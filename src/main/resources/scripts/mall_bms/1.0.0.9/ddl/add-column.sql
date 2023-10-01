alter table oms_compound_config add column `target_id` bigint(20) DEFAULT NULL COMMENT '合成目标ID';
alter table oms_compound_config add column `spu_count` tinyint(1) DEFAULT '1' COMMENT '材料数量';
alter table oms_compound_config drop column `data`;
