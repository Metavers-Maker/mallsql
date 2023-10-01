/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `oms_order_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `user` varchar(100) DEFAULT NULL COMMENT '操作人[用户；系统；后台管理员]',
  `detail` varchar(255) NOT NULL DEFAULT '' COMMENT '操作详情',
  `order_status` int(11) DEFAULT NULL COMMENT '操作时订单状态',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除【0->正常；1->已删除】',
  `created` datetime DEFAULT NULL COMMENT '创建时间',
  `updated` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单操作历史记录';
