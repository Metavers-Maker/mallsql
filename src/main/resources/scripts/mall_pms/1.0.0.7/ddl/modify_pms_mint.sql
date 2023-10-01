/**/
alter table pms_spu add column `operation_id` varchar(255) DEFAULT null COMMENT '操作ID';
alter table pms_spu add column `mint_status` int(2) DEFAULT '0' COMMENT '铸造状态0未上链，1铸造中，2铸造完毕';

