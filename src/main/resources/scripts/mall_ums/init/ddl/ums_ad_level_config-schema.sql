/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `ums_ad_level_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(20) DEFAULT NULL COMMENT '等级',
  `team_num` int(20) DEFAULT '0',
  `next_level` int(20) DEFAULT '0' COMMENT '下一级',
  `invite_num` int(20) DEFAULT '0',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_member_id` (`level`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
