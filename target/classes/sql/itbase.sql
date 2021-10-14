/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : itbase

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 24/02/2021 14:15:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for act_app_appdef
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_app_appdef`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_APP_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE,
  INDEX `ACT_IDX_APP_DEF_DPLY`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_APP_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_appdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_app_databasechangelog
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_app_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_databasechangelog
-- ----------------------------
INSERT IGNORE INTO `act_app_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2021-02-08 12:05:25', 1, 'EXECUTED', '8:496fc778bdf2ab13f2e1926d0e63e0a2', 'createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...', '', NULL, '3.8.9', NULL, NULL, '2757121707');
INSERT IGNORE INTO `act_app_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2021-02-08 12:05:26', 2, 'EXECUTED', '8:ccea9ebfb6c1f8367ca4dd473fcbb7db', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT', '', NULL, '3.8.9', NULL, NULL, '2757121707');
INSERT IGNORE INTO `act_app_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', '2021-02-08 12:05:26', 3, 'EXECUTED', '8:f1f8aff320aade831944ebad24355f3d', 'createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF', '', NULL, '3.8.9', NULL, NULL, '2757121707');

-- ----------------------------
-- Table structure for act_app_databasechangeloglock
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_app_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_databasechangeloglock
-- ----------------------------
INSERT IGNORE INTO `act_app_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_app_deployment
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_app_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_app_deployment_resource
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_app_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_APP_RSRC_DPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_APP_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_app_deployment_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_casedef
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_cmmn_casedef`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_CASE_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_DEF_DPLY`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_CASE_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_casedef
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_databasechangelog
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_cmmn_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_databasechangelog
-- ----------------------------
INSERT IGNORE INTO `act_cmmn_databasechangelog` VALUES ('1', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2021-02-08 12:04:35', 1, 'EXECUTED', '8:8b4b922d90b05ff27483abefc9597aa6', 'createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...', '', NULL, '3.8.9', NULL, NULL, '2757053692');
INSERT IGNORE INTO `act_cmmn_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2021-02-08 12:04:40', 2, 'EXECUTED', '8:65e39b3d385706bb261cbeffe7533cbe', 'addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST', '', NULL, '3.8.9', NULL, NULL, '2757053692');
INSERT IGNORE INTO `act_cmmn_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2021-02-08 12:04:44', 3, 'EXECUTED', '8:c01f6e802b49436b4489040da3012359', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...', '', NULL, '3.8.9', NULL, NULL, '2757053692');
INSERT IGNORE INTO `act_cmmn_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2021-02-08 12:04:47', 4, 'EXECUTED', '8:e40d29cb79345b7fb5afd38a7f0ba8fc', 'createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST', '', NULL, '3.8.9', NULL, NULL, '2757053692');
INSERT IGNORE INTO `act_cmmn_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2021-02-08 12:05:17', 5, 'EXECUTED', '8:70349de472f87368dcdec971a10311a0', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...', '', NULL, '3.8.9', NULL, NULL, '2757053692');
INSERT IGNORE INTO `act_cmmn_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2021-02-08 12:05:18', 6, 'EXECUTED', '8:10e82e26a7fee94c32a92099c059c18c', 'createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF', '', NULL, '3.8.9', NULL, NULL, '2757053692');
INSERT IGNORE INTO `act_cmmn_databasechangelog` VALUES ('7', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', '2021-02-08 12:05:20', 7, 'EXECUTED', '8:530bc81a1e30618ccf4a2da1f7c6c043', 'renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...', '', NULL, '3.8.9', NULL, NULL, '2757053692');

-- ----------------------------
-- Table structure for act_cmmn_databasechangeloglock
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_cmmn_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_databasechangeloglock
-- ----------------------------
INSERT IGNORE INTO `act_cmmn_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_cmmn_deployment
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_cmmn_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_deployment_resource
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_cmmn_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  `GENERATED_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_CMMN_RSRC_DPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_CMMN_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_deployment_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_hi_case_inst
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_cmmn_hi_case_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_hi_case_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_hi_mil_inst
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_cmmn_hi_mil_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_hi_mil_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_hi_plan_item_inst
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_cmmn_hi_plan_item_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_STAGE_` bit(1) NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) NULL DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) NULL DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `EXIT_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ENTRY_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_hi_plan_item_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_case_inst
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_cmmn_ru_case_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `LOCK_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_CASE_INST_PARENT`(`PARENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_CASE_INST_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_case_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_mil_inst
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_cmmn_ru_mil_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_MIL_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_MIL_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MIL_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MIL_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_mil_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_plan_item_inst
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_cmmn_ru_plan_item_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_STAGE_` bit(1) NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `ITEM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` bit(1) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `SENTRY_PART_INST_COUNT_` int(11) NULL DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) NULL DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) NULL DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) NULL DEFAULT NULL,
  `EXIT_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENDED_TIME_` datetime(3) NULL DEFAULT NULL,
  `ENTRY_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_PLAN_ITEM_STAGE_INST`(`STAGE_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_plan_item_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_cmmn_ru_sentry_part_inst
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_cmmn_ru_sentry_part_inst`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REV_` int(11) NOT NULL,
  `CASE_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PLAN_ITEM_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ON_PART_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IF_PART_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TIME_STAMP_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_CASE_DEF`(`CASE_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_CASE_INST`(`CASE_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_SENTRY_PLAN_ITEM`(`PLAN_ITEM_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_SENTRY_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SENTRY_PLAN_ITEM` FOREIGN KEY (`PLAN_ITEM_INST_ID_`) REFERENCES `act_cmmn_ru_plan_item_inst` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_cmmn_ru_sentry_part_inst
-- ----------------------------

-- ----------------------------
-- Table structure for act_co_content_item
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_co_content_item`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MIME_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TASK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_STORE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_STORE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FIELD_` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_AVAILABLE_` bit(1) NULL DEFAULT b'0',
  `CREATED_` timestamp(6) NULL DEFAULT NULL,
  `CREATED_BY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_MODIFIED_` timestamp(6) NULL DEFAULT NULL,
  `LAST_MODIFIED_BY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTENT_SIZE_` bigint(20) NULL DEFAULT 0,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `idx_contitem_taskid`(`TASK_ID_`) USING BTREE,
  INDEX `idx_contitem_procid`(`PROC_INST_ID_`) USING BTREE,
  INDEX `idx_contitem_scope`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_content_item
-- ----------------------------

-- ----------------------------
-- Table structure for act_co_databasechangelog
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_co_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_databasechangelog
-- ----------------------------
INSERT IGNORE INTO `act_co_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2021-02-08 12:04:10', 1, 'EXECUTED', '8:7644d7165cfe799200a2abdd3419e8b6', 'createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '3.8.9', NULL, NULL, '2757048225');
INSERT IGNORE INTO `act_co_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', '2021-02-08 12:04:11', 2, 'EXECUTED', '8:fe7b11ac7dbbf9c43006b23bbab60bab', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', NULL, '3.8.9', NULL, NULL, '2757048225');

-- ----------------------------
-- Table structure for act_co_databasechangeloglock
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_co_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_co_databasechangeloglock
-- ----------------------------
INSERT IGNORE INTO `act_co_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_dmn_databasechangelog
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_dmn_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_databasechangelog
-- ----------------------------
INSERT IGNORE INTO `act_dmn_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2021-02-08 12:03:46', 1, 'EXECUTED', '8:c8701f1c71018b55029f450b2e9a10a1', 'createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.8.9', NULL, NULL, '2757025331');
INSERT IGNORE INTO `act_dmn_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2021-02-08 12:03:47', 2, 'EXECUTED', '8:47f94b27feb7df8a30d4e338c7bd5fb8', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.8.9', NULL, NULL, '2757025331');
INSERT IGNORE INTO `act_dmn_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2021-02-08 12:03:49', 3, 'EXECUTED', '8:ac17eae89fbdccb6e08daf3c7797b579', 'addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.8.9', NULL, NULL, '2757025331');
INSERT IGNORE INTO `act_dmn_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2021-02-08 12:03:50', 4, 'EXECUTED', '8:f73aabc4529e7292c2942073d1cff6f9', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.8.9', NULL, NULL, '2757025331');
INSERT IGNORE INTO `act_dmn_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2021-02-08 12:03:54', 5, 'EXECUTED', '8:3e03528582dd4eeb4eb41f9b9539140d', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION', '', NULL, '3.8.9', NULL, NULL, '2757025331');
INSERT IGNORE INTO `act_dmn_databasechangelog` VALUES ('6', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', '2021-02-08 12:03:55', 6, 'EXECUTED', '8:646c6a061e0b6e8a62e69844ff96abb0', 'createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE', '', NULL, '3.8.9', NULL, NULL, '2757025331');

-- ----------------------------
-- Table structure for act_dmn_databasechangeloglock
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_dmn_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_databasechangeloglock
-- ----------------------------
INSERT IGNORE INTO `act_dmn_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_dmn_decision_table
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_dmn_decision_table`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_DEC_TBL_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_decision_table
-- ----------------------------

-- ----------------------------
-- Table structure for act_dmn_deployment
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_dmn_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_dmn_deployment_resource
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_dmn_deployment_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_deployment_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_dmn_hi_decision_execution
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_dmn_hi_decision_execution`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DECISION_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `INSTANCE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FAILED_` bit(1) NULL DEFAULT b'0',
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EXECUTION_JSON_` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_dmn_hi_decision_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_evt_log
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_evt_log`  (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` longblob NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`LOG_NR_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_databasechangelog
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_fo_databasechangelog`  (
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DATEEXECUTED` datetime(0) NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_databasechangelog
-- ----------------------------
INSERT IGNORE INTO `act_fo_databasechangelog` VALUES ('1', 'activiti', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2021-02-08 12:03:59', 1, 'EXECUTED', '8:033ebf9380889aed7c453927ecc3250d', 'createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.8.9', NULL, NULL, '2757038020');
INSERT IGNORE INTO `act_fo_databasechangelog` VALUES ('2', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2021-02-08 12:04:01', 2, 'EXECUTED', '8:986365ceb40445ce3b27a8e6b40f159b', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.8.9', NULL, NULL, '2757038020');
INSERT IGNORE INTO `act_fo_databasechangelog` VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2021-02-08 12:04:02', 3, 'EXECUTED', '8:abf482518ceb09830ef674e52c06bf15', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '3.8.9', NULL, NULL, '2757038020');
INSERT IGNORE INTO `act_fo_databasechangelog` VALUES ('4', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2021-02-08 12:04:04', 4, 'EXECUTED', '8:2087829f22a4b2298dbf530681c74854', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_FO_FORM_DEPLOYMENT; modifyDataType columnName=SUBMITTED_DATE_, tableName=ACT_FO_FORM_INSTANCE', '', NULL, '3.8.9', NULL, NULL, '2757038020');
INSERT IGNORE INTO `act_fo_databasechangelog` VALUES ('5', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', '2021-02-08 12:04:05', 5, 'EXECUTED', '8:b4be732b89e5ca028bdd520c6ad4d446', 'createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION', '', NULL, '3.8.9', NULL, NULL, '2757038020');

-- ----------------------------
-- Table structure for act_fo_databasechangeloglock
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_fo_databasechangeloglock`  (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime(0) NULL DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_databasechangeloglock
-- ----------------------------
INSERT IGNORE INTO `act_fo_databasechangeloglock` VALUES (1, b'0', NULL, NULL);

-- ----------------------------
-- Table structure for act_fo_form_definition
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_fo_form_definition`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_IDX_FORM_DEF_UNIQ`(`KEY_`, `VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_definition
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_form_deployment
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_fo_form_deployment`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_form_instance
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_fo_form_instance`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FORM_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TASK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SUBMITTED_DATE_` datetime(3) NULL DEFAULT NULL,
  `SUBMITTED_BY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FORM_VALUES_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_instance
-- ----------------------------

-- ----------------------------
-- Table structure for act_fo_form_resource
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_fo_form_resource`  (
  `ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RESOURCE_BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_fo_form_resource
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_bytearray
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ge_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  `GENERATED_` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_BYTEARR_DEPL`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_ge_property
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ge_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT IGNORE INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'true', 1);
INSERT IGNORE INTO `act_ge_property` VALUES ('cfg.task-related-entities-count', 'true', 1);
INSERT IGNORE INTO `act_ge_property` VALUES ('common.schema.version', '6.5.0.1', 1);
INSERT IGNORE INTO `act_ge_property` VALUES ('entitylink.schema.version', '6.5.0.1', 1);
INSERT IGNORE INTO `act_ge_property` VALUES ('eventsubscription.schema.version', '6.5.0.1', 1);
INSERT IGNORE INTO `act_ge_property` VALUES ('identitylink.schema.version', '6.5.0.1', 1);
INSERT IGNORE INTO `act_ge_property` VALUES ('job.schema.version', '6.5.0.1', 1);
INSERT IGNORE INTO `act_ge_property` VALUES ('next.dbid', '1', 1);
INSERT IGNORE INTO `act_ge_property` VALUES ('schema.history', 'create(6.5.0.1)', 1);
INSERT IGNORE INTO `act_ge_property` VALUES ('schema.version', '6.5.0.1', 1);
INSERT IGNORE INTO `act_ge_property` VALUES ('task.schema.version', '6.5.0.1', 1);
INSERT IGNORE INTO `act_ge_property` VALUES ('variable.schema.version', '6.5.0.1', 1);

-- ----------------------------
-- Table structure for act_hi_actinst
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_hi_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_PROCINST`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ACT_INST_EXEC`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_attachment
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_hi_attachment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `URL_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONTENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_comment
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_hi_comment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `MESSAGE_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `FULL_MSG_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_detail
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_hi_detail`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_ACT_INST`(`ACT_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TIME`(`TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_NAME`(`NAME_`) USING BTREE,
  INDEX `ACT_IDX_HI_DETAIL_TASK_ID`(`TASK_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_entitylink
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_hi_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_entitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_identitylink
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_hi_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_IDENT_LNK_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_procinst
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_hi_procinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `END_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `PROC_INST_ID_`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_INST_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_HI_PRO_I_BUSKEY`(`BUSINESS_KEY_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_taskinst
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_hi_taskinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_TASK_INST_PROCINST`(`PROC_INST_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_tsk_log
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_hi_tsk_log`  (
  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DATA_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_tsk_log
-- ----------------------------

-- ----------------------------
-- Table structure for act_hi_varinst
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_hi_varinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_NAME_TYPE`(`NAME_`, `VAR_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_PROC_INST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_IDX_HI_PROCVAR_EXE`(`EXECUTION_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_bytearray
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_id_bytearray`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTES_` longblob NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_bytearray
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_group
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_id_group`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_info
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_id_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PASSWORD_` longblob NULL,
  `PARENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_membership
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_id_membership`  (
  `USER_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `GROUP_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`, `GROUP_ID_`) USING BTREE,
  INDEX `ACT_FK_MEMB_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_id_priv`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PRIV_NAME`(`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_priv
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_priv_mapping
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_id_priv_mapping`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PRIV_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_PRIV_MAPPING`(`PRIV_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_PRIV_GROUP`(`GROUP_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_priv_mapping
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_property
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_id_property`  (
  `NAME_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VALUE_` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NAME_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_property
-- ----------------------------
INSERT IGNORE INTO `act_id_property` VALUES ('schema.version', '6.5.0.1', 1);

-- ----------------------------
-- Table structure for act_id_token
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_id_token`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `IP_ADDRESS_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_AGENT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_token
-- ----------------------------

-- ----------------------------
-- Table structure for act_id_user
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_id_user`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `FIRST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LAST_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EMAIL_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PWD_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PICTURE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for act_procdef_info
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_procdef_info`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_IDX_INFO_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_INFO_JSON_BA`(`INFO_JSON_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_deployment
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_re_deployment`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_model
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_re_model`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int(11) NULL DEFAULT NULL,
  `META_INFO_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE`(`EDITOR_SOURCE_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_SOURCE_EXTRA`(`EDITOR_SOURCE_EXTRA_VALUE_ID_`) USING BTREE,
  INDEX `ACT_FK_MODEL_DEPLOYMENT`(`DEPLOYMENT_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for act_re_procdef
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_re_procdef`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) NULL DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `ENGINE_VERSION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_`) USING BTREE,
  UNIQUE INDEX `ACT_UNIQ_PROCDEF`(`KEY_`, `VERSION_`, `DERIVED_VERSION_`, `TENANT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_re_procdef
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_actinst
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ru_actinst`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT 1,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) NULL DEFAULT NULL,
  `DURATION_` bigint(20) NULL DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_START`(`START_TIME_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_END`(`END_TIME_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_PROC_ACT`(`PROC_INST_ID_`, `ACT_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_ACTI_EXEC_ACT`(`EXECUTION_ID_`, `ACT_ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_deadletter_job
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ru_deadletter_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_DJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_DEADLETTER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_deadletter_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_entitylink
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ru_entitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NULL DEFAULT NULL,
  `LINK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`, `LINK_TYPE_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_entitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_event_subscr
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ru_event_subscr`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CONFIGURATION_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EVENT_SUBSCR_CONFIG_`(`CONFIGURATION_`) USING BTREE,
  INDEX `ACT_FK_EVENT_EXEC`(`EXECUTION_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_execution
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ru_execution`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) NULL DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) NULL DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) NULL DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_ACT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `START_TIME_` datetime(3) NULL DEFAULT NULL,
  `START_USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) NULL DEFAULT NULL,
  `TASK_COUNT_` int(11) NULL DEFAULT NULL,
  `JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_EXEC_BUSKEY`(`BUSINESS_KEY_`) USING BTREE,
  INDEX `ACT_IDC_EXEC_ROOT`(`ROOT_PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_PARENT`(`PARENT_ID_`) USING BTREE,
  INDEX `ACT_FK_EXE_SUPER`(`SUPER_EXEC_`) USING BTREE,
  INDEX `ACT_FK_EXE_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_history_job
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ru_history_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_history_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_identitylink
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ru_identitylink`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `GROUP_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `USER_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_USER`(`USER_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_GROUP`(`GROUP_ID_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_IDENT_LNK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_ATHRZ_PROCEDEF`(`PROC_DEF_ID_`) USING BTREE,
  INDEX `ACT_FK_TSKASS_TASK`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_IDL_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_job
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ru_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_JOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_suspended_job
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ru_suspended_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_SJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_SUSPENDED_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_suspended_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_task
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ru_task`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ASSIGNEE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DELEGATION_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PRIORITY_` int(11) NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) NULL DEFAULT NULL,
  `CATEGORY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  `FORM_KEY_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) NULL DEFAULT NULL,
  `VAR_COUNT_` int(11) NULL DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) NULL DEFAULT NULL,
  `SUB_TASK_COUNT_` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TASK_CREATE`(`CREATE_TIME_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TASK_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TASK_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  INDEX `ACT_FK_TASK_PROCDEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_timer_job
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ru_timer_job`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) NULL DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `RETRIES_` int(11) NULL DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '',
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID`(`EXCEPTION_STACK_ID_`) USING BTREE,
  INDEX `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID`(`CUSTOM_VALUES_ID_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SUB_SCOPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_TJOB_SCOPE_DEF`(`SCOPE_DEFINITION_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_EXECUTION`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROCESS_INSTANCE`(`PROCESS_INSTANCE_ID_`) USING BTREE,
  INDEX `ACT_FK_TIMER_JOB_PROC_DEF`(`PROC_DEF_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_timer_job
-- ----------------------------

-- ----------------------------
-- Table structure for act_ru_variable
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `act_ru_variable`  (
  `ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `REV_` int(11) NULL DEFAULT NULL,
  `TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TASK_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `DOUBLE_` double NULL DEFAULT NULL,
  `LONG_` bigint(20) NULL DEFAULT NULL,
  `TEXT_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `TEXT2_` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SCOPE_ID_TYPE`(`SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_IDX_RU_VAR_SUB_ID_TYPE`(`SUB_SCOPE_ID_`, `SCOPE_TYPE_`) USING BTREE,
  INDEX `ACT_FK_VAR_BYTEARRAY`(`BYTEARRAY_ID_`) USING BTREE,
  INDEX `ACT_IDX_VARIABLE_TASK_ID`(`TASK_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_EXE`(`EXECUTION_ID_`) USING BTREE,
  INDEX `ACT_FK_VAR_PROCINST`(`PROC_INST_ID_`) USING BTREE,
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------

-- ----------------------------
-- Table structure for um_s_menu
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `um_s_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '顺序',
  `order_index` int(20) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `permission_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of um_s_menu
-- ----------------------------
INSERT IGNORE INTO `um_s_menu` VALUES (1, '系统设置', NULL, 0, 0, 1, NULL, 1614131111739, NULL, 'admin', NULL, 'fa fa-gears', NULL, 0);
INSERT IGNORE INTO `um_s_menu` VALUES (2, '用户管理', '', 1, 1, 1, NULL, 1614137596709, NULL, 'admin', '/user/page', 'fa fa-user-o', '', 0);
INSERT IGNORE INTO `um_s_menu` VALUES (4, '组织管理', NULL, 1, 3, 1, NULL, 1614132206868, NULL, 'admin', '/organization/page', 'icon-organization icons', NULL, 0);
INSERT IGNORE INTO `um_s_menu` VALUES (5, '角色管理', '', 1, 4, 1, NULL, 1614146768617, NULL, 'admin', '/role/page', 'fa fa-users', '', 0);
INSERT IGNORE INTO `um_s_menu` VALUES (11, '菜单管理', NULL, 1, 2, 1, NULL, NULL, NULL, NULL, '/menu/page', 'fa fa-navicon', NULL, 0);
INSERT IGNORE INTO `um_s_menu` VALUES (14, '图标管理', NULL, 1, 7, 1, 1612775907299, NULL, 'admin', NULL, '/icons', 'fa fa-fonticons', NULL, 0);
INSERT IGNORE INTO `um_s_menu` VALUES (15, '新增', NULL, 2, 0, 1, 1613813324297, 1613815114120, 'admin', 'admin', NULL, 'fa fa-plus', 'user:add', 1);
INSERT IGNORE INTO `um_s_menu` VALUES (16, '编辑', NULL, 2, 0, 1, 1614135517557, NULL, 'admin', NULL, NULL, NULL, 'user:edit', 1);
INSERT IGNORE INTO `um_s_menu` VALUES (17, '新增', '', 11, 0, 1, 1614138686374, NULL, 'admin', NULL, '', '', 'menu:add', 1);
INSERT IGNORE INTO `um_s_menu` VALUES (18, '编辑', '', 11, 0, 1, 1614138720901, NULL, 'admin', NULL, '', '', 'menu:edit', 1);
INSERT IGNORE INTO `um_s_menu` VALUES (19, '删除', '', 11, 0, 0, 1614138750467, NULL, 'admin', NULL, '', '', 'menu:delete', 1);
INSERT IGNORE INTO `um_s_menu` VALUES (20, '新增', '', 5, 0, 1, 1614138883010, NULL, 'admin', NULL, '', '', 'role:add', 1);
INSERT IGNORE INTO `um_s_menu` VALUES (21, '编辑', '', 5, 0, 1, 1614138917920, NULL, 'admin', NULL, '', '', 'role:edit', 1);
INSERT IGNORE INTO `um_s_menu` VALUES (22, '删除', '', 5, 0, 1, 1614138990546, NULL, 'admin', NULL, '', '', 'role:delete', 1);
INSERT IGNORE INTO `um_s_menu` VALUES (23, '新增', '', 4, 0, 1, 1614139020272, NULL, 'admin', NULL, '', '', 'organization:add', 1);
INSERT IGNORE INTO `um_s_menu` VALUES (24, '编辑', '', 4, 0, 1, 1614139072968, NULL, 'admin', NULL, '', '', 'organization:edit', 1);
INSERT IGNORE INTO `um_s_menu` VALUES (25, '删除', '', 4, 0, 1, 1614139132305, NULL, 'admin', NULL, '', '', 'organization:delete', 1);
INSERT IGNORE INTO `um_s_menu` VALUES (26, '配置', '', 5, 0, 1, 1614139174704, 1614139187723, 'admin', 'admin', '', '', 'role:setting', 1);
INSERT IGNORE INTO `um_s_menu` VALUES (27, '配置', '', 11, 0, 1, 1614139395567, NULL, 'admin', NULL, '', '', 'menu:setting', 1);
INSERT IGNORE INTO `um_s_menu` VALUES (28, '删除', '', 2, 0, 1, 1614146930464, 1614146951487, 'admin', 'admin', '', '', 'user:delete', 1);

-- ----------------------------
-- Table structure for um_s_organization
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `um_s_organization`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `organization_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `update_user` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of um_s_organization
-- ----------------------------
INSERT IGNORE INTO `um_s_organization` VALUES (1, '组织', 1, NULL, 'UO001', NULL, NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `um_s_organization` VALUES (2, '九联科技', 1, NULL, 'A0001', NULL, NULL, NULL, NULL, NULL);
-- INSERT IGNORE INTO `um_s_organization` VALUES (3, '研发三部', 1, NULL, 'A00012', 2, NULL, NULL, NULL, NULL);
-- INSERT IGNORE INTO `um_s_organization` VALUES (4, '董事会', 1, NULL, 'A00011', 2, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for um_s_permission
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `um_s_permission`  (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单权限名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `resource_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源类型',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级菜单权限名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '菜单权限类型(1:目录;2:菜单;3:按钮)',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态1:正常 0：禁用',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `description` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统权限' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of um_s_permission
-- ----------------------------

-- ----------------------------
-- Table structure for um_s_role
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `um_s_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `role_type` tinyint(255) NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `update_user` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `INDEX_ROLE_NAME`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of um_s_role
-- ----------------------------
INSERT IGNORE INTO `um_s_role` VALUES (1, '管理员', 'UMR0001', 1, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `um_s_role` VALUES (2, '业务管理员', 'A0002', 1, NULL, 1, NULL, 1612660436291, 'admin', NULL, NULL);
INSERT IGNORE INTO `um_s_role` VALUES (3, '用户', 'R0001', 1, NULL, 1, NULL, 1614129017091, 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for um_s_role_menu_relation
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `um_s_role_menu_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `menu_id` bigint(20) NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_ROLE_ID`(`role_id`) USING BTREE,
  INDEX `INDEX_MENU_ID`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of um_s_role_menu_relation
-- ----------------------------
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (1, 1, 1, '2021-01-27 14:17:57');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (5, 1, 11, '2021-02-01 15:37:54');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (6, 1, 5, '2021-02-05 14:45:56');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (8, 2, 1, '2021-02-07 09:14:29');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (9, 2, 2, '2021-02-07 09:14:29');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (10, 2, 4, '2021-02-07 09:14:29');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (11, 1, 4, '2021-02-08 09:40:54');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (12, 1, 14, '2021-02-08 17:18:42');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (13, 2, 15, '2021-02-20 17:29:30');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (15, 1, 2, '2021-02-20 17:31:35');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (17, 1, 15, '2021-02-24 11:04:42');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (18, 1, 17, '2021-02-24 12:07:26');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (19, 1, 18, '2021-02-24 12:07:26');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (20, 1, 19, '2021-02-24 12:07:26');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (21, 1, 27, '2021-02-24 12:07:26');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (22, 1, 20, '2021-02-24 12:07:26');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (23, 1, 21, '2021-02-24 12:07:26');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (24, 1, 22, '2021-02-24 12:07:26');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (25, 1, 26, '2021-02-24 12:07:26');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (26, 1, 16, '2021-02-24 14:09:39');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (27, 1, 28, '2021-02-24 14:09:39');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (28, 1, 23, '2021-02-24 14:09:39');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (29, 1, 24, '2021-02-24 14:09:39');
INSERT IGNORE INTO `um_s_role_menu_relation` VALUES (30, 1, 25, '2021-02-24 14:09:39');

-- ----------------------------
-- Table structure for um_s_role_permission_relation
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `um_s_role_permission_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `permission_id` bigint(20) NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `INDEX_ROLE_ID`(`role_id`) USING BTREE,
  INDEX `INDEX_PERMISSION_ID`(`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of um_s_role_permission_relation
-- ----------------------------

-- ----------------------------
-- Table structure for um_s_user
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `um_s_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `superior_id` bigint(20) NULL DEFAULT NULL,
  `organization_id` bigint(20) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_Account`(`account`) USING BTREE,
  INDEX `Index_USER_NAME`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1336619802308980805 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of um_s_user
-- ----------------------------
INSERT IGNORE INTO `um_s_user` VALUES (1336619802308980741, 'admin', 'U002995', '超级管理员', 1, '管理员', NULL, 1, '0ee8b5ef63aa16ccfb58f488e687a62a3f16f10478ff950ae2cadddaf2b0a1d3599d0858fced3293337bf3e7ea49cc118b709faffb04bed65644ff049b047382', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for um_s_user_role_relation
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `um_s_user_role_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `INDEX_ROLE_ID`(`role_id`) USING BTREE,
  INDEX `INDEX_USER_ID`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of um_s_user_role_relation
-- ----------------------------
INSERT IGNORE INTO `um_s_user_role_relation` VALUES (1, 1336619802308980741, 1, '2021-01-27 14:19:20');

-- ----------------------------
-- Table structure for um_s_userinfo
-- ----------------------------
 
CREATE TABLE IF NOT EXISTS `um_s_userinfo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` tinyint(255) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `head_icon` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Index_USER_ID`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of um_s_userinfo
-- ----------------------------
INSERT IGNORE INTO `um_s_userinfo` VALUES (1, 1336619802308980741, 'yipeng.song@unionman.com.cn', 1, '15334213526', NULL, '2021-02-09 16:15:23', 'data:image/png;base64,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');

SET FOREIGN_KEY_CHECKS = 1;
