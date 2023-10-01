/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_mission_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(254) DEFAULT NULL COMMENT '任务名称',
  `claim_coin_type` tinyint(2) DEFAULT NULL COMMENT '奖励积分类型',
  `claim_coin_value` decimal(20,4) DEFAULT '0.0000' COMMENT '奖励积分数量',
  `cost_coin_type` tinyint(2) DEFAULT NULL COMMENT '领取消耗积分类型',
  `cost_coin_value` decimal(20,4) DEFAULT '0.0000' COMMENT '领取消耗积分数量',
  `step` int(11) DEFAULT NULL COMMENT '单个任务进度',
  `cost` tinyint(1) DEFAULT '1' COMMENT '0-返还1-销毁',
  `visible` tinyint(1) DEFAULT '0' COMMENT '0-可用1-不可用',
  `re_num` int(11) DEFAULT '0' COMMENT '剩余总量',
  `mint_num` int(11) DEFAULT '0' COMMENT '释放总量',
  `ext` json DEFAULT NULL COMMENT '扩展字段',
  `group_id` bigint(20) DEFAULT '0' COMMENT '所属任务包',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单详情表';
