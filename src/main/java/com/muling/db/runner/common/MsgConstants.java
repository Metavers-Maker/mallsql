package com.muling.db.runner.common;

public interface MsgConstants {

    String EXE_SUCCESS = "脚本执行成功";

    String EXE_FAILED = "脚本执行失败";


    String TOTAL_INCREAT_FAILED = "全量脚本和增量脚本都执行失败！";

    String CHECK_DDL_DATA_FAILED = "检查目录ddl、data失败，版本目录下需区分ddl、data目录！";

    String INIT_EMPTY = "初始化目录init为空";

    String INIT_DDL_DATA_ERROR = "初始化目录init目录结构错误";

    String INNER_ERROR = "程序内部错误！";

    String INNER_ERROR_CONTENT = "程序内部错误，请创建issue通知。ERROR：";

}