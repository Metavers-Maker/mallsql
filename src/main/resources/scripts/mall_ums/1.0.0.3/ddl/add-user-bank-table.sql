/**/

CREATE TABLE IF NOT EXISTS `ums_bank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL COMMENT '账户ID',
  `bank_card_code` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `bank_username` varchar(255) DEFAULT NULL COMMENT '银行卡用户名称',
  `bank_name` varchar(255) DEFAULT NULL COMMENT '银行名称',
  `credit_flag` tinyint(1) DEFAULT '1' COMMENT '卡片类型(1借记卡，2贷计卡)',
  `check_no` tinyint(1) DEFAULT '0' COMMENT 'cvn2码，贷记卡必填',
  `check_expiry` datetime DEFAULT NULL COMMENT '过期日期YYMM，贷记卡必填',
  `bid` varchar(255) DEFAULT NULL COMMENT 'sand支付bid',
  `used` tinyint(1) DEFAULT '0' COMMENT '1默认使用，0未使用',
  `plat_type` tinyint(1) DEFAULT '0' COMMENT '平台类型 0 sand',
  `status` tinyint(1) DEFAULT '0' COMMENT '卡片状态(冻结,解绑定)',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
