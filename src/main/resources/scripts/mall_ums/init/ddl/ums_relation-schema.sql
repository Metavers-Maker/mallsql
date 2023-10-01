/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `ums_relation` (
  `id` bigint(50) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(50) DEFAULT NULL COMMENT '用户 id',
  `follow_id` bigint(50) DEFAULT NULL COMMENT '国家',
  `status` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
