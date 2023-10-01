/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_farm_stake` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) DEFAULT NULL,
  `pool_id` bigint(20) DEFAULT NULL,
  `spu_id` bigint(20) NOT NULL,
  `alloc_point` double(20,1) NOT NULL DEFAULT '0.0',
  `total` int(20) DEFAULT '0',
  `current_days` int(20) DEFAULT '0',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='市场表';
