/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_mission_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL,
  `mission_group_id` bigint(20) NOT NULL COMMENT '任务包ID',
  `mission_id` bigint(20) DEFAULT NULL COMMENT '任务ID',
  `log_type` tinyint(1) DEFAULT '0' COMMENT '描述',
  `log_dsp` varchar(255) DEFAULT NULL COMMENT '日志描述',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='市场表';
