alter table oms_market add column `order_sn` varchar(64) DEFAULT NULL COMMENT '订单号';
alter table oms_market add column `token_id` varchar(255) DEFAULT NULL COMMENT '上链的NFT-ID';
alter table oms_market add column `bsn_id` bigint(20) DEFAULT NULL COMMENT '链上信息';
