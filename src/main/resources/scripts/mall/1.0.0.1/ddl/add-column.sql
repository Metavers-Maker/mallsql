alter table  `statistics` add column `l2_market_sale_amount` bigint(20) DEFAULT '0'  COMMENT '二级市场销售额';
alter table  `statistics` add column `l2_market_order_payed_amount` int(11) DEFAULT '0' COMMENT '二级市场支付订单数';
alter table  `statistics` add column `l2_market_order_amount` int(11) DEFAULT '0' COMMENT '二级市场订单数';
alter table  `statistics` add column `l2_market_ordered_member_amount` int(11) DEFAULT '0' COMMENT '二级市场下单用户数';
