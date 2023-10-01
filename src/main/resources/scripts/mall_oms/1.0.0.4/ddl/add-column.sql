/**/
alter table oms_order add column `receive_id` bigint(20) DEFAULT NULL COMMENT '收款方';
alter table oms_order add column `fee_count` bigint(20) DEFAULT NULL COMMENT '平台手续费';
alter table oms_order add column `order_name` varchar(64) DEFAULT NULL COMMENT '订单名(商品名)';
