/**/
alter table oms_member_item add column  `sku_id` bigint(20) DEFAULT NULL COMMENT '用于盲盒对应的商品的sku Id';
alter table oms_item_log add column  `sku_id` bigint(20) DEFAULT NULL COMMENT '用于盲盒对应的商品的sku Id';

