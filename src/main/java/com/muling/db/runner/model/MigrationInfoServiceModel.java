package com.muling.db.runner.model;

import org.flywaydb.core.api.MigrationInfo;
import org.flywaydb.core.api.MigrationInfoService;

public class MigrationInfoServiceModel implements MigrationInfoService {

    MigrationInfo migrationInfo;

    public MigrationInfoServiceModel setMigrationInfo(MigrationInfo migrationInfo) {
        this.migrationInfo = migrationInfo;
        return this;
    }

    @Override
    public MigrationInfo current() {
        return migrationInfo;
    }

    @Override
    public MigrationInfo[] all() {
        return new MigrationInfo[0];
    }

    @Override
    public MigrationInfo[] pending() {
        return new MigrationInfo[0];
    }

    @Override
    public MigrationInfo[] applied() {
        return new MigrationInfo[0];
    }
}
