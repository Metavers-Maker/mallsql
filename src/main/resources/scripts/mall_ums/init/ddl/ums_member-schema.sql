/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `ums_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL COMMENT '开放平台ID',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `trade_password` varchar(255) DEFAULT NULL COMMENT '交易密码',
  `email` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '邮箱地址',
  `wechat` varchar(1024) DEFAULT '' COMMENT 'wx',
  `mobile` varchar(255) DEFAULT NULL COMMENT '电话',
  `uid` varchar(20) DEFAULT NULL COMMENT '展示ID',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '显示名',
  `gender` tinyint(1) DEFAULT '1' COMMENT '性别',
  `avatar_url` text COMMENT '头像链接',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `auth_status` tinyint(1) DEFAULT '0' COMMENT '实名状态',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `secret` varchar(255) DEFAULT NULL COMMENT '密码',
  `is_bind_google` tinyint(1) DEFAULT '0' COMMENT '是否绑定google',
  `is_oh` tinyint(1) DEFAULT '0' COMMENT '是否为Oh用户',
  `chain_address` varchar(255) DEFAULT NULL COMMENT '链地址',
  `invite_code` varchar(20) DEFAULT NULL COMMENT '邀请码',
  `safe_code` varchar(20) DEFAULT NULL COMMENT '安全码',
  `salt` varchar(10) DEFAULT NULL,
  `ext` json DEFAULT NULL COMMENT '扩展字段',
  `last_login_type` varchar(255) DEFAULT NULL COMMENT '上次登录类型',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(255) DEFAULT NULL COMMENT '上次登录IP',
  `device_id` text COMMENT '设备ID',
  `deleted` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `index_unique_mobile` (`mobile`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
