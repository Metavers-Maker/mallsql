/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `wms_market_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coin_type` tinyint(4) DEFAULT '0' COMMENT '货币类型',
  `min_balance` decimal(30,4) DEFAULT '0.0000' COMMENT '最小数量',
  `max_balance` decimal(30,4) DEFAULT '0.0000' COMMENT '最大数量',
  `min_price` decimal(30,4) DEFAULT '0.0000' COMMENT '最小价格',
  `max_price` decimal(30,4) DEFAULT '0.0000' COMMENT '最大价格',
  `op_type` tinyint(1) DEFAULT '0' COMMENT '操作类型0买入，1卖出',
  `fee_type` tinyint(1) DEFAULT '0' COMMENT '手续费类型',
  `fee` decimal(30,4) DEFAULT '0.0000' COMMENT '值',
  `min_fee` decimal(30,4) DEFAULT '0.0000' COMMENT '最小手续费',
  `status` tinyint(1) DEFAULT '0' COMMENT '0-可用 1-不可用',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钱包表';
