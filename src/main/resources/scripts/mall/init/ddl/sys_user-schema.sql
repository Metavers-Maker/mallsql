/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL COMMENT '用户名',
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  `gender` tinyint(1) DEFAULT '1' COMMENT '性别：1-男 2-女',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `avatar` varchar(255) DEFAULT '' COMMENT '用户头像',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `status` tinyint(1) DEFAULT '1' COMMENT '用户状态：1-正常 0-禁用',
  `email` varchar(128) DEFAULT NULL COMMENT '用户邮箱',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除标识：0-未删除；1-已删除',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `login_name` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';
