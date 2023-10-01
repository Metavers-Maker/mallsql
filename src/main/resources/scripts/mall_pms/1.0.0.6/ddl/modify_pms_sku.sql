/**/
alter table pms_sku add column `total_stock_num` int(11) DEFAULT '0' COMMENT '用于订单购买的sku总库存数量';
alter table pms_sku add column `total_rnd_stock_num` int(11) DEFAULT '0' COMMENT '用于开盲盒的sku总库存数量';
alter table pms_sku add column `rnd_stock_num` int(11) DEFAULT '0' COMMENT '用于开盲盒的sku剩余可用库存数量';

