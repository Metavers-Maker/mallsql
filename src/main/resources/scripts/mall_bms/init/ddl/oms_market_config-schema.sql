/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_market_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) DEFAULT NULL COMMENT '名称',
  `spu_id` bigint(20) DEFAULT NULL COMMENT 'spu',
  `coin_type` tinyint(1) DEFAULT '0' COMMENT '币种',
  `fee` decimal(20,2) DEFAULT '0.00',
  `status` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='市场表';
