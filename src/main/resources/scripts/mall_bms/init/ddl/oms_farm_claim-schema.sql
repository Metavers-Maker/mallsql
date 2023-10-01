/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_farm_claim` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pool_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  `current_days` int(20) DEFAULT '0',
  `coin_type` tinyint(2) DEFAULT '0',
  `reward_amount` decimal(20,2) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='市场表';
