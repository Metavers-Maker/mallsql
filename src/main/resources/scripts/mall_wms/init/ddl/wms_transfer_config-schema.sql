/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `wms_transfer_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coin_type` tinyint(4) DEFAULT '0' COMMENT '货币类型',
  `min_value` decimal(20,2) DEFAULT NULL COMMENT '会员ID',
  `max_value` decimal(20,2) DEFAULT NULL,
  `fee_type` tinyint(1) DEFAULT '0' COMMENT '费用类型 0-直扣 1-百分比',
  `min_fee` decimal(20,2) DEFAULT '0.00',
  `fee` double(20,6) DEFAULT NULL COMMENT '费用类型的值',
  `status` tinyint(1) DEFAULT '0' COMMENT '0-可用 1-不可用',
  `remark` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_coin_type` (`coin_type`) USING BTREE COMMENT '币种唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钱包转赠配置表';
