/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `wms_wallet_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员ID',
  `coin_type` tinyint(4) DEFAULT '0' COMMENT '货币类型',
  `in_balance` decimal(20,4) DEFAULT '0.0000',
  `old_balance` decimal(20,4) DEFAULT '0.0000',
  `balance` decimal(20,4) DEFAULT '0.0000' COMMENT '余额',
  `fee` decimal(20,4) DEFAULT '0.0000' COMMENT '费用',
  `op_type` tinyint(1) DEFAULT '0' COMMENT '操作类型',
  `remark` text,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_member_id` (`member_id`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=2015 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钱包日志表';
