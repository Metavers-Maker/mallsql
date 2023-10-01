package com.muling.db.runner.Enum;

import java.util.ArrayList;
import java.util.List;

public enum SkippableSQLException {

    DUPLICATE_DATABASE(1007, "HY000"),
    DUPLICATE_TABLE(1050, "42S01"),
    DUPLICATE_COLUMN(1060, "42S21"),
    DUPLICATE_KEY(1061, "42000"),
    DUPLICATE_ENTRY(1062, "23000");

    public static List<Integer> codeList = new ArrayList<>();

    static {
        for (SkippableSQLException sqlException : SkippableSQLException.values()) {
            codeList.add(sqlException.getCode());
        }
    }

    public static boolean contains(int errorCode) {
        return codeList.contains(errorCode);
    }

    private int code;

    private String state;

    SkippableSQLException(int code, String state) {
        this.code = code;
        this.state = state;
    }

    public int getCode() {
        return code;
    }

    public SkippableSQLException setCode(int code) {
        this.code = code;
        return this;
    }

    public String getState() {
        return state;
    }

    public SkippableSQLException setState(String state) {
        this.state = state;
        return this;
    }
}