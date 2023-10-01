/*!40101 SET NAMES binary*/;
/*!40014 SET FOREIGN_KEY_CHECKS=0*/;

CREATE TABLE IF NOT EXISTS  `pms_note` (
    `id` bigint(20) NOT NULL COMMENT '主键',
    `member_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
    `note_type` tinyint(1) DEFAULT '0' COMMENT '帖子类型',
    `title` varchar(64) NOT NULL COMMENT '标题',
    `txt_dsp` varchar(2048) DEFAULT NULL COMMENT '文字描述',
    `images` json DEFAULT NULL COMMENT '图集',
    `ext` json DEFAULT NULL COMMENT '扩展字段',
    `view` int(11) DEFAULT '0' COMMENT '查看次数',
    `collect` int(11) DEFAULT '0' COMMENT '收藏次数',
    `sort` int(11) DEFAULT '0' COMMENT '排序',
    `status` tinyint(1) DEFAULT '0' COMMENT '0-下架 1-上架',
    `created` datetime DEFAULT NULL COMMENT '创建时间',
    `updated` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='帖子';
