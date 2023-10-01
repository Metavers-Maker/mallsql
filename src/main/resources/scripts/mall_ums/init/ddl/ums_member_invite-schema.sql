/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `ums_member_invite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `invite_code` varchar(20) DEFAULT NULL COMMENT '邀请人邀请码',
  `invite_member_id` bigint(20) DEFAULT NULL COMMENT '邀请人ID',
  `auth_status` tinyint(1) DEFAULT '0' COMMENT '目标用户实名状态',
  `ext` text COMMENT '扩展信息',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_member_id` (`member_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
