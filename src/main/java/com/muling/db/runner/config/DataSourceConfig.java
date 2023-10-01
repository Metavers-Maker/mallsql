//package com.muling.db.runner.config;
//
//import com.zaxxer.hikari.HikariDataSource;
//import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
//import org.springframework.boot.context.properties.ConfigurationProperties;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.stereotype.Component;
//import org.springframework.util.StringUtils;
//
//@Configuration
//@Component
//class DataSourceConfig {
//
//    @Bean
//    @ConfigurationProperties(prefix = "spring.datasource.hikari")
//    HikariDataSource dataSource(DataSourceProperties properties) {
//        HikariDataSource dataSource = properties.initializeDataSourceBuilder().type(HikariDataSource.class).build();
//        if (StringUtils.hasText(properties.getName())) {
//            dataSource.setPoolName(properties.getName());
//        }
//        return dataSource;
//    }
//}