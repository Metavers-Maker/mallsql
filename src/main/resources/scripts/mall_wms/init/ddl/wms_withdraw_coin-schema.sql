/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `wms_withdraw_coin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) DEFAULT NULL COMMENT '会员ID',
  `coin_type` int(4) DEFAULT NULL COMMENT '积分类型',
  `balance` decimal(20,4) DEFAULT '0.0000' COMMENT '余额',
  `status` tinyint(1) DEFAULT '0' COMMENT '0-待审核,1-通过,2-失败,3-取消申请',
  `reason` varchar(255) DEFAULT NULL COMMENT '原因',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钱包提币表';
