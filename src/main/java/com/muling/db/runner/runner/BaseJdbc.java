package com.muling.db.runner.runner;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class BaseJdbc {

    protected String tableName;

    private static Logger logger = LoggerFactory.getLogger(BaseJdbc.class);

    @Autowired(required = false)
    public JdbcTemplate jdbc;

    @Autowired
    private ConfigurableApplicationContext context;

    public void updateDescription(String description) {

//        updateDescriptionForPgOrMysql(description);
    }

    public void updateDescriptionForPgOrMysql(String description){

        String maxIdSql = "SELECT MAX(installed_rank) FROM "+tableName;

        int installedRank = jdbc.queryForObject(maxIdSql,Integer.class);

        StringBuilder sql = new StringBuilder();
        sql.append("UPDATE ");
        sql.append(tableName);
        sql.append(" SET description=");
        sql.append("'"+description+"' ,");
        sql.append("success=1 ");
        sql.append("WHERE installed_rank=("+installedRank+")");

        try {
            jdbc.execute(sql.toString());
        } catch (Exception e){
            logger.error("修改description失败 ",e);
        }
    }

    protected void close() {

        context.close();
    }
}