/*
 Navicat Premium Data Transfer

 Source Server         : 120.48.20.27-3124
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : 120.48.20.27:3124
 Source Schema         : easy_cloud

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 02/01/2024 16:30:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `id`           bigint unsigned                                               NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `config_name`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '参数名称',
    `config_key`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL DEFAULT '' COMMENT '参数键名',
    `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数键值',
    `is_system`    char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      NOT NULL COMMENT '是否是系统内置',
    `enable`       tinyint                                                       NOT NULL DEFAULT '1' COMMENT '是否启用',
    `create_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '创建人',
    `create_time`  datetime(3)                                                            DEFAULT NULL COMMENT '创建时间',
    `update_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '更新人',
    `update_time`  datetime(3)                                                            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`          int unsigned                                                  NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1729339197222653954
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='系统参数配置';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`id`, `config_name`, `config_key`, `config_value`, `is_system`, `enable`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, 'test', 'test', '2', '1', 1, NULL, NULL, '1701847090820464641', '2023-11-28 11:22:52.000', 0);
INSERT INTO `sys_config` (`id`, `config_name`, `config_key`, `config_value`, `is_system`, `enable`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `del`)
VALUES (1729339197222653953, 'c', 'c', 'c', '1', 1, '1701847090820464641', '2023-11-28 11:19:28.000',
        '1701847090820464641', '2023-11-28 11:19:32.000', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `id`           bigint unsigned                                               NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `dict_type_id` bigint unsigned                                               NOT NULL COMMENT '字典类型ID easy_dict_type=>id',
    `dict_type`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '字典类型',
    `dict_label`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典标签',
    `dict_value`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典键值',
    `dict_sort`    int unsigned                                                  NOT NULL DEFAULT '0' COMMENT '字典排序',
    `css_class`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '表格回显样式',
    `enable`       tinyint                                                       NOT NULL DEFAULT '1' COMMENT '是否启用',
    `create_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '创建人',
    `create_time`  datetime(3)                                                            DEFAULT NULL COMMENT '创建时间',
    `update_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '更新人',
    `update_time`  datetime(3)                                                            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`          int unsigned                                                  NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6986880772967759893
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='字典数据';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (1729064918308442113, 1727978522311565313, 'system_enable', '启用', 'true', 1, '', 'success', 1, NULL, NULL,
        NULL, NULL, 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (1729064993340346369, 1727978522311565313, 'system_enable', '停用', 'false', 2, '', 'danger', 1, NULL, NULL,
        NULL, NULL, 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6981409755239587840, 6986877039194144768, 'yes_or_no', '是', 'true', 1, '{font-size: 16px;}', 'success', 1,
        NULL, '2022-11-02 21:44:07.000', '', '2023-09-26 15:26:32.794', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6981443196387631104, 6986877039194144768, 'yes_or_no', '否', 'false', 2, NULL, 'danger', 1, NULL,
        '2022-11-02 21:44:07.000', NULL, NULL, 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759872, 6986880524547522560, 'system_menu', '目录', 'CATALOGUE', 1, NULL, 'success', 1, NULL,
        '2022-11-02 21:44:07.000', NULL, '2023-09-26 15:24:53.665', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759873, 6986880524547522560, 'system_menu', '按钮', 'BUTTON', 3, NULL, 'info', 1, NULL,
        '2022-11-02 21:44:07.000', NULL, '2023-09-26 15:24:53.668', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759874, 6986880524547522560, 'system_menu', '页面', 'PAGE', 2, NULL, 'success', 1, NULL,
        '2022-11-02 21:44:07.000', NULL, '2023-09-26 15:24:53.671', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759875, 1727978522311565313, 'system_enable', 'cc', 'cc', 3, '', 'default', 1,
        '1701847090820464641', '2023-11-29 16:57:53.000', '1701847090820464641', '2023-11-29 16:58:02.000', 1);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759876, 1727978522311565313, 'system_enable', 'ff', 'ff', 1, '', 'default', 1,
        '1701847090820464641', '2023-11-29 16:57:57.000', '1701847090820464641', '2023-11-29 16:58:01.000', 1);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759877, 6986880524547522561, 'sysy_gender', '男', 'MAN', 1, '', 'primary', 1,
        '1701847090820464641', '2023-11-30 11:25:08.000', NULL, '2023-11-30 11:25:08.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759878, 6986880524547522561, 'sysy_gender', '女', 'WOMAN', 2, '', 'primary', 1,
        '1701847090820464641', '2023-11-30 11:25:27.000', NULL, '2023-11-30 11:25:27.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759879, 6986880524547522561, 'sysy_gender', '其他', 'OTHER', 3, '', 'primary', 1,
        '1701847090820464641', '2023-11-30 11:26:01.000', NULL, '2023-11-30 11:26:01.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759880, 6986880524547522562, 'system_account_status', '未激活', 'INACTIVATED', 1, '', 'warning', 1,
        '1701847090820464641', '2023-11-30 11:31:12.000', NULL, '2023-11-30 11:31:12.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759881, 6986880524547522562, 'system_account_status', '正常', 'NORMAL', 2, '', 'success', 1,
        '1701847090820464641', '2023-11-30 11:31:24.000', NULL, '2023-11-30 11:31:24.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759882, 6986880524547522562, 'system_account_status', '停用', 'STOP', 3, '', 'danger', 1,
        '1701847090820464641', '2023-11-30 11:31:35.000', NULL, '2023-11-30 11:31:35.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759883, 6986880524547522563, 'system_client', 'WEB', 'WEB', 1, '', 'default', 1,
        '1701847090820464641', '2023-11-30 13:52:37.000', NULL, '2023-11-30 13:52:37.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759884, 6986880524547522563, 'system_client', 'APP', 'APP', 2, '', 'default', 1,
        '1701847090820464641', '2023-11-30 13:52:44.000', NULL, '2023-11-30 13:52:44.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759885, 6986880524547522563, 'system_client', '小程序', 'APPLETS', 3, '', 'default', 1,
        '1701847090820464641', '2023-11-30 13:53:14.000', NULL, '2023-11-30 13:53:14.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759886, 6986880524547522564, 'system_authority_level', '本级', 'ONESELF', 1, '', 'primary', 1,
        '1701847090820464641', '2023-12-06 09:21:38.000', NULL, '2023-12-06 09:21:38.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759887, 6986880524547522564, 'system_authority_level', '本级及以下', 'LOWER', 2, '', 'primary', 1,
        '1701847090820464641', '2023-12-06 09:21:55.000', NULL, '2023-12-06 09:21:55.000', 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759888, 6986880524547522565, 'system_notification', '公告', 'NOTICE', 1, '', 'default', 1,
        '1701847090820464641', '2023-12-12 16:46:53.000', NULL, NULL, 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759889, 1727978522311565313, 'system_enable', '测试', '1', 3, NULL, 'default', 1,
        '1701847090820464641', '2023-12-20 17:55:27.000', '1701847090820464641', '2023-12-20 17:55:35.000', 1);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759890, 6986880524547522566, 'sys_article_status', '草稿', 'DRAFT', 1, NULL, 'warning', 1,
        '1701847090820464641', '2023-12-25 16:54:11.000', NULL, NULL, 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759891, 6986880524547522566, 'sys_article_status', '已发布', 'UNREAD', 2, NULL, 'primary', 1,
        '1701847090820464641', '2023-12-25 16:54:34.000', NULL, NULL, 0);
INSERT INTO `sys_dict_data` (`id`, `dict_type_id`, `dict_type`, `dict_label`, `dict_value`, `dict_sort`, `css_class`,
                             `list_class`, `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880772967759892, 6986880524547522566, 'sys_article_status', '已读', 'READ', 3, NULL, 'success', 1,
        '1701847090820464641', '2023-12-25 16:54:46.000', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `id`          bigint unsigned                                              NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `dict_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典名称',
    `dict_type`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典类型',
    `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT '' COMMENT '字典描述',
    `is_system`   char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '是否是系统内置',
    `enable`      tinyint                                                      NOT NULL DEFAULT '1' COMMENT '是否启用',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci             DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3)                                                           DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci             DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3)                                                           DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         int unsigned                                                 NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6986880524547522567
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='字典类型';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (1727978522311565313, '启用停用', 'system_enable', '启用或者停用', '1', 1, NULL, NULL, '1701847090820464641',
        '2023-12-07 16:12:45.000', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986877039194144768, '是否', 'yes_or_no', '是否', '1', 1, NULL, '2023-09-26 13:58:50.000',
        '1701847090820464641', '2023-11-27 17:19:39.000', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880524547522560, '菜单类型', 'system_menu', '菜单类型', '1', 1, NULL, '2022-11-02 21:44:07.000', NULL,
        '2023-09-26 13:59:28.837', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880524547522561, '性别', 'system_gender', '性别', '1', 1, '1701847090820464641', '2023-11-30 11:24:44.000',
        '1701847090820464641', '2023-11-30 11:28:56.000', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880524547522562, '账号状态', 'system_account_status', '用户账号的状态', '1', 1, '1701847090820464641',
        '2023-11-30 11:30:55.000', NULL, '2023-11-30 11:30:55.000', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880524547522563, '客户端', 'system_client', '所有的账号归属客户端', '1', 1, '1701847090820464641',
        '2023-11-30 13:52:18.000', NULL, '2023-11-30 13:52:18.000', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880524547522564, '数据权限', 'system_authority_level', '角色数据权限', '1', 1, '1701847090820464641',
        '2023-12-06 09:21:17.000', NULL, '2023-12-06 09:21:17.000', 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880524547522565, '通知类型', 'system_notification', '通知类型', '1', 1, '1701847090820464641',
        '2023-12-12 16:45:08.000', NULL, NULL, 0);
INSERT INTO `sys_dict_type` (`id`, `dict_name`, `dict_type`, `description`, `is_system`, `enable`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (6986880524547522566, '文章状态', 'system_article_status', '文章状态', '1', 1, '1701847090820464641',
        '2023-12-25 16:53:25.000', '1701847090820464641', '2023-12-25 16:55:58.000', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_file_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_record`;
CREATE TABLE `sys_file_record`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `file_name`   varchar(255)    NOT NULL COMMENT '文件原名',
    `file`        varchar(255)    NOT NULL COMMENT '文件路径',
    `file_type`   char(32)        NOT NULL COMMENT '文件类型',
    `file_size`   varchar(255)                                              DEFAULT NULL COMMENT '大小(字节)',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3)                                               DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3)                                               DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='文件记录表';

-- ----------------------------
-- Records of sys_file_record
-- ----------------------------
BEGIN;
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (1, 'iShot_2023-12-07_11.01.14.png', 'test/2023/12/08/102508_cd90642209f145b3bc2447a8692668aa.png', 'png',
        '69506', '1701847090820464641', '2023-12-08 10:25:08.000', NULL, '2023-12-08 10:25:08.000');
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (2, 'yRsRRjGO_400x400.jpeg', 'test/2023/12/08/102635_9cc6256f92644a13add0791091edf499.jpeg', 'jpeg', '8476',
        '1701847090820464641', '2023-12-08 10:26:35.000', NULL, '2023-12-08 10:26:35.000');
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (3, 'yRsRRjGO_400x400.jpeg', 'test/2023/12/08/102816_8d60c6f62f09468eb08be7de8bf657c6.jpeg', 'jpeg', '8476',
        '1701847090820464641', '2023-12-08 10:28:16.000', NULL, '2023-12-08 10:28:16.000');
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (4, 'xundao_logo.png', 'test/2023/12/12/103353_d14d68e0799841068d95daa40c211912.png', 'png', '594',
        '1701847090820464641', '2023-12-12 10:33:54.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (5, 'yRsRRjGO_400x400.jpeg', 'test/2023/12/12/103704_4e7841101e6e40429829bbd914fe5df3.jpeg', 'jpeg', '8476',
        '1701847090820464641', '2023-12-12 10:37:04.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (6, 'xundao_logo.png', 'test/2023/12/12/104004_456709b319cf49d99de37a2d644fe0a6.png', 'png', '594',
        '1701847090820464641', '2023-12-12 10:40:04.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (7, 'xundao_logo.png', 'test/2023/12/12/104143_110237b832324e598579b38079176ff3.png', 'png', '594',
        '1701847090820464641', '2023-12-12 10:41:43.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (8, 'xundao_logo.png', 'test/2023/12/27/111547_ab35bfc9ddde462ba8dc053947be04f1.png', 'png', '594',
        '1701847090820464641', '2023-12-27 11:15:47.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (9, 'xundao_logo.png', 'test/2023/12/27/111637_45c644e6a10b4a16a5269b7826474703.png', 'png', '594',
        '1701847090820464641', '2023-12-27 11:16:37.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (10, 'xundao_logo.png', 'test/2023/12/27/115412_595c5abffe5745eab351762498c65dac.png', 'png', '594',
        '1701847090820464641', '2023-12-27 11:54:12.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (11, 'xundao_logo.png', 'test/2023/12/27/115543_03449c713d8043fb9396dae86b61ccfb.png', 'png', '594',
        '1701847090820464641', '2023-12-27 11:55:43.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (12, 'xundao_logo.png', 'test/2023/12/27/115657_e1a7214251034a898b8338da8f0d962a.png', 'png', '594',
        '1701847090820464641', '2023-12-27 11:56:57.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (13, 'xundao_logo.png', 'test/2023/12/27/115711_2ce3ce49f59942b38fd2c3edbcad874c.png', 'png', '594',
        '1701847090820464641', '2023-12-27 11:57:12.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (14, 'xundao_logo.png', 'test/2023/12/27/115735_ec83c51766db4c409998a93b186d7796.png', 'png', '594',
        '1701847090820464641', '2023-12-27 11:57:35.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (15, 'xundao_logo.png', 'test/2023/12/27/133903_220599652fab465cbd0c4395ff1b7f62.png', 'png', '594',
        '1701847090820464641', '2023-12-27 13:39:03.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (16, 'xundao_logo.png', 'test/2023/12/27/134304_a96d3376ad5f497c9daa46f6216514c2.png', 'png', '594',
        '1701847090820464641', '2023-12-27 13:43:04.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (17, 'xundao_logo.png', 'test/2023/12/27/134321_ee26dab0c6ff4483aab575e449fb7451.png', 'png', '594',
        '1701847090820464641', '2023-12-27 13:43:21.000', NULL, NULL);
INSERT INTO `sys_file_record` (`id`, `file_name`, `file`, `file_type`, `file_size`, `create_by`, `create_time`,
                               `update_by`, `update_time`)
VALUES (18, 'xundao_logo.png', 'test/2023/12/27/134354_4c3d619f3c614b1f835e513f93699aa0.png', 'png', '594',
        '1701847090820464641', '2023-12-27 13:43:54.000', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_login_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_logs`;
CREATE TABLE `sys_login_logs`
(
    `id`          bigint unsigned                                              NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id`     bigint                                                       NOT NULL COMMENT '用户ID',
    `username`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户账号',
    `ip`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT '' COMMENT '登录IP地址',
    `ip_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT '' COMMENT '登录地点',
    `browser`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT '' COMMENT '浏览器类型',
    `login_time`  datetime(3)                                                  NOT NULL COMMENT '访问时间',
    `create_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '创建人',
    `update_by`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '更新人',
    `create_time` datetime(3)                                                           DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(3)                                                           DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '更新时间',
    `del`         int                                                          NOT NULL DEFAULT '0' COMMENT '逻辑删除',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 372
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='系统访问记录';

-- ----------------------------
-- Records of sys_login_logs
-- ----------------------------
BEGIN;
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (1, 1701847090820464641, 'admin', '', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36',
        '2023-12-08 17:54:03.000', '0', '1701847090820464641', '2023-12-08 17:54:03.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (2, 1701847090820464641, 'admin', '', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36',
        '2023-12-08 17:55:04.000', '0', '1701847090820464641', '2023-12-08 17:55:04.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (3, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36',
        '2023-12-08 17:56:35.000', '0', '1701847090820464641', '2023-12-08 17:56:35.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (4, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36',
        '2023-12-08 18:01:20.000', '1701847090820464641', '1701847090820464641', '2023-12-08 18:01:20.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (5, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36',
        '2023-12-08 18:03:32.000', '0', NULL, '2023-12-08 18:03:32.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (6, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 10:12:07.000', '0', NULL, '2023-12-11 10:12:07.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (7, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 10:25:41.000', '1701847090820464641', NULL, '2023-12-11 10:25:41.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (8, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 10:25:49.000', '1701847090820464641', NULL, '2023-12-11 10:25:49.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (9, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 10:30:34.000', '1701847090820464641', NULL, '2023-12-11 10:30:34.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (10, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 10:30:34.000', '1701847090820464641', NULL, '2023-12-11 10:30:34.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (11, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 11:28:36.000', '1701847090820464641', NULL, '2023-12-11 11:28:36.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (12, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 11:28:53.000', '1701847090820464641', NULL, '2023-12-11 11:28:53.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (13, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 11:30:08.000', '1701847090820464641', NULL, '2023-12-11 11:30:08.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (14, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 11:30:55.000', '1701847090820464641', NULL, '2023-12-11 11:30:55.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (15, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 11:30:59.000', '1701847090820464641', NULL, '2023-12-11 11:30:59.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (16, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 11:31:06.000', '1701847090820464641', NULL, '2023-12-11 11:31:06.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (17, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 11:31:36.000', '1701847090820464641', NULL, '2023-12-11 11:31:36.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (18, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 14:02:47.000', '1701847090820464641', NULL, '2023-12-11 14:02:47.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (19, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 14:03:19.000', '1701847090820464641', NULL, '2023-12-11 14:03:19.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (20, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 14:03:33.000', '1701847090820464641', NULL, '2023-12-11 14:03:33.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (21, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 14:04:01.000', '1701847090820464641', NULL, '2023-12-11 14:04:01.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (22, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 14:11:01.000', '1701847090820464641', NULL, '2023-12-11 14:11:01.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (23, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 14:16:05.000', '1701847090820464641', NULL, '2023-12-11 14:16:05.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (24, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 14:24:27.000', '1701847090820464641', NULL, '2023-12-11 14:24:27.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (25, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 14:29:50.000', '1701847090820464641', NULL, '2023-12-11 14:29:50.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (26, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 14:29:57.000', '1701847090820464641', NULL, '2023-12-11 14:29:57.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (27, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 14:30:04.000', '1701847090820464641', NULL, '2023-12-11 14:30:04.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (28, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 14:41:59.000', '1701847090820464641', NULL, '2023-12-11 14:41:59.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (29, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 15:10:29.000', '1701847090820464641', NULL, '2023-12-11 15:10:29.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (30, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 17:19:47.000', '1701847090820464641', NULL, '2023-12-11 17:19:47.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (31, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 17:25:39.000', '1701847090820464641', NULL, '2023-12-11 17:25:39.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (32, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 17:29:04.000', '1701847090820464641', NULL, '2023-12-11 17:29:04.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (33, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 17:31:11.000', '1701847090820464641', NULL, '2023-12-11 17:31:11.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (34, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 17:32:11.000', '1701847090820464641', NULL, '2023-12-11 17:32:11.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (35, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 17:38:37.000', '1701847090820464641', NULL, '2023-12-11 17:38:37.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (36, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-11 17:55:29.000', '1701847090820464641', NULL, '2023-12-11 17:55:29.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (37, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 08:59:00.000', '1701847090820464641', NULL, '2023-12-12 08:59:00.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (38, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 10:08:06.000', '1701847090820464641', NULL, '2023-12-12 10:08:06.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (39, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 10:32:14.000', '1701847090820464641', NULL, '2023-12-12 10:32:14.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (40, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 10:33:20.000', '1701847090820464641', NULL, '2023-12-12 10:33:20.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (41, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 10:41:37.000', '1701847090820464641', NULL, '2023-12-12 10:41:37.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (42, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 10:48:24.000', '1701847090820464641', NULL, '2023-12-12 10:48:24.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (43, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 10:56:16.000', '1701847090820464641', NULL, '2023-12-12 10:56:16.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (44, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 10:57:20.000', '1701847090820464641', NULL, '2023-12-12 10:57:20.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (45, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 11:00:19.000', '1701847090820464641', NULL, '2023-12-12 11:00:19.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (46, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 11:02:25.000', '1701847090820464641', NULL, '2023-12-12 11:02:25.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (47, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 11:32:02.000', '1701847090820464641', NULL, '2023-12-12 11:32:02.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (48, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 14:56:19.000', '1701847090820464641', NULL, '2023-12-12 14:56:19.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (49, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 15:48:41.000', '1701847090820464641', NULL, '2023-12-12 15:48:41.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (50, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 16:11:44.000', '1701847090820464641', NULL, '2023-12-12 16:11:44.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (51, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 16:12:12.000', '1701847090820464641', NULL, '2023-12-12 16:12:12.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (52, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 16:27:17.000', '1701847090820464641', NULL, '2023-12-12 16:27:17.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (53, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 16:28:05.000', '1701847090820464641', NULL, '2023-12-12 16:28:05.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (54, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 16:30:11.000', '1701847090820464641', NULL, '2023-12-12 16:30:11.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (55, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 16:36:37.000', '1701847090820464641', NULL, '2023-12-12 16:36:37.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (56, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 16:44:28.000', '1701847090820464641', NULL, '2023-12-12 16:44:28.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (57, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 16:49:38.000', '1701847090820464641', NULL, '2023-12-12 16:49:38.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (58, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-12 16:49:39.000', '1701847090820464641', NULL, '2023-12-12 16:49:39.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (59, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 11:37:27.000', '1701847090820464641', NULL, '2023-12-13 11:37:27.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (60, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 14:34:31.000', '1701847090820464641', NULL, '2023-12-13 14:34:31.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (61, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 14:36:25.000', '1701847090820464641', NULL, '2023-12-13 14:36:25.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (62, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 14:36:25.000', '1701847090820464641', NULL, '2023-12-13 14:36:25.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (63, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 15:08:09.000', '1701847090820464641', NULL, '2023-12-13 15:08:09.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (64, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 15:08:33.000', '1701847090820464641', NULL, '2023-12-13 15:08:33.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (65, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 15:09:57.000', '1701847090820464641', NULL, '2023-12-13 15:09:57.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (66, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 15:28:14.000', '1701847090820464641', NULL, '2023-12-13 15:28:14.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (67, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 15:28:40.000', '1701847090820464641', NULL, '2023-12-13 15:28:40.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (68, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 15:28:46.000', '1701847090820464641', NULL, '2023-12-13 15:28:46.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (69, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 16:31:36.000', '1701847090820464641', NULL, '2023-12-13 16:31:36.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (70, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 16:31:36.000', '1701847090820464641', NULL, '2023-12-13 16:31:36.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (71, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 16:31:37.000', '1701847090820464641', NULL, '2023-12-13 16:31:37.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (72, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 16:33:18.000', '1701847090820464641', NULL, '2023-12-13 16:33:18.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (73, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 16:33:42.000', '1701847090820464641', NULL, '2023-12-13 16:33:42.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (74, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 16:33:50.000', '1701847090820464641', NULL, '2023-12-13 16:33:50.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (75, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 16:34:33.000', '1701847090820464641', NULL, '2023-12-13 16:34:33.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (76, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 16:35:44.000', '1701847090820464641', NULL, '2023-12-13 16:35:44.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (77, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 16:37:30.000', '1701847090820464641', NULL, '2023-12-13 16:37:30.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (78, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-13 16:55:47.000', '1701847090820464641', NULL, '2023-12-13 16:55:47.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (79, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 11:21:24.000', '1701847090820464641', NULL, '2023-12-14 11:21:24.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (80, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 14:42:43.000', '1701847090820464641', NULL, '2023-12-14 14:42:43.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (81, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 14:42:43.000', '1701847090820464641', NULL, '2023-12-14 14:42:43.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (82, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 14:49:34.000', '1701847090820464641', NULL, '2023-12-14 14:49:34.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (83, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 14:55:14.000', '1701847090820464641', NULL, '2023-12-14 14:55:14.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (84, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 14:55:20.000', '1701847090820464641', NULL, '2023-12-14 14:55:20.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (85, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 15:02:18.000', '1701847090820464641', NULL, '2023-12-14 15:02:18.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (86, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 15:02:47.000', '1701847090820464641', NULL, '2023-12-14 15:02:47.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (87, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 15:33:48.000', '1701847090820464641', NULL, '2023-12-14 15:33:48.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (88, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 15:36:10.000', '1701847090820464641', NULL, '2023-12-14 15:36:10.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (89, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 15:48:56.000', '1701847090820464641', NULL, '2023-12-14 15:48:56.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (90, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 15:57:26.000', '1701847090820464641', NULL, '2023-12-14 15:57:26.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (91, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 16:01:32.000', '1701847090820464641', NULL, '2023-12-14 16:01:32.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (92, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 16:01:39.000', '1701847090820464641', NULL, '2023-12-14 16:01:39.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (93, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 16:02:40.000', '1701847090820464641', NULL, '2023-12-14 16:02:40.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (94, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 16:29:46.000', '1701847090820464641', NULL, '2023-12-14 16:29:46.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (95, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-14 17:05:32.000', '1701847090820464641', NULL, '2023-12-14 17:05:32.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (96, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:16:47.000', '1701847090820464641', NULL, '2023-12-20 10:16:47.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (97, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:16:47.000', '1701847090820464641', NULL, '2023-12-20 10:16:47.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (98, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:18:01.000', '1701847090820464641', NULL, '2023-12-20 10:18:01.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (99, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:18:09.000', '1701847090820464641', NULL, '2023-12-20 10:18:09.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (100, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:18:40.000', '1701847090820464641', NULL, '2023-12-20 10:18:40.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (101, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:19:10.000', '1701847090820464641', NULL, '2023-12-20 10:19:10.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (102, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:20:30.000', '1701847090820464641', NULL, '2023-12-20 10:20:30.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (103, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:24:41.000', '1701847090820464641', NULL, '2023-12-20 10:24:41.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (104, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:25:00.000', '1701847090820464641', NULL, '2023-12-20 10:25:00.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (105, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:26:42.000', '1701847090820464641', NULL, '2023-12-20 10:26:42.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (106, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:26:57.000', '1701847090820464641', NULL, '2023-12-20 10:26:57.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (107, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:27:32.000', '1701847090820464641', NULL, '2023-12-20 10:27:32.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (108, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:29:42.000', '1701847090820464641', NULL, '2023-12-20 10:29:42.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (109, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:31:15.000', '1701847090820464641', NULL, '2023-12-20 10:31:15.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (110, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:33:38.000', '1701847090820464641', NULL, '2023-12-20 10:33:38.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (111, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:34:25.000', '1701847090820464641', NULL, '2023-12-20 10:34:25.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (112, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:37:34.000', '1701847090820464641', NULL, '2023-12-20 10:37:34.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (113, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:37:35.000', '1701847090820464641', NULL, '2023-12-20 10:37:35.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (114, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:39:59.000', '1701847090820464641', NULL, '2023-12-20 10:39:59.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (115, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:41:07.000', '1701847090820464641', NULL, '2023-12-20 10:41:07.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (116, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:43:28.000', '1701847090820464641', NULL, '2023-12-20 10:43:28.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (117, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:43:32.000', '1701847090820464641', NULL, '2023-12-20 10:43:32.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (118, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:43:46.000', '1701847090820464641', NULL, '2023-12-20 10:43:46.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (119, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:44:08.000', '1701847090820464641', NULL, '2023-12-20 10:44:08.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (120, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:44:08.000', '1701847090820464641', NULL, '2023-12-20 10:44:08.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (121, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:44:25.000', '1701847090820464641', NULL, '2023-12-20 10:44:25.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (122, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:45:50.000', '1701847090820464641', NULL, '2023-12-20 10:45:50.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (123, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:46:04.000', '1701847090820464641', NULL, '2023-12-20 10:46:04.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (124, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:48:03.000', '1701847090820464641', NULL, '2023-12-20 10:48:03.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (125, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:52:51.000', '1701847090820464641', NULL, '2023-12-20 10:52:51.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (126, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:53:06.000', '1701847090820464641', NULL, '2023-12-20 10:53:06.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (127, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:53:20.000', '1701847090820464641', NULL, '2023-12-20 10:53:20.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (128, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:53:45.000', '1701847090820464641', NULL, '2023-12-20 10:53:45.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (129, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:53:45.000', '1701847090820464641', NULL, '2023-12-20 10:53:45.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (130, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 10:54:13.000', '1701847090820464641', NULL, '2023-12-20 10:54:13.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (131, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 11:33:24.000', '1701847090820464641', NULL, '2023-12-20 11:33:24.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (132, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 11:34:48.000', '1701847090820464641', NULL, '2023-12-20 11:34:48.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (133, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 11:39:28.000', '1701847090820464641', NULL, '2023-12-20 11:39:28.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (134, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 11:40:55.000', '1701847090820464641', NULL, '2023-12-20 11:40:55.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (135, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 11:42:39.000', '1701847090820464641', NULL, '2023-12-20 11:42:39.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (136, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 11:42:56.000', '1701847090820464641', NULL, '2023-12-20 11:42:56.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (137, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 11:43:12.000', '1701847090820464641', NULL, '2023-12-20 11:43:12.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (138, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 11:48:35.000', '1701847090820464641', NULL, '2023-12-20 11:48:35.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (139, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 14:02:52.000', '1701847090820464641', NULL, '2023-12-20 14:02:52.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (140, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 14:04:53.000', '1701847090820464641', NULL, '2023-12-20 14:04:53.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (141, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 14:08:38.000', '1701847090820464641', NULL, '2023-12-20 14:08:38.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (142, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 14:24:55.000', '1701847090820464641', NULL, '2023-12-20 14:24:55.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (143, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 14:25:30.000', '1701847090820464641', NULL, '2023-12-20 14:25:30.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (144, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 14:25:30.000', '1701847090820464641', NULL, '2023-12-20 14:25:30.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (145, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 14:26:19.000', '1701847090820464641', NULL, '2023-12-20 14:26:19.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (146, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 14:43:11.000', '1701847090820464641', NULL, '2023-12-20 14:43:11.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (147, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 14:43:45.000', '1701847090820464641', NULL, '2023-12-20 14:43:45.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (148, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 14:47:37.000', '1701847090820464641', NULL, '2023-12-20 14:47:37.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (149, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 14:48:00.000', '1701847090820464641', NULL, '2023-12-20 14:48:00.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (150, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 14:48:50.000', '1701847090820464641', NULL, '2023-12-20 14:48:50.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (151, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 14:49:44.000', '1701847090820464641', NULL, '2023-12-20 14:49:44.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (152, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 16:31:11.000', '1701847090820464641', NULL, '2023-12-20 16:31:11.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (153, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 16:41:34.000', '1701847090820464641', NULL, '2023-12-20 16:41:34.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (154, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 16:41:49.000', '1701847090820464641', NULL, '2023-12-20 16:41:49.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (155, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 16:47:14.000', '1701847090820464641', NULL, '2023-12-20 16:47:14.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (156, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 16:47:21.000', '1701847090820464641', NULL, '2023-12-20 16:47:21.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (157, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 16:47:25.000', '1701847090820464641', NULL, '2023-12-20 16:47:25.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (158, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 16:47:28.000', '1701847090820464641', NULL, '2023-12-20 16:47:28.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (159, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 16:47:33.000', '1701847090820464641', NULL, '2023-12-20 16:47:33.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (160, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 16:47:36.000', '1701847090820464641', NULL, '2023-12-20 16:47:36.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (161, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 17:16:44.000', '1701847090820464641', NULL, '2023-12-20 17:16:44.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (162, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 17:39:31.000', '1701847090820464641', NULL, '2023-12-20 17:39:31.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (163, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 17:40:05.000', '1701847090820464641', NULL, '2023-12-20 17:40:05.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (164, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 17:41:18.000', '1701847090820464641', NULL, '2023-12-20 17:41:18.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (165, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 17:52:08.000', '1701847090820464641', NULL, '2023-12-20 17:52:08.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (166, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 17:55:10.000', '1701847090820464641', NULL, '2023-12-20 17:55:10.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (167, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-20 17:58:15.000', '1701847090820464641', NULL, '2023-12-20 17:58:15.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (168, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 09:04:18.000', '1701847090820464641', NULL, '2023-12-21 09:04:18.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (169, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 14:34:53.000', '1701847090820464641', NULL, '2023-12-21 14:34:53.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (170, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 14:34:53.000', '1701847090820464641', NULL, '2023-12-21 14:34:53.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (171, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 14:35:06.000', '1701847090820464641', NULL, '2023-12-21 14:35:06.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (172, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 14:57:26.000', '1701847090820464641', NULL, '2023-12-21 14:57:26.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (173, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 15:03:39.000', '1701847090820464641', NULL, '2023-12-21 15:03:39.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (174, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:18:51.000', '1701847090820464641', NULL, '2023-12-21 16:18:51.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (175, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:21:18.000', '1701847090820464641', NULL, '2023-12-21 16:21:18.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (176, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:21:25.000', '1701847090820464641', NULL, '2023-12-21 16:21:25.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (177, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:21:33.000', '1701847090820464641', NULL, '2023-12-21 16:21:33.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (178, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:21:49.000', '1701847090820464641', NULL, '2023-12-21 16:21:49.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (179, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:21:59.000', '1701847090820464641', NULL, '2023-12-21 16:21:59.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (180, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:25:46.000', '1701847090820464641', NULL, '2023-12-21 16:25:46.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (181, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:30:35.000', '1701847090820464641', NULL, '2023-12-21 16:30:35.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (182, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:30:46.000', '1701847090820464641', NULL, '2023-12-21 16:30:46.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (183, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:35:58.000', '1701847090820464641', NULL, '2023-12-21 16:35:58.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (184, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:36:04.000', '1701847090820464641', NULL, '2023-12-21 16:36:04.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (185, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:36:35.000', '1701847090820464641', NULL, '2023-12-21 16:36:36.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (186, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:36:44.000', '1701847090820464641', NULL, '2023-12-21 16:36:44.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (187, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:37:16.000', '1701847090820464641', NULL, '2023-12-21 16:37:16.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (188, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:41:29.000', '1701847090820464641', NULL, '2023-12-21 16:41:29.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (189, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:41:39.000', '1701847090820464641', NULL, '2023-12-21 16:41:39.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (190, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:50:46.000', '1701847090820464641', NULL, '2023-12-21 16:50:46.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (191, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 16:52:39.000', '1701847090820464641', NULL, '2023-12-21 16:52:39.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (192, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 17:05:29.000', '1701847090820464641', NULL, '2023-12-21 17:05:29.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (193, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 17:26:54.000', '1701847090820464641', NULL, '2023-12-21 17:26:54.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (194, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-21 17:31:28.000', '1701847090820464641', NULL, '2023-12-21 17:31:28.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (195, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-22 10:04:19.000', '1701847090820464641', NULL, '2023-12-22 10:04:19.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (196, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-22 10:04:26.000', '1701847090820464641', NULL, '2023-12-22 10:04:26.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (197, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-22 10:04:30.000', '1701847090820464641', NULL, '2023-12-22 10:04:30.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (198, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-22 10:04:36.000', '1701847090820464641', NULL, '2023-12-22 10:04:36.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (199, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-22 10:04:53.000', '1701847090820464641', NULL, '2023-12-22 10:04:53.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (200, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-22 10:05:14.000', '1701847090820464641', NULL, '2023-12-22 10:05:14.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (201, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-22 10:06:10.000', '1701847090820464641', NULL, '2023-12-22 10:06:10.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (202, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-22 10:07:42.000', '1701847090820464641', NULL, '2023-12-22 10:07:42.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (203, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-22 10:09:07.000', '1701847090820464641', NULL, '2023-12-22 10:09:07.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (204, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-22 10:28:58.000', '1701847090820464641', NULL, '2023-12-22 10:28:58.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (205, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-22 11:20:41.000', '1701847090820464641', NULL, '2023-12-22 11:20:41.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (206, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-22 11:22:05.000', '1701847090820464641', NULL, '2023-12-22 11:22:05.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (207, 1701847090820464641, 'admin', '127.0.0.1', ',,内网IP',
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-24 23:41:10.000', '1701847090820464641', NULL, '2023-12-24 23:41:10.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (208, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 15:20:41.000', '1701847090820464641', NULL, '2023-12-25 15:20:41.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (209, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 15:20:53.000', '1701847090820464641', NULL, '2023-12-25 15:20:53.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (210, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 15:20:53.000', '1701847090820464641', NULL, '2023-12-25 15:20:53.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (211, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 15:29:58.000', '1701847090820464641', NULL, '2023-12-25 15:29:58.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (212, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 15:30:33.000', '1701847090820464641', NULL, '2023-12-25 15:30:33.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (213, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 15:30:57.000', '1701847090820464641', NULL, '2023-12-25 15:30:57.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (214, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 15:31:02.000', '1701847090820464641', NULL, '2023-12-25 15:31:02.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (215, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 15:31:48.000', '1701847090820464641', NULL, '2023-12-25 15:31:49.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (216, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 15:40:34.000', '1701847090820464641', NULL, '2023-12-25 15:40:34.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (217, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 15:56:00.000', '1701847090820464641', NULL, '2023-12-25 15:56:00.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (218, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 16:27:38.000', '1701847090820464641', NULL, '2023-12-25 16:27:38.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (219, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 16:48:31.000', '1701847090820464641', NULL, '2023-12-25 16:48:31.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (220, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 16:55:23.000', '1701847090820464641', NULL, '2023-12-25 16:55:23.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (221, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 16:55:40.000', '1701847090820464641', NULL, '2023-12-25 16:55:40.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (222, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 16:56:04.000', '1701847090820464641', NULL, '2023-12-25 16:56:04.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (223, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 16:56:11.000', '1701847090820464641', NULL, '2023-12-25 16:56:11.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (224, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:04:35.000', '1701847090820464641', NULL, '2023-12-25 17:04:35.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (225, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:04:35.000', '1701847090820464641', NULL, '2023-12-25 17:04:35.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (226, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:16:23.000', '1701847090820464641', NULL, '2023-12-25 17:16:23.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (227, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:37:34.000', '1701847090820464641', NULL, '2023-12-25 17:37:34.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (228, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:41:11.000', '1701847090820464641', NULL, '2023-12-25 17:41:11.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (229, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:41:59.000', '1701847090820464641', NULL, '2023-12-25 17:41:59.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (230, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:42:14.000', '1701847090820464641', NULL, '2023-12-25 17:42:14.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (231, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:42:37.000', '1701847090820464641', NULL, '2023-12-25 17:42:37.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (232, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:43:03.000', '1701847090820464641', NULL, '2023-12-25 17:43:03.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (233, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:43:48.000', '1701847090820464641', NULL, '2023-12-25 17:43:48.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (234, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:44:08.000', '1701847090820464641', NULL, '2023-12-25 17:44:08.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (235, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:44:11.000', '1701847090820464641', NULL, '2023-12-25 17:44:11.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (236, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:51:22.000', '1701847090820464641', NULL, '2023-12-25 17:51:22.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (237, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:51:52.000', '1701847090820464641', NULL, '2023-12-25 17:51:52.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (238, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:53:08.000', '1701847090820464641', NULL, '2023-12-25 17:53:08.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (239, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-25 17:53:51.000', '1701847090820464641', NULL, '2023-12-25 17:53:51.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (240, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 09:38:52.000', '1701847090820464641', NULL, '2023-12-26 09:38:52.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (241, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 09:38:52.000', '1701847090820464641', NULL, '2023-12-26 09:38:52.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (242, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 09:59:25.000', '1701847090820464641', NULL, '2023-12-26 09:59:25.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (243, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 10:00:21.000', '1701847090820464641', NULL, '2023-12-26 10:00:21.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (244, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 10:00:35.000', '1701847090820464641', NULL, '2023-12-26 10:00:35.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (245, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 10:29:51.000', '1701847090820464641', NULL, '2023-12-26 10:29:51.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (246, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 10:53:01.000', '1701847090820464641', NULL, '2023-12-26 10:53:01.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (247, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 10:54:18.000', '1701847090820464641', NULL, '2023-12-26 10:54:18.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (248, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 10:54:33.000', '1701847090820464641', NULL, '2023-12-26 10:54:33.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (249, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 10:54:59.000', '1701847090820464641', NULL, '2023-12-26 10:54:59.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (250, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 11:09:37.000', '1701847090820464641', NULL, '2023-12-26 11:09:37.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (251, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 11:17:47.000', '1701847090820464641', NULL, '2023-12-26 11:17:47.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (252, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 11:18:03.000', '1701847090820464641', NULL, '2023-12-26 11:18:03.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (253, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 11:23:57.000', '1701847090820464641', NULL, '2023-12-26 11:23:57.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (254, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 11:24:13.000', '1701847090820464641', NULL, '2023-12-26 11:24:13.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (255, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 11:26:42.000', '1701847090820464641', NULL, '2023-12-26 11:26:42.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (256, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 13:49:40.000', '1701847090820464641', NULL, '2023-12-26 13:49:40.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (257, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 14:03:30.000', '1701847090820464641', NULL, '2023-12-26 14:03:30.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (258, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 14:04:49.000', '1701847090820464641', NULL, '2023-12-26 14:04:49.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (259, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 14:07:41.000', '1701847090820464641', NULL, '2023-12-26 14:07:41.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (260, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 14:09:17.000', '1701847090820464641', NULL, '2023-12-26 14:09:17.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (261, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 14:09:31.000', '1701847090820464641', NULL, '2023-12-26 14:09:31.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (262, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 14:24:44.000', '1701847090820464641', NULL, '2023-12-26 14:24:44.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (263, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 14:27:46.000', '1701847090820464641', NULL, '2023-12-26 14:27:46.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (264, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 14:35:56.000', '1701847090820464641', NULL, '2023-12-26 14:35:56.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (265, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 14:39:21.000', '1701847090820464641', NULL, '2023-12-26 14:39:21.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (266, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 14:42:43.000', '1701847090820464641', NULL, '2023-12-26 14:42:43.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (267, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:00:28.000', '1701847090820464641', NULL, '2023-12-26 15:00:28.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (268, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:24:23.000', '1701847090820464641', NULL, '2023-12-26 15:24:23.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (269, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:25:35.000', '1701847090820464641', NULL, '2023-12-26 15:25:35.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (270, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:28:31.000', '1701847090820464641', NULL, '2023-12-26 15:28:31.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (271, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:28:54.000', '1701847090820464641', NULL, '2023-12-26 15:28:54.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (272, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:29:50.000', '1701847090820464641', NULL, '2023-12-26 15:29:50.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (273, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:30:06.000', '1701847090820464641', NULL, '2023-12-26 15:30:06.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (274, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:30:59.000', '1701847090820464641', NULL, '2023-12-26 15:30:59.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (275, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:32:39.000', '1701847090820464641', NULL, '2023-12-26 15:32:39.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (276, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:33:52.000', '1701847090820464641', NULL, '2023-12-26 15:33:52.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (277, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:38:18.000', '1701847090820464641', NULL, '2023-12-26 15:38:18.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (278, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:39:12.000', '1701847090820464641', NULL, '2023-12-26 15:39:12.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (279, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:40:05.000', '1701847090820464641', NULL, '2023-12-26 15:40:05.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (280, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:40:47.000', '1701847090820464641', NULL, '2023-12-26 15:40:47.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (281, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:41:45.000', '1701847090820464641', NULL, '2023-12-26 15:41:45.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (282, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:41:53.000', '1701847090820464641', NULL, '2023-12-26 15:41:53.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (283, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:45:38.000', '1701847090820464641', NULL, '2023-12-26 15:45:38.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (284, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:45:58.000', '1701847090820464641', NULL, '2023-12-26 15:45:58.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (285, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:46:09.000', '1701847090820464641', NULL, '2023-12-26 15:46:09.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (286, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:47:18.000', '1701847090820464641', NULL, '2023-12-26 15:47:18.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (287, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:47:28.000', '1701847090820464641', NULL, '2023-12-26 15:47:28.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (288, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:48:06.000', '1701847090820464641', NULL, '2023-12-26 15:48:06.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (289, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:52:01.000', '1701847090820464641', NULL, '2023-12-26 15:52:01.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (290, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:52:14.000', '1701847090820464641', NULL, '2023-12-26 15:52:14.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (291, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:53:17.000', '1701847090820464641', NULL, '2023-12-26 15:53:17.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (292, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:54:14.000', '1701847090820464641', NULL, '2023-12-26 15:54:14.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (293, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:59:02.000', '1701847090820464641', NULL, '2023-12-26 15:59:02.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (294, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 15:59:22.000', '1701847090820464641', NULL, '2023-12-26 15:59:22.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (295, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:00:51.000', '1701847090820464641', NULL, '2023-12-26 16:00:51.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (296, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:07:23.000', '1701847090820464641', NULL, '2023-12-26 16:07:23.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (297, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:09:59.000', '1701847090820464641', NULL, '2023-12-26 16:09:59.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (298, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:11:33.000', '1701847090820464641', NULL, '2023-12-26 16:11:33.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (299, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:14:56.000', '1701847090820464641', NULL, '2023-12-26 16:14:56.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (300, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:15:06.000', '1701847090820464641', NULL, '2023-12-26 16:15:06.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (301, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:15:51.000', '1701847090820464641', NULL, '2023-12-26 16:15:51.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (302, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:16:03.000', '1701847090820464641', NULL, '2023-12-26 16:16:03.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (303, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:16:25.000', '1701847090820464641', NULL, '2023-12-26 16:16:25.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (304, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:16:36.000', '1701847090820464641', NULL, '2023-12-26 16:16:36.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (305, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:17:17.000', '1701847090820464641', NULL, '2023-12-26 16:17:17.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (306, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:17:38.000', '1701847090820464641', NULL, '2023-12-26 16:17:38.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (307, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:18:07.000', '1701847090820464641', NULL, '2023-12-26 16:18:07.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (308, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:18:17.000', '1701847090820464641', NULL, '2023-12-26 16:18:17.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (309, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:18:23.000', '1701847090820464641', NULL, '2023-12-26 16:18:23.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (310, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:20:17.000', '1701847090820464641', NULL, '2023-12-26 16:20:17.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (311, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:22:02.000', '1701847090820464641', NULL, '2023-12-26 16:22:02.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (312, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:22:14.000', '1701847090820464641', NULL, '2023-12-26 16:22:14.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (313, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:23:14.000', '1701847090820464641', NULL, '2023-12-26 16:23:14.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (314, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:24:25.000', '1701847090820464641', NULL, '2023-12-26 16:24:25.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (315, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:25:03.000', '1701847090820464641', NULL, '2023-12-26 16:25:03.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (316, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:25:13.000', '1701847090820464641', NULL, '2023-12-26 16:25:13.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (317, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:26:24.000', '1701847090820464641', NULL, '2023-12-26 16:26:24.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (318, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:29:34.000', '1701847090820464641', NULL, '2023-12-26 16:29:34.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (319, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:29:58.000', '1701847090820464641', NULL, '2023-12-26 16:29:58.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (320, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:31:08.000', '1701847090820464641', NULL, '2023-12-26 16:31:08.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (321, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:31:44.000', '1701847090820464641', NULL, '2023-12-26 16:31:44.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (322, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:31:48.000', '1701847090820464641', NULL, '2023-12-26 16:31:48.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (323, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:35:14.000', '1701847090820464641', NULL, '2023-12-26 16:35:14.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (324, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:36:26.000', '1701847090820464641', NULL, '2023-12-26 16:36:26.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (325, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:36:53.000', '1701847090820464641', NULL, '2023-12-26 16:36:53.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (326, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:37:37.000', '1701847090820464641', NULL, '2023-12-26 16:37:37.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (327, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:37:56.000', '1701847090820464641', NULL, '2023-12-26 16:37:56.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (328, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:38:23.000', '1701847090820464641', NULL, '2023-12-26 16:38:23.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (329, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:38:32.000', '1701847090820464641', NULL, '2023-12-26 16:38:32.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (330, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:38:51.000', '1701847090820464641', NULL, '2023-12-26 16:38:51.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (331, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:39:05.000', '1701847090820464641', NULL, '2023-12-26 16:39:05.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (332, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:39:18.000', '1701847090820464641', NULL, '2023-12-26 16:39:18.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (333, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:39:34.000', '1701847090820464641', NULL, '2023-12-26 16:39:34.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (334, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:46:37.000', '1701847090820464641', NULL, '2023-12-26 16:46:37.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (335, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:46:46.000', '1701847090820464641', NULL, '2023-12-26 16:46:46.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (336, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:47:37.000', '1701847090820464641', NULL, '2023-12-26 16:47:37.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (337, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:48:02.000', '1701847090820464641', NULL, '2023-12-26 16:48:02.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (338, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:50:08.000', '1701847090820464641', NULL, '2023-12-26 16:50:08.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (339, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 16:57:08.000', '1701847090820464641', NULL, '2023-12-26 16:57:08.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (340, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:01:42.000', '1701847090820464641', NULL, '2023-12-26 17:01:42.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (341, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:04:59.000', '1701847090820464641', NULL, '2023-12-26 17:04:59.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (342, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:05:12.000', '1701847090820464641', NULL, '2023-12-26 17:05:12.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (343, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:06:03.000', '1701847090820464641', NULL, '2023-12-26 17:06:03.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (344, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:07:27.000', '1701847090820464641', NULL, '2023-12-26 17:07:27.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (345, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:08:00.000', '1701847090820464641', NULL, '2023-12-26 17:08:00.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (346, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:09:25.000', '1701847090820464641', NULL, '2023-12-26 17:09:25.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (347, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:09:47.000', '1701847090820464641', NULL, '2023-12-26 17:09:47.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (348, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:10:07.000', '1701847090820464641', NULL, '2023-12-26 17:10:07.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (349, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:10:21.000', '1701847090820464641', NULL, '2023-12-26 17:10:21.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (350, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:13:15.000', '1701847090820464641', NULL, '2023-12-26 17:13:15.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (351, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:13:48.000', '1701847090820464641', NULL, '2023-12-26 17:13:48.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (352, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:15:00.000', '1701847090820464641', NULL, '2023-12-26 17:15:00.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (353, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:15:13.000', '1701847090820464641', NULL, '2023-12-26 17:15:13.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (354, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:15:26.000', '1701847090820464641', NULL, '2023-12-26 17:15:26.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (355, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-26 17:40:54.000', '1701847090820464641', NULL, '2023-12-26 17:40:54.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (356, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-27 11:15:08.000', '1701847090820464641', NULL, '2023-12-27 11:15:08.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (357, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-27 11:16:26.000', '1701847090820464641', NULL, '2023-12-27 11:16:26.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (358, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-27 11:21:14.000', '1701847090820464641', NULL, '2023-12-27 11:21:14.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (359, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-27 11:26:02.000', '1701847090820464641', NULL, '2023-12-27 11:26:02.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (360, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-27 11:49:10.000', '1701847090820464641', NULL, '2023-12-27 11:49:10.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (361, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-28 09:34:56.000', '1701847090820464641', NULL, '2023-12-28 09:34:56.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (362, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-28 09:35:06.000', '1701847090820464641', NULL, '2023-12-28 09:35:06.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (363, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-28 09:35:08.000', '1701847090820464641', NULL, '2023-12-28 09:35:08.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (364, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-28 09:35:09.000', '1701847090820464641', NULL, '2023-12-28 09:35:09.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (365, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-28 09:35:13.000', '1701847090820464641', NULL, '2023-12-28 09:35:13.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (366, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-28 09:35:15.000', '1701847090820464641', NULL, '2023-12-28 09:35:15.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (367, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-28 09:35:42.000', '1701847090820464641', NULL, '2023-12-28 09:35:42.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (368, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-28 09:35:44.000', '1701847090820464641', NULL, '2023-12-28 09:35:44.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (369, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-28 09:44:54.000', '1701847090820464641', NULL, '2023-12-28 09:44:54.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (370, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-28 09:45:07.000', '1701847090820464641', NULL, '2023-12-28 09:45:07.000', NULL, 0);
INSERT INTO `sys_login_logs` (`id`, `user_id`, `username`, `ip`, `ip_location`, `browser`, `login_time`, `create_by`,
                              `update_by`, `create_time`, `update_time`, `del`)
VALUES (371, 1701847090820464641, 'admin', '172.19.70.70', ',,内网IP',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        '2023-12-28 09:45:08.000', '1701847090820464641', NULL, '2023-12-28 09:45:08.000', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`
(
    `id`            bigint unsigned                                              NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `menu_name`     varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
    `menu_type`     char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci    NOT NULL COMMENT '菜单类型',
    `parent_id`     bigint unsigned                                              NOT NULL DEFAULT '0' COMMENT '父菜单ID',
    `order_num`     int                                                                   DEFAULT '0' COMMENT '显示顺序',
    `path`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT '' COMMENT '路由地址',
    `component`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT '' COMMENT '组件路径',
    `redirect`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT '' COMMENT '重定向',
    `is_iframe`     tinyint                                                               DEFAULT '0' COMMENT '是否为外链',
    `is_link`       tinyint                                                               DEFAULT '0' COMMENT '是否为外链',
    `is_affix`      tinyint                                                               DEFAULT '0' COMMENT '是否固定',
    `is_keep_alive` tinyint                                                               DEFAULT '0' COMMENT '是否缓存',
    `is_hide`       tinyint                                                               DEFAULT '0' COMMENT '菜单是否显示',
    `link`          varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci         DEFAULT NULL COMMENT '地址',
    `perms`         varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '权限标识',
    `icon`          varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT '#' COMMENT '菜单图标',
    `enable`        tinyint                                                      NOT NULL DEFAULT '1' COMMENT '是否启用',
    `create_by`     char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci             DEFAULT NULL COMMENT '创建人',
    `create_time`   datetime(3)                                                           DEFAULT NULL COMMENT '创建时间',
    `update_by`     char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci             DEFAULT NULL COMMENT '更新人',
    `update_time`   datetime(3)                                                           DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`           int unsigned                                                 NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 37
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='菜单权限信息';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, '首页', 'PAGE', 0, 1, 'home', 'home/index', NULL, 0, NULL, 1, 1, NULL, NULL, NULL, '#', 1, NULL, NULL, NULL,
        '2023-12-20 10:57:49.530', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (2, '系统管理', 'CATALOGUE', 0, 13, 'system', NULL, '/system/menu', 0, 0, 0, 0, 0, '0', NULL,
        'iconfont icon-xitongshezhi', 1, '2022-09-22 22:25:42', '2022-11-18 19:27:43.000', NULL,
        '2023-12-20 10:57:49.599', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (3, '菜单配置', 'PAGE', 2, 1, 'system/menu', 'system/menu/index', NULL, 0, 0, 0, 1, 0, '0', 'system.menu.tree',
        'iconfont icon-caidan', 1, '2022-09-22 22:25:42', '2022-11-05 00:20:58.000', '1701847090820464641',
        '2023-12-07 16:07:49.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (4, '参数配置', 'PAGE', 2, 7, 'system/config', 'system/config/index', NULL, 0, 0, 0, 1, 0, '0',
        'system.config.page', 'iconfont icon-xitongshezhi', 1, '2022-10-17 18:42:28', '2022-12-22 00:09:14.000', NULL,
        NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (5, '字典管理', 'PAGE', 2, 6, 'system/dict', 'system/dict/index', NULL, 0, 0, 0, 1, 0, '0', 'system.dict.page',
        'iconfont icon-diannao1', 1, '2022-10-17 18:42:28', '2022-12-21 00:10:37.000', '1701847090820464641',
        '2023-12-12 16:21:33.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6, '机构管理', 'PAGE', 2, 2, 'system/org', 'system/org/index', '', 0, 0, 0, 1, 0, '', 'system.org.tree',
        'iconfont icon-shuxingtu', 1, '1701847090820464641', '2023-11-28 16:03:17.000', '1701847090820464641',
        '2023-12-07 16:08:28.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (7, '用户管理', 'PAGE', 2, 3, 'system/user', 'system/user/index', '', 0, 0, 0, 1, 0, '', 'system.user.page',
        'iconfont icon-icon-', 1, '1701847090820464641', '2023-11-30 09:49:51.000', NULL, '2023-11-30 09:49:51.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (8, '角色管理', 'PAGE', 2, 4, 'system/role', 'system/role/index', '', 0, 0, 0, 1, 0, '', 'system.role.page',
        'iconfont icon-gerenzhongxin', 1, '1701847090820464641', '2023-12-04 16:11:48.000', '1701847090820464641',
        '2023-12-07 16:07:07.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (9, '一级目录', 'CATALOGUE', 0, 15, 'test1', 'test', '', 0, 0, 0, 1, 0, '', NULL, 'iconfont icon-icon-', 1,
        '1701847090820464641', '2023-12-08 10:51:14.000', '1701847090820464641', '2023-12-22 10:57:42.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (10, '新增', 'BUTTON', 3, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.menu.add', '', 1, '1701847090820464641',
        '2023-12-08 11:19:07.000', NULL, '2023-12-08 11:19:07.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (11, '二级目录', 'CATALOGUE', 9, 1, 'test/two2', '', '', 0, 0, 0, 1, 0, '', NULL,
        'iconfont icon-yunshangchuan_o', 1, '1701847090820464641', '2023-12-08 11:19:41.000', '1701847090820464641',
        '2023-12-20 10:57:59.216', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (12, '三级目录', 'CATALOGUE', 11, 1, 'test/two/three', '', '', 0, 0, 0, 1, 0, '', NULL, '', 1,
        '1701847090820464641', '2023-12-08 11:20:17.000', '1701847090820464641', '2023-12-20 10:58:01.626', 1);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (13, '通知消息', 'PAGE', 2, 8, 'system/msg', 'system/msg/index', '', 0, 0, 0, 1, 0, '', 'system.msg.page',
        'iconfont icon-tongzhi1', 1, '1701847090820464641', '2023-12-11 14:05:27.000', '1701847090820464641',
        '2023-12-11 14:10:31.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (14, '编辑', 'BUTTON', 3, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.menu.update', '', 1, '1701847090820464641',
        '2023-12-12 16:18:13.000', '1701847090820464641', '2023-12-12 16:21:14.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (15, '删除', 'BUTTON', 3, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.menu.del', '', 1, '1701847090820464641',
        '2023-12-12 16:18:31.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (16, '新增', 'BUTTON', 5, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.dict.add', '', 1, '1701847090820464641',
        '2023-12-12 16:19:30.000', '1701847090820464641', '2023-12-12 16:21:41.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (17, '编辑', 'BUTTON', 5, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.dict.update', '', 1, '1701847090820464641',
        '2023-12-12 16:19:41.000', '1701847090820464641', '2023-12-12 16:21:26.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (18, '删除', 'BUTTON', 5, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.dict.del', '', 1, '1701847090820464641',
        '2023-12-12 16:19:55.000', '1701847090820464641', '2023-12-12 16:21:48.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (19, '删除', 'BUTTON', 4, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.config.del', '', 1, '1701847090820464641',
        '2023-12-12 16:23:05.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (20, '新增', 'BUTTON', 4, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.config.add', '', 1, '1701847090820464641',
        '2023-12-12 16:23:21.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (21, '编辑', 'BUTTON', 4, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.config.update', '', 1, '1701847090820464641',
        '2023-12-12 16:23:35.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (22, '新增', 'BUTTON', 8, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.role.add', '', 1, '1701847090820464641',
        '2023-12-12 16:39:25.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (23, '编辑', 'BUTTON', 8, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.role.update', '', 1, '1701847090820464641',
        '2023-12-12 16:39:37.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (24, '删除', 'BUTTON', 8, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.role.del', '', 1, '1701847090820464641',
        '2023-12-12 16:39:47.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (25, '删除', 'BUTTON', 7, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.user.del', '', 1, '1701847090820464641',
        '2023-12-12 16:40:03.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (26, '编辑', 'BUTTON', 7, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.user.update', '', 1, '1701847090820464641',
        '2023-12-12 16:40:14.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (27, '新增', 'BUTTON', 7, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.user.add', '', 1, '1701847090820464641',
        '2023-12-12 16:40:23.000', '1701847090820464641', '2023-12-12 16:40:39.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (28, '新增', 'BUTTON', 6, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.org.add', '', 1, '1701847090820464641',
        '2023-12-12 16:40:52.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (29, '删除', 'BUTTON', 6, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.org.del', '', 1, '1701847090820464641',
        '2023-12-12 16:41:47.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (30, '编辑', 'BUTTON', 6, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.org.update', '', 1, '1701847090820464641',
        '2023-12-12 16:42:02.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (31, '编辑', 'BUTTON', 13, 2, '', '', '', 0, 0, 0, 1, 0, '', 'system.msg.update', '', 1, '1701847090820464641',
        '2023-12-12 16:43:41.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (32, '删除', 'BUTTON', 13, 3, '', '', '', 0, 0, 0, 1, 0, '', 'system.msg.del', '', 1, '1701847090820464641',
        '2023-12-12 16:43:55.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (33, '新增', 'BUTTON', 13, 1, '', '', '', 0, 0, 0, 1, 0, '', 'system.msg.add', '', 1, '1701847090820464641',
        '2023-12-12 16:44:04.000', NULL, NULL, 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (34, '测试', 'PAGE', 0, 2, 'test', 'test/index', '', 0, 0, 0, 0, 0, NULL, NULL, 'iconfont icon-barcode-qr', 1,
        '1701847090820464641', '2023-12-20 11:34:02.000', '1701847090820464641', '2023-12-28 09:44:51.000', 0);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (35, '测试', 'BUTTON', 34, 1, '', '', '', 0, 0, 0, 1, 0, NULL, NULL, '', 1, '1701847090820464641',
        '2023-12-20 14:43:27.000', '1701847090820464641', '2023-12-28 09:38:37.000', 1);
INSERT INTO `sys_menu` (`id`, `menu_name`, `menu_type`, `parent_id`, `order_num`, `path`, `component`, `redirect`,
                        `is_iframe`, `is_link`, `is_affix`, `is_keep_alive`, `is_hide`, `link`, `perms`, `icon`,
                        `enable`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (36, 'nodejs', 'PAGE', 9, 1, 'nodejs', '', '', 1, 1, 0, 1, 0, 'https://www.nodejs.com.cn/', NULL, '', 1,
        '1701847090820464641', '2023-12-20 14:47:34.000', '1701847090820464641', '2023-12-20 14:49:39.000', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`
(
    `id`           bigint unsigned                                               NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `title`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
    `type`         char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '类别',
    `content`      longblob                                                      NOT NULL COMMENT '内容',
    `content_text` longblob                                                      NOT NULL COMMENT '纯文本内容',
    `sender`       varchar(255) COLLATE utf8mb4_general_ci                                DEFAULT NULL COMMENT '发送者',
    `status`       char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '消息状态',
    `create_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '创建人',
    `create_time`  datetime(3)                                                            DEFAULT NULL COMMENT '创建时间',
    `update_by`    char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '更新人',
    `update_time`  datetime(3)                                                            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`          int unsigned                                                  NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='消息通知';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` (`id`, `title`, `type`, `content`, `content_text`, `sender`, `status`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `del`)
VALUES (4, '社论｜重温实事求是思想路线', 'NOTICE',
        0x3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380823C2F703E3C703EE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380823C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380823C2F703E3C703EE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380823C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380823C2F703E3C703EE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380823C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380823C2F703E3C703EE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380823C2F703E3C703E3C62723E3C2F703E3C703E3C62723E3C2F703E3C703E3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380823C2F703E3C703EE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380823C2F703E3C703E3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380823C2F703E3C703EE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380823C2F703E3C703E3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380823C2F703E3C703EE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380823C2F703E3C703E3C62723E3C2F703E,
        0x0A0A3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380820AE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380820A0A0A3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380820AE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380820A0A0A3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380820AE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380820A0A0A3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380820AE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380820A0A0A3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380820AE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380820A3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380820AE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380820A3435E5B9B4EFBC8CE5B3A5E5B598E5B281E69C88E7A8A0E3808231393738E5B9B4E5B9B4E5BA95E58FACE5BC80E79A84E4B8ADE585B1E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AEFBC8CE9878DE696B0E7A1AEE5AE9AE5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE69E9CE696ADE7BB93E69D9FE2809CE4BBA5E998B6E7BAA7E69697E4BA89E4B8BAE7BAB2E2809DEFBC8CE5B086E585A8E5859AE5B7A5E4BD9CE9878DE782B9E8BDACE7A7BBE588B0E7BB8FE6B58EE5BBBAE8AEBEE4B88AE69DA5EFBC8CE68E80E8B5B7E4BA86E694B9E99DA9E5BC80E694BEE5BA8FE5B995E38082E694B9E99DA9E5BC80E694BEE68890E4B8BAE586B3E5AE9AE5BD93E4BBA3E4B8ADE59BBDE5898DE98094E591BDE8BF90E79A84E585B3E994AEE4B880E68B9BE38082E7BAAAE5BFB5E694B9E99DA9E5BC80E694BE3435E591A8E5B9B4EFBC8CE4B88DE58FAAE698AFE59B9EE9A1BEE8BF87E5BE80E79A84E889B0E99ABEE58E86E7A88BEFBC8CE4B88DE5BF98E5889DE5BF83EFBC8CE69BB4E698AFE4B8BAE4BA86E5879DE8819AE585B1E8AF86EFBC8CE696A9E6A398E59091E5898DE380820AE38080E38080E5BD93E697B6EFBC8CE7BB8FE58E86E2809CE58D81E5B9B4E58AA8E4B9B1E2809DE586B2E587BBEFBC8CE7BB8FE6B58EE7A4BEE4BC9AE4BCA4E79795E7B4AFE7B4AFEFBC8CE4BABAE5BF83E6809DE58F98E38082E58D81E4B880E5B18AE4B889E4B8ADE585A8E4BC9AE4B98BE68980E4BBA5E883BDE5A49FE68BA8E4B9B1E8BF94E6ADA3EFBC8CE5B9B6E5A5A0E5AE9AE6ADA4E5908EE4B8ADE59BBDE7BB8FE6B58EE885BEE9A39EE59FBAE7A180EFBC8CE4B880E69DA1E6A0B9E69CACE7BB8FE9AA8CE5B0B1E698AFE981B5E5BEAAE4BA86E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFE38082E5AE9EE4BA8BE6B182E698AFE698AFE9A9ACE5858BE6809DE4B8BBE4B989E79A84E6A0B9E69CACE8A782E782B9E5928CE696B9E6B395EFBC8CE5B9B6E58699E585A5E5859AE7ABA0E38082E5859AE79A84E6809DE683B3E8B7AFE7BABFE698AFE4B880E58887E4BB8EE5AE9EE99985E587BAE58F91EFBC8CE79086E8AEBAE88194E7B3BBE5AE9EE99985EFBC8CE5AE9EE4BA8BE6B182E698AFEFBC8CE59CA8E5AE9EE8B7B5E4B8ADE6A380E9AA8CE79C9FE79086E5928CE58F91E5B195E79C9FE79086E38082E98293E5B08FE5B9B3E8AFB4EFBC8CE2809CE694B9E99DA9E5BC80E694BEE79A84E68890E58A9FEFBC8CE4B88DE698AFE99DA0E69CACE69CACEFBC8CE8808CE698AFE99DA0E5AE9EE8B7B5EFBC8CE99DA0E5AE9EE4BA8BE6B182E698AFE38082E2809DE4B9A0E8BF91E5B9B3E680BBE4B9A6E8AEB0E4B99FE68C87E587BAEFBC8CE2809CE58E86E58FB2E58F8DE5A48DE8AF81E6988EEFBC8CE59D9AE68C81E5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E883BDE585B4E5859AE585B4E59BBDEFBC9BE8BF9DE8838CE5AE9EE4BA8BE6B182E698AFEFBC8CE5B0B1E4BC9AE8AFAFE5859AE8AFAFE59BBDE38082E2809DE9878DE6B8A9E5AE9EE4BA8BE6B182E698AFE6809DE683B3E8B7AFE7BABFEFBC8CE5B0B1E698AFE8A681E69186E884B1E69599E69DA1EFBC8CE79BB4E99DA2E78EB0E5AE9EE38082E8BF99E4B880E7BB8FE9AA8CEFBC8CE5AFB9E8BF84E4BB8AE58F91E5B195E8808CE8A880EFBC8CE698AFE4B88DE788BDE79A84E6B395E5AE9DEFBC8CE5AFB9E4BB8AE697A5E4B98BE694B9E99DA9EFBC8CE58899E698AFE5898DE8A18CE79A84E68C87E58D97E380820A,
        NULL, '0', '1701847090820464641', '2023-12-25 17:25:54.000', '1701847090820464641', '2023-12-26 10:59:21.000',
        0);
INSERT INTO `sys_notice` (`id`, `title`, `type`, `content`, `content_text`, `sender`, `status`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `del`)
VALUES (5, '测试', 'NOTICE', 0x3C703EE6B58BE8AF953C2F703E, 0xE6B58BE8AF95, NULL, '0', '1701847090820464641',
        '2023-12-26 09:52:45.000', '1701847090820464641', '2023-12-26 09:52:50.000', 0);
INSERT INTO `sys_notice` (`id`, `title`, `type`, `content`, `content_text`, `sender`, `status`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `del`)
VALUES (6, '测试1', 'NOTICE',
        0x3C703E266C743B74656D706C6174652667743B3C2F703E3C703E20266E6273703B266C743B646976207265663D227363726F6C6C436F6E7461696E657222207374796C653D226865696768743A2033303070783B206F766572666C6F772D793A206175746F2220407363726F6C6C3D2268616E646C655363726F6C6C222667743B3C2F703E3C703E20266E6273703B20266E6273703B266C743B64697620762D666F723D226974656D20696E206974656D7322203A6B65793D226974656D2E69642220636C6173733D226974656D222667743B7B7B206974656D2E74657874207D7D266C743B2F6469762667743B3C2F703E3C703E20266E6273703B266C743B2F6469762667743B3C2F703E3C703E266C743B2F74656D706C6174652667743B3C2F703E3C703E3C62723E3C2F703E3C703E266C743B736372697074207365747570206C616E673D227473222667743B3C2F703E3C703E696D706F7274207B207265662C206F6E4D6F756E746564207D2066726F6D2027767565273B3C2F703E3C703E3C62723E3C2F703E3C703E636F6E7374206974656D73203D20726566285B5D293B3C2F703E3C703E6C65742070616765203D20313B3C2F703E3C703E3C62723E3C2F703E3C703E636F6E737420666574636844617461203D206173796E63202829203D2667743B207B3C2F703E3C703E20266E6273703B2F2F20E6A8A1E68B9FE5BC82E6ADA5E58AA0E8BDBDE695B0E68DAE3C2F703E3C703E20266E6273703B6177616974206E65772050726F6D697365287265736F6C7665203D2667743B2073657454696D656F7574287265736F6C76652C203130303029293B3C2F703E3C703E20266E6273703B636F6E7374206E65774974656D73203D2041727261792E66726F6D287B206C656E6774683A203130207D2C20285F2C20696E64657829203D2667743B20287B2069643A206974656D732E6C656E677468202B20696E6465782C20746578743A20604974656D20247B6974656D732E6C656E677468202B20696E646578202B20317D60207D29293B3C2F703E3C703E20266E6273703B6974656D732E76616C7565203D205B2E2E2E6974656D732E76616C75652C202E2E2E6E65774974656D735D3B3C2F703E3C703E20266E6273703B706167652B2B3B3C2F703E3C703E7D3B3C2F703E3C703E3C62723E3C2F703E3C703E636F6E73742068616E646C655363726F6C6C203D202829203D2667743B207B3C2F703E3C703E20266E6273703B636F6E737420636F6E7461696E6572203D2024726566732E7363726F6C6C436F6E7461696E65723B3C2F703E3C703E20266E6273703B69662028636F6E7461696E657229207B3C2F703E3C703E20266E6273703B20266E6273703B636F6E7374207363726F6C6C486569676874203D20636F6E7461696E65722E7363726F6C6C4865696768743B3C2F703E3C703E20266E6273703B20266E6273703B636F6E7374207363726F6C6C546F70203D20636F6E7461696E65722E7363726F6C6C546F703B3C2F703E3C703E20266E6273703B20266E6273703B636F6E737420636C69656E74486569676874203D20636F6E7461696E65722E636C69656E744865696768743B3C2F703E3C703E3C62723E3C2F703E3C703E20266E6273703B20266E6273703B696620287363726F6C6C486569676874202D207363726F6C6C546F70203D3D3D20636C69656E7448656967687429207B3C2F703E3C703E20266E6273703B20266E6273703B20266E6273703B2F2F20E6BB9AE58AA8E588B0E5BA95E983A8EFBC8CE58AA0E8BDBDE69BB4E5A49AE695B0E68DAE3C2F703E3C703E20266E6273703B20266E6273703B20266E6273703B66657463684461746128293B3C2F703E3C703E20266E6273703B20266E6273703B7D3C2F703E3C703E20266E6273703B7D3C2F703E3C703E7D3B3C2F703E3C703E3C62723E3C2F703E3C703E6F6E4D6F756E746564282829203D2667743B207B3C2F703E3C703E20266E6273703B2F2F20E5889DE5A78BE58AA0E8BDBDE695B0E68DAE3C2F703E3C703E20266E6273703B66657463684461746128293B3C2F703E3C703E7D293B3C2F703E3C703E266C743B2F7363726970742667743B3C2F703E3C703E3C62723E3C2F703E3C703E266C743B7374796C652073636F7065642667743B3C2F703E3C703E2E6974656D207B3C2F703E3C703E20266E6273703B6D617267696E3A20313070783B3C2F703E3C703E20266E6273703B70616464696E673A20323070783B3C2F703E3C703E20266E6273703B626F726465723A2031707820736F6C696420236464643B3C2F703E3C703E7D3C2F703E3C703E266C743B2F7374796C652667743B3C2F703E3C703E3C62723E3C2F703E,
        0x3C74656D706C6174653E0A20203C646976207265663D227363726F6C6C436F6E7461696E657222207374796C653D226865696768743A2033303070783B206F766572666C6F772D793A206175746F2220407363726F6C6C3D2268616E646C655363726F6C6C223E0A202020203C64697620762D666F723D226974656D20696E206974656D7322203A6B65793D226974656D2E69642220636C6173733D226974656D223E7B7B206974656D2E74657874207D7D3C2F6469763E0A20203C2F6469763E0A3C2F74656D706C6174653E0A0A3C736372697074207365747570206C616E673D227473223E0A696D706F7274207B207265662C206F6E4D6F756E746564207D2066726F6D2027767565273B0A0A636F6E7374206974656D73203D20726566285B5D293B0A6C65742070616765203D20313B0A0A636F6E737420666574636844617461203D206173796E63202829203D3E207B0A20202F2F20E6A8A1E68B9FE5BC82E6ADA5E58AA0E8BDBDE695B0E68DAE0A20206177616974206E65772050726F6D697365287265736F6C7665203D3E2073657454696D656F7574287265736F6C76652C203130303029293B0A2020636F6E7374206E65774974656D73203D2041727261792E66726F6D287B206C656E6774683A203130207D2C20285F2C20696E64657829203D3E20287B2069643A206974656D732E6C656E677468202B20696E6465782C20746578743A20604974656D20247B6974656D732E6C656E677468202B20696E646578202B20317D60207D29293B0A20206974656D732E76616C7565203D205B2E2E2E6974656D732E76616C75652C202E2E2E6E65774974656D735D3B0A2020706167652B2B3B0A7D3B0A0A636F6E73742068616E646C655363726F6C6C203D202829203D3E207B0A2020636F6E737420636F6E7461696E6572203D2024726566732E7363726F6C6C436F6E7461696E65723B0A202069662028636F6E7461696E657229207B0A20202020636F6E7374207363726F6C6C486569676874203D20636F6E7461696E65722E7363726F6C6C4865696768743B0A20202020636F6E7374207363726F6C6C546F70203D20636F6E7461696E65722E7363726F6C6C546F703B0A20202020636F6E737420636C69656E74486569676874203D20636F6E7461696E65722E636C69656E744865696768743B0A0A20202020696620287363726F6C6C486569676874202D207363726F6C6C546F70203D3D3D20636C69656E7448656967687429207B0A2020202020202F2F20E6BB9AE58AA8E588B0E5BA95E983A8EFBC8CE58AA0E8BDBDE69BB4E5A49AE695B0E68DAE0A20202020202066657463684461746128293B0A202020207D0A20207D0A7D3B0A0A6F6E4D6F756E746564282829203D3E207B0A20202F2F20E5889DE5A78BE58AA0E8BDBDE695B0E68DAE0A202066657463684461746128293B0A7D293B0A3C2F7363726970743E0A0A3C7374796C652073636F7065643E0A2E6974656D207B0A20206D617267696E3A20313070783B0A202070616464696E673A20323070783B0A2020626F726465723A2031707820736F6C696420236464643B0A7D0A3C2F7374796C653E0A,
        NULL, '0', '1701847090820464641', '2023-12-26 13:50:10.000', NULL, NULL, 0);
INSERT INTO `sys_notice` (`id`, `title`, `type`, `content`, `content_text`, `sender`, `status`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `del`)
VALUES (7, '测试2', 'NOTICE',
        0x3C70207374796C653D22746578742D616C69676E3A2073746172743B223EE59CA8E5AD90E7BB84E4BBB6203C7370616E207374796C653D22636F6C6F723A20766172282D2D74772D70726F73652D636F6465293B223E3C636F64653E4368696C64436F6D706F6E656E743C2F636F64653E3C2F7370616E3E20E4B8ADEFBC8CE68891E4BBACE4BDBFE794A8203C7370616E207374796C653D22636F6C6F723A20766172282D2D74772D70726F73652D636F6465293B223E3C636F64653E646566696E6550726F70733C2F636F64653E3C2F7370616E3E20E69DA5E5AE9AE4B989203C7370616E207374796C653D22636F6C6F723A20766172282D2D74772D70726F73652D636F6465293B223E3C636F64653E70726F70733C2F636F64653E3C2F7370616E3EEFBC8CE5B9B6E4BDBFE794A8203C7370616E207374796C653D22636F6C6F723A20766172282D2D74772D70726F73652D636F6465293B223E3C636F64653E656D69743C2F636F64653E3C2F7370616E3E20E696B9E6B395E69DA5E8A7A6E58F91E887AAE5AE9AE4B989E4BA8BE4BBB6E38082E788B6E7BB84E4BBB6203C7370616E207374796C653D22636F6C6F723A20766172282D2D74772D70726F73652D636F6465293B223E3C636F64653E506172656E74436F6D706F6E656E743C2F636F64653E3C2F7370616E3E20E58899E79BB4E68EA5E59CA8203C7370616E207374796C653D22636F6C6F723A20766172282D2D74772D70726F73652D636F6465293B223E3C636F64653E73657475703C2F636F64653E3C2F7370616E3E20E4B8ADE5AE9AE4B989E4BA86E79BB8E5BA94E79A84E696B9E6B395E5928CE4BA8BE4BBB6E5A484E79086E587BDE695B0EFBC8CE5B9B6E59CA8E6A8A1E69DBFE4B8ADE4BCA0E98092E7BB99E5AD90E7BB84E4BBB6E380823C2F703E3C70207374796C653D22746578742D616C69676E3A2073746172743B223EE8BF99E6A0B7E79A84205479706553637269707420E58699E6B395E58FAFE4BBA5E68F90E4BE9BE69BB4E5BCBAE5A4A7E79A84E7B1BBE59E8BE6A380E69FA5E5928CE887AAE58AA8E8A1A5E585A8E38082E7A1AEE4BF9DE4BDA0E79A842056756520E78988E69CACE694AFE68C8120567565203320E79A8420436F6D706F736974696F6E2041504920E5928C2054797065536372697074E380823C2F703E,
        0xE59CA8E5AD90E7BB84E4BBB6204368696C64436F6D706F6E656E7420E4B8ADEFBC8CE68891E4BBACE4BDBFE794A820646566696E6550726F707320E69DA5E5AE9AE4B9892070726F7073EFBC8CE5B9B6E4BDBFE794A820656D697420E696B9E6B395E69DA5E8A7A6E58F91E887AAE5AE9AE4B989E4BA8BE4BBB6E38082E788B6E7BB84E4BBB620506172656E74436F6D706F6E656E7420E58899E79BB4E68EA5E59CA820736574757020E4B8ADE5AE9AE4B989E4BA86E79BB8E5BA94E79A84E696B9E6B395E5928CE4BA8BE4BBB6E5A484E79086E587BDE695B0EFBC8CE5B9B6E59CA8E6A8A1E69DBFE4B8ADE4BCA0E98092E7BB99E5AD90E7BB84E4BBB6E380820AE8BF99E6A0B7E79A84205479706553637269707420E58699E6B395E58FAFE4BBA5E68F90E4BE9BE69BB4E5BCBAE5A4A7E79A84E7B1BBE59E8BE6A380E69FA5E5928CE887AAE58AA8E8A1A5E585A8E38082E7A1AEE4BF9DE4BDA0E79A842056756520E78988E69CACE694AFE68C8120567565203320E79A8420436F6D706F736974696F6E2041504920E5928C2054797065536372697074E38082,
        NULL, '0', '1701847090820464641', '2023-12-26 13:50:26.000', NULL, NULL, 0);
INSERT INTO `sys_notice` (`id`, `title`, `type`, `content`, `content_text`, `sender`, `status`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `del`)
VALUES (8, '测试3', 'NOTICE',
        0x3C703E266C743B212D2D20506172656E74436F6D706F6E656E742E767565202D2D2667743B3C2F703E3C703E266C743B74656D706C6174652667743B3C2F703E3C703E20266E6273703B266C743B6469762667743B3C2F703E3C703E20266E6273703B20266E6273703B266C743B4368696C64436F6D706F6E656E74203A706172656E744D6574686F643D22706172656E744D6574686F642220406368696C644576656E743D2268616E646C654368696C644576656E7422202F2667743B3C2F703E3C703E20266E6273703B266C743B2F6469762667743B3C2F703E3C703E266C743B2F74656D706C6174652667743B3C2F703E3C703E3C62723E3C2F703E3C703E266C743B736372697074207365747570206C616E673D227473222667743B3C2F703E3C703E696D706F7274204368696C64436F6D706F6E656E742066726F6D20272E2F4368696C64436F6D706F6E656E742E767565273B3C2F703E3C703E3C62723E3C2F703E3C703E636F6E737420706172656E744D6574686F64203D202829203D2667743B207B3C2F703E3C703E20266E6273703B636F6E736F6C652E6C6F672827506172656E74206D6574686F642069732063616C6C656427293B3C2F703E3C703E7D3B3C2F703E3C703E3C62723E3C2F703E3C703E636F6E73742068616E646C654368696C644576656E74203D2028646174613A207B206D6573736167653A20737472696E67207D29203D2667743B207B3C2F703E3C703E20266E6273703B636F6E736F6C652E6C6F6728274368696C64206576656E7420697320747269676765726564207769746820646174613A272C2064617461293B3C2F703E3C703E7D3B3C2F703E3C703E266C743B2F7363726970742667743B3C2F703E3C703E3C62723E3C2F703E,
        0x3C212D2D20506172656E74436F6D706F6E656E742E767565202D2D3E0A3C74656D706C6174653E0A20203C6469763E0A202020203C4368696C64436F6D706F6E656E74203A706172656E744D6574686F643D22706172656E744D6574686F642220406368696C644576656E743D2268616E646C654368696C644576656E7422202F3E0A20203C2F6469763E0A3C2F74656D706C6174653E0A0A3C736372697074207365747570206C616E673D227473223E0A696D706F7274204368696C64436F6D706F6E656E742066726F6D20272E2F4368696C64436F6D706F6E656E742E767565273B0A0A636F6E737420706172656E744D6574686F64203D202829203D3E207B0A2020636F6E736F6C652E6C6F672827506172656E74206D6574686F642069732063616C6C656427293B0A7D3B0A0A636F6E73742068616E646C654368696C644576656E74203D2028646174613A207B206D6573736167653A20737472696E67207D29203D3E207B0A2020636F6E736F6C652E6C6F6728274368696C64206576656E7420697320747269676765726564207769746820646174613A272C2064617461293B0A7D3B0A3C2F7363726970743E0A,
        NULL, '0', '1701847090820464641', '2023-12-26 13:50:41.000', NULL, NULL, 0);
INSERT INTO `sys_notice` (`id`, `title`, `type`, `content`, `content_text`, `sender`, `status`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `del`)
VALUES (9, '测试4', 'NOTICE',
        0x3C703E266C743B212D2D204368696C64436F6D706F6E656E742E767565202D2D2667743B3C2F703E3C703E266C743B74656D706C6174652667743B3C2F703E3C703E20266E6273703B266C743B6469762667743B3C2F703E3C703E20266E6273703B20266E6273703B266C743B627574746F6E2040636C69636B3D2263616C6C506172656E744D6574686F64222667743B43616C6C20506172656E74204D6574686F64266C743B2F627574746F6E2667743B3C2F703E3C703E20266E6273703B266C743B2F6469762667743B3C2F703E3C703E266C743B2F74656D706C6174652667743B3C2F703E3C703E3C62723E3C2F703E3C703E266C743B7363726970742667743B3C2F703E3C703E696D706F7274207B207265662C20646566696E65436F6D706F6E656E74207D2066726F6D2027767565273B3C2F703E3C703E3C62723E3C2F703E3C703E6578706F72742064656661756C7420646566696E65436F6D706F6E656E74287B3C2F703E3C703E20266E6273703B70726F70733A207B3C2F703E3C703E20266E6273703B20266E6273703B706172656E744D6574686F643A2046756E6374696F6E3C2F703E3C703E20266E6273703B7D2C3C2F703E3C703E20266E6273703B6D6574686F64733A207B3C2F703E3C703E20266E6273703B20266E6273703B63616C6C506172656E744D6574686F642829207B3C2F703E3C703E20266E6273703B20266E6273703B20266E6273703B69662028747970656F6620746869732E706172656E744D6574686F64203D3D3D202766756E6374696F6E2729207B3C2F703E3C703E20266E6273703B20266E6273703B20266E6273703B20266E6273703B746869732E706172656E744D6574686F6428293B3C2F703E3C703E20266E6273703B20266E6273703B20266E6273703B7D3C2F703E3C703E20266E6273703B20266E6273703B20266E6273703B2F2F20E58FAFE4BBA5E9809AE8BF87E887AAE5AE9AE4B989E4BA8BE4BBB6E59091E788B6E7BB84E4BBB6E58F91E98081E6B688E681AF3C2F703E3C703E20266E6273703B20266E6273703B20266E6273703B746869732E24656D697428276368696C644576656E74272C207B206D6573736167653A202748656C6C6F2066726F6D206368696C6420636F6D706F6E656E7427207D293B3C2F703E3C703E20266E6273703B20266E6273703B7D3C2F703E3C703E20266E6273703B7D3C2F703E3C703E7D293B3C2F703E3C703E266C743B2F7363726970742667743B3C2F703E3C703E3C62723E3C2F703E,
        0x3C212D2D204368696C64436F6D706F6E656E742E767565202D2D3E0A3C74656D706C6174653E0A20203C6469763E0A202020203C627574746F6E2040636C69636B3D2263616C6C506172656E744D6574686F64223E43616C6C20506172656E74204D6574686F643C2F627574746F6E3E0A20203C2F6469763E0A3C2F74656D706C6174653E0A0A3C7363726970743E0A696D706F7274207B207265662C20646566696E65436F6D706F6E656E74207D2066726F6D2027767565273B0A0A6578706F72742064656661756C7420646566696E65436F6D706F6E656E74287B0A202070726F70733A207B0A20202020706172656E744D6574686F643A2046756E6374696F6E0A20207D2C0A20206D6574686F64733A207B0A2020202063616C6C506172656E744D6574686F642829207B0A20202020202069662028747970656F6620746869732E706172656E744D6574686F64203D3D3D202766756E6374696F6E2729207B0A2020202020202020746869732E706172656E744D6574686F6428293B0A2020202020207D0A2020202020202F2F20E58FAFE4BBA5E9809AE8BF87E887AAE5AE9AE4B989E4BA8BE4BBB6E59091E788B6E7BB84E4BBB6E58F91E98081E6B688E681AF0A202020202020746869732E24656D697428276368696C644576656E74272C207B206D6573736167653A202748656C6C6F2066726F6D206368696C6420636F6D706F6E656E7427207D293B0A202020207D0A20207D0A7D293B0A3C2F7363726970743E0A,
        NULL, '0', '1701847090820464641', '2023-12-26 13:50:58.000', NULL, NULL, 0);
INSERT INTO `sys_notice` (`id`, `title`, `type`, `content`, `content_text`, `sender`, `status`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `del`)
VALUES (10, '测试5', 'NOTICE',
        0x3C703E266C743B212D2D204368696C64436F6D706F6E656E742E767565202D2D2667743B3C2F703E3C703E266C743B74656D706C6174652667743B3C2F703E3C703E20266C743B6469762667743B3C2F703E3C703E20266E6273703B20266C743B627574746F6E2040636C69636B3D2263616C6C506172656E744D6574686F64222667743B43616C6C20506172656E74204D6574686F64266C743B2F627574746F6E2667743B3C2F703E3C703E20266C743B2F6469762667743B3C2F703E3C703E266C743B2F74656D706C6174652667743B3C2F703E3C703E3C62723E3C2F703E3C703E266C743B7363726970742667743B3C2F703E3C703E696D706F7274207B207265662C20646566696E65436F6D706F6E656E74207D2066726F6D2027767565273B3C2F703E3C703E3C62723E3C2F703E3C703E6578706F72742064656661756C7420646566696E65436F6D706F6E656E74287B3C2F703E3C703E2070726F70733A207B3C2F703E3C703E20266E6273703B20706172656E744D6574686F643A2046756E6374696F6E3C2F703E3C703E207D2C3C2F703E3C703E206D6574686F64733A207B3C2F703E3C703E20266E6273703B2063616C6C506172656E744D6574686F642829207B3C2F703E3C703E20266E6273703B20266E6273703B2069662028747970656F6620746869732E706172656E744D6574686F64203D3D3D202766756E6374696F6E2729207B3C2F703E3C703E20266E6273703B20266E6273703B20266E6273703B20746869732E706172656E744D6574686F6428293B3C2F703E3C703E20266E6273703B20266E6273703B207D3C2F703E3C703E20266E6273703B20266E6273703B202F2F20E58FAFE4BBA5E9809AE8BF87E887AAE5AE9AE4B989E4BA8BE4BBB6E59091E788B6E7BB84E4BBB6E58F91E98081E6B688E681AF3C2F703E3C703E20266E6273703B20266E6273703B20746869732E24656D697428276368696C644576656E74272C207B206D6573736167653A202748656C6C6F2066726F6D206368696C6420636F6D706F6E656E7427207D293B3C2F703E3C703E20266E6273703B207D3C2F703E3C703E207D3C2F703E3C703E7D293B3C2F703E3C703E266C743B2F7363726970742667743B3C2F703E3C703E3C62723E3C2F703E,
        0x3C212D2D204368696C64436F6D706F6E656E742E767565202D2D3E0A3C74656D706C6174653E0A203C6469763E0A2020203C627574746F6E2040636C69636B3D2263616C6C506172656E744D6574686F64223E43616C6C20506172656E74204D6574686F643C2F627574746F6E3E0A203C2F6469763E0A3C2F74656D706C6174653E0A0A3C7363726970743E0A696D706F7274207B207265662C20646566696E65436F6D706F6E656E74207D2066726F6D2027767565273B0A0A6578706F72742064656661756C7420646566696E65436F6D706F6E656E74287B0A2070726F70733A207B0A202020706172656E744D6574686F643A2046756E6374696F6E0A207D2C0A206D6574686F64733A207B0A20202063616C6C506172656E744D6574686F642829207B0A202020202069662028747970656F6620746869732E706172656E744D6574686F64203D3D3D202766756E6374696F6E2729207B0A20202020202020746869732E706172656E744D6574686F6428293B0A20202020207D0A20202020202F2F20E58FAFE4BBA5E9809AE8BF87E887AAE5AE9AE4B989E4BA8BE4BBB6E59091E788B6E7BB84E4BBB6E58F91E98081E6B688E681AF0A2020202020746869732E24656D697428276368696C644576656E74272C207B206D6573736167653A202748656C6C6F2066726F6D206368696C6420636F6D706F6E656E7427207D293B0A2020207D0A207D0A7D293B0A3C2F7363726970743E0A,
        NULL, '0', '1701847090820464641', '2023-12-26 16:07:40.000', NULL, NULL, 0);
INSERT INTO `sys_notice` (`id`, `title`, `type`, `content`, `content_text`, `sender`, `status`, `create_by`,
                          `create_time`, `update_by`, `update_time`, `del`)
VALUES (11, '测试6', 'NOTICE',
        0x3C703E266C743B212D2D204368696C64436F6D706F6E656E742E767565202D2D2667743B3C2F703E3C703E266C743B74656D706C6174652667743B3C2F703E3C703E20266C743B6469762667743B3C2F703E3C703E20266E6273703B20266C743B627574746F6E2040636C69636B3D2263616C6C506172656E744D6574686F64222667743B43616C6C20506172656E74204D6574686F64266C743B2F627574746F6E2667743B3C2F703E3C703E20266C743B2F6469762667743B3C2F703E3C703E266C743B2F74656D706C6174652667743B3C2F703E3C703E3C62723E3C2F703E3C703E266C743B7363726970742667743B3C2F703E3C703E696D706F7274207B207265662C20646566696E65436F6D706F6E656E74207D2066726F6D2027767565273B3C2F703E3C703E3C62723E3C2F703E3C703E6578706F72742064656661756C7420646566696E65436F6D706F6E656E74287B3C2F703E3C703E2070726F70733A207B3C2F703E3C703E20266E6273703B20706172656E744D6574686F643A2046756E6374696F6E3C2F703E3C703E207D2C3C2F703E3C703E206D6574686F64733A207B3C2F703E3C703E20266E6273703B2063616C6C506172656E744D6574686F642829207B3C2F703E3C703E20266E6273703B20266E6273703B2069662028747970656F6620746869732E706172656E744D6574686F64203D3D3D202766756E6374696F6E2729207B3C2F703E3C703E20266E6273703B20266E6273703B20266E6273703B20746869732E706172656E744D6574686F6428293B3C2F703E3C703E20266E6273703B20266E6273703B207D3C2F703E3C703E20266E6273703B20266E6273703B202F2F20E58FAFE4BBA5E9809AE8BF87E887AAE5AE9AE4B989E4BA8BE4BBB6E59091E788B6E7BB84E4BBB6E58F91E98081E6B688E681AF3C2F703E3C703E20266E6273703B20266E6273703B20746869732E24656D697428276368696C644576656E74272C207B206D6573736167653A202748656C6C6F2066726F6D206368696C6420636F6D706F6E656E7427207D293B3C2F703E3C703E20266E6273703B207D3C2F703E3C703E207D3C2F703E3C703E7D293B3C2F703E3C703E266C743B2F7363726970742667743B3C2F703E3C703E3C62723E3C2F703E,
        0x3C212D2D204368696C64436F6D706F6E656E742E767565202D2D3E0A3C74656D706C6174653E0A203C6469763E0A2020203C627574746F6E2040636C69636B3D2263616C6C506172656E744D6574686F64223E43616C6C20506172656E74204D6574686F643C2F627574746F6E3E0A203C2F6469763E0A3C2F74656D706C6174653E0A0A3C7363726970743E0A696D706F7274207B207265662C20646566696E65436F6D706F6E656E74207D2066726F6D2027767565273B0A0A6578706F72742064656661756C7420646566696E65436F6D706F6E656E74287B0A2070726F70733A207B0A202020706172656E744D6574686F643A2046756E6374696F6E0A207D2C0A206D6574686F64733A207B0A20202063616C6C506172656E744D6574686F642829207B0A202020202069662028747970656F6620746869732E706172656E744D6574686F64203D3D3D202766756E6374696F6E2729207B0A20202020202020746869732E706172656E744D6574686F6428293B0A20202020207D0A20202020202F2F20E58FAFE4BBA5E9809AE8BF87E887AAE5AE9AE4B989E4BA8BE4BBB6E59091E788B6E7BB84E4BBB6E58F91E98081E6B688E681AF0A2020202020746869732E24656D697428276368696C644576656E74272C207B206D6573736167653A202748656C6C6F2066726F6D206368696C6420636F6D706F6E656E7427207D293B0A2020207D0A207D0A7D293B0A3C2F7363726970743E0A,
        NULL, '0', '1701847090820464641', '2023-12-26 16:07:53.000', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org`
(
    `id`             bigint unsigned                                               NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `org_parent_id`  bigint unsigned                                               NOT NULL DEFAULT '0' COMMENT '上级id',
    `org_name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织名称',
    `org_short_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '组织简称',
    `org_level`      char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '组织级别',
    `org_type`       char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '组织类型',
    `org_nature`     char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '组织性质',
    `org_code`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '机构编码',
    `org_tag`        char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '组织标签',
    `org_province`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '省',
    `org_city`       varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '市',
    `org_district`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '区',
    `org_area_code`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '区划代码集',
    `org_address`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '详细地址',
    `org_desc`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT '机构简介',
    `org_logo`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci          DEFAULT NULL COMMENT 'logo',
    `org_sort`       int                                                                    DEFAULT NULL COMMENT '顺序',
    `org_status`     char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci               DEFAULT NULL COMMENT '组织状态',
    `create_by`      char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '创建人',
    `create_time`    datetime(3)                                                            DEFAULT NULL COMMENT '创建时间',
    `update_by`      char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '更新人',
    `update_time`    datetime(3)                                                            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`            int unsigned                                                  NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='组织信息';

-- ----------------------------
-- Records of sys_org
-- ----------------------------
BEGIN;
INSERT INTO `sys_org` (`id`, `org_parent_id`, `org_name`, `org_short_name`, `org_level`, `org_type`, `org_nature`,
                       `org_code`, `org_tag`, `org_province`, `org_city`, `org_district`, `org_area_code`,
                       `org_address`, `org_desc`, `org_logo`, `org_sort`, `org_status`, `create_by`, `create_time`,
                       `update_by`, `update_time`, `del`)
VALUES (7, 0, '测试机构', '测试', '一级', '测试', '测试', '001', '测试', '120000', '120100', '120101', NULL, '测试地址',
        '测试简介', '', 1, NULL, '1701847090820464641', '2023-11-29 10:58:17.000', NULL, '2023-12-21 14:57:05.540', 0);
INSERT INTO `sys_org` (`id`, `org_parent_id`, `org_name`, `org_short_name`, `org_level`, `org_type`, `org_nature`,
                       `org_code`, `org_tag`, `org_province`, `org_city`, `org_district`, `org_area_code`,
                       `org_address`, `org_desc`, `org_logo`, `org_sort`, `org_status`, `create_by`, `create_time`,
                       `update_by`, `update_time`, `del`)
VALUES (9, 7, '测试机构1', '测试1', '二级', '测试1', '测试1', '002', '测试1', '140000', '140100', '140105',
        '140000,140100,140105', '测试地址1', '测试简介1', '', 1, NULL, '1701847090820464641', '2023-11-29 15:08:46.000',
        NULL, '2023-12-21 14:57:05.615', 0);
INSERT INTO `sys_org` (`id`, `org_parent_id`, `org_name`, `org_short_name`, `org_level`, `org_type`, `org_nature`,
                       `org_code`, `org_tag`, `org_province`, `org_city`, `org_district`, `org_area_code`,
                       `org_address`, `org_desc`, `org_logo`, `org_sort`, `org_status`, `create_by`, `create_time`,
                       `update_by`, `update_time`, `del`)
VALUES (10, 9, '测试机构2', '测试2', '', '', '', '', '', '', '', '', '', '', '', '', 1, NULL, '1701847090820464641',
        '2023-12-13 11:37:48.000', NULL, '2023-12-21 14:57:05.690', 0);
INSERT INTO `sys_org` (`id`, `org_parent_id`, `org_name`, `org_short_name`, `org_level`, `org_type`, `org_nature`,
                       `org_code`, `org_tag`, `org_province`, `org_city`, `org_district`, `org_area_code`,
                       `org_address`, `org_desc`, `org_logo`, `org_sort`, `org_status`, `create_by`, `create_time`,
                       `update_by`, `update_time`, `del`)
VALUES (11, 9, '测试机构3', '测试3', '', '', '', '', '', '', '', '', '', '', '', '', 2, NULL, '1701847090820464641',
        '2023-12-13 11:38:03.000', NULL, '2023-12-21 14:57:05.764', 0);
INSERT INTO `sys_org` (`id`, `org_parent_id`, `org_name`, `org_short_name`, `org_level`, `org_type`, `org_nature`,
                       `org_code`, `org_tag`, `org_province`, `org_city`, `org_district`, `org_area_code`,
                       `org_address`, `org_desc`, `org_logo`, `org_sort`, `org_status`, `create_by`, `create_time`,
                       `update_by`, `update_time`, `del`)
VALUES (12, 11, '测试机构4', '测试4', '', '', '', '', '', NULL, NULL, '', '', '', '', '', 1, NULL,
        '1701847090820464641', '2023-12-13 11:38:13.000', NULL, '2023-12-21 14:57:05.841', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`
(
    `id`          bigint unsigned                                              NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `org_id`      bigint unsigned                                              NOT NULL COMMENT '机构ID',
    `post_code`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
    `post_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
    `post_sort`   int                                                          NOT NULL COMMENT '显示顺序',
    `enable`      tinyint                                                      NOT NULL DEFAULT '1' COMMENT '是否启用',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci             DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3)                                                           DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci             DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3)                                                           DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         int unsigned                                                 NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='岗位信息';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `id`              bigint unsigned                                               NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `org_id`          bigint unsigned                                               NOT NULL COMMENT '归属组织ID',
    `role_name`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '角色名字',
    `role_key`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色key',
    `authority_level` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '权限级别',
    `role_sort`       int unsigned                                                  NOT NULL DEFAULT '0' COMMENT '显示顺序',
    `enable`          tinyint                                                       NOT NULL DEFAULT '1' COMMENT '是否启用',
    `create_by`       char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '创建人',
    `create_time`     datetime(3)                                                            DEFAULT NULL COMMENT '创建时间',
    `update_by`       char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '更新人',
    `update_time`     datetime(3)                                                            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`             int unsigned                                                  NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='角色信息';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`id`, `org_id`, `role_name`, `role_key`, `authority_level`, `role_sort`, `enable`, `create_by`,
                        `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, 7, 'admin', 'admin', 'LOWER', 1, 1, NULL, NULL, '1701847090820464641', '2023-12-12 16:44:39.000', 0);
INSERT INTO `sys_role` (`id`, `org_id`, `role_name`, `role_key`, `authority_level`, `role_sort`, `enable`, `create_by`,
                        `create_time`, `update_by`, `update_time`, `del`)
VALUES (2, 10, 'org_test1', 'org_test', 'ONESELF', 2, 1, NULL, NULL, '1701847090820464641', '2023-12-14 16:31:05.000',
        0);
INSERT INTO `sys_role` (`id`, `org_id`, `role_name`, `role_key`, `authority_level`, `role_sort`, `enable`, `create_by`,
                        `create_time`, `update_by`, `update_time`, `del`)
VALUES (3, 7, 'un_auth', 'un_auth', 'ONESELF', 0, 1, NULL, NULL, '1701847090820464641', '2023-12-05 10:59:49.000', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `role_id`     bigint unsigned NOT NULL COMMENT '角色ID',
    `menu_id`     bigint unsigned NOT NULL COMMENT '菜单ID',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3)                                               DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3)                                               DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         int unsigned    NOT NULL                                  DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 57
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='角色->菜单权限关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, 1, 1, NULL, NULL, NULL, '2023-12-12 16:44:39.256', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (2, 1, 2, NULL, NULL, NULL, '2023-12-12 16:44:39.256', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (3, 1, 3, NULL, NULL, NULL, '2023-12-12 16:44:39.256', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (4, 1, 4, NULL, NULL, NULL, '2023-12-12 16:44:39.256', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (5, 1, 5, NULL, NULL, NULL, '2023-12-12 16:44:39.256', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6, 1, 6, NULL, NULL, NULL, '2023-12-12 16:44:39.256', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (7, 1, 7, NULL, NULL, NULL, '2023-12-12 16:44:39.256', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (8, 1, 8, NULL, NULL, NULL, '2023-12-12 16:44:39.256', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (9, 2, 1, '1701847090820464641', '2023-12-06 09:15:35.000', NULL, '2023-12-06 09:25:13.116', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (10, 2, 1, '1701847090820464641', '2023-12-06 09:25:13.000', NULL, '2023-12-07 15:16:59.267', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (11, 2, 2, '1701847090820464641', '2023-12-07 15:16:55.000', NULL, '2023-12-14 15:38:41.819', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (12, 2, 1, '1701847090820464641', '2023-12-07 15:16:55.000', NULL, '2023-12-14 15:38:41.819', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (13, 2, 5, '1701847090820464641', '2023-12-07 15:16:55.000', NULL, '2023-12-14 15:38:41.819', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (14, 2, 4, '1701847090820464641', '2023-12-07 15:16:55.000', NULL, '2023-12-14 15:38:41.819', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (15, 1, 1, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (16, 1, 2, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (17, 1, 3, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (18, 1, 10, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (19, 1, 14, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (20, 1, 15, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (21, 1, 6, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (22, 1, 28, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (23, 1, 30, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (24, 1, 29, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (25, 1, 7, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (26, 1, 27, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (27, 1, 26, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (28, 1, 25, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (29, 1, 8, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (30, 1, 22, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (31, 1, 23, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (32, 1, 24, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (33, 1, 5, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (34, 1, 16, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (35, 1, 17, '1701847090820464641', '2023-12-12 16:44:39.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (36, 1, 18, '1701847090820464641', '2023-12-12 16:44:40.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (37, 1, 4, '1701847090820464641', '2023-12-12 16:44:40.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (38, 1, 20, '1701847090820464641', '2023-12-12 16:44:40.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (39, 1, 21, '1701847090820464641', '2023-12-12 16:44:40.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (40, 1, 19, '1701847090820464641', '2023-12-12 16:44:40.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (41, 1, 13, '1701847090820464641', '2023-12-12 16:44:40.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (42, 1, 33, '1701847090820464641', '2023-12-12 16:44:40.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (43, 1, 31, '1701847090820464641', '2023-12-12 16:44:40.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (44, 1, 32, '1701847090820464641', '2023-12-12 16:44:40.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (45, 2, 2, '1701847090820464641', '2023-12-14 15:38:41.000', NULL, '2023-12-14 15:48:48.983', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (46, 2, 1, '1701847090820464641', '2023-12-14 15:38:41.000', NULL, '2023-12-14 15:48:48.983', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (47, 2, 5, '1701847090820464641', '2023-12-14 15:38:41.000', NULL, '2023-12-14 15:48:48.983', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (48, 2, 4, '1701847090820464641', '2023-12-14 15:38:41.000', NULL, '2023-12-14 15:48:48.983', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (49, 2, 2, '1701847090820464641', '2023-12-14 15:48:48.000', NULL, '2023-12-14 16:31:05.406', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (50, 2, 1, '1701847090820464641', '2023-12-14 15:48:48.000', NULL, '2023-12-14 16:31:05.406', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (51, 2, 5, '1701847090820464641', '2023-12-14 15:48:49.000', NULL, '2023-12-14 16:31:05.406', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (52, 2, 4, '1701847090820464641', '2023-12-14 15:48:49.000', NULL, '2023-12-14 16:31:05.406', 1);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (53, 2, 2, '1701847090820464641', '2023-12-14 16:31:05.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (54, 2, 1, '1701847090820464641', '2023-12-14 16:31:05.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (55, 2, 5, '1701847090820464641', '2023-12-14 16:31:05.000', NULL, NULL, 0);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (56, 2, 4, '1701847090820464641', '2023-12-14 16:31:05.000', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`
(
    `id`          bigint unsigned                                               NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `username`    varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '账号',
    `password`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
    `email`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '邮箱',
    `phone`       varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci           DEFAULT NULL COMMENT '手机号',
    `client`      char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '所属客户端',
    `status`      char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     NOT NULL COMMENT '账号状态',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3)                                                            DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci              DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3)                                                            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         int unsigned                                                  NOT NULL DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `index_username_del` (`username`, `del`) USING BTREE COMMENT '用户名+逻辑删除唯一',
    KEY `index_phone_del` (`phone`, `del`) USING BTREE COMMENT '手机号+逻辑删除索引'
) ENGINE = InnoDB
  AUTO_INCREMENT = 1706931386700636177
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='账号信息';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`id`, `username`, `password`, `email`, `phone`, `client`, `status`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `del`)
VALUES (1701847090820464641, 'admin', '$2a$10$plmK/omr7TnkvFCpQLpxxe91JxtZDboyhx6gFUODFVnPyWyhNUMtK', NULL,
        '13300006666', 'WEB', 'NORMAL', NULL, '2022-10-07 10:16:26.000', NULL, '2023-10-07 10:16:34.172', 0);
INSERT INTO `sys_user` (`id`, `username`, `password`, `email`, `phone`, `client`, `status`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `del`)
VALUES (1706931386700636171, '123123', '$2a$10$mh7LqCwDmN3T/XeJQhsv7usPYzSxMomWZFycZdbwvUFPSvbG7pTtG', '', '', 'WEB',
        'NORMAL', '1701847090820464641', '2023-12-01 13:52:37.000', '1701847090820464641', '2023-12-07 15:06:19.000',
        0);
INSERT INTO `sys_user` (`id`, `username`, `password`, `email`, `phone`, `client`, `status`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `del`)
VALUES (1706931386700636174, '3123', '$2a$10$LeYQ7vQfLQJhekbi9WPoOeOu2n.5aC35xI1OteGJhIVZiEGAaTD.O', '', '', 'WEB',
        'INACTIVATED', '1701847090820464641', '2023-12-06 16:56:27.000', NULL, '2023-12-06 17:00:44.095', 1);
INSERT INTO `sys_user` (`id`, `username`, `password`, `email`, `phone`, `client`, `status`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `del`)
VALUES (1706931386700636175, '323', '$2a$10$.gEbtbtPYONBbsVw7tto2.hLPOj7H0GDNJfIiUO.zDoGs0iXxLb8G', '', '', 'WEB',
        'INACTIVATED', '1701847090820464641', '2023-12-06 17:01:08.000', NULL, '2023-12-06 17:14:34.242', 1);
INSERT INTO `sys_user` (`id`, `username`, `password`, `email`, `phone`, `client`, `status`, `create_by`, `create_time`,
                        `update_by`, `update_time`, `del`)
VALUES (1706931386700636176, '3233', '$2a$10$DolBvJKeCUCndQCwvDfvJezXpc4U81TmvMGZMfZOKSRj6e7aO9n.6', '', '', 'WEB',
        'INACTIVATED', '1701847090820464641', '2023-12-06 17:15:42.000', NULL, '2023-12-06 17:19:55.059', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint unsigned NOT NULL COMMENT '用户信息ID',
    `nickname`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账号昵称',
    `avatar`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
    `gender`      char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci      DEFAULT NULL COMMENT '性别',
    `name`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
    `id_card`     char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '身份证',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3)                                                   DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci     DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3)                                                   DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         int unsigned    NOT NULL                                      DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='用户基本信息';

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_info` (`id`, `user_id`, `nickname`, `avatar`, `gender`, `name`, `id_card`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, 1701847090820464641, 'admin', 'test/2023/12/08/102816_8d60c6f62f09468eb08be7de8bf657c6.jpeg', '1', NULL,
        NULL, NULL, NULL, '1701847090820464641', '2023-12-08 10:28:17.000', 0);
INSERT INTO `sys_user_info` (`id`, `user_id`, `nickname`, `avatar`, `gender`, `name`, `id_card`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (4, 1706931386700636171, '测试', NULL, NULL, '', NULL, '1701847090820464641', '2023-12-01 13:52:37.000',
        '1701847090820464641', '2023-12-14 16:00:51.000', 0);
INSERT INTO `sys_user_info` (`id`, `user_id`, `nickname`, `avatar`, `gender`, `name`, `id_card`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (7, 1706931386700636174, NULL, '', NULL, '', '', '1701847090820464641', '2023-12-06 16:56:27.000', NULL,
        '2023-12-06 17:00:44.177', 1);
INSERT INTO `sys_user_info` (`id`, `user_id`, `nickname`, `avatar`, `gender`, `name`, `id_card`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (8, 1706931386700636175, NULL, '', NULL, '', '', '1701847090820464641', '2023-12-06 17:01:08.000', NULL,
        '2023-12-06 17:14:34.323', 1);
INSERT INTO `sys_user_info` (`id`, `user_id`, `nickname`, `avatar`, `gender`, `name`, `id_card`, `create_by`,
                             `create_time`, `update_by`, `update_time`, `del`)
VALUES (9, 1706931386700636176, NULL, '', NULL, '', '', '1701847090820464641', '2023-12-06 17:15:42.000', NULL,
        '2023-12-06 17:19:55.143', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_notice`;
CREATE TABLE `sys_user_notice`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint          NOT NULL COMMENT '接受用户ID',
    `notice_id`   bigint          NOT NULL COMMENT '消息ID',
    `status`      int unsigned    NOT NULL                                  DEFAULT '9' COMMENT '阅读状态',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3)                                               DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3)                                               DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         int unsigned    NOT NULL                                  DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 29
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='用户消息关联';

-- ----------------------------
-- Records of sys_user_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_notice` (`id`, `user_id`, `notice_id`, `status`, `create_by`, `create_time`, `update_by`,
                               `update_time`, `del`)
VALUES (17, 1701847090820464641, 5, 1, '1701847090820464641', '2023-12-26 09:52:50.000', NULL,
        '2023-12-26 17:15:20.728', 0);
INSERT INTO `sys_user_notice` (`id`, `user_id`, `notice_id`, `status`, `create_by`, `create_time`, `update_by`,
                               `update_time`, `del`)
VALUES (18, 1701847090820464641, 4, 1, '1701847090820464641', '2023-12-26 10:59:22.000', NULL,
        '2023-12-26 17:15:20.728', 0);
INSERT INTO `sys_user_notice` (`id`, `user_id`, `notice_id`, `status`, `create_by`, `create_time`, `update_by`,
                               `update_time`, `del`)
VALUES (19, 1701847090820464641, 6, 1, '1701847090820464641', '2023-12-26 13:50:10.000', NULL,
        '2023-12-26 17:15:20.728', 0);
INSERT INTO `sys_user_notice` (`id`, `user_id`, `notice_id`, `status`, `create_by`, `create_time`, `update_by`,
                               `update_time`, `del`)
VALUES (20, 1701847090820464641, 7, 1, '1701847090820464641', '2023-12-26 13:50:26.000', NULL,
        '2023-12-26 17:15:20.728', 0);
INSERT INTO `sys_user_notice` (`id`, `user_id`, `notice_id`, `status`, `create_by`, `create_time`, `update_by`,
                               `update_time`, `del`)
VALUES (21, 1706931386700636171, 8, 0, '1701847090820464641', '2023-12-26 13:50:41.000', NULL, NULL, 0);
INSERT INTO `sys_user_notice` (`id`, `user_id`, `notice_id`, `status`, `create_by`, `create_time`, `update_by`,
                               `update_time`, `del`)
VALUES (22, 1701847090820464641, 8, 1, '1701847090820464641', '2023-12-26 13:50:41.000', NULL,
        '2023-12-26 17:15:20.728', 0);
INSERT INTO `sys_user_notice` (`id`, `user_id`, `notice_id`, `status`, `create_by`, `create_time`, `update_by`,
                               `update_time`, `del`)
VALUES (23, 1701847090820464641, 9, 1, '1701847090820464641', '2023-12-26 13:50:58.000', NULL,
        '2023-12-26 17:15:20.728', 0);
INSERT INTO `sys_user_notice` (`id`, `user_id`, `notice_id`, `status`, `create_by`, `create_time`, `update_by`,
                               `update_time`, `del`)
VALUES (24, 1706931386700636171, 9, 0, '1701847090820464641', '2023-12-26 13:50:58.000', NULL, NULL, 0);
INSERT INTO `sys_user_notice` (`id`, `user_id`, `notice_id`, `status`, `create_by`, `create_time`, `update_by`,
                               `update_time`, `del`)
VALUES (25, 1701847090820464641, 10, 1, '1701847090820464641', '2023-12-26 16:07:41.000', NULL,
        '2023-12-26 17:15:20.728', 0);
INSERT INTO `sys_user_notice` (`id`, `user_id`, `notice_id`, `status`, `create_by`, `create_time`, `update_by`,
                               `update_time`, `del`)
VALUES (26, 1706931386700636171, 10, 0, '1701847090820464641', '2023-12-26 16:07:41.000', NULL, NULL, 0);
INSERT INTO `sys_user_notice` (`id`, `user_id`, `notice_id`, `status`, `create_by`, `create_time`, `update_by`,
                               `update_time`, `del`)
VALUES (27, 1706931386700636171, 11, 0, '1701847090820464641', '2023-12-26 16:07:53.000', NULL, NULL, 0);
INSERT INTO `sys_user_notice` (`id`, `user_id`, `notice_id`, `status`, `create_by`, `create_time`, `update_by`,
                               `update_time`, `del`)
VALUES (28, 1701847090820464641, 11, 1, '1701847090820464641', '2023-12-26 16:07:53.000', NULL,
        '2023-12-26 17:15:20.728', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_org`;
CREATE TABLE `sys_user_org`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint unsigned NOT NULL COMMENT '用户id',
    `org_id`      bigint unsigned NOT NULL COMMENT '机构id',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3)                                               DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3)                                               DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         int unsigned    NOT NULL                                  DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='用户->机构关联';

-- ----------------------------
-- Records of sys_user_org
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, 1701847090820464641, 7, NULL, NULL, NULL, '2023-12-07 14:38:57.512', 1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6, 1706931386700636171, 9, '1701847090820464641', '2023-12-06 14:48:30.000', NULL, '2023-12-06 14:52:25.256',
        1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (7, 1706931386700636171, 9, '1701847090820464641', '2023-12-06 14:52:25.000', NULL, '2023-12-07 14:56:48.957',
        1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (9, 1706931386700636174, 7, '1701847090820464641', '2023-12-06 16:56:27.000', NULL, '2023-12-06 17:00:44.251',
        1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (10, 1706931386700636175, 7, '1701847090820464641', '2023-12-06 17:01:08.000', NULL, '2023-12-06 17:14:34.402',
        1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (11, 1706931386700636176, 7, '1701847090820464641', '2023-12-06 17:15:42.000', NULL, '2023-12-06 17:19:55.222',
        1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (12, 1701847090820464641, 7, '1701847090820464641', '2023-12-07 14:38:57.000', NULL, '2023-12-08 10:28:17.542',
        1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (13, 1706931386700636171, 9, '1701847090820464641', '2023-12-07 14:56:49.000', NULL, '2023-12-07 15:12:39.908',
        1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (14, 1706931386700636171, 9, '1701847090820464641', '2023-12-07 15:12:35.000', NULL, '2023-12-07 15:16:08.660',
        1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (15, 1706931386700636171, 9, '1701847090820464641', '2023-12-07 15:16:04.000', NULL, '2023-12-14 16:00:51.263',
        1);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (16, 1701847090820464641, 7, '1701847090820464641', '2023-12-08 10:28:17.000', NULL, '2023-12-08 10:28:17.000',
        0);
INSERT INTO `sys_user_org` (`id`, `user_id`, `org_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (17, 1706931386700636171, 10, '1701847090820464641', '2023-12-14 16:00:51.000', NULL, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint unsigned NOT NULL COMMENT '用户ID',
    `post_id`     bigint unsigned NOT NULL COMMENT '岗位ID',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3)                                               DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3)                                               DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         int unsigned    NOT NULL                                  DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='用户->岗位关联';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `id`          bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `user_id`     bigint unsigned NOT NULL COMMENT '用户ID',
    `role_id`     bigint unsigned NOT NULL COMMENT '角色ID',
    `create_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
    `create_time` datetime(3)                                               DEFAULT NULL COMMENT '创建时间',
    `update_by`   char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
    `update_time` datetime(3)                                               DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '修改时间',
    `del`         int unsigned    NOT NULL                                  DEFAULT '0' COMMENT '逻辑删除标记',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT ='用户->角色关联';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (1, 1701847090820464641, 1, NULL, NULL, NULL, '2023-12-07 14:38:57.584', 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (3, 1706931386700636171, 2, '1701847090820464641', '2023-12-06 14:48:30.000', NULL, '2023-12-06 14:52:25.336',
        1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (4, 1706931386700636171, 2, '1701847090820464641', '2023-12-06 14:52:25.000', NULL, '2023-12-07 14:56:49.021',
        1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (5, 1706931386700636174, 2, '1701847090820464641', '2023-12-06 16:56:30.000', NULL, '2023-12-06 17:00:44.326',
        1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (6, 1706931386700636175, 2, '1701847090820464641', '2023-12-06 17:01:08.000', NULL, '2023-12-06 17:14:34.482',
        1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (7, 1706931386700636176, 2, '1701847090820464641', '2023-12-06 17:15:42.000', NULL, '2023-12-06 17:19:55.301',
        1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (8, 1701847090820464641, 1, '1701847090820464641', '2023-12-07 14:38:57.000', NULL, '2023-12-08 10:28:17.615',
        1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (9, 1706931386700636171, 2, '1701847090820464641', '2023-12-07 14:56:49.000', NULL, '2023-12-07 15:12:39.976',
        1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (10, 1706931386700636171, 2, '1701847090820464641', '2023-12-07 15:12:35.000', NULL, '2023-12-07 15:16:08.725',
        1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (11, 1706931386700636171, 2, '1701847090820464641', '2023-12-07 15:16:04.000', NULL, '2023-12-14 16:00:51.328',
        1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (12, 1701847090820464641, 1, '1701847090820464641', '2023-12-08 10:28:17.000', NULL, '2023-12-08 10:28:17.000',
        0);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`, `create_by`, `create_time`, `update_by`, `update_time`, `del`)
VALUES (13, 1706931386700636171, 2, '1701847090820464641', '2023-12-14 16:00:51.000', NULL, NULL, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;