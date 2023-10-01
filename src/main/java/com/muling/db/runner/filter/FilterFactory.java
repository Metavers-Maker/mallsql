package com.muling.db.runner.filter;

import com.muling.db.runner.util.StringUtil;
import com.muling.db.runner.common.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileFilter;

public class FilterFactory {

    private static Logger logger = LoggerFactory.getLogger(FilterFactory.class);

    private static final String TOTAL = "total";

    public static FileFilter versionDirFilter() {
        return dirFilter(true);
    }

    public static FileFilter dirFilter() {
        return dirFilter(false);
    }

    public static FileFilter dirFilter(boolean version) {
        return new FileFilter() {
            @Override
            public boolean accept(File pathName) {
                if (!pathName.isDirectory()) {
                    return false;
                }

                if (pathName.getName().equals(".") || pathName.getName().equals("..")) {
                    return false;
                }

                if (version && (!Character.isDigit(pathName.getName().charAt(0)) || pathName.getName().equals(Constants.INIT_VERSION))) {
                    return false;
                }
                return true;
            }
        };
    }

    public static FileFilter nameFilter(String name) {
        return new FileFilter() {
            @Override
            public boolean accept(File pathname) {
                return pathname.getName().equals(name);
            }
        };
    }

    public static FileFilter sqlFilter(String dbPlatform) {
        return typeFilter("sql", dbPlatform);
    }

    /**
     * 过滤 .{dbPlatform}.sql 和 .sql结尾的文件
     *
     * @param type
     * @param dbPlatform
     * @return
     */
    public static FileFilter typeFilter(String type, String dbPlatform) {
        return pathname -> {
            if (StringUtil.isEmpty(dbPlatform)) {
                return pathname.getName().endsWith("." + type);
            }
            String[] names = pathname.getName().split("\\.");
            if (names.length == 1) {
                return false;
            }
            if (!type.equals(names[names.length - 1])) {
                return false;
            }
            if (names.length == 2 || dbPlatform.equals(names[names.length - 2])) {
                return true;
            }
            return false;
        };
    }
}
