/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_mission_group_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(20) DEFAULT NULL COMMENT '任务包名称',
  `reward_coin_type` tinyint(2) DEFAULT NULL COMMENT '奖励类型',
  `reward_coin_value` decimal(20,4) DEFAULT '0.0000' COMMENT '奖励数量',
  `visible` tinyint(1) DEFAULT '0' COMMENT '0-可用1-不可用',
  `ext` json DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单详情表';
