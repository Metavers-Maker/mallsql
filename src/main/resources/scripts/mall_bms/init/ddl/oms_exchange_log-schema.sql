/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_exchange_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `exchange_type` tinyint(2) DEFAULT '0',
  `member_id` bigint(20) DEFAULT NULL COMMENT '虚拟币类型0-元葱',
  `spu_id` bigint(20) DEFAULT NULL,
  `coin_type` tinyint(1) DEFAULT '0' COMMENT '0-可用1-不可用',
  `coin_value` decimal(20,2) DEFAULT NULL COMMENT '数量',
  `item_name` varchar(255) DEFAULT NULL,
  `item_no` varchar(255) DEFAULT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_spu_id` (`spu_id`) USING HASH,
  KEY `index _member_id` (`member_id`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单详情表';
