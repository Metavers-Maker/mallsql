package com.muling.db.runner.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.ContextClosedEvent;

@Configuration
@ConditionalOnExpression("'${db.type}'.equals('postgresql') || '${db.type}'.equals('mysql')")
public class FlywayDbConfiguration implements ApplicationListener<ContextClosedEvent> {

    @Bean
    public FlywayDbProperties flywayDbProperties() {
        return new FlywayDbProperties();
    }

    @Bean
    @ConfigurationProperties(prefix = "upgrade")
    public UpgradeProperties upgradeProperties() {
        return new UpgradeProperties();
    }

    @Override
    public void onApplicationEvent(ContextClosedEvent contextClosedEvent) {

    }
}