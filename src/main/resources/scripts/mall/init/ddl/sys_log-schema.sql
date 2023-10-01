/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_type` int(2) DEFAULT NULL COMMENT '日志类型（1登录日志，2操作日志）',
  `log_content` varchar(1000) DEFAULT NULL COMMENT '日志内容',
  `operate_type` varchar(50) DEFAULT NULL COMMENT '操作类型',
  `userid` bigint(20) DEFAULT NULL COMMENT '操作用户账号',
  `username` varchar(100) DEFAULT NULL COMMENT '操作用户名称',
  `ip` varchar(100) DEFAULT NULL COMMENT 'IP',
  `method` varchar(500) DEFAULT NULL COMMENT '请求java方法',
  `request_url` varchar(255) DEFAULT NULL COMMENT '请求路径',
  `request_param` longtext COMMENT '请求参数',
  `request_type` varchar(10) DEFAULT NULL COMMENT '请求类型',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL,
  `cost_time` bigint(20) DEFAULT NULL COMMENT '耗时',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_table_userid` (`userid`) USING BTREE,
  KEY `index_logt_ype` (`log_type`) USING BTREE,
  KEY `index_operate_type` (`operate_type`) USING BTREE,
  KEY `index_log_type` (`log_type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1168 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统日志表';
