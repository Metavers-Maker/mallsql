/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_item_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type` tinyint(4) DEFAULT NULL,
  `item_name` varchar(200) DEFAULT NULL,
  `item_no` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `member_from` bigint(20) DEFAULT NULL,
  `member_to` bigint(20) DEFAULT NULL,
  `spu_id` bigint(20) DEFAULT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  `reason` text,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_member_id` (`member_id`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单详情表';
