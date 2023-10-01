/**/

alter table oms_order_item add column `market_id` bigint(20) DEFAULT NULL COMMENT '二级市场的ID';
