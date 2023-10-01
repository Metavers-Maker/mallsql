/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_farm_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pool_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `spu_id` bigint(20) NOT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_no` int(20) DEFAULT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  `days` int(20) NOT NULL DEFAULT '0',
  `current_days` int(20) DEFAULT '0',
  `alloc_point` double(20,1) NOT NULL DEFAULT '0.0',
  `log_type` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='市场表';
