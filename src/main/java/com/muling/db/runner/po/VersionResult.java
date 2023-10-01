package com.muling.db.runner.po;

public class VersionResult {

    private String version;

    private boolean success = false;

    private String message;

    private boolean needStop = false;

    public VersionResult() {
    }

    public VersionResult(String version) {
        this.version = version;
    }

    public VersionResult(String version, String message, boolean success, boolean needStop) {
        this.version = version;
        this.success = success;
        this.message = message;
        this.needStop = needStop;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isNeedStop() {
        return needStop;
    }

    public void setNeedStop(boolean needStop) {
        this.needStop = needStop;
    }

    @Override
    public String toString() {
        return "{version : " + version + ", success : " + success +", message : " + message + "}";
    }
}