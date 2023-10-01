/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_farm_pool` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL,
  `data` text,
  `spu_id` bigint(20) NOT NULL,
  `balance` bigint(20) NOT NULL DEFAULT '0',
  `total_alloc_point` double(20,1) NOT NULL DEFAULT '0.0',
  `days` int(20) DEFAULT '0',
  `day_amount` decimal(20,2) DEFAULT '0.00',
  `current_days` int(20) DEFAULT '0',
  `remark` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='市场表';
