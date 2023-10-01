alter table oms_member_item add column `from_type` tinyint(2) DEFAULT '0' COMMENT '物品来源';
alter table oms_member_item add column `swap_price` bigint(20) DEFAULT '0' COMMENT '上次价格';
