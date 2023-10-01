/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_transfer_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` tinyint(1) DEFAULT '0' COMMENT '虚拟币类型0-元葱',
  `spu_id` bigint(20) DEFAULT NULL,
  `type_value` decimal(20,2) DEFAULT NULL COMMENT '数量',
  `icd` bigint(20) DEFAULT '0' COMMENT '内网转赠秒冷却',
  `ocd` bigint(20) DEFAULT '0' COMMENT '外网转赠秒冷却',
  `remark` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0-可用1-不可用',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_unique_sku_id` (`spu_id`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=1041 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单详情表';
