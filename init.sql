CREATE TABLE `mendixsystem$entity` (
	`id` NVARCHAR(36) NOT NULL,
	`entity_name` NVARCHAR(511) NOT NULL,
	`table_name` NVARCHAR(255) NOT NULL,
	`superentity_id` NVARCHAR(255) NULL,
	`remote` BOOL NULL,
	`remote_primary_key` BOOL NULL,
	PRIMARY KEY(`id`));

CREATE INDEX `idx_mendixsystem$entity_entity_name` ON `mendixsystem$entity` (`entity_name` ASC);

CREATE TABLE `mendixsystem$attribute` (
	`id` NVARCHAR(36) NOT NULL,
	`entity_id` NVARCHAR(255) NOT NULL,
	`attribute_name` NVARCHAR(255) NOT NULL,
	`column_name` NVARCHAR(255) NOT NULL,
	`type` INT NOT NULL,
	`length` INT NULL,
	`default_value` LONGTEXT CHARSET utf8 NULL,
	`is_auto_number` BOOL NOT NULL,
	PRIMARY KEY(`id`));

CREATE TABLE `mendixsystem$index` (
	`id` NVARCHAR(36) NOT NULL,
	`table_id` NVARCHAR(36) NOT NULL,
	`index_name` NVARCHAR(255) NOT NULL,
	PRIMARY KEY(`id`));

CREATE TABLE `mendixsystem$index_column` (
	`index_id` NVARCHAR(36) NOT NULL,
	`column_id` NVARCHAR(36) NOT NULL,
	`sort_order` BOOL NOT NULL,
	`ordinal` INT NOT NULL,
	PRIMARY KEY(`index_id`,`column_id`));

CREATE TABLE `mendixsystem$association` (
	`id` NVARCHAR(36) NOT NULL,
	`association_name` NVARCHAR(511) NOT NULL,
	`table_name` NVARCHAR(255) NOT NULL,
	`parent_entity_id` NVARCHAR(36) NOT NULL,
	`child_entity_id` NVARCHAR(36) NOT NULL,
	`parent_column_name` NVARCHAR(255) NOT NULL,
	`child_column_name` NVARCHAR(255) NOT NULL,
	`pk_index_name` NVARCHAR(255) NULL,
	`index_name` NVARCHAR(255) NULL,
	PRIMARY KEY(`id`));

CREATE TABLE `mendixsystem$version` (
	`versionnumber` NVARCHAR(255) NOT NULL,
	`lastsyncdate` DATETIME NOT NULL,
	`preanalysismigrationversionnumber` NVARCHAR(255) NOT NULL,
	`modelversionnumber` NVARCHAR(255) NULL,
	`sprintrprojectname` NVARCHAR(511) NULL,
	`mendixversion` NVARCHAR(255) NULL,
	PRIMARY KEY(`versionnumber`));

CREATE TABLE `mendixsystem$sequence` (
	`name` NVARCHAR(255) NOT NULL,
	`attribute_id` NVARCHAR(36) NOT NULL,
	`start_value` BIGINT NOT NULL,
	`current_value` BIGINT NULL,
	PRIMARY KEY(`attribute_id`));

CREATE INDEX `idx_mendixsystem$sequence_name` ON `mendixsystem$sequence` (`name` ASC);

CREATE TABLE `mendixsystem$entityidentifier` (
	`id` NVARCHAR(36) NOT NULL,
	`short_id` SMALLINT NULL,
	`object_sequence` BIGINT NULL,
	PRIMARY KEY(`id`));

CREATE INDEX `idx_mendixsystem$entityidentifier_short_id` ON `mendixsystem$entityidentifier` (`short_id` ASC);

CREATE TABLE `mendixsystem$properties` (
	`key` NVARCHAR(200) NOT NULL,
	`value` NVARCHAR(200) NOT NULL,
	PRIMARY KEY(`key`));

CREATE TABLE `mendixsystem$unique_constraint` (
	`name` NVARCHAR(255) NOT NULL,
	`table_id` NVARCHAR(36) NOT NULL,
	`column_id` NVARCHAR(36) NOT NULL,
	PRIMARY KEY(`name`,`column_id`));

CREATE TABLE `mendixsystem$remote_primary_key` (
	`id` NVARCHAR(36) NOT NULL,
	`entity_id` NVARCHAR(255) NOT NULL,
	`attribute_name` NVARCHAR(255) NOT NULL,
	`column_name` NVARCHAR(255) NOT NULL,
	`type` INT NOT NULL,
	`length` INT NULL,
	PRIMARY KEY(`id`));

CREATE TABLE `system$user` (
	`id` BIGINT NOT NULL,
	`name` NVARCHAR(100) NULL,
	`password` NVARCHAR(200) NULL,
	`lastlogin` DATETIME NULL,
	`blocked` BOOL NULL,
	`blockedsince` DATETIME NULL,
	`active` BOOL NULL,
	`failedlogins` INT NULL,
	`webserviceuser` BOOL NULL,
	`isanonymous` BOOL NULL,
	`createddate` DATETIME NULL,
	`changeddate` DATETIME NULL,
	`submetaobjectname` NVARCHAR(255) NULL,
	`system$changedby` BIGINT NULL,
	`system$owner` BIGINT NULL,
	PRIMARY KEY(`id`),
	CONSTRAINT `uniq_system$user_name` UNIQUE (`name`));

CREATE INDEX `idx_system$user_name_asc` ON `system$user` (`name` ASC,`id` ASC);

CREATE INDEX `idx_system$user_submetaobjectname_asc` ON `system$user` (`submetaobjectname` ASC,`id` ASC);

CREATE INDEX `idx_system$user_system$changedby` ON `system$user` (`system$changedby` ASC,`id` ASC);

CREATE INDEX `idx_system$user_system$owner` ON `system$user` (`system$owner` ASC,`id` ASC);

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('282e2e60-88a5-469d-84a5-ba8d9151644f', 'System.User', 'system$user', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('69acb4a2-be26-4cc5-902a-a8591d357510', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'Name', 'name', 30, 100, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('ef366bc1-ac94-4fd6-bafd-7cee2be459e6', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'Password', 'password', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('040db5be-7810-48b3-a569-516191e8803d', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'LastLogin', 'lastlogin', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('d149bcc3-5e80-46da-ac3f-ee734a64cce1', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'Blocked', 'blocked', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('5b1e816f-0495-4baa-9d21-f1e779923898', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'BlockedSince', 'blockedsince', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('b22d0982-fbee-43a7-8d20-c200d319a3e5', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'Active', 'active', 10, 0, 'true', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('84845531-dbd9-4e00-8afb-c2adc08699bb', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'FailedLogins', 'failedlogins', 3, 0, '0', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('15e3e13d-2df6-4d8a-a1cc-58eea4cec602', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'WebServiceUser', 'webserviceuser', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('28d526e0-915b-466f-80c8-56af32ece225', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'IsAnonymous', 'isanonymous', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('9c09d4eb-9c9c-303e-951e-8c3ea32db37a', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'createdDate', 'createddate', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('e9446b4c-b0f6-3f04-8b0a-264d2384b449', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'changedDate', 'changeddate', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('c2dd7e10-28b4-304c-9ddf-104be6be9cde', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'submetaobjectname', 'submetaobjectname', 30, 255, 'System.User', FALSE);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('5711e9d5-7b67-4579-b730-2ed0b852b799', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'idx_system$user_name_asc');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('5711e9d5-7b67-4579-b730-2ed0b852b799', '69acb4a2-be26-4cc5-902a-a8591d357510', FALSE, 0);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('d45d41fb-40ec-3b91-becf-455eb7f35bff', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'idx_system$user_submetaobjectname_asc');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('d45d41fb-40ec-3b91-becf-455eb7f35bff', 'c2dd7e10-28b4-304c-9ddf-104be6be9cde', FALSE, 0);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('291e0cde-0e23-351e-8001-6240437d1e0e', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'idx_system$user_system$changedby');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('291e0cde-0e23-351e-8001-6240437d1e0e', '6013226d-aeae-3cd2-acec-d95d8bd5c3ad', FALSE, 0);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('3515901d-e8f5-3173-87bb-11ae532c243e', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'idx_system$user_system$owner');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('3515901d-e8f5-3173-87bb-11ae532c243e', '07738295-23fe-3fc1-832b-ed18b22727f0', FALSE, 0);

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$user_name', '282e2e60-88a5-469d-84a5-ba8d9151644f', '69acb4a2-be26-4cc5-902a-a8591d357510');

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`) VALUES ('6013226d-aeae-3cd2-acec-d95d8bd5c3ad', 'System.changedBy', 'system$changedby', '282e2e60-88a5-469d-84a5-ba8d9151644f', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'id', 'system$changedby');

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`) VALUES ('07738295-23fe-3fc1-832b-ed18b22727f0', 'System.owner', 'system$owner', '282e2e60-88a5-469d-84a5-ba8d9151644f', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'id', 'system$owner');

CREATE TABLE `system$user_timezone` (
	`system$userid` BIGINT NOT NULL,
	`system$timezoneid` BIGINT NOT NULL,
	PRIMARY KEY(`system$userid`,`system$timezoneid`),
	CONSTRAINT `uniq_system$user_timezone_system$userid` UNIQUE (`system$userid`));

CREATE INDEX `idx_system$user_timezone_system$timezone_system$user` ON `system$user_timezone` (`system$timezoneid` ASC,`system$userid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('bab4a1ab-7d40-47d5-8f21-fc99d089211d', 'System.User_TimeZone', 'system$user_timezone', '282e2e60-88a5-469d-84a5-ba8d9151644f', '7f7c72af-1ab7-4bf9-bed6-16db5c8fcf6f', 'system$userid', 'system$timezoneid', 'idx_system$user_timezone_system$timezone_system$user');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$user_timezone_system$userid', 'bab4a1ab-7d40-47d5-8f21-fc99d089211d', '61482ff9-64e6-366d-9055-524387b93b37');

CREATE TABLE `system$userroles` (
	`system$userid` BIGINT NOT NULL,
	`system$userroleid` BIGINT NOT NULL,
	PRIMARY KEY(`system$userid`,`system$userroleid`));

CREATE INDEX `idx_system$userroles_system$userrole_system$user` ON `system$userroles` (`system$userroleid` ASC,`system$userid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('6adaf137-4299-435e-9475-a871a4f21471', 'System.UserRoles', 'system$userroles', '282e2e60-88a5-469d-84a5-ba8d9151644f', '92ef30a6-de04-423c-84fd-a21e9b9eeae2', 'system$userid', 'system$userroleid', 'idx_system$userroles_system$userrole_system$user');

CREATE TABLE `system$user_language` (
	`system$userid` BIGINT NOT NULL,
	`system$languageid` BIGINT NOT NULL,
	PRIMARY KEY(`system$userid`,`system$languageid`),
	CONSTRAINT `uniq_system$user_language_system$userid` UNIQUE (`system$userid`));

CREATE INDEX `idx_system$user_language_system$language_system$user` ON `system$user_language` (`system$languageid` ASC,`system$userid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('00640985-3c73-4b15-9705-d4ec3ff58e6b', 'System.User_Language', 'system$user_language', '282e2e60-88a5-469d-84a5-ba8d9151644f', '76805df3-dede-435f-92a6-d6525c68a693', 'system$userid', 'system$languageid', 'idx_system$user_language_system$language_system$user');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$user_language_system$userid', '00640985-3c73-4b15-9705-d4ec3ff58e6b', '37d87db4-942f-301e-b1d7-ca1c940655fa');

CREATE TABLE `system$xasinstance` (
	`id` BIGINT NOT NULL,
	`xasid` NVARCHAR(50) NULL,
	`lastupdate` DATETIME NULL,
	`allowednumberofconcurrentusers` INT NULL,
	`partnername` NVARCHAR(200) NULL,
	`customername` NVARCHAR(200) NULL,
	`createddate` DATETIME NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('d4154981-8dac-4150-aec5-efa3ef62a7a2', 'System.XASInstance', 'system$xasinstance', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('91b58eb9-c16c-4e33-b66b-28489e7fb783', 'd4154981-8dac-4150-aec5-efa3ef62a7a2', 'XASId', 'xasid', 30, 50, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('0c4060ab-4901-419c-a184-81f20fa0460e', 'd4154981-8dac-4150-aec5-efa3ef62a7a2', 'LastUpdate', 'lastupdate', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('2dbe88f5-2b15-4ec3-b295-2e2b496a1ebd', 'd4154981-8dac-4150-aec5-efa3ef62a7a2', 'AllowedNumberOfConcurrentUsers', 'allowednumberofconcurrentusers', 3, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('4359850e-675d-49db-a25c-d78ee530dc33', 'd4154981-8dac-4150-aec5-efa3ef62a7a2', 'PartnerName', 'partnername', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('7ca1bcd3-9355-472f-9e3f-4440366297d6', 'd4154981-8dac-4150-aec5-efa3ef62a7a2', 'CustomerName', 'customername', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('65b02632-d981-3a1c-8ec5-2a36fe6fd7d8', 'd4154981-8dac-4150-aec5-efa3ef62a7a2', 'createdDate', 'createddate', 20, 0, '', FALSE);

CREATE TABLE `system$thumbnail` (
	`id` BIGINT NOT NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `superentity_id`, `remote`, `remote_primary_key`) VALUES ('4babd4c0-b903-4cb4-b1af-e59c4a5fcf3d', 'System.Thumbnail', 'system$thumbnail', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', FALSE, FALSE);

CREATE TABLE `system$thumbnail_image` (
	`system$thumbnailid` BIGINT NOT NULL,
	`system$imageid` BIGINT NOT NULL,
	PRIMARY KEY(`system$thumbnailid`,`system$imageid`),
	CONSTRAINT `uniq_system$thumbnail_image_system$imageid` UNIQUE (`system$imageid`),
	CONSTRAINT `uniq_system$thumbnail_image_system$thumbnailid` UNIQUE (`system$thumbnailid`));

CREATE INDEX `idx_system$thumbnail_image_system$image_system$thumbnail` ON `system$thumbnail_image` (`system$imageid` ASC,`system$thumbnailid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('3dbea779-c8af-467e-a957-140c313ac1b7', 'System.Thumbnail_Image', 'system$thumbnail_image', '4babd4c0-b903-4cb4-b1af-e59c4a5fcf3d', '37827192-315d-4ab6-85b8-f626f866ea76', 'system$thumbnailid', 'system$imageid', 'idx_system$thumbnail_image_system$image_system$thumbnail');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$thumbnail_image_system$imageid', '3dbea779-c8af-467e-a957-140c313ac1b7', '580b34f8-f2b7-3c00-a872-d0e0b53778ef');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$thumbnail_image_system$thumbnailid', '3dbea779-c8af-467e-a957-140c313ac1b7', '9c4f4f6d-6094-3a1b-a97c-09277561b351');

CREATE TABLE `system$workflow` (
	`id` BIGINT NOT NULL,
	`name` NVARCHAR(200) NULL,
	`description` LONGTEXT CHARSET utf8 NULL,
	`starttime` DATETIME NULL,
	`endtime` DATETIME NULL,
	`duedate` DATETIME NULL,
	`canberestarted` BOOL NULL,
	`canbecontinued` BOOL NULL,
	`state` NVARCHAR(12) NULL,
	`reason` LONGTEXT CHARSET utf8 NULL,
	`previousstate` NVARCHAR(12) NULL,
	`objectid` BIGINT NULL,
	`processingstate` NVARCHAR(30) NULL,
	`system$owner` BIGINT NULL,
	PRIMARY KEY(`id`));

CREATE INDEX `idx_system$workflow_system$owner` ON `system$workflow` (`system$owner` ASC,`id` ASC);

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('2ae37bf5-ecb8-4c55-b967-d7383925b208', 'System.Workflow', 'system$workflow', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('77cf3524-fcfe-40cf-8ac0-b073015550ef', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'Name', 'name', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('8a6b4eb4-9b10-4060-a823-79dd4c19c217', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'Description', 'description', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('c627be00-3ea1-4890-9621-d3dad9f11c21', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'StartTime', 'starttime', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('59f6ed7a-8e1a-46c5-a288-c60cdd1baf50', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'EndTime', 'endtime', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('80796d39-0dde-4af7-b619-53ec9950014b', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'DueDate', 'duedate', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('49d88092-1ce9-46e5-baad-b6c22831824d', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'CanBeRestarted', 'canberestarted', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('dec2408c-8fea-4232-8208-cad1117ca406', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'CanBeContinued', 'canbecontinued', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('ec48ea64-d4ae-42dd-8fbe-6c3716181dc7', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'State', 'state', 40, 12, 'InProgress', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('89e83bbd-6379-4601-89b4-825c02c7de6b', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'Reason', 'reason', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('4c70166c-8ebb-4105-a35a-d1e15a82d925', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'PreviousState', 'previousstate', 40, 12, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('e8722447-9692-4c59-8a28-153a4f6ebddb', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'ObjectId', 'objectid', 4, 0, '0', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('cbff7155-11df-47da-8619-b8bd72f40604', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'ProcessingState', 'processingstate', 30, 30, 'Ready', FALSE);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('ac892dd9-fb9e-3590-aaf5-e3e2c7fbc021', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'idx_system$workflow_system$owner');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('ac892dd9-fb9e-3590-aaf5-e3e2c7fbc021', '2cf6fdd7-e448-3a4d-b70e-6d875c2136d7', FALSE, 0);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`) VALUES ('2cf6fdd7-e448-3a4d-b70e-6d875c2136d7', 'System.owner', 'system$owner', '2ae37bf5-ecb8-4c55-b967-d7383925b208', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'id', 'system$owner');

CREATE TABLE `system$workflow_parentworkflow` (
	`system$workflowid1` BIGINT NOT NULL,
	`system$workflowid2` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowid1`,`system$workflowid2`),
	CONSTRAINT `uniq_system$workflow_parentworkflow_system$workflowid1` UNIQUE (`system$workflowid1`));

CREATE INDEX `idx_system$workflow_parentworkflow` ON `system$workflow_parentworkflow` (`system$workflowid2` ASC,`system$workflowid1` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('79314052-9dcc-47e5-954b-80ec631ddd41', 'System.Workflow_ParentWorkflow', 'system$workflow_parentworkflow', '2ae37bf5-ecb8-4c55-b967-d7383925b208', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'system$workflowid1', 'system$workflowid2', 'idx_system$workflow_parentworkflow');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$workflow_parentworkflow_system$workflowid1', '79314052-9dcc-47e5-954b-80ec631ddd41', '84b93b3b-9d0a-342e-b78b-17657b92fc22');

CREATE TABLE `system$workflow_workflowdefinition` (
	`system$workflowid` BIGINT NOT NULL,
	`system$workflowdefinitionid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowid`,`system$workflowdefinitionid`),
	CONSTRAINT `uniq_system$workflow_workflowdefinition_system$workflowid` UNIQUE (`system$workflowid`));

CREATE INDEX `idx_system$workflow_workflowdefinition` ON `system$workflow_workflowdefinition` (`system$workflowdefinitionid` ASC,`system$workflowid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('77c87c19-f28d-4ca3-870c-351722cf5e9e', 'System.Workflow_WorkflowDefinition', 'system$workflow_workflowdefinition', '2ae37bf5-ecb8-4c55-b967-d7383925b208', '5c570d3b-7b31-44fe-abd6-269a234584c5', 'system$workflowid', 'system$workflowdefinitionid', 'idx_system$workflow_workflowdefinition');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$workflow_workflowdefinition_system$workflowid', '77c87c19-f28d-4ca3-870c-351722cf5e9e', '593e832a-6cbc-3208-b1a1-06b8b873428f');

CREATE TABLE `system$workflow_currentactivity` (
	`system$workflowid` BIGINT NOT NULL,
	`system$workflowactivityid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowid`,`system$workflowactivityid`));

CREATE INDEX `idx_system$workflow_currentactivity` ON `system$workflow_currentactivity` (`system$workflowactivityid` ASC,`system$workflowid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('58aa640e-8db7-479b-9f91-2425b009ee06', 'System.Workflow_CurrentActivity', 'system$workflow_currentactivity', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'system$workflowid', 'system$workflowactivityid', 'idx_system$workflow_currentactivity');

CREATE TABLE `system$unreferencedfile` (
	`id` BIGINT NOT NULL,
	`filekey` NVARCHAR(36) NULL,
	`state` NVARCHAR(8) NULL,
	`transactionid` NVARCHAR(36) NULL,
	`createddate` DATETIME NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('4e336d7d-71e8-41f4-9f07-8f0646543e81', 'System.UnreferencedFile', 'system$unreferencedfile', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('a7934e8b-3623-45c7-abf4-e8a1d93770a2', '4e336d7d-71e8-41f4-9f07-8f0646543e81', 'FileKey', 'filekey', 30, 36, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('a7bd62b4-180e-4f89-8767-4df1817e5419', '4e336d7d-71e8-41f4-9f07-8f0646543e81', 'State', 'state', 40, 8, 'New', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('752e783a-9db4-4825-a87c-7e143366bd85', '4e336d7d-71e8-41f4-9f07-8f0646543e81', 'TransactionId', 'transactionid', 30, 36, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('cbd2b083-ad9a-3c24-8d5e-01e8c3994cad', '4e336d7d-71e8-41f4-9f07-8f0646543e81', 'createdDate', 'createddate', 20, 0, '', FALSE);

CREATE TABLE `system$unreferencedfile_xasinstance` (
	`system$unreferencedfileid` BIGINT NOT NULL,
	`system$xasinstanceid` BIGINT NOT NULL,
	PRIMARY KEY(`system$unreferencedfileid`,`system$xasinstanceid`),
	CONSTRAINT `uniq_system$unreferencedfil_xasinstance_system$unreferencedfilei` UNIQUE (`system$unreferencedfileid`));

CREATE INDEX `idx_system$unreferencedfile_xasinstance` ON `system$unreferencedfile_xasinstance` (`system$xasinstanceid` ASC,`system$unreferencedfileid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('1cbb5da6-dbb6-447a-8ea2-b193035320c7', 'System.UnreferencedFile_XASInstance', 'system$unreferencedfile_xasinstance', '4e336d7d-71e8-41f4-9f07-8f0646543e81', 'd4154981-8dac-4150-aec5-efa3ef62a7a2', 'system$unreferencedfileid', 'system$xasinstanceid', 'idx_system$unreferencedfile_xasinstance');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$unreferencedfil_xasinstance_system$unreferencedfilei', '1cbb5da6-dbb6-447a-8ea2-b193035320c7', 'dd0763aa-e3a9-35bd-98ce-4d39d939ad40');

CREATE TABLE `system$image` (
	`id` BIGINT NOT NULL,
	`publicthumbnailpath` NVARCHAR(500) NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `superentity_id`, `remote`, `remote_primary_key`) VALUES ('37827192-315d-4ab6-85b8-f626f866ea76', 'System.Image', 'system$image', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('41c141fa-700b-44de-870d-1aa971e11689', '37827192-315d-4ab6-85b8-f626f866ea76', 'PublicThumbnailPath', 'publicthumbnailpath', 30, 500, '', FALSE);

CREATE TABLE `system$workflowusertaskdefinition` (
	`id` BIGINT NOT NULL,
	`name` NVARCHAR(200) NULL,
	`isobsolete` BOOL NULL,
	`modelguid` NVARCHAR(36) NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('e09e866f-288b-475c-9465-792cde8b878c', 'System.WorkflowUserTaskDefinition', 'system$workflowusertaskdefinition', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('895f51f8-ff84-4694-aa65-1ba19eaeca5e', 'e09e866f-288b-475c-9465-792cde8b878c', 'Name', 'name', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('a6f93dd6-2725-4746-8283-c5c1e1f16d3f', 'e09e866f-288b-475c-9465-792cde8b878c', 'IsObsolete', 'isobsolete', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('015434e4-2727-4ee8-aef4-49d17b16afb1', 'e09e866f-288b-475c-9465-792cde8b878c', 'ModelGUID', 'modelguid', 30, 36, '', FALSE);

CREATE TABLE `system$workflowusertaskdefinition_workflowdefinition` (
	`system$workflowusertaskdefinitionid` BIGINT NOT NULL,
	`system$workflowdefinitionid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowusertaskdefinitionid`,`system$workflowdefinitionid`),
	CONSTRAINT `uniq_syst$workflowusertaskd_workflowdefi_syst$workflowusertaskde` UNIQUE (`system$workflowusertaskdefinitionid`));

CREATE INDEX `idx_system$workflowusertaskdefinition_workflowdefinition` ON `system$workflowusertaskdefinition_workflowdefinition` (`system$workflowdefinitionid` ASC,`system$workflowusertaskdefinitionid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('685c576c-19af-4ea7-983d-ece147c1cebc', 'System.WorkflowUserTaskDefinition_WorkflowDefinition', 'system$workflowusertaskdefinition_workflowdefinition', 'e09e866f-288b-475c-9465-792cde8b878c', '5c570d3b-7b31-44fe-abd6-269a234584c5', 'system$workflowusertaskdefinitionid', 'system$workflowdefinitionid', 'idx_system$workflowusertaskdefinition_workflowdefinition');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_syst$workflowusertaskd_workflowdefi_syst$workflowusertaskde', '685c576c-19af-4ea7-983d-ece147c1cebc', 'ce3750f0-8db1-37ca-95b5-892696a3d9e2');

CREATE TABLE `system$queuedtask` (
	`id` BIGINT NOT NULL,
	`sequence` BIGINT NULL,
	`status` NVARCHAR(12) NULL,
	`queueid` NVARCHAR(36) NULL,
	`queuename` NVARCHAR(200) NULL,
	`contexttype` NVARCHAR(14) NULL,
	`contextdata` LONGTEXT CHARSET utf8 NULL,
	`microflowname` NVARCHAR(200) NULL,
	`useractionname` NVARCHAR(200) NULL,
	`arguments` LONGTEXT CHARSET utf8 NULL,
	`xasid` NVARCHAR(50) NULL,
	`threadid` BIGINT NULL,
	`created` DATETIME NULL,
	`startat` DATETIME NULL,
	`started` DATETIME NULL,
	`retried` BIGINT NULL,
	`retry` NVARCHAR(200) NULL,
	`scheduledeventname` NVARCHAR(200) NULL,
	`system$owner` BIGINT NULL,
	PRIMARY KEY(`id`));

CREATE INDEX `idx_system$queuedtask_queueid_asc_sequence_asc` ON `system$queuedtask` (`queueid` ASC,`sequence` ASC,`id` ASC);

CREATE INDEX `idx_system$queuedtask_system$owner` ON `system$queuedtask` (`system$owner` ASC,`id` ASC);

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('c6c131c8-8779-4213-9b26-a64e141f26a8', 'System.QueuedTask', 'system$queuedtask', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('d26c3f20-7dc5-4a65-bbf6-c84ec5b5fe9f', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'Sequence', 'sequence', 0, 0, '1', TRUE);

INSERT INTO `mendixsystem$sequence` (`attribute_id`, `name`, `start_value`, `current_value`) VALUES ('d26c3f20-7dc5-4a65-bbf6-c84ec5b5fe9f', 'system$queuedtask_sequence_mxseq', 1, 0);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('2223cc2b-6f68-4964-90c4-46ceed8c2f62', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'Status', 'status', 40, 12, 'Idle', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('77f66f6e-3794-4338-8a7d-eb4538dcd6db', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'QueueId', 'queueid', 30, 36, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('3898cc5e-0a5c-402a-8f4b-ffa2271fe5b5', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'QueueName', 'queuename', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('d6288735-aea7-416a-91d2-1735aa7c0ea3', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'ContextType', 'contexttype', 40, 14, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('6534293a-7a10-451c-8b3d-a689d3a281f3', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'ContextData', 'contextdata', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('8b835017-7d42-401f-8271-02c232066d49', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'MicroflowName', 'microflowname', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('b38b8b74-2e97-47aa-96c6-3a14ecef522c', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'UserActionName', 'useractionname', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('b47c6adc-1d13-4f3b-8172-0ace129df25f', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'Arguments', 'arguments', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('0918f273-80a5-42d6-ae35-a7a50ab61210', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'XASId', 'xasid', 30, 50, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('df70e053-7126-4c45-a76b-22c2814babf8', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'ThreadId', 'threadid', 4, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('94e618c6-5158-44c1-baf6-ef6af8a76b6d', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'Created', 'created', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('9b8a26f0-39d8-4419-b064-c58a60be8578', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'StartAt', 'startat', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('3aadbd20-595c-4fdf-84e1-2b65639f8d4b', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'Started', 'started', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('6bd4228f-341d-45b4-a411-765b024ccdfa', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'Retried', 'retried', 4, 0, '0', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('a5c75f55-38b4-4061-a674-5cca84850223', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'Retry', 'retry', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('1cb5f39d-db9c-4f70-ac6a-ee3c5f5a1dcf', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'ScheduledEventName', 'scheduledeventname', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('0eb7513a-a55e-4145-922a-1856104655f7', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'idx_system$queuedtask_queueid_asc_sequence_asc');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('0eb7513a-a55e-4145-922a-1856104655f7', '77f66f6e-3794-4338-8a7d-eb4538dcd6db', FALSE, 0);

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('0eb7513a-a55e-4145-922a-1856104655f7', 'd26c3f20-7dc5-4a65-bbf6-c84ec5b5fe9f', FALSE, 1);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('8de203bb-c0c1-349b-8aef-037cdb0cd348', 'c6c131c8-8779-4213-9b26-a64e141f26a8', 'idx_system$queuedtask_system$owner');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('8de203bb-c0c1-349b-8aef-037cdb0cd348', 'f6de554a-f765-3d80-aa59-2b3da4167137', FALSE, 0);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`) VALUES ('f6de554a-f765-3d80-aa59-2b3da4167137', 'System.owner', 'system$owner', 'c6c131c8-8779-4213-9b26-a64e141f26a8', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'id', 'system$owner');

CREATE TABLE `system$filedocument` (
	`id` BIGINT NOT NULL,
	`fileid` BIGINT NULL,
	`name` NVARCHAR(400) NULL,
	`deleteafterdownload` BOOL NULL,
	`contents` LONGBLOB NULL,
	`hascontents` BOOL NULL,
	`size` BIGINT NULL,
	`__filename__` BIGINT NULL,
	`__uuid__` NVARCHAR(36) NULL,
	`createddate` DATETIME NULL,
	`changeddate` DATETIME NULL,
	`submetaobjectname` NVARCHAR(255) NULL,
	`system$owner` BIGINT NULL,
	`system$changedby` BIGINT NULL,
	PRIMARY KEY(`id`));

CREATE INDEX `idx_system$filedocument_fileid_asc` ON `system$filedocument` (`fileid` ASC,`id` ASC);

CREATE INDEX `idx_system$filedocument_size_asc` ON `system$filedocument` (`size` ASC,`id` ASC);

CREATE INDEX `idx_system$filedocument___uuid___asc` ON `system$filedocument` (`__uuid__` ASC,`id` ASC);

CREATE INDEX `idx_system$filedocument_submetaobjectname_asc` ON `system$filedocument` (`submetaobjectname` ASC,`id` ASC);

CREATE INDEX `idx_system$filedocument_system$owner` ON `system$filedocument` (`system$owner` ASC,`id` ASC);

CREATE INDEX `idx_system$filedocument_system$changedby` ON `system$filedocument` (`system$changedby` ASC,`id` ASC);

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'System.FileDocument', 'system$filedocument', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('0f81688b-e719-4204-8f86-8fcd664a0992', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'FileID', 'fileid', 0, 0, '1', TRUE);

INSERT INTO `mendixsystem$sequence` (`attribute_id`, `name`, `start_value`, `current_value`) VALUES ('0f81688b-e719-4204-8f86-8fcd664a0992', 'system$filedocument_fileid_mxseq', 1, 0);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('3501ab9f-42c7-46e4-ac8f-c51e256c934e', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'Name', 'name', 30, 400, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('5fecca4d-0f28-484d-9fe7-1afde250b07d', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'DeleteAfterDownload', 'deleteafterdownload', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('e6dfb82a-54fe-4fcd-a513-a086f508c2db', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'Contents', 'contents', 50, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('4c9627fb-3b64-4239-95eb-f51fb8d3f2b3', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'HasContents', 'hascontents', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('14018140-78df-4e36-9869-d0b53129d2c9', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'Size', 'size', 4, 0, '-1', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('a02027b1-e24d-49fc-9b3f-ade644070879', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', '__FileName__', '__filename__', 4, 0, '0', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('96445370-6fed-11e4-9803-0800200c9a66', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', '__UUID__', '__uuid__', 30, 36, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('8655b482-0ac3-31db-8289-b05f505b77cb', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'createdDate', 'createddate', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('245def96-0172-3d83-96fe-0ee1ba825f26', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'changedDate', 'changeddate', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('b51ea62a-1838-3f74-9c5f-07b5b5a92a45', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'submetaobjectname', 'submetaobjectname', 30, 255, 'System.FileDocument', FALSE);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('6ceea2cb-6acf-457a-852f-eb7deab79430', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'idx_system$filedocument_fileid_asc');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('6ceea2cb-6acf-457a-852f-eb7deab79430', '0f81688b-e719-4204-8f86-8fcd664a0992', FALSE, 0);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('59de2f9e-3e30-4dd7-a5de-58594a63ea2b', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'idx_system$filedocument_size_asc');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('59de2f9e-3e30-4dd7-a5de-58594a63ea2b', '14018140-78df-4e36-9869-d0b53129d2c9', FALSE, 0);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('17f7461b-5b7c-494d-8fde-b531299c42b0', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'idx_system$filedocument___uuid___asc');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('17f7461b-5b7c-494d-8fde-b531299c42b0', '96445370-6fed-11e4-9803-0800200c9a66', FALSE, 0);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('dfd88a6e-a3b6-3080-b6cc-d5c61334281d', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'idx_system$filedocument_submetaobjectname_asc');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('dfd88a6e-a3b6-3080-b6cc-d5c61334281d', 'b51ea62a-1838-3f74-9c5f-07b5b5a92a45', FALSE, 0);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('a5c117d9-85fc-365e-9a66-909509269987', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'idx_system$filedocument_system$owner');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('a5c117d9-85fc-365e-9a66-909509269987', '1442c9da-d4ae-3cf5-b3c0-6c878743e4e5', FALSE, 0);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('a1966801-fcea-3251-82e4-bf4178bdc504', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', 'idx_system$filedocument_system$changedby');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('a1966801-fcea-3251-82e4-bf4178bdc504', '956c1382-b9fc-3367-b0b2-cb67ee9ef13f', FALSE, 0);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`) VALUES ('1442c9da-d4ae-3cf5-b3c0-6c878743e4e5', 'System.owner', 'system$owner', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'id', 'system$owner');

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`) VALUES ('956c1382-b9fc-3367-b0b2-cb67ee9ef13f', 'System.changedBy', 'system$changedby', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'id', 'system$changedby');

CREATE TABLE `system$backgroundjob` (
	`id` BIGINT NOT NULL,
	`jobid` BIGINT NULL,
	`starttime` DATETIME NULL,
	`endtime` DATETIME NULL,
	`result` LONGTEXT CHARSET utf8 NULL,
	`successful` BOOL NULL,
	PRIMARY KEY(`id`));

CREATE INDEX `idx_system$backgroundjob_jobid_asc` ON `system$backgroundjob` (`jobid` ASC,`id` ASC);

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('660db38b-5ab4-4d15-b649-93a947ecea82', 'System.BackgroundJob', 'system$backgroundjob', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('97bcc327-4d2b-4a28-a57a-7e7437416bfe', '660db38b-5ab4-4d15-b649-93a947ecea82', 'JobId', 'jobid', 4, 0, '0', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('d5aa1ceb-6dfe-457b-afb7-e969a814eafd', '660db38b-5ab4-4d15-b649-93a947ecea82', 'StartTime', 'starttime', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('9c471b02-f266-4e27-9e2f-907d0fad6552', '660db38b-5ab4-4d15-b649-93a947ecea82', 'EndTime', 'endtime', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('c33867e7-7263-4ce6-826a-714e7493f07a', '660db38b-5ab4-4d15-b649-93a947ecea82', 'Result', 'result', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('c56553ba-a3d4-4d9e-bc81-e61ee64da79b', '660db38b-5ab4-4d15-b649-93a947ecea82', 'Successful', 'successful', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('a5ff48ca-56d6-4f43-8e3a-7743fd025974', '660db38b-5ab4-4d15-b649-93a947ecea82', 'idx_system$backgroundjob_jobid_asc');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('a5ff48ca-56d6-4f43-8e3a-7743fd025974', '97bcc327-4d2b-4a28-a57a-7e7437416bfe', FALSE, 0);

CREATE TABLE `system$backgroundjob_session` (
	`system$backgroundjobid` BIGINT NOT NULL,
	`system$sessionid` BIGINT NOT NULL,
	PRIMARY KEY(`system$backgroundjobid`,`system$sessionid`),
	CONSTRAINT `uniq_system$backgroundjob_session_system$backgroundjobid` UNIQUE (`system$backgroundjobid`));

CREATE INDEX `idx_system$backgroundjob_session` ON `system$backgroundjob_session` (`system$sessionid` ASC,`system$backgroundjobid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('19892a2b-f17a-4c29-80c1-c81f8025b36c', 'System.BackgroundJob_Session', 'system$backgroundjob_session', '660db38b-5ab4-4d15-b649-93a947ecea82', '37f9fd49-5318-4c63-9a51-f761779b202f', 'system$backgroundjobid', 'system$sessionid', 'idx_system$backgroundjob_session');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$backgroundjob_session_system$backgroundjobid', '19892a2b-f17a-4c29-80c1-c81f8025b36c', '60770e0f-201c-3f24-8a1e-d8b42a715ddb');

CREATE TABLE `system$backgroundjob_xasinstance` (
	`system$backgroundjobid` BIGINT NOT NULL,
	`system$xasinstanceid` BIGINT NOT NULL,
	PRIMARY KEY(`system$backgroundjobid`,`system$xasinstanceid`),
	CONSTRAINT `uniq_system$backgroundjob_xasinstance_system$backgroundjobid` UNIQUE (`system$backgroundjobid`));

CREATE INDEX `idx_system$backgroundjob_xasinstance` ON `system$backgroundjob_xasinstance` (`system$xasinstanceid` ASC,`system$backgroundjobid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('fc3944c4-7a19-4a4d-9b0d-4a0c9d7aeb23', 'System.BackgroundJob_XASInstance', 'system$backgroundjob_xasinstance', '660db38b-5ab4-4d15-b649-93a947ecea82', 'd4154981-8dac-4150-aec5-efa3ef62a7a2', 'system$backgroundjobid', 'system$xasinstanceid', 'idx_system$backgroundjob_xasinstance');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$backgroundjob_xasinstance_system$backgroundjobid', 'fc3944c4-7a19-4a4d-9b0d-4a0c9d7aeb23', '4fcadd5b-cfd5-3991-bdb8-19c4d63b1aa5');

CREATE TABLE `system$scheduledeventinformation` (
	`id` BIGINT NOT NULL,
	`name` NVARCHAR(200) NULL,
	`description` LONGTEXT CHARSET utf8 NULL,
	`starttime` DATETIME NULL,
	`endtime` DATETIME NULL,
	`status` NVARCHAR(9) NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('685df5a6-1e02-49bb-a0b5-5a55c5e8313d', 'System.ScheduledEventInformation', 'system$scheduledeventinformation', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('8b7184a0-cd05-4c75-89f9-be6e9349783b', '685df5a6-1e02-49bb-a0b5-5a55c5e8313d', 'Name', 'name', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('26ccae8a-22b1-4899-87c9-c5b4915dbf28', '685df5a6-1e02-49bb-a0b5-5a55c5e8313d', 'Description', 'description', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('651e7007-7fcd-43b3-a918-a0de81de34bf', '685df5a6-1e02-49bb-a0b5-5a55c5e8313d', 'StartTime', 'starttime', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('33adad79-f658-4e69-8c58-e003fb3c78be', '685df5a6-1e02-49bb-a0b5-5a55c5e8313d', 'EndTime', 'endtime', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('6d2a7545-4e52-4c5d-ac02-0b8211d0585f', '685df5a6-1e02-49bb-a0b5-5a55c5e8313d', 'Status', 'status', 40, 9, '', FALSE);

CREATE TABLE `system$scheduledeventinformation_xasinstance` (
	`system$scheduledeventinformationid` BIGINT NOT NULL,
	`system$xasinstanceid` BIGINT NOT NULL,
	PRIMARY KEY(`system$scheduledeventinformationid`,`system$xasinstanceid`),
	CONSTRAINT `uniq_syste$scheduledeventinfo_xasinsta_syste$scheduledeventinfor` UNIQUE (`system$scheduledeventinformationid`));

CREATE INDEX `idx_system$scheduledeventinformation_xasinstance` ON `system$scheduledeventinformation_xasinstance` (`system$xasinstanceid` ASC,`system$scheduledeventinformationid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('7b8a18de-fe6d-4735-9841-0d9d4760697e', 'System.ScheduledEventInformation_XASInstance', 'system$scheduledeventinformation_xasinstance', '685df5a6-1e02-49bb-a0b5-5a55c5e8313d', 'd4154981-8dac-4150-aec5-efa3ef62a7a2', 'system$scheduledeventinformationid', 'system$xasinstanceid', 'idx_system$scheduledeventinformation_xasinstance');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_syste$scheduledeventinfo_xasinsta_syste$scheduledeventinfor', '7b8a18de-fe6d-4735-9841-0d9d4760697e', 'b1eb1dd4-9f4c-3dae-9cde-9a7df66af36c');

CREATE TABLE `system$synchronizationerror` (
	`id` BIGINT NOT NULL,
	`reason` LONGTEXT CHARSET utf8 NULL,
	`objectid` NVARCHAR(200) NULL,
	`objecttype` NVARCHAR(1000) NULL,
	`objectcontent` LONGTEXT CHARSET utf8 NULL,
	`createddate` DATETIME NULL,
	`system$owner` BIGINT NULL,
	PRIMARY KEY(`id`));

CREATE INDEX `idx_system$synchronizationerror_system$owner` ON `system$synchronizationerror` (`system$owner` ASC,`id` ASC);

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('f9818ad8-3214-4b1d-b837-3181863f5ed5', 'System.SynchronizationError', 'system$synchronizationerror', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('2f76e5ca-ccbe-4137-856b-1999a51431f2', 'f9818ad8-3214-4b1d-b837-3181863f5ed5', 'Reason', 'reason', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('7e215c6c-0cfd-4533-8529-23e4f5359b7a', 'f9818ad8-3214-4b1d-b837-3181863f5ed5', 'ObjectId', 'objectid', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('b1684d75-8427-4ed6-be7a-3f4d4e59d61e', 'f9818ad8-3214-4b1d-b837-3181863f5ed5', 'ObjectType', 'objecttype', 30, 1000, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('29d27bde-bc08-4f80-9d6c-9f47a3209452', 'f9818ad8-3214-4b1d-b837-3181863f5ed5', 'ObjectContent', 'objectcontent', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('a3e1c07d-2b2b-3e20-bbf0-de44e27d29f4', 'f9818ad8-3214-4b1d-b837-3181863f5ed5', 'createdDate', 'createddate', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('02390f36-727f-3e8e-8698-51de6cbd7dd0', 'f9818ad8-3214-4b1d-b837-3181863f5ed5', 'idx_system$synchronizationerror_system$owner');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('02390f36-727f-3e8e-8698-51de6cbd7dd0', 'b822057e-d9ee-3cd6-8535-6bc9268cb842', FALSE, 0);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`) VALUES ('b822057e-d9ee-3cd6-8535-6bc9268cb842', 'System.owner', 'system$owner', 'f9818ad8-3214-4b1d-b837-3181863f5ed5', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'id', 'system$owner');

CREATE TABLE `system$workflowactivity` (
	`id` BIGINT NOT NULL,
	`modelguid` NVARCHAR(36) NULL,
	`activityguid` NVARCHAR(36) NULL,
	`caption` LONGTEXT CHARSET utf8 NULL,
	`state` NVARCHAR(9) NULL,
	`starttime` DATETIME NULL,
	`endtime` DATETIME NULL,
	`error` LONGTEXT CHARSET utf8 NULL,
	`activityhash` NVARCHAR(200) NULL,
	`ismigrationactivity` BOOL NULL,
	`isderivedactivity` BOOL NULL,
	`outcome` NVARCHAR(200) NULL,
	`outcomemodelguid` NVARCHAR(36) NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('a5952592-bb2c-4798-9805-f9ff91ad97de', 'System.WorkflowActivity', 'system$workflowactivity', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('941e921b-8935-402e-9d93-7894c5cc9164', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'ModelGUID', 'modelguid', 30, 36, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('11384083-d925-4b16-a625-60af27227bb4', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'ActivityGUID', 'activityguid', 30, 36, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('3236d0ea-2456-447a-b2ff-fc3b10a6ddb2', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'Caption', 'caption', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('b0f8b9bd-f006-43a3-9c9f-edb70cd1642c', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'State', 'state', 40, 9, 'Started', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('1c9a62fd-2e39-4fd3-92a4-748940ae67ba', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'StartTime', 'starttime', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('dc169e92-887a-4fc5-a21e-51d99b41314b', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'EndTime', 'endtime', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('3b8d6bea-dfb5-497b-b2ad-c423efbd66eb', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'Error', 'error', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('84cfff18-42dc-4442-b783-3ca923fcde81', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'ActivityHash', 'activityhash', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('d78085f1-fdf5-40c1-93ae-30de543e4b81', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'IsMigrationActivity', 'ismigrationactivity', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('cace349b-8e30-437e-95df-c4fd4225490d', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'IsDerivedActivity', 'isderivedactivity', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('a23daff4-8363-47ea-862f-4c85a29929a2', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'Outcome', 'outcome', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('c39dca31-4f4a-4e52-a633-aa7840fd0894', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'OutcomeModelGUID', 'outcomemodelguid', 30, 36, '', FALSE);

CREATE TABLE `system$workflowactivity_previousactivity` (
	`system$workflowactivityid1` BIGINT NOT NULL,
	`system$workflowactivityid2` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowactivityid1`,`system$workflowactivityid2`));

CREATE INDEX `idx_system$workflowactivity_previousactivity` ON `system$workflowactivity_previousactivity` (`system$workflowactivityid2` ASC,`system$workflowactivityid1` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('8d8c8ffc-08d6-4dc5-88f6-5b344763d948', 'System.WorkflowActivity_PreviousActivity', 'system$workflowactivity_previousactivity', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'system$workflowactivityid1', 'system$workflowactivityid2', 'idx_system$workflowactivity_previousactivity');

CREATE TABLE `system$workflowactivity_workflow` (
	`system$workflowactivityid` BIGINT NOT NULL,
	`system$workflowid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowactivityid`,`system$workflowid`),
	CONSTRAINT `uniq_system$workflowactivity_workflow_system$workflowactivityid` UNIQUE (`system$workflowactivityid`));

CREATE INDEX `idx_system$workflowactivity_workflow` ON `system$workflowactivity_workflow` (`system$workflowid` ASC,`system$workflowactivityid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('ef863cc9-2d20-4a74-af65-0320a76b6a10', 'System.WorkflowActivity_Workflow', 'system$workflowactivity_workflow', 'a5952592-bb2c-4798-9805-f9ff91ad97de', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'system$workflowactivityid', 'system$workflowid', 'idx_system$workflowactivity_workflow');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$workflowactivity_workflow_system$workflowactivityid', 'ef863cc9-2d20-4a74-af65-0320a76b6a10', '56628087-ac77-34ca-bd95-b86020fc4ffa');

CREATE TABLE `system$workflowactivity_workflowversion` (
	`system$workflowactivityid` BIGINT NOT NULL,
	`system$workflowversionid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowactivityid`,`system$workflowversionid`),
	CONSTRAINT `uniq_system$workflowactivi_workflowversi_system$workflowactivity` UNIQUE (`system$workflowactivityid`));

CREATE INDEX `idx_system$workflowactivity_workflowversion` ON `system$workflowactivity_workflowversion` (`system$workflowversionid` ASC,`system$workflowactivityid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('2e5166f9-7430-4265-8465-f7405d6fe1e9', 'System.WorkflowActivity_WorkflowVersion', 'system$workflowactivity_workflowversion', 'a5952592-bb2c-4798-9805-f9ff91ad97de', '30834a21-e81c-4cbf-a10b-5f60f5fddc82', 'system$workflowactivityid', 'system$workflowversionid', 'idx_system$workflowactivity_workflowversion');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$workflowactivi_workflowversi_system$workflowactivity', '2e5166f9-7430-4265-8465-f7405d6fe1e9', 'f25c7cf4-22a7-30e7-a3b6-1cda08ccc618');

CREATE TABLE `system$workflowactivity_workflowusertask` (
	`system$workflowactivityid` BIGINT NOT NULL,
	`system$workflowusertaskid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowactivityid`,`system$workflowusertaskid`),
	CONSTRAINT `uniq_system$workflowactivi_workflowuserta_system$workflowactivit` UNIQUE (`system$workflowactivityid`));

CREATE INDEX `idx_system$workflowactivity_workflowusertask` ON `system$workflowactivity_workflowusertask` (`system$workflowusertaskid` ASC,`system$workflowactivityid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('aaebf783-447c-4386-ba25-969132aa6f7c', 'System.WorkflowActivity_WorkflowUserTask', 'system$workflowactivity_workflowusertask', 'a5952592-bb2c-4798-9805-f9ff91ad97de', '3729d27c-735b-457a-b210-9dffb125c3f3', 'system$workflowactivityid', 'system$workflowusertaskid', 'idx_system$workflowactivity_workflowusertask');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$workflowactivi_workflowuserta_system$workflowactivit', 'aaebf783-447c-4386-ba25-969132aa6f7c', '096b955d-f88f-303f-b43e-deef60b57065');

CREATE TABLE `system$workflowactivity_subworkflow` (
	`system$workflowactivityid` BIGINT NOT NULL,
	`system$workflowid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowactivityid`,`system$workflowid`),
	CONSTRAINT `uniq_system$workflowactivit_subworkflow_system$workflowactivityi` UNIQUE (`system$workflowactivityid`));

CREATE INDEX `idx_system$workflowactivity_subworkflow` ON `system$workflowactivity_subworkflow` (`system$workflowid` ASC,`system$workflowactivityid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('5c89ec5d-0378-4afd-afd4-0e7a9fde45a9', 'System.WorkflowActivity_SubWorkflow', 'system$workflowactivity_subworkflow', 'a5952592-bb2c-4798-9805-f9ff91ad97de', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'system$workflowactivityid', 'system$workflowid', 'idx_system$workflowactivity_subworkflow');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$workflowactivit_subworkflow_system$workflowactivityi', '5c89ec5d-0378-4afd-afd4-0e7a9fde45a9', '2d65cc25-b704-3604-8f2b-e3c73d37fb2b');

CREATE TABLE `system$workflowactivity_taskactor` (
	`system$workflowactivityid` BIGINT NOT NULL,
	`system$userid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowactivityid`,`system$userid`),
	CONSTRAINT `uniq_system$workflowactivity_taskactor_system$workflowactivityid` UNIQUE (`system$workflowactivityid`));

CREATE INDEX `idx_system$workflowactivity_taskactor` ON `system$workflowactivity_taskactor` (`system$userid` ASC,`system$workflowactivityid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('63446029-b863-4c07-ab91-22219be89b70', 'System.WorkflowActivity_TaskActor', 'system$workflowactivity_taskactor', 'a5952592-bb2c-4798-9805-f9ff91ad97de', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'system$workflowactivityid', 'system$userid', 'idx_system$workflowactivity_taskactor');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$workflowactivity_taskactor_system$workflowactivityid', '63446029-b863-4c07-ab91-22219be89b70', '38f7a539-d2df-398f-99b4-047c6f7ff859');

CREATE TABLE `system$session` (
	`id` BIGINT NOT NULL,
	`sessionid` NVARCHAR(50) NULL,
	`csrftoken` NVARCHAR(36) NULL,
	`lastactive` DATETIME NULL,
	`longlived` BOOL NULL,
	`readonlyhashkey` NVARCHAR(36) NULL,
	`lastactionexecution` DATETIME NULL,
	`createddate` DATETIME NULL,
	PRIMARY KEY(`id`));

CREATE INDEX `idx_system$session_sessionid_asc` ON `system$session` (`sessionid` ASC,`id` ASC);

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('37f9fd49-5318-4c63-9a51-f761779b202f', 'System.Session', 'system$session', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('d50c78a5-d740-4a76-a356-47659cfd515e', '37f9fd49-5318-4c63-9a51-f761779b202f', 'SessionId', 'sessionid', 30, 50, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('f4d19200-071c-45e5-af25-321354f0702b', '37f9fd49-5318-4c63-9a51-f761779b202f', 'CSRFToken', 'csrftoken', 30, 36, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('1ffdcb00-e7a4-4303-8b40-2319d9ba01b7', '37f9fd49-5318-4c63-9a51-f761779b202f', 'LastActive', 'lastactive', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('875dc581-177c-457a-8406-814676ccdb05', '37f9fd49-5318-4c63-9a51-f761779b202f', 'LongLived', 'longlived', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('f1949c9c-7b28-11e6-8b77-86f30ca893d3', '37f9fd49-5318-4c63-9a51-f761779b202f', 'ReadOnlyHashKey', 'readonlyhashkey', 30, 36, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('8b42eee4-92e5-4472-9f12-3a4e73291f2b', '37f9fd49-5318-4c63-9a51-f761779b202f', 'LastActionExecution', 'lastactionexecution', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('0c2b42ef-02bd-3783-bf55-02a92f4275c7', '37f9fd49-5318-4c63-9a51-f761779b202f', 'createdDate', 'createddate', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('6127a5ae-0a96-4df5-9856-17baf94b2351', '37f9fd49-5318-4c63-9a51-f761779b202f', 'idx_system$session_sessionid_asc');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('6127a5ae-0a96-4df5-9856-17baf94b2351', 'd50c78a5-d740-4a76-a356-47659cfd515e', FALSE, 0);

CREATE TABLE `system$session_user` (
	`system$sessionid` BIGINT NOT NULL,
	`system$userid` BIGINT NOT NULL,
	PRIMARY KEY(`system$sessionid`,`system$userid`),
	CONSTRAINT `uniq_system$session_user_system$sessionid` UNIQUE (`system$sessionid`));

CREATE INDEX `idx_system$session_user_system$user_system$session` ON `system$session_user` (`system$userid` ASC,`system$sessionid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('546aaff5-62e1-40ce-ab45-d40d0a0478f1', 'System.Session_User', 'system$session_user', '37f9fd49-5318-4c63-9a51-f761779b202f', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'system$sessionid', 'system$userid', 'idx_system$session_user_system$user_system$session');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$session_user_system$sessionid', '546aaff5-62e1-40ce-ab45-d40d0a0478f1', '142c3a11-004d-3f79-916b-d0347144970b');

CREATE TABLE `system$autocommitentry` (
	`id` BIGINT NOT NULL,
	`sessionid` NVARCHAR(36) NULL,
	`objectid` BIGINT NULL,
	`createddate` DATETIME NULL,
	PRIMARY KEY(`id`));

CREATE INDEX `idx_system$autocommitentry_sessionid_asc_objectid_asc` ON `system$autocommitentry` (`sessionid` ASC,`objectid` ASC,`id` ASC);

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('67c28960-7a7a-11e6-bdf4-0800200c9a66', 'System.AutoCommitEntry', 'system$autocommitentry', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('67c28961-7a7a-11e6-bdf4-0800200c9a66', '67c28960-7a7a-11e6-bdf4-0800200c9a66', 'SessionId', 'sessionid', 30, 36, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('67c28962-7a7a-11e6-bdf4-0800200c9a66', '67c28960-7a7a-11e6-bdf4-0800200c9a66', 'ObjectId', 'objectid', 4, 0, '0', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('bbe9c632-f0be-31a1-a709-ab0d57c79c84', '67c28960-7a7a-11e6-bdf4-0800200c9a66', 'createdDate', 'createddate', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('67c28963-7a7a-11e6-bdf4-0800200c9a66', '67c28960-7a7a-11e6-bdf4-0800200c9a66', 'idx_system$autocommitentry_sessionid_asc_objectid_asc');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('67c28963-7a7a-11e6-bdf4-0800200c9a66', '67c28961-7a7a-11e6-bdf4-0800200c9a66', FALSE, 0);

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('67c28963-7a7a-11e6-bdf4-0800200c9a66', '67c28962-7a7a-11e6-bdf4-0800200c9a66', FALSE, 1);

CREATE TABLE `system$taskqueuetoken` (
	`id` BIGINT NOT NULL,
	`queuename` NVARCHAR(200) NULL,
	`xasid` NVARCHAR(50) NULL,
	`validuntil` DATETIME NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('bb60ef05-6d17-48ad-a4ef-559310c30c5b', 'System.TaskQueueToken', 'system$taskqueuetoken', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('f1c72f88-9feb-409f-b592-385be28eed47', 'bb60ef05-6d17-48ad-a4ef-559310c30c5b', 'QueueName', 'queuename', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('46add4ce-cd71-4db0-8fc7-0d1ab16954fa', 'bb60ef05-6d17-48ad-a4ef-559310c30c5b', 'XASId', 'xasid', 30, 50, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('c05017ba-1faa-4f63-9d4c-06918a947700', 'bb60ef05-6d17-48ad-a4ef-559310c30c5b', 'ValidUntil', 'validuntil', 20, 0, '', FALSE);

CREATE TABLE `system$workflowversion` (
	`id` BIGINT NOT NULL,
	`versionhash` NVARCHAR(200) NULL,
	`modeljson` LONGTEXT CHARSET utf8 NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('30834a21-e81c-4cbf-a10b-5f60f5fddc82', 'System.WorkflowVersion', 'system$workflowversion', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('ee842048-ff1d-4ea4-80b3-2d1123437d5f', '30834a21-e81c-4cbf-a10b-5f60f5fddc82', 'VersionHash', 'versionhash', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('2c5449d3-09f4-463f-8a99-439c6cb74fed', '30834a21-e81c-4cbf-a10b-5f60f5fddc82', 'ModelJSON', 'modeljson', 30, 0, '', FALSE);

CREATE TABLE `system$workflowversion_workflowusertaskdefinition` (
	`system$workflowversionid` BIGINT NOT NULL,
	`system$workflowusertaskdefinitionid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowversionid`,`system$workflowusertaskdefinitionid`));

CREATE INDEX `idx_system$workflowversion_workflowusertaskdefinition` ON `system$workflowversion_workflowusertaskdefinition` (`system$workflowusertaskdefinitionid` ASC,`system$workflowversionid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('3348e396-6643-4a5b-bcb1-a939cdcdf435', 'System.WorkflowVersion_WorkflowUserTaskDefinition', 'system$workflowversion_workflowusertaskdefinition', '30834a21-e81c-4cbf-a10b-5f60f5fddc82', 'e09e866f-288b-475c-9465-792cde8b878c', 'system$workflowversionid', 'system$workflowusertaskdefinitionid', 'idx_system$workflowversion_workflowusertaskdefinition');

CREATE TABLE `system$workflowversion_previousversion` (
	`system$workflowversionid1` BIGINT NOT NULL,
	`system$workflowversionid2` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowversionid1`,`system$workflowversionid2`),
	CONSTRAINT `uniq_system$workflowversi_previousversio_system$workflowversioni` UNIQUE (`system$workflowversionid1`));

CREATE INDEX `idx_system$workflowversion_previousversion` ON `system$workflowversion_previousversion` (`system$workflowversionid2` ASC,`system$workflowversionid1` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('61a2af90-0720-41a0-bea9-8a3d60de71d0', 'System.WorkflowVersion_PreviousVersion', 'system$workflowversion_previousversion', '30834a21-e81c-4cbf-a10b-5f60f5fddc82', '30834a21-e81c-4cbf-a10b-5f60f5fddc82', 'system$workflowversionid1', 'system$workflowversionid2', 'idx_system$workflowversion_previousversion');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$workflowversi_previousversio_system$workflowversioni', '61a2af90-0720-41a0-bea9-8a3d60de71d0', 'a0f7479f-37c0-39ac-9fb9-5589bd8627c5');

CREATE TABLE `system$workflowversion_workflowdefinition` (
	`system$workflowversionid` BIGINT NOT NULL,
	`system$workflowdefinitionid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowversionid`,`system$workflowdefinitionid`),
	CONSTRAINT `uniq_system$workflowversi_workflowdefinit_system$workflowversion` UNIQUE (`system$workflowversionid`));

CREATE INDEX `idx_system$workflowversion_workflowdefinition` ON `system$workflowversion_workflowdefinition` (`system$workflowdefinitionid` ASC,`system$workflowversionid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('c063e3e7-a440-47f0-8065-6fac7c723690', 'System.WorkflowVersion_WorkflowDefinition', 'system$workflowversion_workflowdefinition', '30834a21-e81c-4cbf-a10b-5f60f5fddc82', '5c570d3b-7b31-44fe-abd6-269a234584c5', 'system$workflowversionid', 'system$workflowdefinitionid', 'idx_system$workflowversion_workflowdefinition');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$workflowversi_workflowdefinit_system$workflowversion', 'c063e3e7-a440-47f0-8065-6fac7c723690', '47c7ac0f-8b15-3178-ae6c-8b0cb0debb61');

CREATE TABLE `system$synchronizationerrorfile` (
	`id` BIGINT NOT NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `superentity_id`, `remote`, `remote_primary_key`) VALUES ('9b26443c-f4bb-4252-aa62-9eaffb71c4db', 'System.SynchronizationErrorFile', 'system$synchronizationerrorfile', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', FALSE, FALSE);

CREATE TABLE `system$synchronizationerrorfile_synchronizationerror` (
	`system$synchronizationerrorfileid` BIGINT NOT NULL,
	`system$synchronizationerrorid` BIGINT NOT NULL,
	PRIMARY KEY(`system$synchronizationerrorfileid`,`system$synchronizationerrorid`),
	CONSTRAINT `uniq_syst$synchronizatione_synchronizati_syste$synchronizationer` UNIQUE (`system$synchronizationerrorfileid`));

CREATE INDEX `idx_system$synchronizationerrorfile_synchronizationerror` ON `system$synchronizationerrorfile_synchronizationerror` (`system$synchronizationerrorid` ASC,`system$synchronizationerrorfileid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('6440aa38-83ff-4ba6-8c85-5ff785956b09', 'System.SynchronizationErrorFile_SynchronizationError', 'system$synchronizationerrorfile_synchronizationerror', '9b26443c-f4bb-4252-aa62-9eaffb71c4db', 'f9818ad8-3214-4b1d-b837-3181863f5ed5', 'system$synchronizationerrorfileid', 'system$synchronizationerrorid', 'idx_system$synchronizationerrorfile_synchronizationerror');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_syst$synchronizatione_synchronizati_syste$synchronizationer', '6440aa38-83ff-4ba6-8c85-5ff785956b09', '1e2455b8-3c89-380e-983f-14ead6e94b4c');

CREATE TABLE `system$changehash` (
	`id` BIGINT NOT NULL,
	`objectid` BIGINT NULL,
	`attribute` NVARCHAR(200) NULL,
	`hash` NVARCHAR(200) NULL,
	`createddate` DATETIME NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('24f72d72-3c66-46e4-a08b-09daf0f451d8', 'System.ChangeHash', 'system$changehash', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('47b5e625-85c7-431f-8aaa-3d1e532287f9', '24f72d72-3c66-46e4-a08b-09daf0f451d8', 'ObjectId', 'objectid', 4, 0, '0', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('28dc5eba-42c6-4602-ac97-35eda6b366b0', '24f72d72-3c66-46e4-a08b-09daf0f451d8', 'Attribute', 'attribute', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('a142f7d6-8ed6-4753-8706-d5938e9879aa', '24f72d72-3c66-46e4-a08b-09daf0f451d8', 'Hash', 'hash', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('13f98cae-7256-37ee-a5de-fdb7aa36e8b5', '24f72d72-3c66-46e4-a08b-09daf0f451d8', 'createdDate', 'createddate', 20, 0, '', FALSE);

CREATE TABLE `system$changehash_session` (
	`system$changehashid` BIGINT NOT NULL,
	`system$sessionid` BIGINT NOT NULL,
	PRIMARY KEY(`system$changehashid`,`system$sessionid`),
	CONSTRAINT `uniq_system$changehash_session_system$changehashid` UNIQUE (`system$changehashid`));

CREATE INDEX `idx_system$changehash_session_system$session_system$changehash` ON `system$changehash_session` (`system$sessionid` ASC,`system$changehashid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('1aa853ae-4871-4f54-9716-af1e36b6b031', 'System.ChangeHash_Session', 'system$changehash_session', '24f72d72-3c66-46e4-a08b-09daf0f451d8', '37f9fd49-5318-4c63-9a51-f761779b202f', 'system$changehashid', 'system$sessionid', 'idx_system$changehash_session_system$session_system$changehash');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$changehash_session_system$changehashid', '1aa853ae-4871-4f54-9716-af1e36b6b031', 'e4d85c0c-652d-3e54-859c-3b0f1db86277');

CREATE TABLE `system$workflowdefinition` (
	`id` BIGINT NOT NULL,
	`name` NVARCHAR(200) NULL,
	`title` NVARCHAR(200) NULL,
	`isobsolete` BOOL NULL,
	`islocked` BOOL NULL,
	`modelguid` NVARCHAR(36) NULL,
	PRIMARY KEY(`id`),
	CONSTRAINT `uniq_system$workflowdefinition_modelguid` UNIQUE (`modelguid`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('5c570d3b-7b31-44fe-abd6-269a234584c5', 'System.WorkflowDefinition', 'system$workflowdefinition', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('d16c4272-c9d3-4371-86f6-69eb263033e1', '5c570d3b-7b31-44fe-abd6-269a234584c5', 'Name', 'name', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('e023e8ca-3319-4698-a841-30430fdca099', '5c570d3b-7b31-44fe-abd6-269a234584c5', 'Title', 'title', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('8554021f-9842-4c51-b124-86a102d33da7', '5c570d3b-7b31-44fe-abd6-269a234584c5', 'IsObsolete', 'isobsolete', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('5544e32c-48e4-4580-bac2-ed8a14f1e098', '5c570d3b-7b31-44fe-abd6-269a234584c5', 'IsLocked', 'islocked', 10, 0, 'false', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('d61ef304-2773-4336-a146-8997dfccae8a', '5c570d3b-7b31-44fe-abd6-269a234584c5', 'ModelGUID', 'modelguid', 30, 36, '', FALSE);

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$workflowdefinition_modelguid', '5c570d3b-7b31-44fe-abd6-269a234584c5', 'd61ef304-2773-4336-a146-8997dfccae8a');

CREATE TABLE `system$workflowdefinition_currentworkflowversion` (
	`system$workflowdefinitionid` BIGINT NOT NULL,
	`system$workflowversionid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowdefinitionid`,`system$workflowversionid`),
	CONSTRAINT `uniq_syste$workflowdefini_currentworkflowv_syste$workflowdefinit` UNIQUE (`system$workflowdefinitionid`));

CREATE INDEX `idx_system$workflowdefinition_currentworkflowversion` ON `system$workflowdefinition_currentworkflowversion` (`system$workflowversionid` ASC,`system$workflowdefinitionid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('2b065cdd-3d2c-4517-9727-ced57d97fd03', 'System.WorkflowDefinition_CurrentWorkflowVersion', 'system$workflowdefinition_currentworkflowversion', '5c570d3b-7b31-44fe-abd6-269a234584c5', '30834a21-e81c-4cbf-a10b-5f60f5fddc82', 'system$workflowdefinitionid', 'system$workflowversionid', 'idx_system$workflowdefinition_currentworkflowversion');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_syste$workflowdefini_currentworkflowv_syste$workflowdefinit', '2b065cdd-3d2c-4517-9727-ced57d97fd03', 'eb384fa0-c9cd-3568-bdd6-1501cb6e352e');

CREATE TABLE `system$timezone` (
	`id` BIGINT NOT NULL,
	`code` NVARCHAR(50) NULL,
	`description` NVARCHAR(100) NULL,
	`rawoffset` INT NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('7f7c72af-1ab7-4bf9-bed6-16db5c8fcf6f', 'System.TimeZone', 'system$timezone', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('6abafab4-6a96-46c0-9475-b72cc4d3ffd6', '7f7c72af-1ab7-4bf9-bed6-16db5c8fcf6f', 'Code', 'code', 30, 50, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('954c43f0-3333-4264-813b-e8f1c8f2f0b6', '7f7c72af-1ab7-4bf9-bed6-16db5c8fcf6f', 'Description', 'description', 30, 100, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('1060f919-60c9-4f90-91ee-81b4bf584bcd', '7f7c72af-1ab7-4bf9-bed6-16db5c8fcf6f', 'RawOffset', 'rawoffset', 3, 0, '', FALSE);

CREATE TABLE `system$userrole` (
	`id` BIGINT NOT NULL,
	`modelguid` NVARCHAR(36) NULL,
	`name` NVARCHAR(100) NULL,
	`description` NVARCHAR(1000) NULL,
	PRIMARY KEY(`id`));

CREATE INDEX `idx_system$userrole_name_asc` ON `system$userrole` (`name` ASC,`id` ASC);

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('92ef30a6-de04-423c-84fd-a21e9b9eeae2', 'System.UserRole', 'system$userrole', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('3cb7dc95-eac8-4999-8af4-492a4f2c0d73', '92ef30a6-de04-423c-84fd-a21e9b9eeae2', 'ModelGUID', 'modelguid', 30, 36, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('3a3aca86-2f34-4038-a62f-7c0654ce21b7', '92ef30a6-de04-423c-84fd-a21e9b9eeae2', 'Name', 'name', 30, 100, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('a33fbc53-ecf5-46c5-bad2-a364686e19dc', '92ef30a6-de04-423c-84fd-a21e9b9eeae2', 'Description', 'description', 30, 1000, '', FALSE);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('a46808f5-f89a-41eb-81e2-217968eac118', '92ef30a6-de04-423c-84fd-a21e9b9eeae2', 'idx_system$userrole_name_asc');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('a46808f5-f89a-41eb-81e2-217968eac118', '3a3aca86-2f34-4038-a62f-7c0654ce21b7', FALSE, 0);

CREATE TABLE `system$grantableroles` (
	`system$userroleid1` BIGINT NOT NULL,
	`system$userroleid2` BIGINT NOT NULL,
	PRIMARY KEY(`system$userroleid1`,`system$userroleid2`));

CREATE INDEX `idx_system$grantableroles_system$userrole_system$userrole` ON `system$grantableroles` (`system$userroleid2` ASC,`system$userroleid1` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('1adca745-c7a9-44ff-92bb-5d41cb2a1743', 'System.grantableRoles', 'system$grantableroles', '92ef30a6-de04-423c-84fd-a21e9b9eeae2', '92ef30a6-de04-423c-84fd-a21e9b9eeae2', 'system$userroleid1', 'system$userroleid2', 'idx_system$grantableroles_system$userrole_system$userrole');

CREATE TABLE `administration$account` (
	`id` BIGINT NOT NULL,
	`fullname` NVARCHAR(200) NULL,
	`email` NVARCHAR(200) NULL,
	`islocaluser` BOOL NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `superentity_id`, `remote`, `remote_primary_key`) VALUES ('c921ccbb-a670-48d9-833d-6a76c1406917', 'Administration.Account', 'administration$account', '282e2e60-88a5-469d-84a5-ba8d9151644f', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('57b3cac6-4999-4794-b4d9-682943024c60', 'c921ccbb-a670-48d9-833d-6a76c1406917', 'FullName', 'fullname', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('4d882b45-41be-4012-a44e-54a08c290413', 'c921ccbb-a670-48d9-833d-6a76c1406917', 'Email', 'email', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('40f47cfd-60b5-4db3-bc4a-f63d5fdf2564', 'c921ccbb-a670-48d9-833d-6a76c1406917', 'IsLocalUser', 'islocaluser', 10, 0, 'true', FALSE);

CREATE TABLE `system$offlinesynchronizationhistory` (
	`id` BIGINT NOT NULL,
	`syncid` NVARCHAR(200) NULL,
	`createddate` DATETIME NULL,
	PRIMARY KEY(`id`),
	CONSTRAINT `uniq_system$offlinesynchronizationhistory_syncid` UNIQUE (`syncid`));

CREATE INDEX `idx_system$offlinesynchronizationhistory_syncid_asc` ON `system$offlinesynchronizationhistory` (`syncid` ASC,`id` ASC);

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('137064d4-4cf1-4a0b-92a5-a11b66360ff9', 'System.OfflineSynchronizationHistory', 'system$offlinesynchronizationhistory', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('a91934fd-65f2-404e-bff8-7b370c20d687', '137064d4-4cf1-4a0b-92a5-a11b66360ff9', 'SyncId', 'syncid', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('fa5f48d5-d89f-3022-bdab-059cfc5b12ec', '137064d4-4cf1-4a0b-92a5-a11b66360ff9', 'createdDate', 'createddate', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('7a35f5fa-69a5-42e6-842d-c5bf65735a0f', '137064d4-4cf1-4a0b-92a5-a11b66360ff9', 'idx_system$offlinesynchronizationhistory_syncid_asc');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('7a35f5fa-69a5-42e6-842d-c5bf65735a0f', 'a91934fd-65f2-404e-bff8-7b370c20d687', FALSE, 0);

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$offlinesynchronizationhistory_syncid', '137064d4-4cf1-4a0b-92a5-a11b66360ff9', 'a91934fd-65f2-404e-bff8-7b370c20d687');

CREATE TABLE `system$databrokerentitymetadata` (
	`id` BIGINT NOT NULL,
	`entityid` NVARCHAR(36) NULL,
	`memberdetails` LONGTEXT CHARSET utf8 NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('df86cd1e-f9ac-42d4-bcd0-a185540a247a', 'System.DataBrokerEntityMetadata', 'system$databrokerentitymetadata', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('9898404a-0a0e-48c5-b223-49323db632b5', 'df86cd1e-f9ac-42d4-bcd0-a185540a247a', 'EntityId', 'entityid', 30, 36, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('0a53921a-933e-4272-99a3-d86715840c82', 'df86cd1e-f9ac-42d4-bcd0-a185540a247a', 'MemberDetails', 'memberdetails', 30, 0, '', FALSE);

CREATE TABLE `system$workflowactivityusertaskoutcome` (
	`id` BIGINT NOT NULL,
	`outcome` NVARCHAR(200) NULL,
	`time` DATETIME NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('1ebda4ad-6e00-4b19-8b95-6b6261beb937', 'System.WorkflowActivityUserTaskOutcome', 'system$workflowactivityusertaskoutcome', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('f854eb95-236e-4c3f-af60-0d72c0cbf27b', '1ebda4ad-6e00-4b19-8b95-6b6261beb937', 'Outcome', 'outcome', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('9c9b1db9-e8ff-4192-b11d-4127162aa51a', '1ebda4ad-6e00-4b19-8b95-6b6261beb937', 'Time', 'time', 20, 0, '', FALSE);

CREATE TABLE `system$workflowactivityusertaskoutcome_workflowactivity` (
	`system$workflowactivityusertaskoutcomeid` BIGINT NOT NULL,
	`system$workflowactivityid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowactivityusertaskoutcomeid`,`system$workflowactivityid`),
	CONSTRAINT `uniq_syst$workflowactivityus_workflowac_syst$workflowactivityuse` UNIQUE (`system$workflowactivityusertaskoutcomeid`));

CREATE INDEX `idx_system$workflowactivityusertaskoutcome_workflowactivity` ON `system$workflowactivityusertaskoutcome_workflowactivity` (`system$workflowactivityid` ASC,`system$workflowactivityusertaskoutcomeid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('9ce50251-ec5a-46d0-ba7e-cb91876078f0', 'System.WorkflowActivityUserTaskOutcome_WorkflowActivity', 'system$workflowactivityusertaskoutcome_workflowactivity', '1ebda4ad-6e00-4b19-8b95-6b6261beb937', 'a5952592-bb2c-4798-9805-f9ff91ad97de', 'system$workflowactivityusertaskoutcomeid', 'system$workflowactivityid', 'idx_system$workflowactivityusertaskoutcome_workflowactivity');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_syst$workflowactivityus_workflowac_syst$workflowactivityuse', '9ce50251-ec5a-46d0-ba7e-cb91876078f0', 'ced1f439-bb5d-34eb-9344-68a02c7877e7');

CREATE TABLE `system$workflowactivityusertaskoutcome_user` (
	`system$workflowactivityusertaskoutcomeid` BIGINT NOT NULL,
	`system$userid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowactivityusertaskoutcomeid`,`system$userid`),
	CONSTRAINT `uniq_syst$workflowactivityusert_use_syste$workflowactivityuserta` UNIQUE (`system$workflowactivityusertaskoutcomeid`));

CREATE INDEX `idx_system$workflowactivityusertaskoutcome_user` ON `system$workflowactivityusertaskoutcome_user` (`system$userid` ASC,`system$workflowactivityusertaskoutcomeid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('69f85619-f30b-427c-adb1-7be7ce8cc3dd', 'System.WorkflowActivityUserTaskOutcome_User', 'system$workflowactivityusertaskoutcome_user', '1ebda4ad-6e00-4b19-8b95-6b6261beb937', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'system$workflowactivityusertaskoutcomeid', 'system$userid', 'idx_system$workflowactivityusertaskoutcome_user');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_syst$workflowactivityusert_use_syste$workflowactivityuserta', '69f85619-f30b-427c-adb1-7be7ce8cc3dd', '0e354480-b4c1-3655-9f12-e34dc1488c2f');

CREATE TABLE `system$privatefiledocument` (
	`id` BIGINT NOT NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `superentity_id`, `remote`, `remote_primary_key`) VALUES ('3b6f5ca3-28d6-4581-b26e-7ce5bd0e6eeb', 'System.PrivateFileDocument', 'system$privatefiledocument', '170ce49d-f29c-4fac-99a6-b55e8a3aeb39', FALSE, FALSE);

CREATE TABLE `myfirstmodule$a01234567890123456789` (
	`id` BIGINT NOT NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('1441614a-114d-4477-a5ff-5e7df576c695', 'MyFirstModule.A01234567890123456789', 'myfirstmodule$a01234567890123456789', FALSE, FALSE);

CREATE TABLE `myfirstmodule$a01234567890123456789_b01234567890123456789` (
	`myfirstmodule$a01234567890123456789id` BIGINT NOT NULL,
	`myfirstmodule$b01234567890123456789id` BIGINT NOT NULL,
	PRIMARY KEY(`myfirstmodule$a01234567890123456789id`,`myfirstmodule$b01234567890123456789id`),
	CONSTRAINT `uniq_myfirstm$a012345678901_b012345678901_myfirstm$b012345678901` UNIQUE (`myfirstmodule$b01234567890123456789id`),
	CONSTRAINT `uniq_myfirstm$a012345678901_b012345678901_myfirstm$a012345678901` UNIQUE (`myfirstmodule$a01234567890123456789id`));

CREATE INDEX `idx_myfirstmodule$a01234567890123456789_b01234567890123456789` ON `myfirstmodule$a01234567890123456789_b01234567890123456789` (`myfirstmodule$b01234567890123456789id` ASC,`myfirstmodule$a01234567890123456789id` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('e9ce5218-b157-4208-811a-f19b7c324eb2', 'MyFirstModule.A01234567890123456789_B01234567890123456789', 'myfirstmodule$a01234567890123456789_b01234567890123456789', '1441614a-114d-4477-a5ff-5e7df576c695', '36aa7085-3102-4c53-9136-9804814999c8', 'myfirstmodule$a01234567890123456789id', 'myfirstmodule$b01234567890123456789id', 'idx_myfirstmodule$a01234567890123456789_b01234567890123456789');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_myfirstm$a012345678901_b012345678901_myfirstm$b012345678901', 'e9ce5218-b157-4208-811a-f19b7c324eb2', 'dbf56905-dc88-3385-81db-66502e8ac5a0');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_myfirstm$a012345678901_b012345678901_myfirstm$a012345678901', 'e9ce5218-b157-4208-811a-f19b7c324eb2', 'da807523-73ba-331b-b0d4-372196ade553');

CREATE TABLE `system$userreportinfo` (
	`id` BIGINT NOT NULL,
	`usertype` NVARCHAR(8) NULL,
	`hash` NVARCHAR(64) NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('1c90a770-98ef-45df-9267-b87973cc6581', 'System.UserReportInfo', 'system$userreportinfo', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('d6f4a7fc-3c2d-4793-bfc0-8dde42937863', '1c90a770-98ef-45df-9267-b87973cc6581', 'UserType', 'usertype', 40, 8, 'Internal', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('e959c75a-c655-45d8-8b7d-a4335dcbf581', '1c90a770-98ef-45df-9267-b87973cc6581', 'Hash', 'hash', 30, 64, '', FALSE);

CREATE TABLE `system$userreportinfo_user` (
	`system$userreportinfoid` BIGINT NOT NULL,
	`system$userid` BIGINT NOT NULL,
	PRIMARY KEY(`system$userreportinfoid`,`system$userid`),
	CONSTRAINT `uniq_system$userreportinfo_user_system$userreportinfoid` UNIQUE (`system$userreportinfoid`));

CREATE INDEX `idx_system$userreportinfo_user_system$user_system$userreportinfo` ON `system$userreportinfo_user` (`system$userid` ASC,`system$userreportinfoid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('d88b344c-b1e5-4759-b60e-0348e63ac445', 'System.UserReportInfo_User', 'system$userreportinfo_user', '1c90a770-98ef-45df-9267-b87973cc6581', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'system$userreportinfoid', 'system$userid', 'idx_system$userreportinfo_user_system$user_system$userreportinfo');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$userreportinfo_user_system$userreportinfoid', 'd88b344c-b1e5-4759-b60e-0348e63ac445', '677bda5e-706d-3d41-b007-247640ca3be1');

CREATE TABLE `system$offlinecreatedguids` (
	`id` BIGINT NOT NULL,
	`guid` NVARCHAR(200) NULL,
	`createddate` DATETIME NULL,
	PRIMARY KEY(`id`),
	CONSTRAINT `uniq_system$offlinecreatedguids_guid` UNIQUE (`guid`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('89cea6a8-a2df-4925-85e4-2b0c447e98c3', 'System.OfflineCreatedGuids', 'system$offlinecreatedguids', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('7919a281-0b72-4dc4-87e1-fffaced4c8d1', '89cea6a8-a2df-4925-85e4-2b0c447e98c3', 'Guid', 'guid', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('22289399-6f82-3eda-bbdf-15ddacf9f408', '89cea6a8-a2df-4925-85e4-2b0c447e98c3', 'createdDate', 'createddate', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$offlinecreatedguids_guid', '89cea6a8-a2df-4925-85e4-2b0c447e98c3', '7919a281-0b72-4dc4-87e1-fffaced4c8d1');

CREATE TABLE `myfirstmodule$b01234567890123456789` (
	`id` BIGINT NOT NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('36aa7085-3102-4c53-9136-9804814999c8', 'MyFirstModule.B01234567890123456789', 'myfirstmodule$b01234567890123456789', FALSE, FALSE);

CREATE TABLE `system$processedqueuetask` (
	`id` BIGINT NOT NULL,
	`sequence` BIGINT NULL,
	`status` NVARCHAR(12) NULL,
	`queueid` NVARCHAR(36) NULL,
	`queuename` NVARCHAR(200) NULL,
	`contexttype` NVARCHAR(14) NULL,
	`contextdata` LONGTEXT CHARSET utf8 NULL,
	`microflowname` NVARCHAR(200) NULL,
	`useractionname` NVARCHAR(200) NULL,
	`arguments` LONGTEXT CHARSET utf8 NULL,
	`xasid` NVARCHAR(50) NULL,
	`threadid` BIGINT NULL,
	`created` DATETIME NULL,
	`startat` DATETIME NULL,
	`started` DATETIME NULL,
	`finished` DATETIME NULL,
	`duration` BIGINT NULL,
	`retried` BIGINT NULL,
	`errormessage` LONGTEXT CHARSET utf8 NULL,
	`scheduledeventname` NVARCHAR(200) NULL,
	`system$owner` BIGINT NULL,
	PRIMARY KEY(`id`));

CREATE INDEX `idx_system$processedqueuetask_system$owner` ON `system$processedqueuetask` (`system$owner` ASC,`id` ASC);

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'System.ProcessedQueueTask', 'system$processedqueuetask', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('a1c19d5b-0798-452a-b8d9-4f60e684cc1b', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'Sequence', 'sequence', 4, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('6609f51d-d19f-49df-92d8-582e78e55ba0', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'Status', 'status', 40, 12, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('6c8ea01f-faf8-40dd-8b81-297fbe14cda4', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'QueueId', 'queueid', 30, 36, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('354f1eb1-13a0-4bc4-8fdf-0faad10e2b81', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'QueueName', 'queuename', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('8e8e6dfa-87a2-413a-89c1-a2b23037b792', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'ContextType', 'contexttype', 40, 14, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('7cbcf835-1193-4d91-84f5-40bde9ddb9e4', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'ContextData', 'contextdata', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('2fc91d80-70d3-4868-9332-142b1f447888', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'MicroflowName', 'microflowname', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('c891eb17-76d6-4600-a96f-b02ef10aa921', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'UserActionName', 'useractionname', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('e6f7a526-84ed-4f4e-8d32-d49d79dd5174', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'Arguments', 'arguments', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('e7792091-da19-4946-a07d-b11f857c4d1d', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'XASId', 'xasid', 30, 50, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('09951e9a-b362-499d-bf7c-68300a314110', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'ThreadId', 'threadid', 4, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('6c24f3a3-6473-4a2b-8a93-fca27764f394', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'Created', 'created', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('2b58adc9-b35a-4803-912d-e376a3ad89c9', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'StartAt', 'startat', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('3023edea-95d3-4a8b-84e3-32a749729400', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'Started', 'started', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('f4f115ad-2bb9-4452-9bfb-f666afdebbb4', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'Finished', 'finished', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('6dab51ec-3ecc-43ac-a8d1-ba6815ad0fd7', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'Duration', 'duration', 4, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('7627493b-b7d4-4afa-99e7-5957889ed081', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'Retried', 'retried', 4, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('73d41075-6c63-4c64-92e3-ce264ddabe59', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'ErrorMessage', 'errormessage', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('526fe440-6d73-4c41-8f72-e5b5b4f2641e', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'ScheduledEventName', 'scheduledeventname', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$index` (`id`, `table_id`, `index_name`) VALUES ('a28ff41f-1610-3353-9957-9e8d776b805e', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', 'idx_system$processedqueuetask_system$owner');

INSERT INTO `mendixsystem$index_column` (`index_id`, `column_id`, `sort_order`, `ordinal`) VALUES ('a28ff41f-1610-3353-9957-9e8d776b805e', '2a2739dd-9160-3616-8999-a7a147bf4cda', FALSE, 0);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`) VALUES ('2a2739dd-9160-3616-8999-a7a147bf4cda', 'System.owner', 'system$owner', 'eb5c32a1-85ec-49d1-8bca-ecca779cd539', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'id', 'system$owner');

CREATE TABLE `system$tokeninformation` (
	`id` BIGINT NOT NULL,
	`token` NVARCHAR(200) NULL,
	`expirydate` DATETIME NULL,
	`useragent` LONGTEXT CHARSET utf8 NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('09b2f0fe-4a11-4afc-a16e-94992a3ebc3d', 'System.TokenInformation', 'system$tokeninformation', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('a169a8d1-b10f-427b-b492-3aebeabb7cd6', '09b2f0fe-4a11-4afc-a16e-94992a3ebc3d', 'Token', 'token', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('8bb77a0c-0461-43f9-bb27-e91fb9e3623f', '09b2f0fe-4a11-4afc-a16e-94992a3ebc3d', 'ExpiryDate', 'expirydate', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('0b9398e4-9bb7-4ab8-958c-43526f2c83bf', '09b2f0fe-4a11-4afc-a16e-94992a3ebc3d', 'UserAgent', 'useragent', 30, 0, '', FALSE);

CREATE TABLE `system$tokeninformation_user` (
	`system$tokeninformationid` BIGINT NOT NULL,
	`system$userid` BIGINT NOT NULL,
	PRIMARY KEY(`system$tokeninformationid`,`system$userid`),
	CONSTRAINT `uniq_system$tokeninformation_user_system$tokeninformationid` UNIQUE (`system$tokeninformationid`));

CREATE INDEX `idx_system$tokeninformation_user` ON `system$tokeninformation_user` (`system$userid` ASC,`system$tokeninformationid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('20ca86b2-5a00-4131-aee1-427cb2e94425', 'System.TokenInformation_User', 'system$tokeninformation_user', '09b2f0fe-4a11-4afc-a16e-94992a3ebc3d', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'system$tokeninformationid', 'system$userid', 'idx_system$tokeninformation_user');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$tokeninformation_user_system$tokeninformationid', '20ca86b2-5a00-4131-aee1-427cb2e94425', '4abdbc47-924f-3c57-9257-190d5521d13e');

CREATE TABLE `system$language` (
	`id` BIGINT NOT NULL,
	`code` NVARCHAR(20) NULL,
	`description` NVARCHAR(200) NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('76805df3-dede-435f-92a6-d6525c68a693', 'System.Language', 'system$language', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('88390044-5b74-4e71-8b88-a6e4e91f6f2e', '76805df3-dede-435f-92a6-d6525c68a693', 'Code', 'code', 30, 20, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('d879cb38-5630-4fdf-9e39-f03da0aa8ede', '76805df3-dede-435f-92a6-d6525c68a693', 'Description', 'description', 30, 200, '', FALSE);

CREATE TABLE `system$workflowusertaskoutcome` (
	`id` BIGINT NOT NULL,
	`outcome` NVARCHAR(200) NULL,
	`time` DATETIME NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('d753ad05-63c3-4d18-9424-1dd97c7d1a05', 'System.WorkflowUserTaskOutcome', 'system$workflowusertaskoutcome', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('1c43b5b0-f645-4bc1-83fe-2da08ef1eba4', 'd753ad05-63c3-4d18-9424-1dd97c7d1a05', 'Outcome', 'outcome', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('2b63667d-dda0-4033-b432-679f51187ebb', 'd753ad05-63c3-4d18-9424-1dd97c7d1a05', 'Time', 'time', 20, 0, '', FALSE);

CREATE TABLE `system$workflowusertaskoutcome_user` (
	`system$workflowusertaskoutcomeid` BIGINT NOT NULL,
	`system$userid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowusertaskoutcomeid`,`system$userid`),
	CONSTRAINT `uniq_syste$workflowusertaskout_user_system$workflowusertaskoutco` UNIQUE (`system$workflowusertaskoutcomeid`));

CREATE INDEX `idx_system$workflowusertaskoutcome_user` ON `system$workflowusertaskoutcome_user` (`system$userid` ASC,`system$workflowusertaskoutcomeid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('d49ae7eb-5886-4a82-8659-be0b01d13104', 'System.WorkflowUserTaskOutcome_User', 'system$workflowusertaskoutcome_user', 'd753ad05-63c3-4d18-9424-1dd97c7d1a05', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'system$workflowusertaskoutcomeid', 'system$userid', 'idx_system$workflowusertaskoutcome_user');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_syste$workflowusertaskout_user_system$workflowusertaskoutco', 'd49ae7eb-5886-4a82-8659-be0b01d13104', '1416fe96-0847-37c7-8af0-e159dca1b3c7');

CREATE TABLE `system$workflowusertaskoutcome_workflowusertask` (
	`system$workflowusertaskoutcomeid` BIGINT NOT NULL,
	`system$workflowusertaskid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowusertaskoutcomeid`,`system$workflowusertaskid`),
	CONSTRAINT `uniq_syste$workflowusertask_workflowuse_syste$workflowusertaskou` UNIQUE (`system$workflowusertaskoutcomeid`));

CREATE INDEX `idx_system$workflowusertaskoutcome_workflowusertask` ON `system$workflowusertaskoutcome_workflowusertask` (`system$workflowusertaskid` ASC,`system$workflowusertaskoutcomeid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('37818a79-121d-447e-aa9d-89e88b145180', 'System.WorkflowUserTaskOutcome_WorkflowUserTask', 'system$workflowusertaskoutcome_workflowusertask', 'd753ad05-63c3-4d18-9424-1dd97c7d1a05', '3729d27c-735b-457a-b210-9dffb125c3f3', 'system$workflowusertaskoutcomeid', 'system$workflowusertaskid', 'idx_system$workflowusertaskoutcome_workflowusertask');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_syste$workflowusertask_workflowuse_syste$workflowusertaskou', '37818a79-121d-447e-aa9d-89e88b145180', '350d214b-6b9c-3c5d-a6d2-3483fecc59d8');

CREATE TABLE `system$workflowusertask` (
	`id` BIGINT NOT NULL,
	`name` LONGTEXT CHARSET utf8 NULL,
	`description` LONGTEXT CHARSET utf8 NULL,
	`starttime` DATETIME NULL,
	`duedate` DATETIME NULL,
	`endtime` DATETIME NULL,
	`outcome` NVARCHAR(200) NULL,
	`state` NVARCHAR(10) NULL,
	`completiontype` NVARCHAR(9) NULL,
	`processingstate` NVARCHAR(30) NULL,
	`error` LONGTEXT CHARSET utf8 NULL,
	PRIMARY KEY(`id`));

INSERT INTO `mendixsystem$entity` (`id`, `entity_name`, `table_name`, `remote`, `remote_primary_key`) VALUES ('3729d27c-735b-457a-b210-9dffb125c3f3', 'System.WorkflowUserTask', 'system$workflowusertask', FALSE, FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('122c4e1e-edda-4311-85b7-2a715626b869', '3729d27c-735b-457a-b210-9dffb125c3f3', 'Name', 'name', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('544b4b9a-c5ac-4785-8efb-647a51648024', '3729d27c-735b-457a-b210-9dffb125c3f3', 'Description', 'description', 30, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('beeda34a-8cd1-4bbe-abd3-b18a3a0ea0ef', '3729d27c-735b-457a-b210-9dffb125c3f3', 'StartTime', 'starttime', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('17ae7bb0-2dea-4860-9c7b-f236aaf5a790', '3729d27c-735b-457a-b210-9dffb125c3f3', 'DueDate', 'duedate', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('49503f62-1887-4823-bf94-db88a332f316', '3729d27c-735b-457a-b210-9dffb125c3f3', 'EndTime', 'endtime', 20, 0, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('047e7010-cbc4-4bba-bf64-774fa656d010', '3729d27c-735b-457a-b210-9dffb125c3f3', 'Outcome', 'outcome', 30, 200, '', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('f87a5a98-730e-4c57-b6c4-ae09cd057e65', '3729d27c-735b-457a-b210-9dffb125c3f3', 'State', 'state', 40, 10, 'Created', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('7d72fc37-c5cd-425d-82d2-0b8559b28314', '3729d27c-735b-457a-b210-9dffb125c3f3', 'CompletionType', 'completiontype', 40, 9, 'Single', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('99f67785-67f1-40e0-91dc-6cdec5e2b3e5', '3729d27c-735b-457a-b210-9dffb125c3f3', 'ProcessingState', 'processingstate', 30, 30, 'Ready', FALSE);

INSERT INTO `mendixsystem$attribute` (`id`, `entity_id`, `attribute_name`, `column_name`, `type`, `length`, `default_value`, `is_auto_number`) VALUES ('90233d09-6c96-487e-a89e-a31f29b81bd1', '3729d27c-735b-457a-b210-9dffb125c3f3', 'Error', 'error', 30, 0, '', FALSE);

CREATE TABLE `system$workflowusertask_workflowusertaskdefinition` (
	`system$workflowusertaskid` BIGINT NOT NULL,
	`system$workflowusertaskdefinitionid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowusertaskid`,`system$workflowusertaskdefinitionid`),
	CONSTRAINT `uniq_syste$workflowusert_workflowusertaskdef_syste$workflowusert` UNIQUE (`system$workflowusertaskid`));

CREATE INDEX `idx_system$workflowusertask_workflowusertaskdefinition` ON `system$workflowusertask_workflowusertaskdefinition` (`system$workflowusertaskdefinitionid` ASC,`system$workflowusertaskid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('0169cc0e-491b-4ee3-812d-6bf3ba28e287', 'System.WorkflowUserTask_WorkflowUserTaskDefinition', 'system$workflowusertask_workflowusertaskdefinition', '3729d27c-735b-457a-b210-9dffb125c3f3', 'e09e866f-288b-475c-9465-792cde8b878c', 'system$workflowusertaskid', 'system$workflowusertaskdefinitionid', 'idx_system$workflowusertask_workflowusertaskdefinition');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_syste$workflowusert_workflowusertaskdef_syste$workflowusert', '0169cc0e-491b-4ee3-812d-6bf3ba28e287', '0643c851-59f7-3428-92a1-a970ad21ad18');

CREATE TABLE `system$workflowusertask_workflow` (
	`system$workflowusertaskid` BIGINT NOT NULL,
	`system$workflowid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowusertaskid`,`system$workflowid`),
	CONSTRAINT `uniq_system$workflowusertask_workflow_system$workflowusertaskid` UNIQUE (`system$workflowusertaskid`));

CREATE INDEX `idx_system$workflowusertask_workflow` ON `system$workflowusertask_workflow` (`system$workflowid` ASC,`system$workflowusertaskid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('53a1c6d7-5e4d-4a2d-81ec-58fde4bbba8a', 'System.WorkflowUserTask_Workflow', 'system$workflowusertask_workflow', '3729d27c-735b-457a-b210-9dffb125c3f3', '2ae37bf5-ecb8-4c55-b967-d7383925b208', 'system$workflowusertaskid', 'system$workflowid', 'idx_system$workflowusertask_workflow');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$workflowusertask_workflow_system$workflowusertaskid', '53a1c6d7-5e4d-4a2d-81ec-58fde4bbba8a', 'bb1eaa2c-e600-3a88-85d0-08d5f5ca94da');

CREATE TABLE `system$workflowusertask_assignee` (
	`system$workflowusertaskid` BIGINT NOT NULL,
	`system$userid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowusertaskid`,`system$userid`),
	CONSTRAINT `uniq_system$workflowusertask_assignee_system$workflowusertaskid` UNIQUE (`system$workflowusertaskid`));

CREATE INDEX `idx_system$workflowusertask_assignee` ON `system$workflowusertask_assignee` (`system$userid` ASC,`system$workflowusertaskid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('929fbbed-d3a8-4ea2-b6ad-b28de4f77776', 'System.WorkflowUserTask_Assignee', 'system$workflowusertask_assignee', '3729d27c-735b-457a-b210-9dffb125c3f3', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'system$workflowusertaskid', 'system$userid', 'idx_system$workflowusertask_assignee');

INSERT INTO `mendixsystem$unique_constraint` (`name`, `table_id`, `column_id`) VALUES ('uniq_system$workflowusertask_assignee_system$workflowusertaskid', '929fbbed-d3a8-4ea2-b6ad-b28de4f77776', 'ed895e88-8fb4-3df0-b86f-faab883d19ec');

CREATE TABLE `system$workflowusertask_targetusers` (
	`system$workflowusertaskid` BIGINT NOT NULL,
	`system$userid` BIGINT NOT NULL,
	PRIMARY KEY(`system$workflowusertaskid`,`system$userid`));

CREATE INDEX `idx_system$workflowusertask_targetusers` ON `system$workflowusertask_targetusers` (`system$userid` ASC,`system$workflowusertaskid` ASC);

INSERT INTO `mendixsystem$association` (`id`, `association_name`, `table_name`, `parent_entity_id`, `child_entity_id`, `parent_column_name`, `child_column_name`, `index_name`) VALUES ('2b9c1990-302f-474c-9341-9d5d23b27653', 'System.WorkflowUserTask_TargetUsers', 'system$workflowusertask_targetusers', '3729d27c-735b-457a-b210-9dffb125c3f3', '282e2e60-88a5-469d-84a5-ba8d9151644f', 'system$workflowusertaskid', 'system$userid', 'idx_system$workflowusertask_targetusers');

INSERT INTO `mendixsystem$version` (`versionnumber`, `lastsyncdate`, `preanalysismigrationversionnumber`) VALUES ('4.2', '20240924 14:16:05', '4.1.0');
