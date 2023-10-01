/**/

CREATE TABLE IF NOT EXISTS `ums_sand_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL COMMENT '账户ID',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `order_sn` varchar(255) DEFAULT NULL COMMENT '创建账户的流水号',
  `status` tinyint(1) DEFAULT '0' COMMENT '账户状态',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
