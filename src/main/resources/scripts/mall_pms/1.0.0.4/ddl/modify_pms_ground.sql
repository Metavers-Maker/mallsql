/**/

alter table pms_ground drop column `product_id`;
alter table pms_ground drop column `icon`;
alter table pms_ground add column `spu_id` bigint(20) DEFAULT NULL COMMENT '关联商品';
