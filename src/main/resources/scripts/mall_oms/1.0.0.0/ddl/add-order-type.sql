/**/

alter table oms_order add column `order_type` tinyint(1) DEFAULT 0 COMMENT '订单类型0-1级，1-2级 ';
