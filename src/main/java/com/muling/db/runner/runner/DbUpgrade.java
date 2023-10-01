package com.muling.db.runner.runner;

import com.muling.db.runner.Enum.SkippableSQLException;
import com.muling.db.runner.common.Constants;
import com.muling.db.runner.common.MsgConstants;
import com.muling.db.runner.config.FlywayDbProperties;
import com.muling.db.runner.config.UpgradeProperties;
import com.muling.db.runner.filter.FilterFactory;
import com.muling.db.runner.po.VersionResult;
import com.muling.db.runner.service.MailService;
import com.muling.db.runner.util.FileUtil;
import com.muling.db.runner.util.NumUtils;
import jodd.util.ThreadUtil;
import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.MigrationInfo;
import org.flywaydb.core.api.MigrationInfoService;
import org.flywaydb.core.internal.command.DbMigrate;
import org.flywaydb.core.internal.exception.FlywaySqlException;
import org.flywaydb.core.internal.sqlscript.FlywaySqlScriptException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import javax.sql.DataSource;
import java.io.File;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class DbUpgrade extends BaseJdbc implements ApplicationRunner {

    public static final String CONNECTION_ERROR = "28000";
    private static Logger logger = LoggerFactory.getLogger(DbUpgrade.class);

    private static final int MAX_RETRY = 60;

    @Autowired(required = false)
    DataSource dataSource;

    @Autowired
    MailService mailSender;

    @Autowired(required = false)
    private FlywayDbProperties flywayDbProperties;

    @Autowired
    private UpgradeProperties upgradeProperties;

    @Value("${outside.res.enable:false}")
    private Boolean outsideResEnable;

    @Value("${outside.res.root:data}")
    private String outsideResRootPath;

    @Value("${db.platform}")
    private String dbPlatform;

    @Override
    public void run(ApplicationArguments args) {
        ClassLoader classLoader = getClass().getClassLoader();
        File path = new File(classLoader.getResource(Constants.UPGRADE_PATH).getFile());

        File[] databaseDirs = path.listFiles(FilterFactory.dirFilter());

        for(File dir : databaseDirs){
            String databases = dir.getName();
            logger.info("Start create database {} if not exists",databases);
            initDatabases(databases);
        }
        for(File dir : databaseDirs){
            String databases = dir.getName();

            logger.info("Start {}",databases);

            runWithRetry(dir.getAbsolutePath(), databases);
        }
        close();
    }

    private void runWithRetry(String path, String databases) {

        boolean success;
        int count = 0;

        success = dbUpgrade(path, databases);
        if (!success) {
            logger.error("[UPGRADE] retry {}", ++count);
            ThreadUtil.sleep(10000);
        }

    }

    private boolean dbUpgrade(String relativeScriptPath, String databases) {

        File serviceDir = new File(relativeScriptPath);
        List<VersionResult> versionResults = null;
        boolean hasException = false;
        Exception innerError = null;

        try {

            Flyway flyway = buildFlyway(serviceDir, databases);

            MigrationInfoService migrationInfo = flyway.info();
            MigrationInfo current = migrationInfo.current();
            List<String> allAppliedVersion = getAllAppliedVersion(migrationInfo);

            versionResults = doDbUpgrade(serviceDir, flyway, current, allAppliedVersion);

        } catch (Exception e) {
            logger.error("", e);
            hasException = true;
            innerError = e;
        } finally {

            if (hasException) {
                sendInnerErrorMail(serviceDir, innerError.getMessage());
                return false;
            } else {
                sendExecResultMail(serviceDir, versionResults);
            }

            if (!CollectionUtils.isEmpty(versionResults)) {
                return versionResults.get(versionResults.size() - 1).isSuccess();
            }
            return true;
        }

    }

    private Flyway buildFlyway(File serviceDir, String databases) {

        Map<String, String> config = getConfig(serviceDir.getName());
        Flyway flyway = Flyway.configure()
                .configuration(config)
                .dataSource(DataSourceBuilder.create().url(flywayDbProperties.getUrl(databases)).username(flywayDbProperties.getUsername()).password(flywayDbProperties.getPassword()).build())
                .load();

        //执行baseline 如果没有将建立版本号表
        flyway.baseline();

        if (Constants.MYSQL.equals(flywayDbProperties.getType())) {
            flyway.repair();
        }

        return flyway;
    }

    private void sendInnerErrorMail(File serviceDir, String content) {
        if (serviceDir == null) {
            return;
        }
        String subject = MsgConstants.INNER_ERROR;
        if (serviceDir != null) {
            subject += serviceDir.getName();
        }
        //内部异常 邮件
        mailSender.sendSimpleMail(subject, MsgConstants.INNER_ERROR_CONTENT + content);
    }

    private void sendExecResultMail(File serviceDir, List<VersionResult> versionResults) {
        if (serviceDir == null) {
            return;
        }
        mailSender.emailNotify(serviceDir.getName(), versionResults);
    }

    private Exception getExceptionNeedThrow(Exception needThrowException, FlywaySqlException e) {
        FlywaySqlException exception = e;
        SQLException sqlException = (SQLException) exception.getCause();

        if (CONNECTION_ERROR.equalsIgnoreCase(sqlException.getSQLState())) {
            needThrowException = sqlException;
        }
        return needThrowException;
    }

    private SQLException getSQLException(DbMigrate.FlywayMigrateException e) {
        DbMigrate.FlywayMigrateException exception = e;
        FlywaySqlScriptException sqlScriptException = (FlywaySqlScriptException) exception.getCause();
        return (SQLException) sqlScriptException.getCause();
    }

    private List<String> getAllAppliedVersion(MigrationInfoService migrationInfo) {

        if (!upgradeProperties.isOutOfOrder()) {
            return new ArrayList<>();
        }

        List<String> allAppliedVersion = new ArrayList<>();

        if (migrationInfo.all() != null) {
            for (MigrationInfo info : migrationInfo.all()) {
                if (info.getState().isFailed()) {
                    continue;
                }
                allAppliedVersion.add(info.getVersion().getVersion());
            }
        }

        return allAppliedVersion;
    }

    /**
     * 执行升级逻辑   空库、旧库、有版本号库
     *
     * @param serviceDir
     * @param flyway
     * @param current
     */
    private List<VersionResult> doDbUpgrade(File serviceDir, Flyway flyway, MigrationInfo current, List<String> allAppliedVersion) {

        List<VersionResult> versionResults = new ArrayList<>();
        VersionResult versionResult = null;

        //没有版本表
        if (current == null || "0".equals(current.getVersion().getVersion().trim())) {
            versionResult = execInit(serviceDir, flyway);
            versionResults.add(versionResult);
            if (versionResult.isNeedStop()) {
                return versionResults;
            }
        }

        //以下为init执行失败的旧库、或有版本号的正常升级
        File[] versionDirArray = serviceDir.listFiles(FilterFactory.versionDirFilter());

        if (versionDirArray == null || versionDirArray.length == 0) {
            return versionResults;
        }

        String currentVersion = getCurrentVersion(current, versionResult);

        List<File> notExecVersions = notExecVersion(versionDirArray, currentVersion, allAppliedVersion);

        //没有需要执行的脚本
        if (notExecVersions.size() == 0) {
            logger.info("没有需要执行的脚本");
            return versionResults;
        }

        versionResults.addAll(execVersions(notExecVersions, currentVersion, flyway));

        logger.info("脚本执行结果：{}", versionResults);
        return versionResults;
    }

    private List<VersionResult> execVersions(List<File> notExecVersions, String currentVersion, Flyway flyway) {

        //按版本号排序
        File[] versionDirs = FileUtil.versionSortAsc(notExecVersions);

        List<VersionResult> versionResults = new ArrayList<>();
        VersionResult versionResult;

        for (int j = 0; j < versionDirs.length; j++) {

            logger.info("[Exec] starting version: {}", versionDirs[j].getName());

            if (Constants.BASE_VERSION.equals(currentVersion)) {

                //已存在旧数据库但不知道版本号：从头开始执行,才能确定版本
                versionResult = execVersionSqlIgoreError(versionDirs[j], flyway);

            } else {

                //已有版本号
                versionResult = execVersionSql(versionDirs[j], flyway);
            }

            versionResults.add(versionResult);

            if (versionResult.isNeedStop()) {
                break;
            }
        }

        return versionResults;
    }

    private String getCurrentVersion(MigrationInfo current, VersionResult versionResult) {
        String currentVersion = Constants.BASE_VERSION;
        if (current != null) {
            currentVersion = current.getVersion().getVersion();
        }
        if (versionResult != null && versionResult.isSuccess()) {
            currentVersion = Constants.INIT_VERSION;
        }
        return currentVersion;
    }

    private VersionResult execInit(File serviceDir, Flyway flyway) {

        VersionResult versionResult;
        if (!checkInit(serviceDir)) {
            return new VersionResult(Constants.INIT_CN, MsgConstants.INIT_EMPTY, false, true);
        }

        logger.info("[Init] exec init...");
        versionResult = doExecInit(serviceDir, flyway);
        logger.info("[Init] exec init result: {}", versionResult.isSuccess());

        return versionResult;
    }

    private List<File> notExecVersion(File[] versionDirs, String current, List<String> allAppliedVersion) {

        List<File> notExeVersion = new ArrayList<>();

        for (File version : versionDirs) {

            if (upgradeProperties.isOutOfOrder()) {
                //开关开启时，允许执行未执行过的脚本
                if (!allAppliedVersion.contains(version.getName())) {
                    notExeVersion.add(version);
                }

            } else {
                //开关关闭时只执行大于当前版本号的版本
                if (NumUtils.compareVersion(version.getName(), current) > 0) {
                    notExeVersion.add(version);
                }
            }

        }

        return notExeVersion;
    }


    /**
     * 检查init目录
     *
     * @param serviceDir
     * @return true 有内容 | false 无内容，空目录
     */
    private boolean checkInit(File serviceDir) {
        //获取init目录
        File[] inits = getInits(serviceDir);

        if (inits == null || inits.length == 0) {
            logger.error(MsgConstants.INIT_EMPTY);
            return false;
        }

        if (checkDdlDataDir(inits[0])) {
            return true;
        }
        logger.error(MsgConstants.INIT_DDL_DATA_ERROR);
        return false;
    }

    private File[] getInits(File serviceDir) {
        File[] inits = serviceDir.listFiles(FilterFactory.nameFilter(Constants.INIT));
        if (inits == null || inits.length == 0) {
            inits = serviceDir.listFiles(FilterFactory.nameFilter(Constants.INIT_VERSION));
        }
        return inits;
    }

    /**
     * 执行init目录下全量脚本
     *
     * @param serviceDir
     * @param flyway
     * @return true 执行成功 |  false 执行失败
     */
    private VersionResult doExecInit(File serviceDir, Flyway flyway) {

        File[] inits = getInits(serviceDir);
        if (inits == null) {
            return new VersionResult(Constants.INIT_VERSION, "init失败", false, true);
        }

        //init 重命名为 0.0.0.1 作为版本0.0.0.1
        File initVersion = inits[0];
        if (!Constants.INIT_VERSION.equals(initVersion.getName())) {
            initVersion = FileUtil.rename(inits[0], Constants.INIT_VERSION);
        }

        VersionResult result = execVersionSqlIgoreError(initVersion, flyway);
        result.setVersion(Constants.INIT_CN);

        return result;
    }

    /**
     * flyway配置项
     *
     * @param serviceName
     * @return
     */
    private Map<String, String> getConfig(String serviceName) {

        Map<String, String> config = new HashMap<>();

        serviceName = serviceName.replaceAll("-", "_");
        tableName = serviceName + "_version";

        config.put("flyway.cleanDisabled", Boolean.TRUE.toString());
        config.put("flyway.baselineVersion", Constants.BASE_VERSION);
        config.put("flyway.table", tableName);
        config.put("flyway.ignoreMissingMigrations", Boolean.TRUE.toString());
        config.put("flyway.outOfOrder", String.valueOf(upgradeProperties.isOutOfOrder()));
        config.put("flyway.placeholderReplacement", Boolean.FALSE.toString());

        return config;
    }

    /**
     * 执行版本sql，忽略报错
     *
     * @param versionPath
     * @param flyway
     * @return
     */
    private VersionResult execVersionSqlIgoreError(File versionPath, Flyway flyway) {
        return execVersionSql(versionPath, flyway, true);
    }

    /**
     * 执行版本sql，不忽略报错
     *
     * @param versionPath
     * @param flyway
     * @return
     */
    private VersionResult execVersionSql(File versionPath, Flyway flyway) {
        return execVersionSql(versionPath, flyway, false);
    }

    /**
     * 检查版本号目录下ddl、data目录是否有内容
     *
     * @param versionPath
     * @return true 至少有一个目录有内容 |  false 两个都是空目录
     */
    private boolean checkDdlDataDir(File versionPath) {
        //两个目录 ddl和data
        File[] ddlPath = versionPath.listFiles(FilterFactory.nameFilter(Constants.DDL));
        File[] dataPath = versionPath.listFiles(FilterFactory.nameFilter(Constants.DATA));

        if (ddlPath != null && ddlPath.length == 1) {
            File[] sqls = ddlPath[0].listFiles(FilterFactory.sqlFilter(dbPlatform));
            if (sqls.length > 0) {
                return true;
            }
        }
        if (dataPath != null && dataPath.length == 1) {
            File[] sqls = dataPath[0].listFiles(FilterFactory.sqlFilter(dbPlatform));
            if (sqls.length > 0) {
                return true;
            }
        }
        return false;
    }

    /**
     * 合并ddl、data目录下的文件
     *
     * @param versionPath
     */
    private String mergeDdlData(File versionPath) {
        //两个目录 ddl和data
        File[] ddlPath = versionPath.listFiles(FilterFactory.nameFilter(Constants.DDL));
        File[] dataPath = versionPath.listFiles(FilterFactory.nameFilter(Constants.DATA));

        //合并内容和文件名
        StringBuilder content = new StringBuilder();
        StringBuilder name = new StringBuilder();

        if (ddlPath != null && ddlPath.length == 1) {
            mergeFile(ddlPath[0], content, name);
        }

        if (dataPath != null && dataPath.length == 1) {
            mergeFile(dataPath[0], content, name);
        }

        //汇总sql到classpath:dbMigration目录下的一个文件
        //文件名称 V[version]__[description].sql
        String version = versionPath.getName();
        String fileName = "V" + version + "__" + version + ".sql";
        FileUtil.writeFile(versionPath, content.toString(), fileName);

        return name.toString();
    }

    /**
     * 执行sql
     *
     * @param versionPath
     * @param flyway
     * @param igoreError  是否忽略错误
     * @return
     */
    private VersionResult execVersionSql(File versionPath, Flyway flyway, boolean igoreError) {

        VersionResult result = new VersionResult(versionPath.getName());

        if (!checkDdlDataDir(versionPath)) {

            result.setMessage(MsgConstants.CHECK_DDL_DATA_FAILED);
            result.setSuccess(false);
            result.setNeedStop(false);

            return result;
        }

        String description = mergeDdlData(versionPath);

        try {
            flyway.setLocations(Constants.FILESYSTEM + versionPath.getAbsolutePath());
            flyway.migrate();
        } catch (Exception e) {

            logger.error("升级版本失败: V{} ", versionPath.getName(), e);

            result.setMessage(e.toString());
            result.setNeedStop(true);

            //根据错误类型判断是否需要停止
            if (e instanceof DbMigrate.FlywayMigrateException) {
                SQLException sqlException = getSQLException((DbMigrate.FlywayMigrateException) e);
                if (SkippableSQLException.contains(sqlException.getErrorCode())) {
                    result.setSuccess(true);
                    result.setNeedStop(false);
                    logger.warn("升级版本失败: V{} igore error {} ", versionPath.getName(), e.getMessage());
                }
            }
        }

        if (result.isNeedStop()) {
            return result;
        }

        result.setSuccess(true);
        //成功则更新描述
        updateDescription(description);

        return result;
    }

    /**
     * 合并路径中的sql内容和文件名
     *
     * @param path
     * @param content
     * @param name
     */
    private void mergeFile(File path, StringBuilder content, StringBuilder name) {

        File[] files = path.listFiles(FilterFactory.sqlFilter(dbPlatform));
        if (files == null || files.length == 0) {
            return;
        }
        StringBuilder fileContent = FileUtil.mergeFileContent(files);
        StringBuilder fileName = FileUtil.mergeFileName(files);

        content.append(fileContent);
        name.append(fileName);
    }

    public void initDatabases(String databases) {
        Connection conn = null;
        Statement stmt = null;
        try {
            conn  = DriverManager.getConnection(flywayDbProperties.getUrl(), flywayDbProperties.getUsername(), flywayDbProperties.getPassword());
            String sql = "CREATE DATABASE IF NOT EXISTS " + databases;
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            logger.error("InitDatabases error occur",e);
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                logger.error("Close db error occur",e);
            }
        }
    }
}
