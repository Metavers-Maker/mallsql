package com.muling.db.runner.model;

import org.flywaydb.core.api.MigrationInfo;
import org.flywaydb.core.api.MigrationState;
import org.flywaydb.core.api.MigrationType;
import org.flywaydb.core.api.MigrationVersion;

import java.util.Date;

public class MigrationInfoModel implements MigrationInfo {

    private MigrationVersion migrationVersion;

    public MigrationInfoModel(MigrationVersion migrationVersion) {
        this.migrationVersion = migrationVersion;
    }

    @Override
    public MigrationType getType() {
        return null;
    }

    @Override
    public Integer getChecksum() {
        return null;
    }

    @Override
    public MigrationVersion getVersion() {
        return migrationVersion;
    }

    @Override
    public String getDescription() {
        return null;
    }

    @Override
    public String getScript() {
        return null;
    }

    @Override
    public MigrationState getState() {
        return null;
    }

    @Override
    public Date getInstalledOn() {
        return null;
    }

    @Override
    public String getInstalledBy() {
        return null;
    }

    @Override
    public Integer getInstalledRank() {
        return null;
    }

    @Override
    public Integer getExecutionTime() {
        return null;
    }

    @Override
    public int compareTo(MigrationInfo o) {
        return 0;
    }
}
