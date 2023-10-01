/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `ums_invite_level_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(20) DEFAULT NULL COMMENT '等级',
  `invite_num` int(20) DEFAULT '0',
  `coin_type` int(2) DEFAULT '0' COMMENT '指定币种',
  `coin_value` decimal(20,4) DEFAULT '0.0000' COMMENT '值',
  `min_value` decimal(20,4) DEFAULT '0.0000' COMMENT '最小值',
  `max_value` decimal(20,4) DEFAULT '0.0000' COMMENT '最大值',
  `fee` double(20,4) DEFAULT '0.0000' COMMENT '手续费',
  `claim_coin_type` int(2) DEFAULT '0' COMMENT '指定币种',
  `claim_coin_value` decimal(20,4) DEFAULT NULL COMMENT '值',
  `next_level` int(20) DEFAULT NULL COMMENT '下一级',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_member_id` (`level`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
