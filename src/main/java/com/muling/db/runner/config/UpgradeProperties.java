package com.muling.db.runner.config;

public class UpgradeProperties {

    private boolean outOfOrder;

    public boolean isOutOfOrder() {
        return outOfOrder;
    }

    public UpgradeProperties setOutOfOrder(boolean outOfOrder) {
        this.outOfOrder = outOfOrder;
        return this;
    }
}
