/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `ums_white` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(50) DEFAULT NULL COMMENT '用户 id',
  `mobile` varchar(20) DEFAULT NULL COMMENT '电话',
  `level` tinyint(1) DEFAULT '0' COMMENT '权限等级',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
