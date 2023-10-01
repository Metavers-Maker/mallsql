/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `wms_wallet_oh` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员ID',
  `coin_type` int(4) DEFAULT '0' COMMENT '货币类型',
  `balance` decimal(30,4) DEFAULT '0.0000' COMMENT '余额',
  `freeze_balance` decimal(30,4) DEFAULT '0.0000' COMMENT '冻结余额',
  `status` tinyint(1) DEFAULT '0' COMMENT '0-可用 1-不可用',
  `version` int(11) DEFAULT '0' COMMENT '版本',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钱包表';
