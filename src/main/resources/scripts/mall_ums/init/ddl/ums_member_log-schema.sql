/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `ums_member_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0',
  `member_id` bigint(20) DEFAULT NULL,
  `client_id` varchar(20) DEFAULT NULL,
  `grant_type` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `device_id` varchar(255) CHARACTER SET utf8mb4 DEFAULT '',
  `device_name` varchar(50) DEFAULT NULL,
  `device_version` varchar(20) DEFAULT NULL,
  `user_agent` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_member_id` (`member_id`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
