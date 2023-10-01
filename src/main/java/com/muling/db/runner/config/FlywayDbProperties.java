package com.muling.db.runner.config;

import com.muling.db.runner.common.Constants;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "db")
public class FlywayDbProperties {

    private String type;

    private String host;

    private String port;

    private String username;

    private String password;

    private String superusername;

    private String superpassword;

    private String rolelist;

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSuperusername() {
        return superusername;
    }

    public void setSuperusername(String superusername) {
        this.superusername = superusername;
    }

    public String getSuperpassword() {
        return superpassword;
    }

    public void setSuperpassword(String superpassword) {
        this.superpassword = superpassword;
    }

    public String getRolelist() {
        return rolelist;
    }

    public void setRolelist(String rolelist) {
        this.rolelist = rolelist;
    }

    public String getUrl() {
        return "jdbc:" + type + "://" + host + ":" + port + "?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai";
    }
    public String getUrl(String databases) {
        return "jdbc:" + type + "://" + host + ":" + port + "/" + databases + "?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai";
    }

    public String getDatabaseUrl() {
        return "jdbc:" + type + "://" + host + ":" + port + "/";
    }

    public String getDefaultDbUrl() {
        return "jdbc:" + type + "://" + host + ":" + port + "/postgres";
    }

    public String getDriverClassName() {
        if (!Constants.MYSQL.equals(type)) {
            //pg
            return "org.postgresql.Driver";
        }

        return "com.mysql.jdbc.Driver";
    }
}