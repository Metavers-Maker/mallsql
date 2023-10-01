/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `wms_transfer_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` bigint(20) DEFAULT NULL,
  `target_id` bigint(20) DEFAULT NULL,
  `target_uid` varchar(255) DEFAULT NULL,
  `coin_type` tinyint(1) DEFAULT '0',
  `balance` decimal(20,2) DEFAULT NULL,
  `fee` decimal(20,2) DEFAULT '0.00' COMMENT '余额',
  `remark` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钱包转赠日志表';
