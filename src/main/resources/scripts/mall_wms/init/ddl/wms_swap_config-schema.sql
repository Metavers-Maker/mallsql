/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `wms_swap_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_coin_type` tinyint(4) DEFAULT '0' COMMENT '源币种',
  `source_min_value` decimal(20,6) DEFAULT '0.000000' COMMENT '最小值',
  `source_max_value` decimal(20,6) DEFAULT '0.000000' COMMENT '最大值',
  `target_coin_type` tinyint(4) DEFAULT '0' COMMENT '目标币种',
  `ratio` decimal(20,6) DEFAULT '0.000000' COMMENT '兑换系数',
  `fee_type` tinyint(1) DEFAULT '0' COMMENT '费用类型 0-直扣 1-百分比',
  `fee` double(20,6) DEFAULT '0.000000' COMMENT '费用类型的值',
  `min_fee` decimal(20,6) DEFAULT '0.000000' COMMENT '最小费用',
  `status` tinyint(1) DEFAULT '0' COMMENT '0-可用 1-不可用',
  `remark` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_coin_type` (`source_coin_type`) USING BTREE COMMENT '币种唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钱包转赠配置表';
