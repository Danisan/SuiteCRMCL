-- MySQL dump 10.13  Distrib 5.1.67, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: crm_bmya_cl3
-- ------------------------------------------------------
-- Server version	5.1.67-0ubuntu0.10.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_audit`
--

DROP TABLE IF EXISTS `accounts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_audit`
--

LOCK TABLES `accounts_audit` WRITE;
/*!40000 ALTER TABLE `accounts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_bugs`
--

DROP TABLE IF EXISTS `accounts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_bugs`
--

LOCK TABLES `accounts_bugs` WRITE;
/*!40000 ALTER TABLE `accounts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_cases`
--

DROP TABLE IF EXISTS `accounts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_cases`
--

LOCK TABLES `accounts_cases` WRITE;
/*!40000 ALTER TABLE `accounts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_contacts`
--

DROP TABLE IF EXISTS `accounts_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_contacts`
--

LOCK TABLES `accounts_contacts` WRITE;
/*!40000 ALTER TABLE `accounts_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_opportunities`
--

DROP TABLE IF EXISTS `accounts_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_opportunities`
--

LOCK TABLES `accounts_opportunities` WRITE;
/*!40000 ALTER TABLE `accounts_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_actions`
--

DROP TABLE IF EXISTS `acl_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_actions`
--

LOCK TABLES `acl_actions` WRITE;
/*!40000 ALTER TABLE `acl_actions` DISABLE KEYS */;
INSERT INTO `acl_actions` VALUES ('8e9324b8-ca48-b52c-b36b-52a66b57bdf6','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Leads','module',89,0),('8f7f3e07-8f4b-813f-fd09-52a66bdc0c93','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Leads','module',90,0),('902334d2-b5f1-1f29-a8cd-52a66b0a7554','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Leads','module',90,0),('90eb1286-a251-3d0a-016f-52a66b918e0c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Leads','module',90,0),('916ff137-b607-0918-7a8c-52a66b720644','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Leads','module',90,0),('91f5a0ed-00ac-10e8-aefd-52a66b0e6257','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Leads','module',90,0),('928bbce4-63f2-c74c-ac2c-52a66b6b6b32','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Leads','module',90,0),('932ff998-835f-eb4f-3c99-52a66bc2e70e','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Leads','module',90,0),('38e3095d-c5b3-4cec-131c-52a66b94860f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Cases','module',89,0),('42520e82-d3ad-066d-bc26-52a66b03e021','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Cases','module',90,0),('49c604d1-7f4d-ca21-47b5-52a66bb159fb','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Cases','module',90,0),('515b057c-58e0-ffc8-51bf-52a66bf54d7c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Cases','module',90,0),('58f6064c-8230-2bf7-2cc8-52a66b3c16ce','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Cases','module',90,0),('609d08bb-d824-22fd-f7a0-52a66ba176db','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Cases','module',90,0),('68290ba4-eb0b-e993-d376-52a66b1b9e1c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Cases','module',90,0),('6fae094b-c9e9-25fa-986b-52a66bcd71b2','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Cases','module',90,0),('203fb31e-cc2e-53aa-d7f7-52a66b7ddda7','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Bugs','module',89,0),('2193bd2e-c385-43f5-42b3-52a66bf0d03a','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Bugs','module',90,0),('22fae25d-cd54-5283-3e99-52a66b3a7f47','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Bugs','module',90,0),('2385db08-e5f0-981a-f374-52a66b8710ca','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Bugs','module',90,0),('24b3e142-090d-a03d-b338-52a66b8b1dda','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Bugs','module',90,0),('25253007-721a-e9b4-c4f1-52a66b5f4349','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Bugs','module',90,0),('259af08e-a47e-6132-c5ce-52a66ba7b0b7','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Bugs','module',90,0),('26b1bd20-80b7-c06d-6a43-52a66b50395e','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Bugs','module',90,0),('47bee50b-aa47-d94b-664a-52a66b2bd834','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Users','module',89,0),('48c5e66a-f50b-fac1-0ac5-52a66b052b33','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Users','module',90,0),('49ba552e-e260-bb03-e2ca-52a66b4bc646','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Users','module',90,0),('4accbe26-bc97-171a-38f5-52a66bf174e5','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Users','module',90,0),('4b943d5a-42d8-7631-6c08-52a66b54002d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Users','module',90,0),('4c3965d3-0cf3-20ee-4d2e-52a66b9e998d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Users','module',90,0),('4ce08a3d-3bf1-2146-7fbd-52a66b73549f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Users','module',90,0),('4da6b42c-0a64-f01c-9615-52a66b9dc37f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Users','module',90,0),('5f159881-9e02-cee6-7b62-52a66b942d00','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Project','module',89,0),('604119e8-726a-0a4d-03cd-52a66bf240f1','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Project','module',90,0),('611a3426-8258-cab5-26c1-52a66b7f63a0','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Project','module',90,0),('61e92821-ef7f-65a2-a90a-52a66b2cddd0','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Project','module',90,0),('62b1b9c3-ed95-c065-d731-52a66b16b76e','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Project','module',90,0),('634a7616-c176-83c3-bbd3-52a66b0458de','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Project','module',90,0),('63b93450-46d0-786c-46fc-52a66b64280e','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Project','module',90,0),('64385327-91a2-c693-9ee1-52a66be2a61d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Project','module',90,0),('6d7a0a8d-298a-eca1-f8b0-52a66b7d419b','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','ProjectTask','module',89,0),('6e133b3a-b538-e6c5-ce31-52a66b8ec803','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','ProjectTask','module',90,0),('6ea3a645-4422-7a46-7659-52a66bc20e81','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','ProjectTask','module',90,0),('6f2f1b6c-cd3b-058d-043f-52a66b048706','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','ProjectTask','module',90,0),('6fc3c0be-7e68-a0e8-0c17-52a66bf2bbbe','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','ProjectTask','module',90,0),('7042242e-563b-883d-aaaf-52a66bdcf80d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','ProjectTask','module',90,0),('70f9be28-8f5d-fe21-cc73-52a66bf173d7','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','ProjectTask','module',90,0),('718c6f20-3a6d-56d3-e9ea-52a66bd6fd20','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','ProjectTask','module',90,0),('8024466b-68cf-0697-4f22-52a66bf00229','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Campaigns','module',89,0),('80c5eb40-67fe-3b5d-c899-52a66b22acb4','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Campaigns','module',90,0),('81414705-dba9-caec-6d29-52a66b342234','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Campaigns','module',90,0),('81c09438-ad80-23b9-dc3e-52a66b69ceb6','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Campaigns','module',90,0),('823e10aa-5387-e42b-a199-52a66bbf94e3','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Campaigns','module',90,0),('82ceda39-b2e1-2b0f-79bc-52a66b66e132','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Campaigns','module',90,0),('83519e30-887e-0bcb-13a7-52a66b89ca68','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Campaigns','module',90,0),('83deeb75-36e7-e688-71af-52a66b247a25','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Campaigns','module',90,0),('91cbea11-3ed9-0d72-f81b-52a66bc11572','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','ProspectLists','module',89,0),('9272c3ba-f4af-164d-6883-52a66b1f53b3','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','ProspectLists','module',90,0),('9304c096-3491-3931-a6fd-52a66bf08b2a','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','ProspectLists','module',90,0),('938f869a-827f-89b9-99a6-52a66b3520d4','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','ProspectLists','module',90,0),('9413039b-8ba7-82c2-dfd6-52a66b1e4f80','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','ProspectLists','module',90,0),('94ad82fe-8b60-6ece-b06e-52a66b2b1d70','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','ProspectLists','module',90,0),('954bb02a-26b5-aeb3-be39-52a66bcb9aad','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','ProspectLists','module',90,0),('95f0c19d-a792-5653-4f7b-52a66b647900','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','ProspectLists','module',90,0),('a11a5d8c-f9f5-9ef3-0e1c-52a66b5760f9','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Prospects','module',89,0),('a1abb6c2-203b-7465-0bdd-52a66bc35224','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Prospects','module',90,0),('a22f76d3-f84d-130d-e818-52a66b8f0298','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Prospects','module',90,0),('a2a3fd87-2fd0-98e8-96ef-52a66be0fd93','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Prospects','module',90,0),('a369fa3b-7140-ff64-b5c9-52a66bcf3c6a','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Prospects','module',90,0),('a3fea131-22be-20b3-bc1c-52a66be09064','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Prospects','module',90,0),('a4941a1e-99b0-7491-4f9e-52a66b729309','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Prospects','module',90,0),('a52c38dc-417b-8a7f-17d4-52a66be19a6e','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Prospects','module',90,0),('ad778b26-f51f-0a5a-a5c3-52a66bb1f392','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','EmailMarketing','module',89,0),('ae6d1f53-f488-f128-0f2c-52a66bf29ec0','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','EmailMarketing','module',90,0),('af5ded08-65e7-ff6c-a982-52a66bc549cb','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','EmailMarketing','module',90,0),('b074b3bc-3063-afc6-34fc-52a66bf959da','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','EmailMarketing','module',90,0),('b152fb58-96fa-3f91-6036-52a66bac3300','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','EmailMarketing','module',90,0),('b287f7fd-322e-0fb5-a054-52a66b01c095','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','EmailMarketing','module',90,0),('b36e7b99-3966-85b8-d18a-52a66bde9e0a','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','EmailMarketing','module',90,0),('b43fec08-d692-1ec0-107b-52a66bdc70cb','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','EmailMarketing','module',90,0),('2bcb7102-af15-a1e5-dfc3-52a66b581b0b','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Contacts','module',89,0),('2c674be9-ffce-d861-5e2b-52a66b8d87bf','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Contacts','module',90,0),('2cfb6f1e-f30c-45a5-c09c-52a66bbbf30f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Contacts','module',90,0),('2d9caa10-d8b7-681d-a119-52a66b6271f9','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Contacts','module',90,0),('2e326a7f-b0e6-27d6-22ae-52a66b353b6f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Contacts','module',90,0),('2fe4b220-e801-a22c-9897-52a66b0771c8','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Contacts','module',90,0),('30ed8c44-e318-fa5a-acde-52a66bc5c8da','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Contacts','module',90,0),('31e146b4-aa67-f9d7-237e-52a66bf29830','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Contacts','module',90,0),('4f5d03d7-7ebd-0a07-1caf-52a66b71c050','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Accounts','module',89,0),('5062b072-567b-39d3-223b-52a66b4c8920','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Accounts','module',90,0),('511d6571-b278-66e2-4350-52a66bb58fc7','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Accounts','module',90,0),('520830e4-a19d-e9ab-791d-52a66b1b86d6','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Accounts','module',90,0),('529df7cb-bd93-0385-0215-52a66bdfe92c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Accounts','module',90,0),('533e4eb9-eb96-a258-64a5-52a66be74a81','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Accounts','module',90,0),('5413bab0-3602-ea63-c054-52a66b90b238','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Accounts','module',90,0),('559ac369-82f8-ad23-e21f-52a66be0fa2b','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Accounts','module',90,0),('71e23cf9-66bc-d763-dbe6-52a66b59d567','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Opportunities','module',89,0),('7327a277-c3e2-9ae4-3024-52a66b883555','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Opportunities','module',90,0),('73db7d4e-8f98-4952-158d-52a66bfb9348','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Opportunities','module',90,0),('74884050-0b8a-e6b6-0295-52a66b87f0c0','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Opportunities','module',90,0),('7576edab-a0a5-6664-270f-52a66bb53e45','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Opportunities','module',90,0),('760fac2c-74ae-da90-7864-52a66b1e6752','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Opportunities','module',90,0),('76923297-50ae-3cf6-e5fc-52a66b192a4d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Opportunities','module',90,0),('77209c42-8148-66a9-67f0-52a66b2a60bc','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Opportunities','module',90,0),('8e5666a5-8297-b52d-ff7a-52a66b6657ae','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','EmailTemplates','module',89,0),('8f5f37ff-dc86-b030-6521-52a66bd32edc','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','EmailTemplates','module',90,0),('904bcd09-5076-d17d-6b69-52a66b30085c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','EmailTemplates','module',90,0),('9171055d-8cdd-6e42-5fc1-52a66b2a58cb','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','EmailTemplates','module',90,0),('925eddc2-c5e1-7238-0bc6-52a66be98a55','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','EmailTemplates','module',90,0),('93562061-580d-4cf2-04f8-52a66bbfeabe','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','EmailTemplates','module',90,0),('94225de5-742c-082a-0421-52a66b59f706','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','EmailTemplates','module',90,0),('94b3e2ca-3697-b1b6-6dab-52a66b714f37','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','EmailTemplates','module',90,0),('a44fda95-971d-b202-b72a-52a66b64fe62','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Notes','module',89,0),('a56c4721-96e4-b43c-5bbd-52a66beb3f19','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Notes','module',90,0),('a61ccc94-22fc-bbd5-620e-52a66b95a44f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Notes','module',90,0),('a6d5f74b-3756-ed9f-7684-52a66b4bcd19','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Notes','module',90,0),('a797e8f6-9be7-bcb5-1422-52a66b3f1971','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Notes','module',90,0),('a86dcfbb-0ef4-e7e1-450c-52a66b572e36','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Notes','module',90,0),('a93d8832-82b3-4733-af7f-52a66b11a715','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Notes','module',90,0),('a9d74155-ae47-5779-4193-52a66b05ab50','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Notes','module',90,0),('b86fcee9-da37-f331-1310-52a66bff2345','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Calls','module',89,0),('b951851d-7984-e44a-e2b2-52a66bfddc4e','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Calls','module',90,0),('ba33f219-26a6-713d-ebb0-52a66bc729a3','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Calls','module',90,0),('bb1b6ff5-20e3-485b-cbf1-52a66b34adc7','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Calls','module',90,0),('bc0525f5-6e63-984b-9274-52a66b2c57be','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Calls','module',90,0),('bce91557-db71-2447-9ee2-52a66ba22f68','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Calls','module',90,0),('bdb0f203-e29c-6418-24ee-52a66b38c4f2','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Calls','module',90,0),('be9c83b7-142a-59e0-90c6-52a66b905442','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Calls','module',90,0),('d12e78f5-79d8-8343-5fb2-52a66b506c31','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Emails','module',89,0),('d21a1569-f577-3d1b-cbf3-52a66bd3bbb5','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Emails','module',90,0),('d2aea793-c14e-3242-4d86-52a66b1ae72a','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Emails','module',90,0),('d33936b9-45af-90e4-61cb-52a66b3f0e3f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Emails','module',90,0),('d3c508a9-6cd9-459f-db89-52a66bb71fe7','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Emails','module',90,0),('d4cde7ff-cf74-d925-94a8-52a66bab7564','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Emails','module',90,0),('d5504b66-7830-12f3-3133-52a66b702c35','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Emails','module',90,0),('d5cfca88-6f2c-a0d8-d81a-52a66be35a13','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Emails','module',90,0),('e2245c26-86b2-509c-8152-52a66b08319d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Meetings','module',89,0),('e34eadb9-e906-ad25-d850-52a66b7e6ac5','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Meetings','module',90,0),('e40b969e-196a-2617-c77e-52a66b2f2f84','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Meetings','module',90,0),('e55de0a9-e819-f840-3583-52a66b1014f5','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Meetings','module',90,0),('e64fc541-75f9-887d-534f-52a66b0bf29c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Meetings','module',90,0),('e6f1cde1-a712-47ac-4d13-52a66b22b3cf','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Meetings','module',90,0),('e78348c0-d46e-037e-02ae-52a66bc829c9','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Meetings','module',90,0),('e837ab2e-6c62-4c6b-fcca-52a66bfea253','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Meetings','module',90,0),('14530bbb-76ac-d23c-8a15-52a66b745901','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Tasks','module',89,0),('2aef0cb9-ac63-5106-67b5-52a66ba1f615','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Tasks','module',90,0),('40fc0d86-4418-1986-cdb8-52a66b323bce','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Tasks','module',90,0),('50000ad4-4b3b-7efd-3d04-52a66be70956','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Tasks','module',90,0),('5cd60359-c1ee-9bbd-8164-52a66b7e91b5','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Tasks','module',90,0),('73070a65-5cd2-415c-4b3a-52a66be33c44','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Tasks','module',90,0),('852d0c02-cb90-a5a1-c8df-52a66b6f17b2','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Tasks','module',90,0),('95b00518-1862-e7c3-3dd6-52a66bff266b','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Tasks','module',90,0),('6d492647-1594-ca55-451b-52a66bafdf0c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Documents','module',89,0),('6df577ec-e2a2-0a02-11e6-52a66ba86810','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Documents','module',90,0),('6e9968e7-a23c-0026-b491-52a66bd3b198','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Documents','module',90,0),('6f54bb4a-ae58-0ca8-7167-52a66b974e1a','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Documents','module',90,0),('6ff6e4e0-c9cc-f14b-f4fa-52a66b45d219','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Documents','module',90,0),('70a85908-89df-ab35-0263-52a66bf66ed1','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Documents','module',90,0),('71d6dc28-cfe3-40af-6ccf-52a66bfa315f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Documents','module',90,0),('72ba1b98-4357-3f00-83f9-52a66befcf56','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Documents','module',90,0),('d9b7ed89-6c4f-3b81-60bc-52a66b6ece6c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','EAPM','module',89,0),('da7848cb-03a8-8886-784b-52a66bceddff','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','EAPM','module',90,0),('db28f3bb-b3b6-2032-f890-52a66b6a9ee1','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','EAPM','module',90,0),('dbd19a39-53ec-4aa9-49dd-52a66b27e982','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','EAPM','module',90,0),('dc766c1b-6c18-bdbe-08d5-52a66b9ae5d8','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','EAPM','module',90,0),('dd078bac-9c85-e3b7-f6a9-52a66bbc7d15','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','EAPM','module',90,0),('dd9881f2-cdee-5e0a-4259-52a66bbe2c9d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','EAPM','module',90,0),('de3291f9-56e9-be32-e94c-52a66b2ca5dd','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','EAPM','module',90,0),('1a3f7da2-7908-738d-e819-52a66b197334','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','AOW_WorkFlow','module',89,0),('1b0f29e6-d8e3-07e9-957a-52a66b48c937','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','AOW_WorkFlow','module',90,0),('1bee3f2d-a788-c435-705e-52a66b605f31','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','AOW_WorkFlow','module',90,0),('1ca395c9-49f0-da61-7466-52a66b02700f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','AOW_WorkFlow','module',90,0),('1d783817-1445-a592-d2fd-52a66b864a75','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','AOW_WorkFlow','module',90,0),('1e4dffda-4f4a-1ad8-203e-52a66bb6e654','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','AOW_WorkFlow','module',90,0),('1ee4c72d-5c75-b370-f599-52a66b03ba9c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','AOW_WorkFlow','module',90,0),('1f5d482d-8c20-4959-b008-52a66bfcf6bd','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','AOW_WorkFlow','module',90,0),('33b39c79-d96b-aefe-d5a7-52a66bf7c606','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','AOW_Processed','module',89,0),('34b4198c-01cb-2a3a-a406-52a66b7e55a7','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','AOW_Processed','module',90,0),('3573351c-d43f-f5cc-6fa7-52a66b39cca9','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','AOW_Processed','module',90,0),('35f44a0e-5a97-d812-e342-52a66b4da476','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','AOW_Processed','module',90,0),('367a62f7-4482-b663-9e28-52a66bd90dbd','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','AOW_Processed','module',90,0),('37053beb-d776-ce9f-a855-52a66b6c5a21','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','AOW_Processed','module',90,0),('37875ed8-11e5-403d-26d0-52a66b42b8fe','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','AOW_Processed','module',90,0),('38031850-6604-74bc-1918-52a66b2818d9','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','AOW_Processed','module',90,0),('55228f8e-deb5-8dd4-f5dc-52a66b76d6ed','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','Calls_Reschedule','module',89,0),('560e7327-8557-55eb-2c3f-52a66b64885e','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','Calls_Reschedule','module',90,0),('56d6fcaf-ae75-7066-aba9-52a66b7b0e5e','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','Calls_Reschedule','module',90,0),('574d117e-8137-084f-b677-52a66b1b5623','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','Calls_Reschedule','module',90,0),('57d4e2ba-477c-0ae5-239b-52a66b1f7d9f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','Calls_Reschedule','module',90,0),('585757b4-098b-fba1-d9b3-52a66bbe9f4a','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','Calls_Reschedule','module',90,0),('58da4d30-91f8-cb23-e034-52a66bb68fea','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','Calls_Reschedule','module',90,0),('595f0b91-b7ac-ec90-e425-52a66bad3079','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','Calls_Reschedule','module',90,0),('75795425-bec2-7f9b-2ab1-52a66bfa02bd','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','jjwg_Maps','module',89,0),('77058d83-0b2c-ed93-382c-52a66bf44719','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','jjwg_Maps','module',90,0),('77db3c77-3d2a-3f50-3fb6-52a66b898bd6','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','jjwg_Maps','module',90,0),('798175f3-07f0-1210-4ec2-52a66b6fc25d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','jjwg_Maps','module',90,0),('7aae3a52-20b2-8302-330d-52a66b89812a','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','jjwg_Maps','module',90,0),('7d34f09f-731b-f111-f80c-52a66b8bd471','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','jjwg_Maps','module',90,0),('7e29886f-fdd1-5797-1a71-52a66be18f59','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','jjwg_Maps','module',90,0),('7ec40ce3-0d38-9a59-45d5-52a66ba12b1c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','jjwg_Maps','module',90,0),('9c137847-8052-56a6-7461-52a66bdfeca4','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','jjwg_Markers','module',89,0),('9cfd106c-74f0-b228-9204-52a66b2f041a','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','jjwg_Markers','module',90,0),('aee3147c-9876-923f-e384-52a66b5b70d1','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','jjwg_Markers','module',90,0),('afa7149c-2a59-0ed9-d3f7-52a66b27413a','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','jjwg_Markers','module',90,0),('b1ea0f81-778e-117e-5c17-52a66be04e39','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','jjwg_Markers','module',90,0),('b5726236-5c4d-fcb8-8210-52a66bcef2d8','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','jjwg_Markers','module',90,0),('b63749b6-87ab-68ab-94c0-52a66bdad1aa','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','jjwg_Markers','module',90,0),('b7e1cf5b-d21c-7af4-545e-52a66b9e2c24','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','jjwg_Markers','module',90,0),('dec11004-8b5e-62c3-77e9-52a66b976238','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','jjwg_Areas','module',89,0),('df6a158e-12b1-d8f6-ab71-52a66b5d8d2e','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','jjwg_Areas','module',90,0),('dfef0b7f-af38-1049-3079-52a66b5f395d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','jjwg_Areas','module',90,0),('e06c672a-7752-5e5b-683d-52a66b824e2f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','jjwg_Areas','module',90,0),('e0e4374d-464d-791e-149d-52a66bfdb71b','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','jjwg_Areas','module',90,0),('e1676463-1e87-80fa-4dda-52a66bed6289','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','jjwg_Areas','module',90,0),('e1fdcc3d-2cc1-f266-990e-52a66b3d8a69','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','jjwg_Areas','module',90,0),('e282c8c0-ec26-5e0a-923b-52a66befb509','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','jjwg_Areas','module',90,0),('62b6028c-f946-a346-05cb-52a66b8be357','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','jjwg_Address_Cache','module',89,0),('871d0e2b-5c22-7265-7c7c-52a66bf4971c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','jjwg_Address_Cache','module',90,0),('98ee0748-3f0d-ab74-0e6d-52a66b335a8f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','jjwg_Address_Cache','module',90,0),('a4ef06ef-f5df-db5e-ec8d-52a66bf87644','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','jjwg_Address_Cache','module',90,0),('afd60dce-a907-c1aa-4a4d-52a66b951da4','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','jjwg_Address_Cache','module',90,0),('b8d80c79-2087-f2aa-1052-52a66b0f7f6e','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','jjwg_Address_Cache','module',90,0),('c3dc0ac3-849f-8c56-6890-52a66b1dcf65','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','jjwg_Address_Cache','module',90,0),('cd2208c9-0d2a-a8d5-06eb-52a66b772ee7','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','jjwg_Address_Cache','module',90,0),('26ac87ab-708e-ccc5-b1c8-52a66b1405c1','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','AOS_Contracts','module',89,0),('27e3c971-0feb-46de-c719-52a66bbde4c4','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','AOS_Contracts','module',90,0),('291931d6-f679-2eea-b69e-52a66b9c670c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','AOS_Contracts','module',90,0),('2ac49214-9567-6aac-6f6b-52a66bc82636','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','AOS_Contracts','module',90,0),('2be908ec-aeee-c860-1f4f-52a66b5cdfaf','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','AOS_Contracts','module',90,0),('2ca58496-c9c9-1233-4ab1-52a66b5c5cfc','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','AOS_Contracts','module',90,0),('2d2cee4e-644f-595f-89cd-52a66b1da152','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','AOS_Contracts','module',90,0),('2db58891-4bbe-3b89-f59a-52a66b261e82','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','AOS_Contracts','module',90,0),('487b4c6f-730a-4b6f-4f6d-52a66b60ca66','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','AOS_Invoices','module',89,0),('4a555714-10bd-4e15-6e4a-52a66b247085','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','AOS_Invoices','module',90,0),('4b08535a-e8f5-aa5a-1782-52a66b1f0a78','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','AOS_Invoices','module',90,0),('4bd50864-8a2c-349b-28e6-52a66b5fae8c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','AOS_Invoices','module',90,0),('4ccb854f-0b00-3291-0156-52a66b5cb17c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','AOS_Invoices','module',90,0),('4d471209-d8aa-933c-7e97-52a66b903a26','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','AOS_Invoices','module',90,0),('4df7da25-dbeb-46c9-9b96-52a66b8807ce','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','AOS_Invoices','module',90,0),('4e9ba1b7-7dc7-aade-2777-52a66ba1e796','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','AOS_Invoices','module',90,0),('681872e5-573e-25c3-cfae-52a66bd2eb99','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','AOS_PDF_Templates','module',89,0),('69286efa-61eb-9062-bac4-52a66b01d8d1','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','AOS_PDF_Templates','module',90,0),('6a267f51-698a-637d-6741-52a66b7edb1d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','AOS_PDF_Templates','module',90,0),('6b158e15-64e1-1c43-7eae-52a66b3e3d8f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','AOS_PDF_Templates','module',90,0),('6bdc0ca7-60b6-872c-c7df-52a66be13a7d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','AOS_PDF_Templates','module',90,0),('6c9b000f-0597-4ab9-d5a0-52a66b2317b0','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','AOS_PDF_Templates','module',90,0),('6d152996-0162-a847-68b9-52a66bd57c23','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','AOS_PDF_Templates','module',90,0),('6da45e08-9552-8a4d-8a8e-52a66bd57e13','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','AOS_PDF_Templates','module',90,0),('85977efa-fa3c-e836-aefa-52a66b4331d9','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','AOS_Product_Categories','module',89,0),('86f3047e-fea0-20b2-2bf3-52a66b748f08','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','AOS_Product_Categories','module',90,0),('879d6a13-bb6d-7269-77cf-52a66bf9378b','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','AOS_Product_Categories','module',90,0),('8866d9ae-194b-8a10-8081-52a66b930c28','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','AOS_Product_Categories','module',90,0),('8951e1df-03f0-00f7-bf79-52a66b6ce6c4','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','AOS_Product_Categories','module',90,0),('8a277168-6398-a26c-b9f7-52a66bbec2c4','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','AOS_Product_Categories','module',90,0),('8ae0f684-af02-c6c5-dcf3-52a66b67ec20','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','AOS_Product_Categories','module',90,0),('8b8460a0-6931-3054-b004-52a66b2c1386','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','AOS_Product_Categories','module',90,0),('b52c8ba5-9097-6f27-101a-52a66bf9608a','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','AOS_Products','module',89,0),('b60e8e7d-498d-771d-ca7f-52a66b5d9618','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','AOS_Products','module',90,0),('b6a49975-be73-4ade-3107-52a66bc28cf1','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','AOS_Products','module',90,0),('b731b336-2bc2-96bc-b8ef-52a66b5948c8','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','AOS_Products','module',90,0),('b7fc8ff8-5fb3-9cba-a176-52a66bfbecd9','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','AOS_Products','module',90,0),('b8cf83fa-b89a-37e9-f669-52a66b7c0c8b','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','AOS_Products','module',90,0),('b9a89dcf-c502-723a-6e0f-52a66b440c35','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','AOS_Products','module',90,0),('ba5c0cd2-3591-2451-1b57-52a66b7b071c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','AOS_Products','module',90,0),('1a62ad6e-db60-b21d-cab3-52a66b4bc486','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','AOS_Quotes','module',89,0),('1b03b0ce-594a-8873-b722-52a66ba56218','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','AOS_Quotes','module',90,0),('1ba76d9a-888d-2525-278c-52a66bf9bb85','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','AOS_Quotes','module',90,0),('1c351486-2b3c-e766-387d-52a66bd868d6','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','AOS_Quotes','module',90,0),('1cb7f06b-2bbf-8f68-31a3-52a66b5c9278','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','AOS_Quotes','module',90,0),('1d336f33-4988-d062-b6f1-52a66b3828c7','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','AOS_Quotes','module',90,0),('1db1d5be-20f2-9398-f68b-52a66b41d2d9','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','AOS_Quotes','module',90,0),('1e352497-fe0a-4d3a-7ca9-52a66b54ec1e','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','AOS_Quotes','module',90,0),('36db7dd8-1d1f-319e-0a81-52a66b9673e3','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','AOR_Reports','module',89,0),('37a929a3-4ff5-74c8-4cf8-52a66b4dbfdc','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','AOR_Reports','module',90,0),('3871a4bf-0faf-6a65-8bb5-52a66bf82606','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','AOR_Reports','module',90,0),('3921340c-ec53-8cd3-2757-52a66bf0cf3d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','AOR_Reports','module',90,0),('39c2ee6c-7adf-b03a-3b85-52a66bdab331','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','AOR_Reports','module',90,0),('3a5c494a-ba6a-1742-4cb9-52a66b31329a','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','AOR_Reports','module',90,0),('3af9b5f9-8c0d-a30a-d110-52a66b47ec45','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','AOR_Reports','module',90,0),('3bb2865b-f6c7-b754-2bed-52a66b012bc4','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','AOR_Reports','module',90,0),('b4fd2fc8-7698-019a-21b2-52a66b9ca01c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','SecurityGroups','module',89,0),('b5db5b99-a6f8-aa05-3860-52a66b17cb44','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','SecurityGroups','module',90,0),('b695c1c0-fb69-56cb-081c-52a66bc6e765','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','SecurityGroups','module',90,0),('b7372d46-e0bc-1539-72d3-52a66bcf6825','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','SecurityGroups','module',90,0),('b7fc9819-d283-da00-54e4-52a66b61c92b','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','SecurityGroups','module',90,0),('b88aba29-171f-7ef1-8898-52a66bbc50f1','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','SecurityGroups','module',90,0),('b9352183-ee47-b400-7817-52a66ba77fb9','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','SecurityGroups','module',90,0),('bee23300-845a-4f43-235e-52a66bbcba80','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','SecurityGroups','module',90,0),('3ae6d863-241b-19a3-b194-52a66b1aa4b9','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','FP_events','module',89,0),('40522fcf-3f57-44c0-3280-52a66bbe6538','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','FP_events','module',90,0),('410ea155-b61b-a3d1-8fa5-52a66b4f8d64','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','FP_events','module',90,0),('4315843d-4def-2282-2ee9-52a66b07f3f6','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','FP_events','module',90,0),('4a9826ab-b0ba-c1a8-99e1-52a66b028d72','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','FP_events','module',90,0),('4fa435aa-fe6e-bb73-1e4b-52a66b729d70','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','FP_events','module',90,0),('592ec83d-ce07-da3a-b5af-52a66b324ec5','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','FP_events','module',90,0),('59f3e510-ff40-c41b-3b53-52a66b4238ad','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','FP_events','module',90,0),('2c12b6b6-e559-9000-06b5-52a66b8a12e3','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','FP_Event_Locations','module',89,0),('2df6e17e-29b5-52ff-1bf9-52a66bc552b2','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','FP_Event_Locations','module',90,0),('31fb3874-cdb4-37e3-cc31-52a66b464cda','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','FP_Event_Locations','module',90,0),('33c3b835-cc85-30fa-095e-52a66b7d1b6c','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','FP_Event_Locations','module',90,0),('3aad1f11-ebd2-b23a-45ff-52a66bc7d2e9','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','FP_Event_Locations','module',90,0),('3b3fbd83-e47b-0db2-4d77-52a66bb734ed','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','FP_Event_Locations','module',90,0),('3f9cee0b-1f46-877d-2a38-52a66bbd4380','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','FP_Event_Locations','module',90,0),('42c8ce9c-9100-bb8f-4f8d-52a66bbf799f','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','FP_Event_Locations','module',90,0),('a300225c-cd97-d0aa-aa60-52a66bf0b4b7','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','AOP_Case_Events','module',89,0),('a38aa134-c7c6-7d7c-388d-52a66b67ebf8','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','AOP_Case_Events','module',90,0),('a48f45f4-9c65-b1d4-c492-52a66b043978','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','AOP_Case_Events','module',90,0),('a93af985-745f-16d4-8450-52a66b97dc45','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','AOP_Case_Events','module',90,0),('aec85de2-6395-3a1d-5111-52a66b739e77','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','AOP_Case_Events','module',90,0),('af641bac-b752-9af1-e2ab-52a66bac48d8','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','AOP_Case_Events','module',90,0),('b19ffd4e-bbd1-734a-bd1a-52a66b838fd2','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','AOP_Case_Events','module',90,0),('b58adb19-af11-d93c-7f4c-52a66b029f9d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','AOP_Case_Events','module',90,0),('eb3f935e-acf1-d0c6-701b-52a66b6074a8','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','access','AOP_Case_Updates','module',89,0),('ebc5ad0a-7649-452e-a8ae-52a66b3ed66d','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','view','AOP_Case_Updates','module',90,0),('ec470f72-1f3e-014c-af64-52a66b1e0fcc','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','list','AOP_Case_Updates','module',90,0),('eedba230-0b86-d733-b3a5-52a66bb90251','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','edit','AOP_Case_Updates','module',90,0),('f35710d6-bc82-6c4d-8a37-52a66b6902ef','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','delete','AOP_Case_Updates','module',90,0),('f3d72587-fe09-b167-f4ba-52a66bdf90e4','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','import','AOP_Case_Updates','module',90,0),('2f1306f7-2a09-0bb5-d249-52a66beb56fa','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','export','AOP_Case_Updates','module',90,0),('5ebd08a6-0658-abae-e209-52a66b2345a1','2013-12-10 01:14:53','2013-12-10 01:14:53','1','','massupdate','AOP_Case_Updates','module',90,0);
/*!40000 ALTER TABLE `acl_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles`
--

DROP TABLE IF EXISTS `acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles`
--

LOCK TABLES `acl_roles` WRITE;
/*!40000 ALTER TABLE `acl_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_actions`
--

DROP TABLE IF EXISTS `acl_roles_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_actions`
--

LOCK TABLES `acl_roles_actions` WRITE;
/*!40000 ALTER TABLE `acl_roles_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_roles_users`
--

DROP TABLE IF EXISTS `acl_roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_acluser_id` (`user_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_roles_users`
--

LOCK TABLES `acl_roles_users` WRITE;
/*!40000 ALTER TABLE `acl_roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl_roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_book`
--

LOCK TABLES `address_book` WRITE;
/*!40000 ALTER TABLE `address_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_events`
--

DROP TABLE IF EXISTS `aop_case_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_events`
--

LOCK TABLES `aop_case_events` WRITE;
/*!40000 ALTER TABLE `aop_case_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_events_audit`
--

DROP TABLE IF EXISTS `aop_case_events_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_events_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_events_audit`
--

LOCK TABLES `aop_case_events_audit` WRITE;
/*!40000 ALTER TABLE `aop_case_events_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_events_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_updates`
--

DROP TABLE IF EXISTS `aop_case_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_updates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `internal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_updates`
--

LOCK TABLES `aop_case_updates` WRITE;
/*!40000 ALTER TABLE `aop_case_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aop_case_updates_audit`
--

DROP TABLE IF EXISTS `aop_case_updates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aop_case_updates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_updates_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aop_case_updates_audit`
--

LOCK TABLES `aop_case_updates_audit` WRITE;
/*!40000 ALTER TABLE `aop_case_updates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aop_case_updates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_charts`
--

DROP TABLE IF EXISTS `aor_charts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_charts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_charts`
--

LOCK TABLES `aor_charts` WRITE;
/*!40000 ALTER TABLE `aor_charts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_charts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_conditions`
--

DROP TABLE IF EXISTS `aor_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_conditions_index_report_id` (`aor_report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_conditions`
--

LOCK TABLES `aor_conditions` WRITE;
/*!40000 ALTER TABLE `aor_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_fields`
--

DROP TABLE IF EXISTS `aor_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_fields` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aor_report_id` char(36) DEFAULT NULL,
  `field_order` int(255) DEFAULT NULL,
  `module_path` longtext,
  `field` varchar(100) DEFAULT NULL,
  `display` tinyint(1) DEFAULT NULL,
  `link` tinyint(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `function` varchar(100) DEFAULT NULL,
  `sort_by` varchar(100) DEFAULT NULL,
  `sort_order` varchar(100) DEFAULT NULL,
  `group_by` varchar(100) DEFAULT NULL,
  `group_order` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_fields_index_report_id` (`aor_report_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_fields`
--

LOCK TABLES `aor_fields` WRITE;
/*!40000 ALTER TABLE `aor_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_reports`
--

DROP TABLE IF EXISTS `aor_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `report_module` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_reports`
--

LOCK TABLES `aor_reports` WRITE;
/*!40000 ALTER TABLE `aor_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aor_reports_audit`
--

DROP TABLE IF EXISTS `aor_reports_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aor_reports_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aor_reports_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aor_reports_audit`
--

LOCK TABLES `aor_reports_audit` WRITE;
/*!40000 ALTER TABLE `aor_reports_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aor_reports_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts`
--

DROP TABLE IF EXISTS `aos_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_contracts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_contract_value` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `customer_signed_date` date DEFAULT NULL,
  `company_signed_date` date DEFAULT NULL,
  `renewal_reminder_date` datetime DEFAULT NULL,
  `contract_type` varchar(100) DEFAULT 'Type',
  `contract_account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts`
--

LOCK TABLES `aos_contracts` WRITE;
/*!40000 ALTER TABLE `aos_contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts_audit`
--

DROP TABLE IF EXISTS `aos_contracts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_contracts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_contracts_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts_audit`
--

LOCK TABLES `aos_contracts_audit` WRITE;
/*!40000 ALTER TABLE `aos_contracts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_contracts_documents`
--

DROP TABLE IF EXISTS `aos_contracts_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_contracts_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_contracts_id` varchar(36) DEFAULT NULL,
  `documents_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_contracts_documents_alt` (`aos_contracts_id`,`documents_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_contracts_documents`
--

LOCK TABLES `aos_contracts_documents` WRITE;
/*!40000 ALTER TABLE `aos_contracts_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_contracts_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_invoices`
--

DROP TABLE IF EXISTS `aos_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_invoices` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `quote_number` int(11) DEFAULT NULL,
  `quote_date` date DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `template_ddown_c` text,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_invoices`
--

LOCK TABLES `aos_invoices` WRITE;
/*!40000 ALTER TABLE `aos_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_invoices_audit`
--

DROP TABLE IF EXISTS `aos_invoices_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_invoices_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_invoices_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_invoices_audit`
--

LOCK TABLES `aos_invoices_audit` WRITE;
/*!40000 ALTER TABLE `aos_invoices_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_invoices_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_line_item_groups`
--

DROP TABLE IF EXISTS `aos_line_item_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_line_item_groups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_line_item_groups`
--

LOCK TABLES `aos_line_item_groups` WRITE;
/*!40000 ALTER TABLE `aos_line_item_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_line_item_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_line_item_groups_audit`
--

DROP TABLE IF EXISTS `aos_line_item_groups_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_line_item_groups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_line_item_groups_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_line_item_groups_audit`
--

LOCK TABLES `aos_line_item_groups_audit` WRITE;
/*!40000 ALTER TABLE `aos_line_item_groups_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_line_item_groups_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_pdf_templates`
--

DROP TABLE IF EXISTS `aos_pdf_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_pdf_templates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `type` varchar(100) DEFAULT NULL,
  `pdfheader` text,
  `pdffooter` text,
  `margin_left` int(255) DEFAULT '15',
  `margin_right` int(255) DEFAULT '15',
  `margin_top` int(255) DEFAULT '16',
  `margin_bottom` int(255) DEFAULT '16',
  `margin_header` int(255) DEFAULT '9',
  `margin_footer` int(255) DEFAULT '9',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_pdf_templates`
--

LOCK TABLES `aos_pdf_templates` WRITE;
/*!40000 ALTER TABLE `aos_pdf_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_pdf_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_pdf_templates_audit`
--

DROP TABLE IF EXISTS `aos_pdf_templates_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_pdf_templates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_pdf_templates_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_pdf_templates_audit`
--

LOCK TABLES `aos_pdf_templates_audit` WRITE;
/*!40000 ALTER TABLE `aos_pdf_templates_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_pdf_templates_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_product_categories`
--

DROP TABLE IF EXISTS `aos_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_product_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT '0',
  `parent_category_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_product_categories`
--

LOCK TABLES `aos_product_categories` WRITE;
/*!40000 ALTER TABLE `aos_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_product_categories_audit`
--

DROP TABLE IF EXISTS `aos_product_categories_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_product_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_product_categories_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_product_categories_audit`
--

LOCK TABLES `aos_product_categories_audit` WRITE;
/*!40000 ALTER TABLE `aos_product_categories_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_product_categories_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products`
--

DROP TABLE IF EXISTS `aos_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `maincode` varchar(100) DEFAULT 'XXXX',
  `part_number` varchar(25) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT 'Good',
  `cost` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `price` decimal(26,6) DEFAULT NULL,
  `url` varchar(25) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `aos_product_category_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products`
--

LOCK TABLES `aos_products` WRITE;
/*!40000 ALTER TABLE `aos_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_audit`
--

DROP TABLE IF EXISTS `aos_products_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_audit`
--

LOCK TABLES `aos_products_audit` WRITE;
/*!40000 ALTER TABLE `aos_products_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_quotes`
--

DROP TABLE IF EXISTS `aos_products_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products_quotes` (
  `id` char(36) NOT NULL,
  `name` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `item_description` text,
  `number` int(11) DEFAULT NULL,
  `product_qty` decimal(18,4) DEFAULT NULL,
  `product_cost_price` decimal(26,6) DEFAULT NULL,
  `product_list_price` decimal(26,6) DEFAULT NULL,
  `product_discount` decimal(26,6) DEFAULT NULL,
  `product_discount_amount` decimal(26,6) DEFAULT NULL,
  `discount` varchar(255) DEFAULT 'Percentage',
  `product_unit_price` decimal(26,6) DEFAULT NULL,
  `vat_amt` decimal(26,6) DEFAULT NULL,
  `product_total_price` decimal(26,6) DEFAULT NULL,
  `vat` varchar(100) DEFAULT '5.0',
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `group_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aospq_par_del` (`parent_id`,`parent_type`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_quotes`
--

LOCK TABLES `aos_products_quotes` WRITE;
/*!40000 ALTER TABLE `aos_products_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_products_quotes_audit`
--

DROP TABLE IF EXISTS `aos_products_quotes_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_products_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_quotes_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_products_quotes_audit`
--

LOCK TABLES `aos_products_quotes_audit` WRITE;
/*!40000 ALTER TABLE `aos_products_quotes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_products_quotes_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes`
--

DROP TABLE IF EXISTS `aos_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `approval_issue` text,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `number` int(11) NOT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `template_ddown_c` text,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `stage` varchar(100) DEFAULT 'Draft',
  `term` varchar(100) DEFAULT NULL,
  `terms_c` text,
  `approval_status` varchar(100) DEFAULT NULL,
  `invoice_status` varchar(100) DEFAULT 'Not Invoiced',
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes`
--

LOCK TABLES `aos_quotes` WRITE;
/*!40000 ALTER TABLE `aos_quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_aos_invoices_c`
--

DROP TABLE IF EXISTS `aos_quotes_aos_invoices_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_aos_invoices_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes77d9_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes6b83nvoices_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_invoices_alt` (`aos_quotes77d9_quotes_ida`,`aos_quotes6b83nvoices_idb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_aos_invoices_c`
--

LOCK TABLES `aos_quotes_aos_invoices_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_aos_invoices_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_aos_invoices_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_audit`
--

DROP TABLE IF EXISTS `aos_quotes_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aos_quotes_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_audit`
--

LOCK TABLES `aos_quotes_audit` WRITE;
/*!40000 ALTER TABLE `aos_quotes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_os_contracts_c`
--

DROP TABLE IF EXISTS `aos_quotes_os_contracts_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_os_contracts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotese81e_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes4dc0ntracts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_contracts_alt` (`aos_quotese81e_quotes_ida`,`aos_quotes4dc0ntracts_idb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_os_contracts_c`
--

LOCK TABLES `aos_quotes_os_contracts_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_os_contracts_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_os_contracts_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aos_quotes_project_c`
--

DROP TABLE IF EXISTS `aos_quotes_project_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aos_quotes_project_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `aos_quotes1112_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes7207project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_project_alt` (`aos_quotes1112_quotes_ida`,`aos_quotes7207project_idb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aos_quotes_project_c`
--

LOCK TABLES `aos_quotes_project_c` WRITE;
/*!40000 ALTER TABLE `aos_quotes_project_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `aos_quotes_project_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_actions`
--

DROP TABLE IF EXISTS `aow_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_actions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `action_order` int(255) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `parameters` longtext,
  PRIMARY KEY (`id`),
  KEY `aow_action_index_workflow_id` (`aow_workflow_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_actions`
--

LOCK TABLES `aow_actions` WRITE;
/*!40000 ALTER TABLE `aow_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_conditions`
--

DROP TABLE IF EXISTS `aow_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aow_conditions_index_workflow_id` (`aow_workflow_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_conditions`
--

LOCK TABLES `aow_conditions` WRITE;
/*!40000 ALTER TABLE `aow_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_processed`
--

DROP TABLE IF EXISTS `aow_processed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_processed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `aow_workflow_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `aow_processed_index_status` (`status`),
  KEY `aow_processed_index_workflow_id` (`aow_workflow_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_processed`
--

LOCK TABLES `aow_processed` WRITE;
/*!40000 ALTER TABLE `aow_processed` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_processed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_processed_aow_actions`
--

DROP TABLE IF EXISTS `aow_processed_aow_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_processed_aow_actions` (
  `id` varchar(36) NOT NULL,
  `aow_processed_id` varchar(36) DEFAULT NULL,
  `aow_action_id` varchar(36) DEFAULT NULL,
  `status` varchar(36) DEFAULT 'Pending',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aow_processed_aow_actions` (`aow_processed_id`,`aow_action_id`),
  KEY `idx_actid_del_freid` (`aow_action_id`,`deleted`,`aow_processed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_processed_aow_actions`
--

LOCK TABLES `aow_processed_aow_actions` WRITE;
/*!40000 ALTER TABLE `aow_processed_aow_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_processed_aow_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_workflow`
--

DROP TABLE IF EXISTS `aow_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_workflow` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `flow_module` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `run_when` varchar(100) DEFAULT 'Create',
  `multiple_runs` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `aow_workflow_index_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_workflow`
--

LOCK TABLES `aow_workflow` WRITE;
/*!40000 ALTER TABLE `aow_workflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aow_workflow_audit`
--

DROP TABLE IF EXISTS `aow_workflow_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aow_workflow_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_aow_workflow_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aow_workflow_audit`
--

LOCK TABLES `aow_workflow_audit` WRITE;
/*!40000 ALTER TABLE `aow_workflow_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `aow_workflow_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs`
--

DROP TABLE IF EXISTS `bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs`
--

LOCK TABLES `bugs` WRITE;
/*!40000 ALTER TABLE `bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugs_audit`
--

DROP TABLE IF EXISTS `bugs_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugs_audit`
--

LOCK TABLES `bugs_audit` WRITE;
/*!40000 ALTER TABLE `bugs_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `bugs_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `direction` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_contacts`
--

DROP TABLE IF EXISTS `calls_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_contacts`
--

LOCK TABLES `calls_contacts` WRITE;
/*!40000 ALTER TABLE `calls_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_leads`
--

DROP TABLE IF EXISTS `calls_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_leads`
--

LOCK TABLES `calls_leads` WRITE;
/*!40000 ALTER TABLE `calls_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_reschedule`
--

DROP TABLE IF EXISTS `calls_reschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_reschedule` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_reschedule`
--

LOCK TABLES `calls_reschedule` WRITE;
/*!40000 ALTER TABLE `calls_reschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_reschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_reschedule_audit`
--

DROP TABLE IF EXISTS `calls_reschedule_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_reschedule_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_calls_reschedule_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_reschedule_audit`
--

LOCK TABLES `calls_reschedule_audit` WRITE;
/*!40000 ALTER TABLE `calls_reschedule_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_reschedule_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls_users`
--

DROP TABLE IF EXISTS `calls_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls_users`
--

LOCK TABLES `calls_users` WRITE;
/*!40000 ALTER TABLE `calls_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_log`
--

DROP TABLE IF EXISTS `campaign_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `hits` int(11) DEFAULT '0',
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_log`
--

LOCK TABLES `campaign_log` WRITE;
/*!40000 ALTER TABLE `campaign_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_trkrs`
--

DROP TABLE IF EXISTS `campaign_trkrs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(30) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_trkrs`
--

LOCK TABLES `campaign_trkrs` WRITE;
/*!40000 ALTER TABLE `campaign_trkrs` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_trkrs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_count` int(11) DEFAULT '0',
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT '0',
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text,
  `content` text,
  `frequency` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns_audit`
--

DROP TABLE IF EXISTS `campaigns_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns_audit`
--

LOCK TABLES `campaigns_audit` WRITE;
/*!40000 ALTER TABLE `campaigns_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaigns_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text,
  `work_log` text,
  `account_id` char(36) DEFAULT NULL,
  `state` varchar(100) DEFAULT 'Closed',
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_audit`
--

DROP TABLE IF EXISTS `cases_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_audit`
--

LOCK TABLES `cases_audit` WRITE;
/*!40000 ALTER TABLE `cases_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases_bugs`
--

DROP TABLE IF EXISTS `cases_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases_bugs`
--

LOCK TABLES `cases_bugs` WRITE;
/*!40000 ALTER TABLE `cases_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text,
  KEY `idx_config_cat` (`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES ('notify','fromaddress','do_not_reply@example.com'),('notify','fromname','SugarCRM'),('notify','send_by_default','1'),('notify','on','1'),('notify','send_from_assigning_user','0'),('info','sugar_version','6.5.16'),('MySettings','tab','YTozMTp7czo0OiJIb21lIjtzOjQ6IkhvbWUiO3M6ODoiQWNjb3VudHMiO3M6ODoiQWNjb3VudHMiO3M6ODoiQ29udGFjdHMiO3M6ODoiQ29udGFjdHMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6NToiTGVhZHMiO3M6NToiTGVhZHMiO3M6MTA6IkFPU19RdW90ZXMiO3M6MTA6IkFPU19RdW90ZXMiO3M6ODoiQ2FsZW5kYXIiO3M6ODoiQ2FsZW5kYXIiO3M6OToiRG9jdW1lbnRzIjtzOjk6IkRvY3VtZW50cyI7czo2OiJFbWFpbHMiO3M6NjoiRW1haWxzIjtzOjk6IkNhbXBhaWducyI7czo5OiJDYW1wYWlnbnMiO3M6NToiQ2FsbHMiO3M6NToiQ2FsbHMiO3M6ODoiTWVldGluZ3MiO3M6ODoiTWVldGluZ3MiO3M6NToiVGFza3MiO3M6NToiVGFza3MiO3M6NToiTm90ZXMiO3M6NToiTm90ZXMiO3M6MTI6IkFPU19JbnZvaWNlcyI7czoxMjoiQU9TX0ludm9pY2VzIjtzOjEzOiJBT1NfQ29udHJhY3RzIjtzOjEzOiJBT1NfQ29udHJhY3RzIjtzOjU6IkNhc2VzIjtzOjU6IkNhc2VzIjtzOjk6IlByb3NwZWN0cyI7czo5OiJQcm9zcGVjdHMiO3M6MTM6IlByb3NwZWN0TGlzdHMiO3M6MTM6IlByb3NwZWN0TGlzdHMiO3M6OToiRlBfZXZlbnRzIjtzOjk6IkZQX2V2ZW50cyI7czoxODoiRlBfRXZlbnRfTG9jYXRpb25zIjtzOjE4OiJGUF9FdmVudF9Mb2NhdGlvbnMiO3M6MTI6IkFPU19Qcm9kdWN0cyI7czoxMjoiQU9TX1Byb2R1Y3RzIjtzOjIyOiJBT1NfUHJvZHVjdF9DYXRlZ29yaWVzIjtzOjIyOiJBT1NfUHJvZHVjdF9DYXRlZ29yaWVzIjtzOjE3OiJBT1NfUERGX1RlbXBsYXRlcyI7czoxNzoiQU9TX1BERl9UZW1wbGF0ZXMiO3M6OToiamp3Z19NYXBzIjtzOjk6Impqd2dfTWFwcyI7czoxMjoiamp3Z19NYXJrZXJzIjtzOjEyOiJqandnX01hcmtlcnMiO3M6MTA6Impqd2dfQXJlYXMiO3M6MTA6Impqd2dfQXJlYXMiO3M6MTg6Impqd2dfQWRkcmVzc19DYWNoZSI7czoxODoiamp3Z19BZGRyZXNzX0NhY2hlIjtzOjExOiJBT1JfUmVwb3J0cyI7czoxMToiQU9SX1JlcG9ydHMiO3M6MTI6IkFPV19Xb3JrRmxvdyI7czoxMjoiQU9XX1dvcmtGbG93IjtzOjE0OiJTZWN1cml0eUdyb3VwcyI7czoxNDoiU2VjdXJpdHlHcm91cHMiO30='),('portal','on','0'),('tracker','Tracker','1'),('system','skypeout_on','1'),('sugarfeed','enabled','1'),('sugarfeed','module_UserFeed','1'),('sugarfeed','module_Opportunities','1'),('sugarfeed','module_Leads','1'),('sugarfeed','module_Contacts','1'),('sugarfeed','module_Cases','1'),('Update','CheckUpdates','manual'),('system','name','Blanco Martin & Asociados'),('system','adminwizard','1'),('notify','allow_default_outbound','0');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `joomla_account_id` varchar(255) DEFAULT NULL,
  `portal_account_disabled` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_audit`
--

DROP TABLE IF EXISTS `contacts_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_audit`
--

LOCK TABLES `contacts_audit` WRITE;
/*!40000 ALTER TABLE `contacts_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_bugs`
--

DROP TABLE IF EXISTS `contacts_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_bugs`
--

LOCK TABLES `contacts_bugs` WRITE;
/*!40000 ALTER TABLE `contacts_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_cases`
--

DROP TABLE IF EXISTS `contacts_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_cases`
--

LOCK TABLES `contacts_cases` WRITE;
/*!40000 ALTER TABLE `contacts_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_users`
--

DROP TABLE IF EXISTS `contacts_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_users`
--

LOCK TABLES `contacts_users` WRITE;
/*!40000 ALTER TABLE `contacts_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_remove_documents`
--

DROP TABLE IF EXISTS `cron_remove_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  KEY `idx_cron_remove_document_stamp` (`date_modified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_remove_documents`
--

LOCK TABLES `cron_remove_documents` WRITE;
/*!40000 ALTER TABLE `cron_remove_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `cron_remove_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT '0',
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT '0',
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_revisions`
--

DROP TABLE IF EXISTS `document_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_revisions`
--

LOCK TABLES `document_revisions` WRITE;
/*!40000 ALTER TABLE `document_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT '0',
  `template_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_accounts`
--

DROP TABLE IF EXISTS `documents_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_accounts`
--

LOCK TABLES `documents_accounts` WRITE;
/*!40000 ALTER TABLE `documents_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_bugs`
--

DROP TABLE IF EXISTS `documents_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_bugs`
--

LOCK TABLES `documents_bugs` WRITE;
/*!40000 ALTER TABLE `documents_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_cases`
--

DROP TABLE IF EXISTS `documents_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_cases`
--

LOCK TABLES `documents_cases` WRITE;
/*!40000 ALTER TABLE `documents_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_contacts`
--

DROP TABLE IF EXISTS `documents_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_contacts`
--

LOCK TABLES `documents_contacts` WRITE;
/*!40000 ALTER TABLE `documents_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_opportunities`
--

DROP TABLE IF EXISTS `documents_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_opportunities`
--

LOCK TABLES `documents_opportunities` WRITE;
/*!40000 ALTER TABLE `documents_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eapm`
--

DROP TABLE IF EXISTS `eapm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eapm`
--

LOCK TABLES `eapm` WRITE;
/*!40000 ALTER TABLE `eapm` DISABLE KEYS */;
/*!40000 ALTER TABLE `eapm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addr_bean_rel`
--

DROP TABLE IF EXISTS `email_addr_bean_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT '0',
  `reply_to_address` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addr_bean_rel`
--

LOCK TABLES `email_addr_bean_rel` WRITE;
/*!40000 ALTER TABLE `email_addr_bean_rel` DISABLE KEYS */;
INSERT INTO `email_addr_bean_rel` VALUES ('b32069e4-8455-bcfd-c4d2-52a676fd760b','b35deb72-ffa1-f210-7c36-52a6760470f6','1','Users',1,0,'2013-12-10 02:04:56','2013-12-10 02:04:56',0);
/*!40000 ALTER TABLE `email_addr_bean_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_addresses`
--

DROP TABLE IF EXISTS `email_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT '0',
  `opt_out` tinyint(1) DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_addresses`
--

LOCK TABLES `email_addresses` WRITE;
/*!40000 ALTER TABLE `email_addresses` DISABLE KEYS */;
INSERT INTO `email_addresses` VALUES ('b35deb72-ffa1-f210-7c36-52a6760470f6','daniel@blancomartin.com.ar','DANIEL@BLANCOMARTIN.COM.AR',0,0,'2013-12-10 02:04:56','2013-12-10 02:04:56',0);
/*!40000 ALTER TABLE `email_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_cache`
--

DROP TABLE IF EXISTS `email_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) unsigned DEFAULT NULL,
  `imap_uid` int(10) unsigned DEFAULT NULL,
  `msgno` int(10) unsigned DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_cache`
--

LOCK TABLES `email_cache` WRITE;
/*!40000 ALTER TABLE `email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing`
--

DROP TABLE IF EXISTS `email_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing`
--

LOCK TABLES `email_marketing` WRITE;
/*!40000 ALTER TABLE `email_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_marketing_prospect_lists`
--

DROP TABLE IF EXISTS `email_marketing_prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_marketing_prospect_lists`
--

LOCK TABLES `email_marketing_prospect_lists` WRITE;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_marketing_prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `body_html` text,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES ('22ff919f-dc23-1159-0104-52a66b22105a','2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','off','System-generated password email','This template is used when the System Administrator sends a new password to a user.','New account information','\nHere is your account username and temporary password:\nUsername : $contact_user_user_name\nPassword : $contact_user_user_hash\n\n$config_site_url\n\nAfter you log in using the above password, you may be required to reset the password to one of your own choice.','<div><table width=\"550\"><tbody><tr><td><p>Here is your account username and temporary password:</p><p>Username : $contact_user_user_name </p><p>Password : $contact_user_user_hash </p><br /><p>$config_site_url</p><br /><p>After you log in using the above password, you may be required to reset the password to one of your own choice.</p>   </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,NULL),('26f0377f-6881-a66a-87f7-52a66b177e20','2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','off','Forgot Password email','This template is used to send a user a link to click to reset the user\'s account password.','Reset your account password','\nYou recently requested on $contact_user_pwd_last_changed to be able to reset your account password.\n\nClick on the link below to reset your password:\n\n$contact_user_link_guid','<div><table width=\"550\"><tbody><tr><td><p>You recently requested on $contact_user_pwd_last_changed to be able to reset your account password. </p><p>Click on the link below to reset your password:</p><p> $contact_user_link_guid </p>  </td>         </tr><tr><td></td>         </tr></tbody></table></div>',0,NULL,0,NULL),('d8c6b01b-8467-a3f6-af28-52a66b94d088','2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','off','Case Closure','Template for informing a contact that their case has been closed.','$acase_name [CASE:$acase_case_number] closed','Hi $contact_first_name $contact_last_name,\n\n					   Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered\n					   Status:				$acase_status\n					   Reference:			$acase_case_number\n					   Resolution:			$acase_resolution','<p> Hi $contact_first_name $contact_last_name,</p>\n					    <p>Your case $acase_name (# $acase_case_number) has been closed on $acase_date_entered</p>\n					    <table border=\"0\"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Resolution</td><td>$acase_resolution</td></tr></tbody></table>',0,NULL,NULL,NULL),('db12b3d5-190c-4818-9eac-52a66bb95558','2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','off','Joomla Account Creation','Template used when informing a contact that they\'ve been given an account on the joomla portal.','Support Portal Account Created','Hi $contact_name,\n					   An account has been created for you at $portal_address.\n					   You may login using this email address and the password $joomla_pass','<p>Hi $contact_name,</p>\n					    <p>An account has been created for you at <a href=\"$portal_address\">$portal_address</a>.</p>\n					    <p>You may login using this email address and the password $joomla_pass</p>',0,NULL,NULL,NULL),('dd5fbce5-c018-b9f1-2d04-52a66bada6b3','2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','off','Case Creation','Template to send to a contact when a case is received from them.','$acase_name [CASE:$acase_case_number]','Hi $contact_first_name $contact_last_name,\n\n					   We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered\n					   Status:		$acase_status\n					   Reference:	$acase_case_number\n					   Description:	$acase_description','<p> Hi $contact_first_name $contact_last_name,</p>\n					    <p>We\'ve received your case $acase_name (# $acase_case_number) on $acase_date_entered</p>\n					    <table border=\"0\"><tbody><tr><td>Status</td><td>$acase_status</td></tr><tr><td>Reference</td><td>$acase_case_number</td></tr><tr><td>Description</td><td>$acase_description</td></tr></tbody></table>',0,NULL,NULL,NULL),('e0fccbf1-e435-9a6f-ab69-52a66b655ec8','2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','off','Contact Case Update','Template to send to a contact when their case is updated.','$acase_name update [CASE:$acase_case_number]','Hi $user_first_name $user_last_name,\n\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\n					       $contact_first_name $contact_last_name, said:\n					               $aop_case_updates_description','<p>Hi $contact_first_name $contact_last_name,</p>\n					    <p> </p>\n					    <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\n					    <p><strong>$user_first_name $user_last_name said:</strong></p>\n					    <p style=\"padding-left:30px;\">$aop_case_updates_description</p>',0,NULL,NULL,NULL),('e408bbe2-38d8-2b86-c34c-52a66b927ab8','2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','off','User Case Update','Email template to send to a Sugar user when their case is updated.','$acase_name (# $acase_case_number) update','Hi $user_first_name $user_last_name,\n\n					   You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:\n					       $contact_first_name $contact_last_name, said:\n					               $aop_case_updates_description\n                        You may review this Case at:\n                            $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;','<p>Hi $user_first_name $user_last_name,</p>\n					   <p> </p>\n					   <p>You\'ve had an update to your case $acase_name (# $acase_case_number) on $aop_case_updates_date_entered:</p>\n					   <p><strong>$contact_first_name $contact_last_name, said:</strong></p>\n					   <p style=\"padding-left:30px;\">$aop_case_updates_description</p>\n					   <p>You may review this Case at: $sugarurl/index.php?module=Cases&action=DetailView&record=$acase_id;</p>\n					   ',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailman`
--

DROP TABLE IF EXISTS `emailman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT '0',
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailman`
--

LOCK TABLES `emailman` WRITE;
/*!40000 ALTER TABLE `emailman` DISABLE KEYS */;
/*!40000 ALTER TABLE `emailman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_beans`
--

DROP TABLE IF EXISTS `emails_beans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_beans`
--

LOCK TABLES `emails_beans` WRITE;
/*!40000 ALTER TABLE `emails_beans` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_beans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_email_addr_rel`
--

DROP TABLE IF EXISTS `emails_email_addr_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_email_addr_rel`
--

LOCK TABLES `emails_email_addr_rel` WRITE;
/*!40000 ALTER TABLE `emails_email_addr_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_email_addr_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails_text`
--

DROP TABLE IF EXISTS `emails_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(255) DEFAULT NULL,
  `reply_to_addr` varchar(255) DEFAULT NULL,
  `to_addrs` text,
  `cc_addrs` text,
  `bcc_addrs` text,
  `description` longtext,
  `description_html` longtext,
  `raw_source` longtext,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails_text`
--

LOCK TABLES `emails_text` WRITE;
/*!40000 ALTER TABLE `emails_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_meta_data`
--

DROP TABLE IF EXISTS `fields_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `audited` tinyint(1) DEFAULT '0',
  `massupdate` tinyint(1) DEFAULT '0',
  `duplicate_merge` smallint(6) DEFAULT '0',
  `reportable` tinyint(1) DEFAULT '1',
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_meta_data`
--

LOCK TABLES `fields_meta_data` WRITE;
/*!40000 ALTER TABLE `fields_meta_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT '0',
  `is_group` tinyint(1) DEFAULT '0',
  `is_dynamic` tinyint(1) DEFAULT '0',
  `dynamic_query` text,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_rel`
--

DROP TABLE IF EXISTS `folders_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_rel`
--

LOCK TABLES `folders_rel` WRITE;
/*!40000 ALTER TABLE `folders_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders_subscriptions`
--

DROP TABLE IF EXISTS `folders_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders_subscriptions`
--

LOCK TABLES `folders_subscriptions` WRITE;
/*!40000 ALTER TABLE `folders_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `folders_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations`
--

DROP TABLE IF EXISTS `fp_event_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_event_locations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations`
--

LOCK TABLES `fp_event_locations` WRITE;
/*!40000 ALTER TABLE `fp_event_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations_audit`
--

DROP TABLE IF EXISTS `fp_event_locations_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_event_locations_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_fp_event_locations_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations_audit`
--

LOCK TABLES `fp_event_locations_audit` WRITE;
/*!40000 ALTER TABLE `fp_event_locations_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_event_locations_fp_events_1_c`
--

DROP TABLE IF EXISTS `fp_event_locations_fp_events_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_event_locations_fp_events_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_event_locations_fp_events_1fp_event_locations_ida` varchar(36) DEFAULT NULL,
  `fp_event_locations_fp_events_1fp_events_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_event_locations_fp_events_1_ida1` (`fp_event_locations_fp_events_1fp_event_locations_ida`),
  KEY `fp_event_locations_fp_events_1_alt` (`fp_event_locations_fp_events_1fp_events_idb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_event_locations_fp_events_1_c`
--

LOCK TABLES `fp_event_locations_fp_events_1_c` WRITE;
/*!40000 ALTER TABLE `fp_event_locations_fp_events_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_event_locations_fp_events_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events`
--

DROP TABLE IF EXISTS `fp_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `budget` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `invite_templates` varchar(100) DEFAULT NULL,
  `accept_redirect` varchar(255) DEFAULT NULL,
  `decline_redirect` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events`
--

LOCK TABLES `fp_events` WRITE;
/*!40000 ALTER TABLE `fp_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_audit`
--

DROP TABLE IF EXISTS `fp_events_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_fp_events_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_audit`
--

LOCK TABLES `fp_events_audit` WRITE;
/*!40000 ALTER TABLE `fp_events_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_contacts_c`
--

DROP TABLE IF EXISTS `fp_events_contacts_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_contacts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_contactsfp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_contactscontacts_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_contacts_alt` (`fp_events_contactsfp_events_ida`,`fp_events_contactscontacts_idb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_contacts_c`
--

LOCK TABLES `fp_events_contacts_c` WRITE;
/*!40000 ALTER TABLE `fp_events_contacts_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_contacts_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_fp_event_delegates_1_c`
--

DROP TABLE IF EXISTS `fp_events_fp_event_delegates_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_fp_event_delegates_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_delegates_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_delegates_1fp_event_delegates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_delegates_1_ida1` (`fp_events_fp_event_delegates_1fp_events_ida`),
  KEY `fp_events_fp_event_delegates_1_alt` (`fp_events_fp_event_delegates_1fp_event_delegates_idb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_fp_event_delegates_1_c`
--

LOCK TABLES `fp_events_fp_event_delegates_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_fp_event_delegates_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_fp_event_delegates_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_fp_event_locations_1_c`
--

DROP TABLE IF EXISTS `fp_events_fp_event_locations_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_fp_event_locations_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_fp_event_locations_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_locations_1fp_event_locations_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_locations_1_alt` (`fp_events_fp_event_locations_1fp_events_ida`,`fp_events_fp_event_locations_1fp_event_locations_idb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_fp_event_locations_1_c`
--

LOCK TABLES `fp_events_fp_event_locations_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_fp_event_locations_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_fp_event_locations_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_leads_1_c`
--

DROP TABLE IF EXISTS `fp_events_leads_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_leads_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_leads_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_leads_1leads_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_leads_1_alt` (`fp_events_leads_1fp_events_ida`,`fp_events_leads_1leads_idb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_leads_1_c`
--

LOCK TABLES `fp_events_leads_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_leads_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_leads_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fp_events_prospects_1_c`
--

DROP TABLE IF EXISTS `fp_events_prospects_1_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fp_events_prospects_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `fp_events_prospects_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_prospects_1prospects_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fp_events_prospects_1_alt` (`fp_events_prospects_1fp_events_ida`,`fp_events_prospects_1prospects_idb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fp_events_prospects_1_c`
--

LOCK TABLES `fp_events_prospects_1_c` WRITE;
/*!40000 ALTER TABLE `fp_events_prospects_1_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `fp_events_prospects_1_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_maps`
--

DROP TABLE IF EXISTS `import_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text,
  `default_values` text,
  `has_header` tinyint(1) DEFAULT '1',
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_maps`
--

LOCK TABLES `import_maps` WRITE;
/*!40000 ALTER TABLE `import_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email`
--

DROP TABLE IF EXISTS `inbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text,
  `delete_seen` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT '0',
  `groupfolder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email`
--

LOCK TABLES `inbound_email` WRITE;
/*!40000 ALTER TABLE `inbound_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_autoreply`
--

DROP TABLE IF EXISTS `inbound_email_autoreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_autoreply`
--

LOCK TABLES `inbound_email_autoreply` WRITE;
/*!40000 ALTER TABLE `inbound_email_autoreply` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_autoreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inbound_email_cache_ts`
--

DROP TABLE IF EXISTS `inbound_email_cache_ts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inbound_email_cache_ts`
--

LOCK TABLES `inbound_email_cache_ts` WRITE;
/*!40000 ALTER TABLE `inbound_email_cache_ts` DISABLE KEYS */;
/*!40000 ALTER TABLE `inbound_email_cache_ts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_address_cache`
--

DROP TABLE IF EXISTS `jjwg_address_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_address_cache` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `lat` float(10,8) DEFAULT NULL,
  `lng` float(11,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_address_cache`
--

LOCK TABLES `jjwg_address_cache` WRITE;
/*!40000 ALTER TABLE `jjwg_address_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_address_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_address_cache_audit`
--

DROP TABLE IF EXISTS `jjwg_address_cache_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_address_cache_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_address_cache_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_address_cache_audit`
--

LOCK TABLES `jjwg_address_cache_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_address_cache_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_address_cache_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_areas`
--

DROP TABLE IF EXISTS `jjwg_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_areas` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `coordinates` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_areas`
--

LOCK TABLES `jjwg_areas` WRITE;
/*!40000 ALTER TABLE `jjwg_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_areas_audit`
--

DROP TABLE IF EXISTS `jjwg_areas_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_areas_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_areas_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_areas_audit`
--

LOCK TABLES `jjwg_areas_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_areas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_areas_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps`
--

DROP TABLE IF EXISTS `jjwg_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `distance` float(9,4) DEFAULT NULL,
  `unit_type` varchar(100) DEFAULT 'mi',
  `module_type` varchar(100) DEFAULT 'Accounts',
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps`
--

LOCK TABLES `jjwg_maps` WRITE;
/*!40000 ALTER TABLE `jjwg_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_audit`
--

DROP TABLE IF EXISTS `jjwg_maps_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_maps_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_audit`
--

LOCK TABLES `jjwg_maps_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_jjwg_areas_c`
--

DROP TABLE IF EXISTS `jjwg_maps_jjwg_areas_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps_jjwg_areas_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_5304wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_41f2g_areas_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_areas_alt` (`jjwg_maps_5304wg_maps_ida`,`jjwg_maps_41f2g_areas_idb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_jjwg_areas_c`
--

LOCK TABLES `jjwg_maps_jjwg_areas_c` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_areas_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_areas_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_maps_jjwg_markers_c`
--

DROP TABLE IF EXISTS `jjwg_maps_jjwg_markers_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_maps_jjwg_markers_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `jjwg_maps_b229wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_2e31markers_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_markers_alt` (`jjwg_maps_b229wg_maps_ida`,`jjwg_maps_2e31markers_idb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_maps_jjwg_markers_c`
--

LOCK TABLES `jjwg_maps_jjwg_markers_c` WRITE;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_markers_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_maps_jjwg_markers_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_markers`
--

DROP TABLE IF EXISTS `jjwg_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_markers` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `jjwg_maps_lat` float(10,8) DEFAULT '0.00000000',
  `jjwg_maps_lng` float(11,8) DEFAULT '0.00000000',
  `marker_image` varchar(100) DEFAULT 'company',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_markers`
--

LOCK TABLES `jjwg_markers` WRITE;
/*!40000 ALTER TABLE `jjwg_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjwg_markers_audit`
--

DROP TABLE IF EXISTS `jjwg_markers_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjwg_markers_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_markers_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjwg_markers_audit`
--

LOCK TABLES `jjwg_markers_audit` WRITE;
/*!40000 ALTER TABLE `jjwg_markers_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjwg_markers_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_queue`
--

DROP TABLE IF EXISTS `job_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text,
  `target` varchar(255) DEFAULT NULL,
  `data` text,
  `requeue` tinyint(1) DEFAULT '0',
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_queue`
--

LOCK TABLES `job_queue` WRITE;
/*!40000 ALTER TABLE `job_queue` DISABLE KEYS */;
INSERT INTO `job_queue` VALUES ('1','c0644c05-3061-90c1-ba9c-52a66bc950f1','Check Inbound Mailboxes',0,'2013-12-10 01:16:02','2013-12-10 01:16:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:16:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12314',NULL),('1','c8292e98-d06f-d6c1-b2cf-52a66b773f8f','Run Nightly Process Bounced Campaign Emails',0,'2013-12-10 01:16:02','2013-12-10 01:16:02','da03a7f4-41e9-e40a-e133-52a66b3514fd','2013-12-10 01:16:00','done','success',NULL,'function::pollMonitoredInboxesForBouncedCampaignEmails',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12314',NULL),('1','cdefa0a1-1d09-b514-5c5a-52a66bd55cca','Run Nightly Mass Email Campaigns',0,'2013-12-10 01:16:02','2013-12-10 01:16:02','dbd114f9-9648-40f6-747c-52a66befdb48','2013-12-10 01:16:00','done','success',NULL,'function::runMassEmailCampaign',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12314',NULL),('1','1cae1ef3-7879-8fb7-cc4e-52a66b338886','Run Email Reminder Notifications',0,'2013-12-10 01:16:02','2013-12-10 01:16:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:16:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12314',NULL),('1','56ae8191-75a0-fc25-38c9-52a66b3a9706','Run AOW WorkFlow',0,'2013-12-10 01:16:02','2013-12-10 01:16:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:16:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:12314',NULL),('1','9f913b69-0a15-a87c-f667-52a66bb1b166','Check Inbound Mailboxes',0,'2013-12-10 01:17:02','2013-12-10 01:17:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:17:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12394',NULL),('1','eb76ee24-ab5d-80ed-058d-52a66b6eced4','Run Email Reminder Notifications',0,'2013-12-10 01:17:02','2013-12-10 01:17:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:17:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12394',NULL),('1','586cdd27-25e8-6d4e-4b5f-52a66beb05ae','Run AOW WorkFlow',0,'2013-12-10 01:17:02','2013-12-10 01:17:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:17:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:12394',NULL),('1','a484cc84-037e-07e4-126a-52a66bc72b55','Check Inbound Mailboxes',0,'2013-12-10 01:18:02','2013-12-10 01:18:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:18:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12479',NULL),('1','eaecbceb-7548-9a55-f29c-52a66bf286d1','Run Email Reminder Notifications',0,'2013-12-10 01:18:02','2013-12-10 01:18:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:18:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12479',NULL),('1','4602ae23-1d30-eaa5-33dd-52a66b7962bf','Run AOW WorkFlow',0,'2013-12-10 01:18:02','2013-12-10 01:18:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:18:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:12479',NULL),('1','dc75746a-06ec-defe-8660-52a66c3a9f86','Check Inbound Mailboxes',0,'2013-12-10 01:19:02','2013-12-10 01:19:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:19:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12650',NULL),('1','2b4c1d91-e0d9-1284-b6db-52a66c7ae096','Run Email Reminder Notifications',0,'2013-12-10 01:19:02','2013-12-10 01:19:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:19:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12650',NULL),('1','77f2e7e2-50e4-8019-6342-52a66cd821b3','Run AOW WorkFlow',0,'2013-12-10 01:19:02','2013-12-10 01:19:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:19:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:12650',NULL),('1','73ee3751-e743-33ea-41ef-52a66c54eb31','Check Inbound Mailboxes',0,'2013-12-10 01:20:02','2013-12-10 01:20:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:20:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12732',NULL),('1','edced188-4aee-3120-a8a4-52a66c8bd124','Run Email Reminder Notifications',0,'2013-12-10 01:20:02','2013-12-10 01:20:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:20:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12732',NULL),('1','84e752ac-0ef3-ad25-a2d7-52a66c00a389','Run AOW WorkFlow',0,'2013-12-10 01:20:02','2013-12-10 01:20:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:20:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:12732',NULL),('1','3f0001e3-dc2a-bcb2-500f-52a66cb5e5f2','Check Inbound Mailboxes',0,'2013-12-10 01:21:02','2013-12-10 01:21:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:21:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12855',NULL),('1','4a5cd799-258f-998b-d738-52a66c7d55db','Run Email Reminder Notifications',0,'2013-12-10 01:21:02','2013-12-10 01:21:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:21:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12855',NULL),('1','96c1f6c9-81ec-cc04-bc54-52a66cafdfad','Run AOW WorkFlow',0,'2013-12-10 01:21:02','2013-12-10 01:21:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:21:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:12855',NULL),('1','2fdfb3c8-b1ec-c650-de96-52a66c1f6dd0','Check Inbound Mailboxes',0,'2013-12-10 01:22:02','2013-12-10 01:22:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:22:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12931',NULL),('1','7fec6cd1-eb5e-f252-276d-52a66cf2f70d','Run Email Reminder Notifications',0,'2013-12-10 01:22:02','2013-12-10 01:22:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:22:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:12931',NULL),('1','c42c63b6-8e3d-0e1f-6dc4-52a66cc1f4ec','Run AOW WorkFlow',0,'2013-12-10 01:22:02','2013-12-10 01:22:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:22:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:12931',NULL),('1','60393f58-fafc-5d16-ac14-52a66cfe773d','Check Inbound Mailboxes',0,'2013-12-10 01:23:02','2013-12-10 01:23:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:23:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13031',NULL),('1','e9ca8394-ecb2-0045-0dcb-52a66c029244','Run Email Reminder Notifications',0,'2013-12-10 01:23:02','2013-12-10 01:23:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:23:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13031',NULL),('1','6a98ba88-749e-26e2-f2d0-52a66c9227c9','Run AOW WorkFlow',0,'2013-12-10 01:23:02','2013-12-10 01:23:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:23:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:13031',NULL),('1','19794fcd-6a78-ebeb-1169-52a66d84e1a8','Check Inbound Mailboxes',0,'2013-12-10 01:24:02','2013-12-10 01:24:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:24:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13219',NULL),('1','61bd87ec-85d2-150c-4200-52a66da25d7c','Run Email Reminder Notifications',0,'2013-12-10 01:24:02','2013-12-10 01:24:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:24:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13219',NULL),('1','a750bc72-77cc-f42e-7165-52a66dba89d5','Run AOW WorkFlow',0,'2013-12-10 01:24:02','2013-12-10 01:24:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:24:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:13219',NULL),('1','e71c0019-af5b-c855-b47b-52a66d65a546','Check Inbound Mailboxes',0,'2013-12-10 01:25:03','2013-12-10 01:25:03','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:25:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13303',NULL),('1','67fa79a7-de20-9b17-39ae-52a66ded798f','Run Email Reminder Notifications',0,'2013-12-10 01:25:03','2013-12-10 01:25:03','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:25:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13303',NULL),('1','b82247ca-c6d4-9b1a-ba76-52a66d2d707e','Run AOW WorkFlow',0,'2013-12-10 01:25:03','2013-12-10 01:25:03','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:25:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:13303',NULL),('1','bd64de59-673c-3253-7b7c-52a66d6c5f0f','Check Inbound Mailboxes',0,'2013-12-10 01:26:02','2013-12-10 01:26:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:26:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13418',NULL),('1','c1310f9e-4ad9-f009-738d-52a66d11d436','Run Email Reminder Notifications',0,'2013-12-10 01:26:02','2013-12-10 01:26:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:26:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13418',NULL),('1','4be9eaae-4a76-3dba-8913-52a66d8325cf','Run AOW WorkFlow',0,'2013-12-10 01:26:02','2013-12-10 01:26:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:26:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:13418',NULL),('1','dc164544-8446-f37a-b50a-52a66dc8892f','Check Inbound Mailboxes',0,'2013-12-10 01:27:02','2013-12-10 01:27:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:27:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13496',NULL),('1','1d4d0309-091d-2683-428e-52a66d6f5515','Run Email Reminder Notifications',0,'2013-12-10 01:27:02','2013-12-10 01:27:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:27:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13496',NULL),('1','57370207-522e-dfb8-a4b2-52a66d285226','Run AOW WorkFlow',0,'2013-12-10 01:27:02','2013-12-10 01:27:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:27:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:13496',NULL),('1','30f76e3c-ae25-b768-32f6-52a66ec560d7','Check Inbound Mailboxes',0,'2013-12-10 01:28:02','2013-12-10 01:28:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:28:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13574',NULL),('1','7e5d240c-1be4-215b-fb18-52a66e7372cc','Run Email Reminder Notifications',0,'2013-12-10 01:28:02','2013-12-10 01:28:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:28:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13574',NULL),('1','d2602c6f-0ed8-b128-67ab-52a66ee51b0d','Run AOW WorkFlow',0,'2013-12-10 01:28:02','2013-12-10 01:28:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:28:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:13574',NULL),('1','db648541-7455-b2ef-94d0-52a66e28b35c','Check Inbound Mailboxes',0,'2013-12-10 01:29:02','2013-12-10 01:29:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:29:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13772',NULL),('1','3018cb91-17b8-80ef-d10b-52a66e66a282','Run Email Reminder Notifications',0,'2013-12-10 01:29:02','2013-12-10 01:29:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:29:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13772',NULL),('1','73a1a98c-6f92-2cf7-1547-52a66ef29a88','Run AOW WorkFlow',0,'2013-12-10 01:29:02','2013-12-10 01:29:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:29:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:13772',NULL),('1','dce8d142-b255-ebe7-8600-52a66e8a4b75','Check Inbound Mailboxes',0,'2013-12-10 01:30:02','2013-12-10 01:30:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:30:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13863',NULL),('1','a42e0e05-62b9-d079-53d6-52a66e1959c3','Run Email Reminder Notifications',0,'2013-12-10 01:30:02','2013-12-10 01:30:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:30:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13863',NULL),('1','30deb829-516a-c47c-e5b6-52a66e496333','Run AOW WorkFlow',0,'2013-12-10 01:30:02','2013-12-10 01:30:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:30:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:13863',NULL),('1','6df6473d-beae-f34c-0444-52a66e0e6cb1','Check Inbound Mailboxes',0,'2013-12-10 01:31:01','2013-12-10 01:31:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:31:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13998',NULL),('1','a397ffec-3f5c-e7fd-ddd4-52a66e9bca1f','Run Email Reminder Notifications',0,'2013-12-10 01:31:01','2013-12-10 01:31:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:31:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:13998',NULL),('1','db5b50d0-624d-d7c1-48f5-52a66e654de2','Run AOW WorkFlow',0,'2013-12-10 01:31:01','2013-12-10 01:31:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:31:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:13998',NULL),('1','f2a9112d-e2a5-7d1c-4770-52a66ffdb1cc','Check Inbound Mailboxes',0,'2013-12-10 01:32:02','2013-12-10 01:32:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:32:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14071',NULL),('1','40d36d07-08c3-78f5-6a27-52a66fe3fdb4','Run Email Reminder Notifications',0,'2013-12-10 01:32:02','2013-12-10 01:32:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:32:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14071',NULL),('1','892f5232-8f60-c0ec-4d49-52a66f8c024c','Run AOW WorkFlow',0,'2013-12-10 01:32:02','2013-12-10 01:32:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:32:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:14071',NULL),('1','3c15ce56-3b33-b4dd-b395-52a66f00cd6e','Check Inbound Mailboxes',0,'2013-12-10 01:33:02','2013-12-10 01:33:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:33:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14147',NULL),('1','7fb69269-ceb5-ea51-c045-52a66faa16d6','Run Email Reminder Notifications',0,'2013-12-10 01:33:02','2013-12-10 01:33:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:33:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14147',NULL),('1','c87c4ef0-c621-0995-66a7-52a66f2b8a98','Run AOW WorkFlow',0,'2013-12-10 01:33:02','2013-12-10 01:33:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:33:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:14147',NULL),('1','1841a486-fec9-a9b3-0339-52a66f137a88','Check Inbound Mailboxes',0,'2013-12-10 01:34:02','2013-12-10 01:34:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:34:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14326',NULL),('1','5936c751-9cc8-2f4b-78c1-52a66f5f3b34','Run Email Reminder Notifications',0,'2013-12-10 01:34:02','2013-12-10 01:34:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:34:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14326',NULL),('1','abe6e3d8-14c3-df73-4885-52a66f5d349c','Run AOW WorkFlow',0,'2013-12-10 01:34:02','2013-12-10 01:34:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:34:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:14326',NULL),('1','7decd7db-7739-884f-6ca3-52a66f7711d0','Check Inbound Mailboxes',0,'2013-12-10 01:35:01','2013-12-10 01:35:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:35:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14416',NULL),('1','da6b46c3-9f18-18cb-2f47-52a66fae1e71','Run Email Reminder Notifications',0,'2013-12-10 01:35:01','2013-12-10 01:35:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:35:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14416',NULL),('1','45f77af6-0560-77a9-6493-52a66f7d3af9','Run AOW WorkFlow',0,'2013-12-10 01:35:01','2013-12-10 01:35:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:35:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:14416',NULL),('1','bb0b89f6-45cb-23b4-6971-52a670e71770','Check Inbound Mailboxes',0,'2013-12-10 01:36:02','2013-12-10 01:36:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:36:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14538',NULL),('1','d2a80d9d-9736-bbe4-f8d1-52a670913e00','Run Email Reminder Notifications',0,'2013-12-10 01:36:02','2013-12-10 01:36:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:36:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14538',NULL),('1','44f8fc16-0c8c-5c13-aa36-52a670b1e057','Run AOW WorkFlow',0,'2013-12-10 01:36:02','2013-12-10 01:36:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:36:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:14538',NULL),('1','c44cb5b2-50ab-dcbd-bc0c-52a670d07ea4','Check Inbound Mailboxes',0,'2013-12-10 01:37:02','2013-12-10 01:37:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:37:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14616',NULL),('1','120e0be0-e505-a83b-8096-52a670c49843','Run Email Reminder Notifications',0,'2013-12-10 01:37:02','2013-12-10 01:37:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:37:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14616',NULL),('1','481a0dc7-24ac-1be9-5117-52a67027e8e7','Run AOW WorkFlow',0,'2013-12-10 01:37:02','2013-12-10 01:37:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:37:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:14616',NULL),('1','9740a368-6bd6-0e6b-fe09-52a6701372e4','Check Inbound Mailboxes',0,'2013-12-10 01:38:02','2013-12-10 01:38:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:38:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14689',NULL),('1','dac918a4-d861-dbac-e6b6-52a67092d6d0','Run Email Reminder Notifications',0,'2013-12-10 01:38:02','2013-12-10 01:38:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:38:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14689',NULL),('1','27f6c1aa-c319-b607-b818-52a6708d21e5','Run AOW WorkFlow',0,'2013-12-10 01:38:02','2013-12-10 01:38:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:38:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:14689',NULL),('1','97481237-5eba-94a0-0026-52a670f35119','Check Inbound Mailboxes',0,'2013-12-10 01:39:02','2013-12-10 01:39:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:39:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14888',NULL),('1','d529179c-7936-fbc8-b9e9-52a6701e8c6d','Run Email Reminder Notifications',0,'2013-12-10 01:39:02','2013-12-10 01:39:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:39:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14888',NULL),('1','15610556-f68c-c03e-cbd8-52a67015ed27','Run AOW WorkFlow',0,'2013-12-10 01:39:02','2013-12-10 01:39:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:39:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:14888',NULL),('1','eb667ac5-3a15-ebf4-0848-52a670abd1fa','Check Inbound Mailboxes',0,'2013-12-10 01:40:03','2013-12-10 01:40:03','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:40:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14988',NULL),('1','8eb7256e-1e11-7abe-9b4b-52a670e92487','Run Email Reminder Notifications',0,'2013-12-10 01:40:03','2013-12-10 01:40:03','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:40:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:14988',NULL),('1','304bffdd-e8cf-d112-4d1e-52a670be21a3','Run AOW WorkFlow',0,'2013-12-10 01:40:03','2013-12-10 01:40:03','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:40:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:14988',NULL),('1','e80c1373-a236-508a-3c82-52a67160ba95','Check Inbound Mailboxes',0,'2013-12-10 01:41:02','2013-12-10 01:41:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:41:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15108',NULL),('1','2d6e56d4-b999-ee9d-a947-52a67188e6fd','Run Email Reminder Notifications',0,'2013-12-10 01:41:02','2013-12-10 01:41:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:41:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15108',NULL),('1','6866ebce-6d62-4ed7-8f02-52a6710b8f78','Run AOW WorkFlow',0,'2013-12-10 01:41:02','2013-12-10 01:41:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:41:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:15108',NULL),('1','1206d45d-3751-aee9-1ecf-52a671d0d09e','Check Inbound Mailboxes',0,'2013-12-10 01:42:02','2013-12-10 01:42:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:42:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15186',NULL),('1','518cbed3-f4a9-9d72-67af-52a67117ba6a','Run Email Reminder Notifications',0,'2013-12-10 01:42:02','2013-12-10 01:42:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:42:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15186',NULL),('1','8fbc1779-d79e-e72f-f6c8-52a671b59ab3','Run AOW WorkFlow',0,'2013-12-10 01:42:02','2013-12-10 01:42:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:42:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:15186',NULL),('1','219aced6-2536-7c10-40e7-52a67175070a','Check Inbound Mailboxes',0,'2013-12-10 01:43:02','2013-12-10 01:43:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:43:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15269',NULL),('1','6295c45e-c400-8894-3018-52a6711881a7','Run Email Reminder Notifications',0,'2013-12-10 01:43:02','2013-12-10 01:43:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:43:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15269',NULL),('1','9d2141de-147e-5cf4-032a-52a6715a615a','Run AOW WorkFlow',0,'2013-12-10 01:43:02','2013-12-10 01:43:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:43:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:15269',NULL),('1','2ff8300f-73e7-a2c5-4ad1-52a671b850ed','Check Inbound Mailboxes',0,'2013-12-10 01:44:02','2013-12-10 01:44:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:44:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15449',NULL),('1','89bd5b65-b88f-d43c-3a1d-52a6717e700d','Run Email Reminder Notifications',0,'2013-12-10 01:44:02','2013-12-10 01:44:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:44:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15449',NULL),('1','e7dd7758-6e4b-924c-cac7-52a6710121f9','Run AOW WorkFlow',0,'2013-12-10 01:44:02','2013-12-10 01:44:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:44:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:15449',NULL),('1','3fb590a2-ae80-a46f-1f5c-52a6722158a1','Check Inbound Mailboxes',0,'2013-12-10 01:45:03','2013-12-10 01:45:03','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:45:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15539',NULL),('1','9b46354b-3fd2-1a3b-126e-52a672eec127','Run Email Reminder Notifications',0,'2013-12-10 01:45:03','2013-12-10 01:45:03','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:45:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15539',NULL),('1','e8762e21-6710-48d5-c594-52a672fd679b','Run AOW WorkFlow',0,'2013-12-10 01:45:03','2013-12-10 01:45:03','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:45:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:15539',NULL),('1','1f899309-dd34-cd3f-9dda-52a672f8e834','Check Inbound Mailboxes',0,'2013-12-10 01:46:02','2013-12-10 01:46:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:46:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15667',NULL),('1','5eea9d39-5081-bb89-c87c-52a6727d18fb','Run Email Reminder Notifications',0,'2013-12-10 01:46:02','2013-12-10 01:46:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:46:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15667',NULL),('1','9a5198cb-043f-39ab-918a-52a672233a17','Run AOW WorkFlow',0,'2013-12-10 01:46:02','2013-12-10 01:46:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:46:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:15667',NULL),('1','ee52015d-97be-4109-d674-52a6729ff2c1','Check Inbound Mailboxes',0,'2013-12-10 01:47:02','2013-12-10 01:47:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:47:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15736',NULL),('1','4e41dad5-934e-3b9a-0c55-52a6727c749a','Run Email Reminder Notifications',0,'2013-12-10 01:47:02','2013-12-10 01:47:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:47:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15736',NULL),('1','8c2662c4-3ff7-958c-6f13-52a672516af6','Run AOW WorkFlow',0,'2013-12-10 01:47:02','2013-12-10 01:47:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:47:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:15736',NULL),('1','93e3af88-4914-bd41-88ed-52a6726dc7f9','Check Inbound Mailboxes',0,'2013-12-10 01:48:02','2013-12-10 01:48:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:48:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15818',NULL),('1','de43bbc0-18c1-e078-b151-52a672adfae5','Run Email Reminder Notifications',0,'2013-12-10 01:48:02','2013-12-10 01:48:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:48:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15818',NULL),('1','26e4d6b2-bc6e-808b-f0b3-52a6723250fc','Run AOW WorkFlow',0,'2013-12-10 01:48:02','2013-12-10 01:48:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:48:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:15818',NULL),('1','d82d3dcb-0c12-1eb8-25c8-52a6730241f7','Check Inbound Mailboxes',0,'2013-12-10 01:49:02','2013-12-10 01:49:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:49:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15991',NULL),('1','2e5babd2-39ab-50cc-63a4-52a67398af38','Run Email Reminder Notifications',0,'2013-12-10 01:49:02','2013-12-10 01:49:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:49:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:15991',NULL),('1','7100e519-8156-5e9b-cfa8-52a67329150b','Run AOW WorkFlow',0,'2013-12-10 01:49:02','2013-12-10 01:49:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:49:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:15991',NULL),('1','b7533558-50f7-0e18-e61e-52a6734cf968','Check Inbound Mailboxes',0,'2013-12-10 01:50:03','2013-12-10 01:50:03','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:50:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16072',NULL),('1','4c1f8fe8-d04f-8f2d-68bd-52a6738757cf','Run Email Reminder Notifications',0,'2013-12-10 01:50:03','2013-12-10 01:50:03','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:50:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16072',NULL),('1','c5a18389-9caf-63d1-a277-52a673613b89','Run AOW WorkFlow',0,'2013-12-10 01:50:03','2013-12-10 01:50:03','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:50:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:16072',NULL),('1','1d0ee961-6416-225d-ae69-52a6731d88c7','Check Inbound Mailboxes',0,'2013-12-10 01:51:02','2013-12-10 01:51:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:51:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16195',NULL),('1','5c1e1922-5147-a19e-2c59-52a673ddb478','Run Email Reminder Notifications',0,'2013-12-10 01:51:02','2013-12-10 01:51:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:51:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16195',NULL),('1','9a28bb81-4722-8499-81fc-52a673a9d172','Run AOW WorkFlow',0,'2013-12-10 01:51:02','2013-12-10 01:51:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:51:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:16195',NULL),('1','2daaaa3e-c35a-2764-9613-52a67397ae80','Check Inbound Mailboxes',0,'2013-12-10 01:52:02','2013-12-10 01:52:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:52:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16273',NULL),('1','6d13c3c1-0c39-3435-d858-52a67330d1a0','Run Email Reminder Notifications',0,'2013-12-10 01:52:02','2013-12-10 01:52:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:52:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16273',NULL),('1','a7d7b65b-7d78-fd09-a3cc-52a6736bc8af','Run AOW WorkFlow',0,'2013-12-10 01:52:02','2013-12-10 01:52:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:52:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:16273',NULL),('1','e719580a-e3e9-67ed-569b-52a673ea63a1','Check Inbound Mailboxes',0,'2013-12-10 01:53:02','2013-12-10 01:53:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:53:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16352',NULL),('1','2f662b7b-a72c-034a-3318-52a673bace52','Run Email Reminder Notifications',0,'2013-12-10 01:53:02','2013-12-10 01:53:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:53:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16352',NULL),('1','663e16ba-fed8-08b6-40c3-52a673efb702','Run AOW WorkFlow',0,'2013-12-10 01:53:02','2013-12-10 01:53:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:53:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:16352',NULL),('1','6f6546cf-a68a-2fc3-b20d-52a6742bb8c7','Check Inbound Mailboxes',0,'2013-12-10 01:54:01','2013-12-10 01:54:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:54:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16503',NULL),('1','af0c01d1-618b-dfcd-1dba-52a67400b35e','Run Email Reminder Notifications',0,'2013-12-10 01:54:01','2013-12-10 01:54:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:54:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16503',NULL),('1','f1780fce-43f3-09f5-df37-52a67487a5c3','Run AOW WorkFlow',0,'2013-12-10 01:54:01','2013-12-10 01:54:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:54:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:16503',NULL),('1','7ca33661-5098-3115-1550-52a6741b8090','Check Inbound Mailboxes',0,'2013-12-10 01:55:02','2013-12-10 01:55:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:55:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16612',NULL),('1','e90b393f-8574-42b9-d735-52a6747b9995','Run Email Reminder Notifications',0,'2013-12-10 01:55:02','2013-12-10 01:55:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:55:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16612',NULL),('1','88ecb13e-720c-c5e7-6f4f-52a6743510d7','Run AOW WorkFlow',0,'2013-12-10 01:55:02','2013-12-10 01:55:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:55:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:16612',NULL),('1','8e4dd845-3cd0-06f4-2826-52a674ee930c','Check Inbound Mailboxes',0,'2013-12-10 01:56:02','2013-12-10 01:56:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:56:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16739',NULL),('1','ce9a2765-0e47-6db0-71d4-52a674e4c628','Run Email Reminder Notifications',0,'2013-12-10 01:56:02','2013-12-10 01:56:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:56:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16739',NULL),('1','1584eb2e-3dbe-70b3-88ee-52a674546dae','Run AOW WorkFlow',0,'2013-12-10 01:56:02','2013-12-10 01:56:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:56:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:16739',NULL),('1','5df57cc6-3385-d3ee-0d26-52a674b3ced0','Check Inbound Mailboxes',0,'2013-12-10 01:57:01','2013-12-10 01:57:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:57:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16828',NULL),('1','a0c348c0-cfc7-d62a-140e-52a6742707fd','Run Email Reminder Notifications',0,'2013-12-10 01:57:01','2013-12-10 01:57:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:57:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16828',NULL),('1','dab35d3c-d9c6-d36e-1a8b-52a6740c7ff2','Run AOW WorkFlow',0,'2013-12-10 01:57:01','2013-12-10 01:57:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:57:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:16828',NULL),('1','94afd8f5-00fc-375f-c9f3-52a675af43e2','Check Inbound Mailboxes',0,'2013-12-10 01:58:02','2013-12-10 01:58:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:58:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16922',NULL),('1','e383d42a-b4ad-1f1c-4b9d-52a675049027','Run Email Reminder Notifications',0,'2013-12-10 01:58:02','2013-12-10 01:58:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:58:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:16922',NULL),('1','47850216-3208-ba70-3573-52a675a6ed6d','Run AOW WorkFlow',0,'2013-12-10 01:58:02','2013-12-10 01:58:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:58:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:16922',NULL),('1','af13754a-a612-5431-c2d5-52a6755aaa24','Check Inbound Mailboxes',0,'2013-12-10 01:59:02','2013-12-10 01:59:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 01:59:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17074',NULL),('1','edce9ee6-0f1f-da31-4601-52a675590420','Run Email Reminder Notifications',0,'2013-12-10 01:59:02','2013-12-10 01:59:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 01:59:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17074',NULL),('1','3216abf3-cadb-d9ba-8474-52a67587d73b','Run AOW WorkFlow',0,'2013-12-10 01:59:02','2013-12-10 01:59:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 01:59:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:17074',NULL),('1','7a0f3f7a-faa4-e8d3-eb68-52a675df2e36','Check Inbound Mailboxes',0,'2013-12-10 02:00:02','2013-12-10 02:00:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:00:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17185',NULL),('1','7e5f9e1e-7486-fc44-554e-52a6752f9549','Run Nightly Process Bounced Campaign Emails',0,'2013-12-10 02:00:02','2013-12-10 02:00:02','da03a7f4-41e9-e40a-e133-52a66b3514fd','2013-12-10 02:00:00','done','success',NULL,'function::pollMonitoredInboxesForBouncedCampaignEmails',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17185',NULL),('1','82ef4772-0a6a-4193-a04a-52a6757cd615','Run Nightly Mass Email Campaigns',0,'2013-12-10 02:00:02','2013-12-10 02:00:02','dbd114f9-9648-40f6-747c-52a66befdb48','2013-12-10 02:00:00','done','success',NULL,'function::runMassEmailCampaign',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17185',NULL),('1','e8fb03cc-7618-21c8-3b71-52a675bca4ba','Run Email Reminder Notifications',0,'2013-12-10 02:00:02','2013-12-10 02:00:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:00:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17185',NULL),('1','5e77a784-7367-4ae5-b0b7-52a6755b96c3','Run AOW WorkFlow',0,'2013-12-10 02:00:02','2013-12-10 02:00:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:00:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:17185',NULL),('1','63c479f3-502e-c3dd-3f22-52a6754a7c8b','Check Inbound Mailboxes',0,'2013-12-10 02:01:01','2013-12-10 02:01:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:01:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17594',NULL),('1','afcafe7b-9976-f271-f280-52a675a30a17','Run Email Reminder Notifications',0,'2013-12-10 02:01:01','2013-12-10 02:01:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:01:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17594',NULL),('1','5ea00912-beba-451e-8dc0-52a6758e67bc','Run AOW WorkFlow',0,'2013-12-10 02:01:01','2013-12-10 02:01:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:01:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:17594',NULL),('1','361b799c-9fac-68e0-1e1d-52a676839015','Check Inbound Mailboxes',0,'2013-12-10 02:02:02','2013-12-10 02:02:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:02:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17642',NULL),('1','952a14d0-27c7-52f9-5bf7-52a67656515e','Run Email Reminder Notifications',0,'2013-12-10 02:02:02','2013-12-10 02:02:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:02:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17642',NULL),('1','f196bfc3-08df-ae8b-2a08-52a676cc5a4c','Run AOW WorkFlow',0,'2013-12-10 02:02:02','2013-12-10 02:02:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:02:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:17642',NULL),('1','168a9c1c-7e65-36fc-7cfa-52a6768b17b1','Check Inbound Mailboxes',0,'2013-12-10 02:03:02','2013-12-10 02:03:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:03:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17685',NULL),('1','5124acdc-b8c8-658d-3ba5-52a676d71b7b','Run Email Reminder Notifications',0,'2013-12-10 02:03:02','2013-12-10 02:03:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:03:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17685',NULL),('1','8975bb0c-d369-31af-de95-52a6762e13a2','Run AOW WorkFlow',0,'2013-12-10 02:03:02','2013-12-10 02:03:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:03:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:17685',NULL),('1','1b8d706a-0ac5-2cc3-6ac9-52a676d5c66d','Check Inbound Mailboxes',0,'2013-12-10 02:04:02','2013-12-10 02:04:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:04:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17803',NULL),('1','51952c32-1bab-7d01-4869-52a676339b61','Run Email Reminder Notifications',0,'2013-12-10 02:04:02','2013-12-10 02:04:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:04:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17803',NULL),('1','82623482-a52b-15d1-37a6-52a6768fe456','Run AOW WorkFlow',0,'2013-12-10 02:04:02','2013-12-10 02:04:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:04:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:17803',NULL),('1','d3152596-b1cc-8340-30c9-52a676c29fd7','Check Inbound Mailboxes',0,'2013-12-10 02:05:03','2013-12-10 02:05:03','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:05:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17893',NULL),('1','387e1968-fce3-1c72-6b14-52a676ce2004','Run Email Reminder Notifications',0,'2013-12-10 02:05:03','2013-12-10 02:05:03','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:05:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17893',NULL),('1','9a6156a6-145a-ab35-c948-52a676a57e1d','Run AOW WorkFlow',0,'2013-12-10 02:05:03','2013-12-10 02:05:03','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:05:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:17893',NULL),('1','5ddd354e-488a-9ddd-6287-52a677df888e','Check Inbound Mailboxes',0,'2013-12-10 02:06:01','2013-12-10 02:06:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:06:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17989',NULL),('1','97b75451-c505-90d4-ce3c-52a677ccc2ec','Run Email Reminder Notifications',0,'2013-12-10 02:06:01','2013-12-10 02:06:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:06:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:17989',NULL),('1','d05a33b2-bb75-620e-b8ed-52a6774e9fa4','Run AOW WorkFlow',0,'2013-12-10 02:06:01','2013-12-10 02:06:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:06:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:17989',NULL),('1','6740cd50-06a0-71a9-f0d0-52a677c9f76d','Check Inbound Mailboxes',0,'2013-12-10 02:07:01','2013-12-10 02:07:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:07:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18034',NULL),('1','95fd0b32-a45a-ce2c-4308-52a6779003e1','Run Email Reminder Notifications',0,'2013-12-10 02:07:01','2013-12-10 02:07:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:07:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18034',NULL),('1','ced5fad8-fbb8-2150-749d-52a6778548b4','Run AOW WorkFlow',0,'2013-12-10 02:07:01','2013-12-10 02:07:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:07:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:18034',NULL),('1','c1890ba8-e1dd-d742-23da-52a677b76d82','Check Inbound Mailboxes',0,'2013-12-10 02:08:01','2013-12-10 02:08:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:08:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18078',NULL),('1','3cabdc4a-2c80-d8a2-2c6d-52a677384d44','Run Email Reminder Notifications',0,'2013-12-10 02:08:01','2013-12-10 02:08:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:08:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18078',NULL),('1','6f3c36fa-91e0-bc42-dfb0-52a677064346','Run AOW WorkFlow',0,'2013-12-10 02:08:01','2013-12-10 02:08:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:08:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:18078',NULL),('1','f23ffbfe-2640-a480-f11b-52a677a0805b','Check Inbound Mailboxes',0,'2013-12-10 02:09:02','2013-12-10 02:09:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:09:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18200',NULL),('1','368f3a38-97c6-c520-14fe-52a6775f2e85','Run Email Reminder Notifications',0,'2013-12-10 02:09:02','2013-12-10 02:09:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:09:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18200',NULL),('1','674392f9-fa09-c1bb-8ff2-52a677c2d981','Run AOW WorkFlow',0,'2013-12-10 02:09:02','2013-12-10 02:09:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:09:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:18200',NULL),('1','dbe48963-4387-a6bf-08b0-52a6776eeca3','Check Inbound Mailboxes',0,'2013-12-10 02:10:03','2013-12-10 02:10:03','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:10:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18289',NULL),('1','23fa74df-3786-8008-5c41-52a677f758b6','Run Email Reminder Notifications',0,'2013-12-10 02:10:03','2013-12-10 02:10:03','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:10:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18289',NULL),('1','690895b0-9a47-0a2c-9d90-52a677b9139a','Run AOW WorkFlow',0,'2013-12-10 02:10:03','2013-12-10 02:10:03','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:10:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:18289',NULL),('1','3ae468fb-9ed1-5ff5-69c8-52a6785473cd','Check Inbound Mailboxes',0,'2013-12-10 02:11:02','2013-12-10 02:11:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:11:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18364',NULL),('1','726f024e-392f-a795-583f-52a678185897','Run Email Reminder Notifications',0,'2013-12-10 02:11:02','2013-12-10 02:11:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:11:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18364',NULL),('1','a86d4c49-4cf8-22e6-95a5-52a678bfb67f','Run AOW WorkFlow',0,'2013-12-10 02:11:02','2013-12-10 02:11:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:11:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:18364',NULL),('1','280a1306-b393-0fcc-97fa-52a67896b3c2','Check Inbound Mailboxes',0,'2013-12-10 02:12:02','2013-12-10 02:12:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:12:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18402',NULL),('1','6c62297a-d851-ffd9-2c0c-52a678179cdd','Run Email Reminder Notifications',0,'2013-12-10 02:12:02','2013-12-10 02:12:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:12:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18402',NULL),('1','9e76f13f-acd2-2d03-bfb4-52a678c89436','Run AOW WorkFlow',0,'2013-12-10 02:12:02','2013-12-10 02:12:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:12:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:18402',NULL),('1','2faa10fe-5255-d90c-825b-52a678ee3017','Check Inbound Mailboxes',0,'2013-12-10 02:13:02','2013-12-10 02:13:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:13:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18444',NULL),('1','6ac86912-9c77-f65e-1455-52a678875c8d','Run Email Reminder Notifications',0,'2013-12-10 02:13:02','2013-12-10 02:13:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:13:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18444',NULL),('1','9d8f6b3e-e204-eaab-c454-52a678935355','Run AOW WorkFlow',0,'2013-12-10 02:13:02','2013-12-10 02:13:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:13:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:18444',NULL),('1','23cf0358-83b8-8600-543f-52a6783c7bfc','Check Inbound Mailboxes',0,'2013-12-10 02:14:02','2013-12-10 02:14:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:14:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18559',NULL),('1','38675cb8-9a2c-24b7-877f-52a678ac9ce5','Run Email Reminder Notifications',0,'2013-12-10 02:14:02','2013-12-10 02:14:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:14:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18559',NULL),('1','4b1a54e1-a5d9-ced4-4dbc-52a6784a7f16','Run AOW WorkFlow',0,'2013-12-10 02:14:02','2013-12-10 02:14:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:14:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:18559',NULL),('1','c49e3983-0605-5d70-73b5-52a6799f4785','Check Inbound Mailboxes',0,'2013-12-10 02:15:02','2013-12-10 02:15:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:15:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18637',NULL),('1','3ab39fc6-1b23-4afb-0533-52a679a9cabe','Run Email Reminder Notifications',0,'2013-12-10 02:15:02','2013-12-10 02:15:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:15:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18637',NULL),('1','911b1ab7-1ebd-9db2-d1d0-52a679fefc8e','Run AOW WorkFlow',0,'2013-12-10 02:15:02','2013-12-10 02:15:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:15:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:18637',NULL),('1','9d274838-4c06-0214-57e2-52a679cade42','Check Inbound Mailboxes',0,'2013-12-10 02:16:02','2013-12-10 02:16:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:16:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18730',NULL),('1','dfb23d28-852c-1e93-cc4d-52a679dbb440','Run Email Reminder Notifications',0,'2013-12-10 02:16:02','2013-12-10 02:16:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:16:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18730',NULL),('1','23c7263a-7eff-456b-d6e4-52a679fbdaeb','Run AOW WorkFlow',0,'2013-12-10 02:16:02','2013-12-10 02:16:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:16:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:18730',NULL),('1','9a8f8cf9-d5ba-6c9f-33d1-52a6796f1bf1','Check Inbound Mailboxes',0,'2013-12-10 02:17:02','2013-12-10 02:17:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:17:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18780',NULL),('1','dcb9952e-e530-ce9e-829e-52a679b0bc5f','Run Email Reminder Notifications',0,'2013-12-10 02:17:02','2013-12-10 02:17:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:17:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18780',NULL),('1','1f4c1b02-6b5e-9487-a3b0-52a679c7ef44','Run AOW WorkFlow',0,'2013-12-10 02:17:02','2013-12-10 02:17:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:17:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:18780',NULL),('1','99075098-1e60-2c3d-bdcb-52a679daad5a','Check Inbound Mailboxes',0,'2013-12-10 02:18:02','2013-12-10 02:18:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:18:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18823',NULL),('1','d3850cda-42ae-7cfe-c367-52a679e6e878','Run Email Reminder Notifications',0,'2013-12-10 02:18:02','2013-12-10 02:18:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:18:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18823',NULL),('1','147d1ff6-ce78-3ebe-5b40-52a679664b84','Run AOW WorkFlow',0,'2013-12-10 02:18:02','2013-12-10 02:18:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:18:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:18823',NULL),('1','8f18c372-0f81-0242-fe6d-52a67a4c3ce3','Check Inbound Mailboxes',0,'2013-12-10 02:19:02','2013-12-10 02:19:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:19:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18938',NULL),('1','c76b5ed3-4eb1-4f2b-e112-52a67ac16b5d','Run Email Reminder Notifications',0,'2013-12-10 02:19:02','2013-12-10 02:19:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:19:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:18938',NULL),('1','b2840e58-4368-1d07-7f3b-52a67aad004c','Run AOW WorkFlow',0,'2013-12-10 02:19:02','2013-12-10 02:19:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:19:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:18938',NULL),('1','999dcbfb-b93e-2eb7-490e-52a67adef56b','Check Inbound Mailboxes',0,'2013-12-10 02:20:02','2013-12-10 02:20:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:20:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19010',NULL),('1','eb810872-6f82-eb86-ab84-52a67a2fc2dc','Run Email Reminder Notifications',0,'2013-12-10 02:20:02','2013-12-10 02:20:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:20:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19010',NULL),('1','96d0e682-f548-1c32-b181-52a67a76d6e1','Run AOW WorkFlow',0,'2013-12-10 02:20:02','2013-12-10 02:20:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:20:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19010',NULL),('1','4d451eab-ca42-672b-e0db-52a67a2a2f50','Check Inbound Mailboxes',0,'2013-12-10 02:21:02','2013-12-10 02:21:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:21:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19093',NULL),('1','a3102e2a-bc8e-01ca-6c20-52a67a82e78a','Run Email Reminder Notifications',0,'2013-12-10 02:21:02','2013-12-10 02:21:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:21:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19093',NULL),('1','90f60770-6391-caf3-13bb-52a67a06d5e6','Run AOW WorkFlow',0,'2013-12-10 02:21:02','2013-12-10 02:21:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:21:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19093',NULL),('1','696a0b90-26c1-cf53-19d2-52a67afa565e','Check Inbound Mailboxes',0,'2013-12-10 02:22:01','2013-12-10 02:22:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:22:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19221',NULL),('1','a45e6547-759f-df0d-3fb2-52a67ab2c12a','Run Email Reminder Notifications',0,'2013-12-10 02:22:01','2013-12-10 02:22:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:22:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19221',NULL),('1','d9545981-1d54-c008-fbf4-52a67ae73f38','Run AOW WorkFlow',0,'2013-12-10 02:22:01','2013-12-10 02:22:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:22:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19221',NULL),('1','4df0bbc0-6faa-93a5-5851-52a67bfea074','Check Inbound Mailboxes',0,'2013-12-10 02:23:01','2013-12-10 02:23:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:23:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19262',NULL),('1','8f0dda31-931c-6fe3-be87-52a67bcda1d3','Run Email Reminder Notifications',0,'2013-12-10 02:23:01','2013-12-10 02:23:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:23:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19262',NULL),('1','c1bec4cb-89c3-bb7d-fd30-52a67beb6573','Run AOW WorkFlow',0,'2013-12-10 02:23:01','2013-12-10 02:23:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:23:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19262',NULL),('1','3d8564f2-e7a7-809b-5689-52a67b051bd6','Check Inbound Mailboxes',0,'2013-12-10 02:24:01','2013-12-10 02:24:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:24:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19381',NULL),('1','7787491b-73b5-05f7-28d2-52a67b279c69','Run Email Reminder Notifications',0,'2013-12-10 02:24:01','2013-12-10 02:24:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:24:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19381',NULL),('1','a81847ad-3724-761e-29a3-52a67b6e06e4','Run AOW WorkFlow',0,'2013-12-10 02:24:01','2013-12-10 02:24:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:24:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19381',NULL),('1','aa28fc69-1800-7a3c-6397-52a67bae009c','Check Inbound Mailboxes',0,'2013-12-10 02:25:03','2013-12-10 02:25:03','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:25:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19455',NULL),('1','f0a4571e-7723-1a87-d5ce-52a67b7d7dc2','Run Email Reminder Notifications',0,'2013-12-10 02:25:03','2013-12-10 02:25:03','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:25:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19455',NULL),('1','43b33758-c3f8-70c7-8100-52a67b65b99b','Run AOW WorkFlow',0,'2013-12-10 02:25:03','2013-12-10 02:25:03','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:25:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19455',NULL),('1','33a550b3-c9b8-6c2d-3f0a-52a67be443c0','Check Inbound Mailboxes',0,'2013-12-10 02:26:02','2013-12-10 02:26:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:26:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19535',NULL),('1','7aad23f9-f042-4674-3d7b-52a67bb91811','Run Email Reminder Notifications',0,'2013-12-10 02:26:02','2013-12-10 02:26:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:26:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19535',NULL),('1','b66b24c7-6cbb-87ef-720c-52a67b54e3b5','Run AOW WorkFlow',0,'2013-12-10 02:26:02','2013-12-10 02:26:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:26:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19535',NULL),('1','34cef513-d313-82ba-2174-52a67ba0c9e4','Check Inbound Mailboxes',0,'2013-12-10 02:27:01','2013-12-10 02:27:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:27:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19576',NULL),('1','71b6917e-1bda-af40-2e7e-52a67bec011e','Run Email Reminder Notifications',0,'2013-12-10 02:27:01','2013-12-10 02:27:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:27:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19576',NULL),('1','a35e427b-a740-59fa-571e-52a67bd1e382','Run AOW WorkFlow',0,'2013-12-10 02:27:01','2013-12-10 02:27:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:27:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19576',NULL),('1','1b7ae577-c123-c925-143d-52a67cfb639e','Check Inbound Mailboxes',0,'2013-12-10 02:28:02','2013-12-10 02:28:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:28:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19616',NULL),('1','53cbadd2-f95e-c511-37ab-52a67c09be83','Run Email Reminder Notifications',0,'2013-12-10 02:28:02','2013-12-10 02:28:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:28:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19616',NULL),('1','874addbd-3dce-223f-3a14-52a67c3ca0a9','Run AOW WorkFlow',0,'2013-12-10 02:28:02','2013-12-10 02:28:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:28:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19616',NULL),('1','f30b5644-d9f7-d02f-3311-52a67c879c46','Check Inbound Mailboxes',0,'2013-12-10 02:29:02','2013-12-10 02:29:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:29:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19723',NULL),('1','4049f8e8-b1fa-cc18-9713-52a67cddbbdc','Run Email Reminder Notifications',0,'2013-12-10 02:29:02','2013-12-10 02:29:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:29:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19723',NULL),('1','6f79694d-12e7-43c9-986a-52a67cf07041','Run AOW WorkFlow',0,'2013-12-10 02:29:02','2013-12-10 02:29:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:29:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19723',NULL),('1','e8cc2339-b15b-6db0-e473-52a67cc298af','Check Inbound Mailboxes',0,'2013-12-10 02:30:03','2013-12-10 02:30:03','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:30:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19799',NULL),('1','6cf5fe44-1d08-1417-4366-52a67c021368','Run Email Reminder Notifications',0,'2013-12-10 02:30:03','2013-12-10 02:30:03','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:30:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19799',NULL),('1','cd5db37d-350d-39d7-e735-52a67c4c9cda','Run AOW WorkFlow',0,'2013-12-10 02:30:03','2013-12-10 02:30:03','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:30:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19799',NULL),('1','b1916f9f-f78c-0aa0-5362-52a67c748348','Check Inbound Mailboxes',0,'2013-12-10 02:31:02','2013-12-10 02:31:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:31:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19886',NULL),('1','e64f9ba7-7039-14a4-1a48-52a67c958e93','Run Email Reminder Notifications',0,'2013-12-10 02:31:02','2013-12-10 02:31:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:31:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19886',NULL),('1','20c5da2e-3933-54c7-7ab9-52a67caf4cc4','Run AOW WorkFlow',0,'2013-12-10 02:31:02','2013-12-10 02:31:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:31:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19886',NULL),('1','777b2ec0-a511-8391-e87a-52a67dd10655','Check Inbound Mailboxes',0,'2013-12-10 02:32:02','2013-12-10 02:32:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:32:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19928',NULL),('1','abb11529-ae29-d6ef-2cce-52a67db50ddc','Run Email Reminder Notifications',0,'2013-12-10 02:32:02','2013-12-10 02:32:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:32:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19928',NULL),('1','d5a6ac4f-2605-3d2f-90be-52a67dace755','Run AOW WorkFlow',0,'2013-12-10 02:32:02','2013-12-10 02:32:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:32:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19928',NULL),('1','a58c98a8-e3c3-9649-4684-52a67dda0d4d','Check Inbound Mailboxes',0,'2013-12-10 02:33:02','2013-12-10 02:33:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:33:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19968',NULL),('1','11a802f5-efa0-c835-0ce3-52a67d885d2f','Run Email Reminder Notifications',0,'2013-12-10 02:33:02','2013-12-10 02:33:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:33:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:19968',NULL),('1','42eb1515-f0d6-19ec-c983-52a67d2371bf','Run AOW WorkFlow',0,'2013-12-10 02:33:02','2013-12-10 02:33:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:33:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:19968',NULL),('1','ab0a0181-4cfa-0fab-b0dc-52a67d95f4ee','Check Inbound Mailboxes',0,'2013-12-10 02:34:02','2013-12-10 02:34:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:34:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20176',NULL),('1','4338a412-e46e-8924-2737-52a67d7b9781','Run Email Reminder Notifications',0,'2013-12-10 02:34:02','2013-12-10 02:34:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:34:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20176',NULL),('1','75ab4499-6d2b-55da-740c-52a67df51c51','Run AOW WorkFlow',0,'2013-12-10 02:34:02','2013-12-10 02:34:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:34:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:20176',NULL),('1','cd23ac0c-5cfe-e16d-86c9-52a67d06b803','Check Inbound Mailboxes',0,'2013-12-10 02:35:03','2013-12-10 02:35:03','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:35:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20224',NULL),('1','2fcd8c53-8260-316a-bffe-52a67db9d809','Run Email Reminder Notifications',0,'2013-12-10 02:35:03','2013-12-10 02:35:03','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:35:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20224',NULL),('1','70e63cf0-f2ac-0087-37d0-52a67d38acde','Run AOW WorkFlow',0,'2013-12-10 02:35:03','2013-12-10 02:35:03','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:35:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:20224',NULL),('1','1c19ee64-fd0b-bbac-caed-52a67e92d5d4','Check Inbound Mailboxes',0,'2013-12-10 02:36:02','2013-12-10 02:36:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:36:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20332',NULL),('1','6339a23b-457d-35ad-0b8a-52a67e352ccd','Run Email Reminder Notifications',0,'2013-12-10 02:36:02','2013-12-10 02:36:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:36:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20332',NULL),('1','9c4cd1c6-5977-3ff2-4f62-52a67e127dac','Run AOW WorkFlow',0,'2013-12-10 02:36:02','2013-12-10 02:36:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:36:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:20332',NULL),('1','1903f210-1b25-7bc0-4c26-52a67e52b70f','Check Inbound Mailboxes',0,'2013-12-10 02:37:02','2013-12-10 02:37:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:37:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20366',NULL),('1','51968e69-644b-4879-f71c-52a67ed0604e','Run Email Reminder Notifications',0,'2013-12-10 02:37:02','2013-12-10 02:37:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:37:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20366',NULL),('1','7ee5dea3-3722-aede-7a77-52a67e36b27b','Run AOW WorkFlow',0,'2013-12-10 02:37:02','2013-12-10 02:37:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:37:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:20366',NULL),('1','f269efff-4bbf-2282-a510-52a67e6ca8bf','Check Inbound Mailboxes',0,'2013-12-10 02:38:02','2013-12-10 02:38:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:38:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20406',NULL),('1','3e5ebfda-8831-afd1-0640-52a67eeec9d7','Run Email Reminder Notifications',0,'2013-12-10 02:38:02','2013-12-10 02:38:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:38:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20406',NULL),('1','738a733b-1764-a9da-56b0-52a67ea57208','Run AOW WorkFlow',0,'2013-12-10 02:38:02','2013-12-10 02:38:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:38:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:20406',NULL),('1','42b721d9-4355-e28f-fe8d-52a67eac4484','Check Inbound Mailboxes',0,'2013-12-10 02:39:02','2013-12-10 02:39:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:39:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20544',NULL),('1','94d3d0f1-8fac-2474-4ee3-52a67e6e43ae','Run Email Reminder Notifications',0,'2013-12-10 02:39:02','2013-12-10 02:39:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:39:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20544',NULL),('1','e0db7186-b83f-3d19-e21c-52a67eb5b8da','Run AOW WorkFlow',0,'2013-12-10 02:39:02','2013-12-10 02:39:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:39:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:20544',NULL),('1','b863a097-2a38-8c13-cfc4-52a67f1c2096','Check Inbound Mailboxes',0,'2013-12-10 02:40:03','2013-12-10 02:40:03','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:40:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20712',NULL),('1','266077c2-e1e2-96a0-d975-52a67f3d5c98','Run Email Reminder Notifications',0,'2013-12-10 02:40:03','2013-12-10 02:40:03','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:40:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20712',NULL),('1','84ce1016-e5c9-b19a-b9e4-52a67f03e821','Run AOW WorkFlow',0,'2013-12-10 02:40:03','2013-12-10 02:40:03','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:40:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:20712',NULL),('1','543c5349-0601-e6c9-bf8e-52a67fcadd36','Check Inbound Mailboxes',0,'2013-12-10 02:41:01','2013-12-10 02:41:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:41:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20823',NULL),('1','95bf16f8-6974-0310-be11-52a67fa88aa3','Run Email Reminder Notifications',0,'2013-12-10 02:41:01','2013-12-10 02:41:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:41:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20823',NULL),('1','c5c6fd36-f359-e5ae-77a9-52a67fe5bec4','Run AOW WorkFlow',0,'2013-12-10 02:41:01','2013-12-10 02:41:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:41:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:20823',NULL),('1','4db8bfd0-b48e-a39d-210c-52a67f5cc81a','Check Inbound Mailboxes',0,'2013-12-10 02:42:01','2013-12-10 02:42:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:42:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20873',NULL),('1','9ac7d0d0-a72f-3b1a-8180-52a67f9ae83c','Run Email Reminder Notifications',0,'2013-12-10 02:42:01','2013-12-10 02:42:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:42:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20873',NULL),('1','d99b7bb5-720b-2eb2-5a16-52a67f8b2f44','Run AOW WorkFlow',0,'2013-12-10 02:42:01','2013-12-10 02:42:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:42:00','done','failure','Cannot call function: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:20873',NULL),('1','98f5ead3-fd4d-cd4c-5b22-52a67f092b30','Check Inbound Mailboxes',0,'2013-12-10 02:43:02','2013-12-10 02:43:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:43:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20923',NULL),('1','d1dae509-cc95-dec3-241c-52a67f0751eb','Run Email Reminder Notifications',0,'2013-12-10 02:43:02','2013-12-10 02:43:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:43:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:20923',NULL),('1','1137895e-8baa-13f5-f79c-52a67f6c33b2','Run AOW WorkFlow',0,'2013-12-10 02:43:02','2013-12-10 02:43:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:43:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:20923',NULL),('1','66654318-1c3b-a8fe-9f71-52a67f43c5d9','Check Inbound Mailboxes',0,'2013-12-10 02:44:01','2013-12-10 02:44:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:44:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21041',NULL),('1','9a64c78d-7eb2-d01f-c5f4-52a67ff10ca4','Run Email Reminder Notifications',0,'2013-12-10 02:44:01','2013-12-10 02:44:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:44:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21041',NULL),('1','c9618404-c671-0429-a115-52a67fdd4641','Run AOW WorkFlow',0,'2013-12-10 02:44:01','2013-12-10 02:44:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:44:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21041',NULL),('1','f045d03a-decc-e3c4-017c-52a680364ac7','Check Inbound Mailboxes',0,'2013-12-10 02:45:03','2013-12-10 02:45:03','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:45:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21084',NULL),('1','4e3395c2-176a-cb83-dbb1-52a6803642fa','Run Email Reminder Notifications',0,'2013-12-10 02:45:03','2013-12-10 02:45:03','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:45:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21084',NULL),('1','91621502-3525-e622-ebb2-52a680bacbae','Run AOW WorkFlow',0,'2013-12-10 02:45:03','2013-12-10 02:45:03','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:45:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21084',NULL),('1','55c74f59-c354-085e-bc5c-52a6804279f8','Check Inbound Mailboxes',0,'2013-12-10 02:46:01','2013-12-10 02:46:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:46:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21206',NULL),('1','9134b70b-cffe-e4b3-60e2-52a680e91ce4','Run Email Reminder Notifications',0,'2013-12-10 02:46:01','2013-12-10 02:46:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:46:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21206',NULL),('1','cba95d6a-22ae-45ea-ccb6-52a68091fe51','Run AOW WorkFlow',0,'2013-12-10 02:46:01','2013-12-10 02:46:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:46:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21206',NULL),('1','53f817af-2dae-c99e-db1a-52a680c85700','Check Inbound Mailboxes',0,'2013-12-10 02:47:01','2013-12-10 02:47:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:47:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21248',NULL),('1','9fe7f022-1373-8f55-5b0f-52a6807c6c28','Run Email Reminder Notifications',0,'2013-12-10 02:47:01','2013-12-10 02:47:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:47:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21248',NULL),('1','ce3c825a-19e3-cc60-6c78-52a68037c389','Run AOW WorkFlow',0,'2013-12-10 02:47:01','2013-12-10 02:47:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:47:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21248',NULL),('1','66b615e5-2d8d-8d0e-4a48-52a6807ac200','Check Inbound Mailboxes',0,'2013-12-10 02:48:02','2013-12-10 02:48:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:48:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21294',NULL),('1','9fad8d55-9fe7-55be-65ed-52a68091d80b','Run Email Reminder Notifications',0,'2013-12-10 02:48:02','2013-12-10 02:48:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:48:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21294',NULL),('1','e7edf72f-0903-4c66-1e98-52a6802d8778','Run AOW WorkFlow',0,'2013-12-10 02:48:02','2013-12-10 02:48:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:48:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21294',NULL),('1','7369b48d-7d92-c36b-0b47-52a68165019d','Check Inbound Mailboxes',0,'2013-12-10 02:49:01','2013-12-10 02:49:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:49:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21415',NULL),('1','b17b9622-23f5-e186-a886-52a6819a0082','Run Email Reminder Notifications',0,'2013-12-10 02:49:01','2013-12-10 02:49:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:49:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21415',NULL),('1','e547aa1b-5a13-e468-97ba-52a68134f1e6','Run AOW WorkFlow',0,'2013-12-10 02:49:01','2013-12-10 02:49:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:49:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21415',NULL),('1','3d986b4f-cae7-a778-ad2d-52a681ab863b','Check Inbound Mailboxes',0,'2013-12-10 02:50:02','2013-12-10 02:50:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:50:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21464',NULL),('1','b985d3c0-d50f-ed1d-19fb-52a681f62b53','Run Email Reminder Notifications',0,'2013-12-10 02:50:02','2013-12-10 02:50:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:50:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21464',NULL),('1','14943924-a8ac-1a1d-4783-52a6810b2969','Run AOW WorkFlow',0,'2013-12-10 02:50:02','2013-12-10 02:50:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:50:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21464',NULL),('1','a7015371-ec63-84e1-5c8e-52a681d7a4e9','Check Inbound Mailboxes',0,'2013-12-10 02:51:02','2013-12-10 02:51:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:51:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21574',NULL),('1','dad15845-664e-bf55-1963-52a681605ec6','Run Email Reminder Notifications',0,'2013-12-10 02:51:02','2013-12-10 02:51:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:51:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21574',NULL),('1','19cfb027-c412-a75e-3d70-52a681a8481c','Run AOW WorkFlow',0,'2013-12-10 02:51:02','2013-12-10 02:51:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:51:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21574',NULL),('1','819a693b-5766-6929-78c3-52a6818b755a','Check Inbound Mailboxes',0,'2013-12-10 02:52:02','2013-12-10 02:52:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:52:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21619',NULL),('1','2d0dc0b0-e7f5-d864-54c5-52a681629ae5','Run Email Reminder Notifications',0,'2013-12-10 02:52:02','2013-12-10 02:52:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:52:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21619',NULL),('1','cfa14f77-987b-7229-a21a-52a681119af3','Run AOW WorkFlow',0,'2013-12-10 02:52:02','2013-12-10 02:52:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:52:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21619',NULL),('1','8eef871f-a9db-0b1a-0212-52a682f7c3ff','Check Inbound Mailboxes',0,'2013-12-10 02:53:02','2013-12-10 02:53:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:53:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21660',NULL),('1','c8376353-c021-67bc-73fd-52a682a5140c','Run Email Reminder Notifications',0,'2013-12-10 02:53:02','2013-12-10 02:53:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:53:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21660',NULL),('1','277b022d-224b-e0b0-8723-52a682573bde','Run AOW WorkFlow',0,'2013-12-10 02:53:02','2013-12-10 02:53:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:53:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21660',NULL),('1','80efcae1-19df-7ff0-648f-52a68237943c','Check Inbound Mailboxes',0,'2013-12-10 02:54:01','2013-12-10 02:54:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:54:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21787',NULL),('1','bc4ac525-fc0c-23d6-6922-52a6823160d3','Run Email Reminder Notifications',0,'2013-12-10 02:54:01','2013-12-10 02:54:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:54:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21787',NULL),('1','ef603a22-2221-9223-1469-52a68274ebab','Run AOW WorkFlow',0,'2013-12-10 02:54:01','2013-12-10 02:54:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:54:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21787',NULL),('1','5d547e29-ee22-64b1-9b82-52a6828aab85','Check Inbound Mailboxes',0,'2013-12-10 02:55:02','2013-12-10 02:55:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:55:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21846',NULL),('1','b310790a-a3ea-afa4-8a51-52a68272ebf3','Run Email Reminder Notifications',0,'2013-12-10 02:55:02','2013-12-10 02:55:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:55:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21846',NULL),('1','d51d0ef9-41ab-c8d8-05ce-52a6823b854b','Run AOW WorkFlow',0,'2013-12-10 02:55:02','2013-12-10 02:55:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:55:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21846',NULL),('1','873b78b4-d530-0ec2-0f65-52a682195e46','Check Inbound Mailboxes',0,'2013-12-10 02:56:02','2013-12-10 02:56:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:56:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21950',NULL),('1','c28d80d1-6810-8096-e886-52a682f6a0bc','Run Email Reminder Notifications',0,'2013-12-10 02:56:02','2013-12-10 02:56:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:56:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21950',NULL),('1','f007f522-e159-50ac-70ff-52a682b2d22b','Run AOW WorkFlow',0,'2013-12-10 02:56:02','2013-12-10 02:56:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:56:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21950',NULL),('1','65820140-6b4a-a2b3-cd44-52a68253d8a6','Check Inbound Mailboxes',0,'2013-12-10 02:57:01','2013-12-10 02:57:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:57:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21993',NULL),('1','98c7bc54-50e2-1809-f288-52a682a001e9','Run Email Reminder Notifications',0,'2013-12-10 02:57:01','2013-12-10 02:57:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:57:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:21993',NULL),('1','cf3aea72-3263-062e-ff5d-52a682e7e228','Run AOW WorkFlow',0,'2013-12-10 02:57:01','2013-12-10 02:57:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:57:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:21993',NULL),('1','6ef3a98e-22be-47ad-c425-52a683cd9366','Check Inbound Mailboxes',0,'2013-12-10 02:58:01','2013-12-10 02:58:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:58:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:22032',NULL),('1','b7f869bd-8fa3-26a5-1aed-52a683116153','Run Email Reminder Notifications',0,'2013-12-10 02:58:01','2013-12-10 02:58:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:58:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:22032',NULL),('1','ecf2a49c-a517-5e1b-2700-52a6831b13fb','Run AOW WorkFlow',0,'2013-12-10 02:58:01','2013-12-10 02:58:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:58:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:22032',NULL),('1','7569e9b8-422d-a8fd-e85e-52a68341fe03','Check Inbound Mailboxes',0,'2013-12-10 02:59:01','2013-12-10 02:59:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 02:59:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:22149',NULL),('1','b069f328-da3e-962a-570a-52a683788bd3','Run Email Reminder Notifications',0,'2013-12-10 02:59:01','2013-12-10 02:59:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 02:59:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:22149',NULL),('1','edacfb18-e1f6-293a-41cb-52a6833bc835','Run AOW WorkFlow',0,'2013-12-10 02:59:01','2013-12-10 02:59:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 02:59:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:22149',NULL),('1','49ca4b2f-0647-4b7e-6efc-52a683c19efc','Check Inbound Mailboxes',0,'2013-12-10 03:00:03','2013-12-10 03:00:03','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 03:00:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:22197',NULL),('1','bd84c5ee-e015-12a9-4655-52a683d30ed5','Run Email Reminder Notifications',0,'2013-12-10 03:00:03','2013-12-10 03:00:03','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 03:00:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:22197',NULL),('1','9c260bfc-f87f-626e-b39c-52a683b5ce85','Run AOW WorkFlow',0,'2013-12-10 03:00:03','2013-12-10 03:00:03','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 03:00:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:22197',NULL),('1','7e08ca1e-ee0d-cf6a-1b58-52a6831764b6','Check Inbound Mailboxes',0,'2013-12-10 03:01:01','2013-12-10 03:01:01','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 03:01:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:22604',NULL),('1','d2ceabad-0bdc-0f8e-d699-52a68369b64b','Run Email Reminder Notifications',0,'2013-12-10 03:01:01','2013-12-10 03:01:01','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 03:01:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:22604',NULL),('1','170f05d2-961d-399e-f89e-52a683f9cfb1','Run AOW WorkFlow',0,'2013-12-10 03:01:01','2013-12-10 03:01:01','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 03:01:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:22604',NULL),('1','7713d398-b505-cd93-56d0-52a6842a1b5d','Check Inbound Mailboxes',0,'2013-12-10 03:02:02','2013-12-10 03:02:02','d8f07bb1-8683-36a1-fd3b-52a66bba73a2','2013-12-10 03:02:00','done','success',NULL,'function::pollMonitoredInboxes',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:22642',NULL),('1','dd93f52d-e3f2-8713-bfa1-52a684d1142e','Run Email Reminder Notifications',0,'2013-12-10 03:02:02','2013-12-10 03:02:02','df75ed13-b4ee-d602-e55f-52a66bf904a3','2013-12-10 03:02:00','done','success',NULL,'function::sendEmailReminders',NULL,0,NULL,NULL,0,'CRONe5f432d97d88005136865e00f5be648a:22642',NULL),('1','2780b4f2-c057-f194-e73e-52a684604799','Run AOW WorkFlow',0,'2013-12-10 03:02:02','2013-12-10 03:02:02','d4c8cfa9-f065-a4a0-a67e-52a66be9d560','2013-12-10 03:02:00','done','failure','No se puede llamar a la función: processAOW_Workflow\n','function::processAOW_Workflow',NULL,0,NULL,1,0,'CRONe5f432d97d88005136865e00f5be648a:22642',NULL);
/*!40000 ALTER TABLE `job_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT '0',
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_audit`
--

DROP TABLE IF EXISTS `leads_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_audit`
--

LOCK TABLES `leads_audit` WRITE;
/*!40000 ALTER TABLE `leads_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linked_documents`
--

DROP TABLE IF EXISTS `linked_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linked_documents`
--

LOCK TABLES `linked_documents` WRITE;
/*!40000 ALTER TABLE `linked_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `linked_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT '-1',
  `email_reminder_time` int(11) DEFAULT '-1',
  `email_reminder_sent` tinyint(1) DEFAULT '0',
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT '1',
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_contacts`
--

DROP TABLE IF EXISTS `meetings_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_contacts`
--

LOCK TABLES `meetings_contacts` WRITE;
/*!40000 ALTER TABLE `meetings_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_leads`
--

DROP TABLE IF EXISTS `meetings_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_leads`
--

LOCK TABLES `meetings_leads` WRITE;
/*!40000 ALTER TABLE `meetings_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings_users`
--

DROP TABLE IF EXISTS `meetings_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings_users`
--

LOCK TABLES `meetings_users` WRITE;
/*!40000 ALTER TABLE `meetings_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT '0',
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_consumer`
--

LOCK TABLES `oauth_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_nonce`
--

DROP TABLE IF EXISTS `oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_nonce`
--

LOCK TABLES `oauth_nonce` WRITE;
/*!40000 ALTER TABLE `oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_tokens`
--

DROP TABLE IF EXISTS `oauth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_tokens`
--

LOCK TABLES `oauth_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities`
--

LOCK TABLES `opportunities` WRITE;
/*!40000 ALTER TABLE `opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_audit`
--

DROP TABLE IF EXISTS `opportunities_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_audit`
--

LOCK TABLES `opportunities_audit` WRITE;
/*!40000 ALTER TABLE `opportunities_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_contacts`
--

DROP TABLE IF EXISTS `opportunities_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_contacts`
--

LOCK TABLES `opportunities_contacts` WRITE;
/*!40000 ALTER TABLE `opportunities_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbound_email`
--

DROP TABLE IF EXISTS `outbound_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` int(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT '0',
  `mail_smtpssl` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `oe_user_id_idx` (`id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbound_email`
--

LOCK TABLES `outbound_email` WRITE;
/*!40000 ALTER TABLE `outbound_email` DISABLE KEYS */;
INSERT INTO `outbound_email` VALUES ('a070d9e9-6d6d-9221-2d38-52a66b5b3723','system','system','1','SMTP','gmail','smtp.gmail.com',587,'sugarcrm@blancomartin.com.ar','+bsZWIFDiWfWhVkrdsztJg==',1,2),('be178de0-ccb4-17f6-1f10-52a676b1ba1a','system','system-override','1','SMTP','gmail','smtp.gmail.com',587,'daniel@blancomartin.com.ar','3UHk6+yWGGVF62/7LBNrvg==',1,2);
/*!40000 ALTER TABLE `outbound_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task`
--

DROP TABLE IF EXISTS `project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` text,
  `predecessors` text,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT '1',
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `utilization` int(11) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task`
--

LOCK TABLES `project_task` WRITE;
/*!40000 ALTER TABLE `project_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_task_audit`
--

DROP TABLE IF EXISTS `project_task_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_task_audit`
--

LOCK TABLES `project_task_audit` WRITE;
/*!40000 ALTER TABLE `project_task_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_task_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_accounts`
--

DROP TABLE IF EXISTS `projects_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_accounts`
--

LOCK TABLES `projects_accounts` WRITE;
/*!40000 ALTER TABLE `projects_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_bugs`
--

DROP TABLE IF EXISTS `projects_bugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_bugs`
--

LOCK TABLES `projects_bugs` WRITE;
/*!40000 ALTER TABLE `projects_bugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_bugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_cases`
--

DROP TABLE IF EXISTS `projects_cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_cases`
--

LOCK TABLES `projects_cases` WRITE;
/*!40000 ALTER TABLE `projects_cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_contacts`
--

DROP TABLE IF EXISTS `projects_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_contacts`
--

LOCK TABLES `projects_contacts` WRITE;
/*!40000 ALTER TABLE `projects_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_opportunities`
--

DROP TABLE IF EXISTS `projects_opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_opportunities`
--

LOCK TABLES `projects_opportunities` WRITE;
/*!40000 ALTER TABLE `projects_opportunities` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_products`
--

DROP TABLE IF EXISTS `projects_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_products`
--

LOCK TABLES `projects_products` WRITE;
/*!40000 ALTER TABLE `projects_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_list_campaigns`
--

DROP TABLE IF EXISTS `prospect_list_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_list_campaigns`
--

LOCK TABLES `prospect_list_campaigns` WRITE;
/*!40000 ALTER TABLE `prospect_list_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_list_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists`
--

DROP TABLE IF EXISTS `prospect_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text,
  `domain_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists`
--

LOCK TABLES `prospect_lists` WRITE;
/*!40000 ALTER TABLE `prospect_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_lists_prospects`
--

DROP TABLE IF EXISTS `prospect_lists_prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_lists_prospects`
--

LOCK TABLES `prospect_lists_prospects` WRITE;
/*!40000 ALTER TABLE `prospect_lists_prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_lists_prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospects`
--

DROP TABLE IF EXISTS `prospects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT '0',
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospects`
--

LOCK TABLES `prospects` WRITE;
/*!40000 ALTER TABLE `prospects` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(64) DEFAULT NULL,
  `join_key_lhs` varchar(64) DEFAULT NULL,
  `join_key_rhs` varchar(64) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationships`
--

LOCK TABLES `relationships` WRITE;
/*!40000 ALTER TABLE `relationships` DISABLE KEYS */;
INSERT INTO `relationships` VALUES ('3e935c57-6fd9-c318-d5a3-52a68293611a','leads_modified_user','Users','users','id','Leads','leads','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3ed10460-f3a9-2a9a-4364-52a6825ba33d','leads_created_by','Users','users','id','Leads','leads','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3f01d524-1046-2f01-8289-52a68209472d','leads_assigned_user','Users','users','id','Leads','leads','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3f312bc6-051c-f685-cd8e-52a68209a04f','leads_email_addresses','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Leads',0,0),('3f603599-1844-9a7a-477b-52a682c75ece','leads_email_addresses_primary','Leads','leads','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('3f97ef76-bbc8-d164-249d-52a682584cc3','lead_direct_reports','Leads','leads','id','Leads','leads','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3fcbb096-e03e-b0c1-e4af-52a68200133c','lead_tasks','Leads','leads','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('40019bc3-b562-7c77-d206-52a68260dd0a','lead_notes','Leads','leads','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('40430f0a-745a-f598-08f2-52a682b20313','lead_meetings','Leads','leads','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('40879627-93e2-32e1-0928-52a682411b2e','lead_calls','Leads','leads','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('40c28b0b-98ca-cdf1-1b2c-52a682579a15','lead_emails','Leads','leads','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Leads',0,0),('40f97582-ae05-8411-1be4-52a6824c2ea6','lead_campaign_log','Leads','leads','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Leads',0,0),('44a20f12-1e37-7766-a097-52a6825f7a57','cases_modified_user','Users','users','id','Cases','cases','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('44d54a98-afb9-5652-c9c7-52a6828bf8b5','cases_created_by','Users','users','id','Cases','cases','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('450b1bbc-1949-8c4a-77f9-52a682381fc8','cases_assigned_user','Users','users','id','Cases','cases','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('453bc254-53b5-c59a-db6e-52a682c34866','case_calls','Cases','cases','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('4572a1fc-e1a8-b6d6-e36b-52a6824c7993','case_tasks','Cases','cases','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('45afae35-ce04-e95f-1eda-52a68212df6f','case_notes','Cases','cases','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('45f1e3c1-a594-d039-0e70-52a682004b99','case_meetings','Cases','cases','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('463468fa-2e07-28d1-5ae5-52a682746155','case_emails','Cases','cases','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Cases',0,0),('4b1085ff-744b-337c-f748-52a68218983d','bugs_modified_user','Users','users','id','Bugs','bugs','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4b573497-1968-f14d-f5e2-52a68253689e','bugs_created_by','Users','users','id','Bugs','bugs','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4b98f72b-c6fb-8479-834b-52a6826fc447','bugs_assigned_user','Users','users','id','Bugs','bugs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4bdc1c61-a9e0-7e68-4638-52a6820dc80f','bug_tasks','Bugs','bugs','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('4c1e50b8-5c62-e862-abba-52a6822adaa1','bug_meetings','Bugs','bugs','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('4c66962f-7287-fc05-0ad6-52a682f19406','bug_calls','Bugs','bugs','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('4cae6230-5b81-41ce-0fc9-52a682a152b5','bug_emails','Bugs','bugs','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('4cf1e198-e5bb-5ff8-4f7b-52a6820c21eb','bug_notes','Bugs','bugs','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Bugs',0,0),('4d34361d-78a3-2dd1-4267-52a682c212a2','bugs_release','Releases','releases','id','Bugs','bugs','found_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4d7c142b-7cc4-eb38-7015-52a6828e3d84','bugs_fixed_in_release','Releases','releases','id','Bugs','bugs','fixed_in_release',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4e7c7c65-1998-2662-f0e0-52a6829df8e0','user_direct_reports','Users','users','id','Users','users','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4ec8c1b7-d328-ab92-d2b1-52a6826db6b3','users_email_addresses','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Users',0,0),('4f0b3fac-7f14-d83b-dcdd-52a6824d1449','users_email_addresses_primary','Users','users','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('5065423b-d32b-0999-cefe-52a682d027a0','campaignlog_contact','CampaignLog','campaign_log','related_id','Contacts','contacts','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('50a6a511-26ce-73af-0f5f-52a68251fa84','campaignlog_lead','CampaignLog','campaign_log','related_id','Leads','leads','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('50eb07c1-16a3-bc9d-3d88-52a682cb00a8','campaignlog_created_opportunities','CampaignLog','campaign_log','related_id','Opportunities','opportunities','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('512dc01f-a894-0398-85b2-52a682748ff3','campaignlog_targeted_users','CampaignLog','campaign_log','target_id','Users','users','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('51c2577d-a068-d1fd-23c4-52a682ede9e0','campaignlog_sent_emails','CampaignLog','campaign_log','related_id','Emails','emails','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('55464802-dd70-cc52-55f6-52a68234cdbb','projects_notes','Project','project','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('558fbd41-756e-b37d-5243-52a682484537','projects_tasks','Project','project','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('55d4b912-88a8-37ae-e3c9-52a68259344a','projects_meetings','Project','project','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('561d7cf7-2436-5b9c-073f-52a6822a667c','projects_calls','Project','project','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('5660bd02-254c-f08a-3816-52a682abcccf','projects_emails','Project','project','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Project',0,0),('56a7627c-c5f0-8fb2-1f81-52a68296a618','projects_project_tasks','Project','project','id','ProjectTask','project_task','project_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('56e7d713-ceb5-e8b2-85a9-52a682631592','projects_assigned_user','Users','users','id','Project','project','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('57294de3-3ccb-8df1-f7df-52a68225b6f5','projects_modified_user','Users','users','id','Project','project','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('576d2c70-5271-5af0-4407-52a68278d245','projects_created_by','Users','users','id','Project','project','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5b6470ff-d306-1d71-8356-52a6826fa537','project_tasks_notes','ProjectTask','project_task','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('5ba315e1-0e83-4f07-72bb-52a682ef2f53','project_tasks_tasks','ProjectTask','project_task','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('5bdefb0b-c3d4-60d2-41f2-52a68206e727','project_tasks_meetings','ProjectTask','project_task','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('5c1bc5f3-e8fa-b56f-6c67-52a68297278a','project_tasks_calls','ProjectTask','project_task','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('5c4e90db-9012-149e-785b-52a6821a8a68','project_tasks_emails','ProjectTask','project_task','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','ProjectTask',0,0),('5c7f6184-952e-542d-fb0d-52a68285356f','project_tasks_assigned_user','Users','users','id','ProjectTask','project_task','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5cb5e3ea-ef09-64bc-9c4c-52a682b51075','project_tasks_modified_user','Users','users','id','ProjectTask','project_task','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5ce50a74-dc4b-3c66-bf90-52a682e5a1b9','project_tasks_created_by','Users','users','id','ProjectTask','project_task','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6141fba4-576d-1d8e-f10b-52a682b916af','campaigns_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('617321b1-5314-b3e2-c259-52a682fc1d29','campaigns_created_by','Users','users','id','Campaigns','campaigns','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('61a16947-9615-25ba-f2ad-52a682e57224','campaigns_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('61cfc0bd-4205-4633-529d-52a682b37d67','campaign_accounts','Campaigns','campaigns','id','Accounts','accounts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('620359ae-5a7e-640b-7b4a-52a682ff66d5','campaign_contacts','Campaigns','campaigns','id','Contacts','contacts','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('624b9b12-a2e3-da3b-f85e-52a682faa66f','campaign_leads','Campaigns','campaigns','id','Leads','leads','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('62916577-1a93-e1db-e692-52a682641202','campaign_prospects','Campaigns','campaigns','id','Prospects','prospects','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('62f54760-d435-8b00-c613-52a682d0dde9','campaign_opportunities','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('634410d6-fab2-830a-4492-52a682818c13','campaign_email_marketing','Campaigns','campaigns','id','EmailMarketing','email_marketing','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('638d4082-0f69-a3c5-e073-52a682843627','campaign_emailman','Campaigns','campaigns','id','EmailMan','emailman','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('63d59783-a5fe-e6a4-e80a-52a682f94523','campaign_campaignlog','Campaigns','campaigns','id','CampaignLog','campaign_log','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('641d4eb2-3267-71ef-a9a7-52a68270a25c','campaign_assigned_user','Users','users','id','Campaigns','campaigns','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('645bbee3-45b9-bdea-6dfc-52a682444b0f','campaign_modified_user','Users','users','id','Campaigns','campaigns','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('66be5f97-af17-0632-1edf-52a68238f65e','prospectlists_assigned_user','Users','users','id','prospectlists','prospect_lists','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6c808f41-23c1-36d4-f279-52a6820ea4bc','prospects_modified_user','Users','users','id','Prospects','prospects','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6cc5a8ca-773c-a8fd-b438-52a682371f67','prospects_created_by','Users','users','id','Prospects','prospects','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6d0d0119-d40d-e7cf-2639-52a682047f77','prospects_assigned_user','Users','users','id','Prospects','prospects','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6d55da8b-d897-eca3-f86d-52a682373a7a','prospects_email_addresses','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Prospects',0,0),('6daa3ec2-79d0-1a76-94c4-52a6828dc744','prospects_email_addresses_primary','Prospects','prospects','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('6df0b35c-2672-6d4c-411c-52a682024a58','prospect_tasks','Prospects','prospects','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('6e370d4a-f96a-25db-f287-52a6823d1699','prospect_notes','Prospects','prospects','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('6e7eed1c-7b0b-7214-eb7e-52a68208e818','prospect_meetings','Prospects','prospects','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('6ecec2b8-5f28-e200-2a33-52a682e70c46','prospect_calls','Prospects','prospects','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('6f15e7af-49fa-b50b-46c4-52a682bb9c9f','prospect_emails','Prospects','prospects','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Prospects',0,0),('6f65fa1f-08af-c61b-b765-52a682ffd972','prospect_campaign_log','Prospects','prospects','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Prospects',0,0),('71d88a66-0f6f-6458-58ba-52a6828f2eed','email_template_email_marketings','EmailTemplates','email_templates','id','EmailMarketing','email_marketing','template_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('72ef4b97-3d29-3185-2a4d-52a682aa6014','campaign_campaigntrakers','Campaigns','campaigns','id','CampaignTrackers','campaign_trkrs','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7cef9768-7224-d23c-0b92-52a682fdd65f','schedulers_created_by_rel','Users','users','id','Schedulers','schedulers','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('7d3be2a2-618f-0b82-17c2-52a682889250','schedulers_modified_user_id_rel','Users','users','id','Schedulers','schedulers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7d7ba861-0ee1-eeaf-5a2d-52a682f026a0','schedulers_jobs_rel','Schedulers','schedulers','id','SchedulersJobs','job_queue','scheduler_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7e76145b-6ce1-a004-e309-52a682532774','schedulersjobs_assigned_user','Users','users','id','SchedulersJobs','schedulersjobs','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8663cc3b-c992-df06-9cec-52a6826d1eba','contacts_modified_user','Users','users','id','Contacts','contacts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('869f2203-37c5-cba4-7e84-52a68238997d','contacts_created_by','Users','users','id','Contacts','contacts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('86e1e999-2e0b-bf90-fe18-52a68229d3e3','contacts_assigned_user','Users','users','id','Contacts','contacts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('871c9b0a-921a-a4c7-a11b-52a6828c5c43','contacts_email_addresses','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Contacts',0,0),('875b2b7d-ee57-da17-790b-52a68208cc84','contacts_email_addresses_primary','Contacts','contacts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('879a41e6-a19f-d6a6-f7aa-52a68298c095','contact_direct_reports','Contacts','contacts','id','Contacts','contacts','reports_to_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('87d50b2c-9e52-ffd7-d66e-52a68260ceeb','contact_leads','Contacts','contacts','id','Leads','leads','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('88095adb-e886-f04a-efda-52a682230cae','contact_notes','Contacts','contacts','id','Notes','notes','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('884cc0c8-6a1e-c713-d46b-52a6829e1aab','contact_tasks','Contacts','contacts','id','Tasks','tasks','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('88884e8e-b6b9-529f-edb8-52a682fc431c','contact_tasks_parent','Contacts','contacts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('88c2a411-f526-2454-f92f-52a68242def6','contact_notes_parent','Contacts','contacts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Contacts',0,0),('89002b10-ba14-dffe-9446-52a6825a113d','contact_campaign_log','Contacts','contacts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Contacts',0,0),('8932eaaa-e05f-9bb0-59ce-52a682d907f9','contacts_aop_case_updates','Contacts','contacts','id','AOP_Case_Updates','aop_case_updates','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8966be90-42db-0864-c441-52a68256c472','contact_aos_quotes','Contacts','contacts','id','AOS_Quotes','aos_quotes','billing_contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('89a06b64-9226-3f20-0d8b-52a682aec8c5','contact_aos_invoices','Contacts','contacts','id','AOS_Invoices','aos_invoices','billing_contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('89d46c93-3564-b624-6329-52a682dc3c9e','contact_aos_contracts','Contacts','contacts','id','AOS_Contracts','aos_contracts','contact_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8ebe090c-b47a-f1ff-9222-52a68290b33b','accounts_modified_user','Users','users','id','Accounts','accounts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8ef5e50f-764d-9d90-5d97-52a6825ba58f','accounts_created_by','Users','users','id','Accounts','accounts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8f2784bb-140f-2852-3f38-52a6820fbed8','accounts_assigned_user','Users','users','id','Accounts','accounts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8f62506a-1ecd-7d17-33b0-52a68250e8a9','accounts_email_addresses','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','bean_module','Accounts',0,0),('8f957546-b398-836d-fa1e-52a682ba0039','accounts_email_addresses_primary','Accounts','accounts','id','EmailAddresses','email_addresses','id','email_addr_bean_rel','bean_id','email_address_id','many-to-many','primary_address','1',0,0),('8fc98f42-feff-c48c-3369-52a68252c1bf','member_accounts','Accounts','accounts','id','Accounts','accounts','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8ffec69f-5c72-5461-2ef8-52a68249e2ca','account_cases','Accounts','accounts','id','Cases','cases','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('903df4c6-c1f0-a383-cc86-52a682f727b7','account_tasks','Accounts','accounts','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('907af360-454c-9080-b09c-52a6822f39eb','account_notes','Accounts','accounts','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('90b54889-46e4-60c6-78aa-52a6829a82c5','account_meetings','Accounts','accounts','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('90fe3d9c-2bbd-d9b8-2690-52a6823823ae','account_calls','Accounts','accounts','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('91331417-59c1-0cec-3b5c-52a6827f7020','account_emails','Accounts','accounts','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Accounts',0,0),('91637fe5-9528-1ebb-e6c4-52a682c84ab9','account_leads','Accounts','accounts','id','Leads','leads','account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9195196c-a8dd-b4cc-f92b-52a6820fcaa7','account_campaign_log','Accounts','accounts','id','CampaignLog','campaign_log','target_id',NULL,NULL,NULL,'one-to-many','target_type','Accounts',0,0),('91c5ebb9-385b-f4a4-d73a-52a682dcbfd8','account_aos_quotes','Accounts','accounts','id','AOS_Quotes','aos_quotes','billing_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('91f76101-0f17-e717-bc4c-52a682a1ead8','account_aos_invoices','Accounts','accounts','id','AOS_Invoices','aos_invoices','billing_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('92284043-3444-473e-21ef-52a682e8ab79','account_aos_contracts','Accounts','accounts','id','AOS_Contracts','aos_contracts','contract_account_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9696076f-c54b-2045-cc0c-52a682cc6776','opportunities_modified_user','Users','users','id','Opportunities','opportunities','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('96d056bb-8b5b-8c84-de29-52a6822daf9b','opportunities_created_by','Users','users','id','Opportunities','opportunities','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('970f09e1-7e92-110f-414b-52a6827cabf6','opportunities_assigned_user','Users','users','id','Opportunities','opportunities','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('97661d34-9084-b59a-bdaf-52a6827d8974','opportunity_calls','Opportunities','opportunities','id','Calls','calls','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('97bfe0e4-d5a1-1f46-6dcf-52a682a08249','opportunity_meetings','Opportunities','opportunities','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('98302160-92af-9fe8-b1cd-52a682a2d175','opportunity_tasks','Opportunities','opportunities','id','Tasks','tasks','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('9887f4b4-582a-ebe0-9f8f-52a682dc6218','opportunity_notes','Opportunities','opportunities','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('98ca5b34-42ca-0d4a-a53e-52a682177f85','opportunity_emails','Opportunities','opportunities','id','Emails','emails','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Opportunities',0,0),('991d2831-8d56-1341-5671-52a6821dff95','opportunity_leads','Opportunities','opportunities','id','Leads','leads','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('99569d5d-70c5-8cf6-c800-52a682842626','opportunity_currencies','Opportunities','opportunities','currency_id','Currencies','currencies','id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9988535f-7b29-ccec-4087-52a682316567','opportunities_campaign','Campaigns','campaigns','id','Opportunities','opportunities','campaign_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('99b6201e-71d8-f782-0718-52a682186a14','opportunity_aos_quotes','Opportunities','opportunities','id','AOS_Quotes','aos_quotes','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('99ee49e0-f6a0-6f45-4b82-52a682d0b2f4','opportunity_aos_contracts','Opportunities','opportunities','id','AOS_Contracts','aos_contracts','opportunity_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9c17ab25-e181-3331-674a-52a682d0b0ba','emailtemplates_assigned_user','Users','users','id','EmailTemplates','email_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9e7d8470-7c40-6e93-660b-52a682c4766c','notes_assigned_user','Users','users','id','Notes','notes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9eb213b1-9aad-209a-05bb-52a68277d533','notes_modified_user','Users','users','id','Notes','notes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9eea6de1-7c19-bdcf-0d0d-52a6828a4237','notes_created_by','Users','users','id','Notes','notes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a29b7cff-6f49-0289-9703-52a682cee57c','calls_modified_user','Users','users','id','Calls','calls','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a2ce3e8f-6114-443d-5d73-52a6826ee61e','calls_created_by','Users','users','id','Calls','calls','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a300e56e-30d5-6c40-8fc1-52a6829c682f','calls_assigned_user','Users','users','id','Calls','calls','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a338c684-f728-0719-85b4-52a682537255','calls_notes','Calls','calls','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Calls',0,0),('a36da0c3-c85a-c059-5f2c-52a682134986','calls_reschedule','Calls','calls','id','Calls_Reschedule','calls_reschedule','call_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a88205c4-d1b8-d07a-0029-52a6823f2c5c','emails_assigned_user','Users','users','id','Emails','emails','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a8c7d718-6d46-2d12-5520-52a682454a54','emails_modified_user','Users','users','id','Emails','emails','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aacf49f0-d6d1-c3fc-0e07-52a682e2b6a7','emails_created_by','Users','users','id','Emails','emails','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ab072574-bac1-b465-178b-52a6826fb0a9','emails_notes_rel','Emails','emails','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ab444906-c215-e220-25a3-52a682373520','emails_contacts_rel','Emails','emails','id','Contacts','contacts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Contacts',0,0),('ab757164-9080-2770-b2e6-52a682a2962a','emails_accounts_rel','Emails','emails','id','Accounts','accounts','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Accounts',0,0),('abb627eb-8dcb-b93c-eb07-52a68293eb91','emails_leads_rel','Emails','emails','id','Leads','leads','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Leads',0,0),('abe7728f-39f7-e15f-392f-52a68284cbff','emails_meetings_rel','Emails','emails','id','Meetings','meetings','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b64cf17e-6fdf-2ab9-ff95-52a682ce60fe','meetings_modified_user','Users','users','id','Meetings','meetings','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b68bae4c-cf27-257b-0e05-52a682521b80','meetings_created_by','Users','users','id','Meetings','meetings','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b6bd925e-60c5-2ee2-9ffa-52a68246425e','meetings_assigned_user','Users','users','id','Meetings','meetings','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b6f75a39-a7bf-8d91-f390-52a682ed7191','meetings_notes','Meetings','meetings','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','Meetings',0,0),('c01b843a-1eb2-8e5c-6d31-52a6821ab0b0','tasks_modified_user','Users','users','id','Tasks','tasks','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c097bdb0-c988-45b5-956f-52a682133580','tasks_created_by','Users','users','id','Tasks','tasks','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c0cfc8db-fca9-e736-78ac-52a682c49274','tasks_assigned_user','Users','users','id','Tasks','tasks','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c109ca44-e5e1-09ce-7535-52a682379596','tasks_notes','Tasks','tasks','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e130d204-179a-1cdc-a1bd-52a682f072e9','documents_modified_user','Users','users','id','Documents','documents','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e172a43e-6fc6-bc30-73f4-52a682d6f40d','documents_created_by','Users','users','id','Documents','documents','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e1a23776-a3e0-f876-5e98-52a682339aa0','documents_assigned_user','Users','users','id','Documents','documents','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e1d311f5-ddff-169a-2393-52a682f54dc0','document_revisions','Documents','documents','id','DocumentRevisions','document_revisions','document_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e2e6d991-fa24-6a9d-00f8-52a682e9c46c','revisions_created_by','Users','users','id','DocumentRevisions','document_revisions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('f0a38650-d150-cc42-7e80-52a682a03321','inbound_email_created_by','Users','users','id','InboundEmail','inbound_email','created_by',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('f0ef8b32-25c6-c445-79b0-52a6821c40e7','inbound_email_modified_user_id','Users','users','id','InboundEmail','inbound_email','modified_user_id',NULL,NULL,NULL,'one-to-one',NULL,NULL,0,0),('22b30201-0a45-e7ff-5835-52a682ecb571','saved_search_assigned_user','Users','users','id','SavedSearch','saved_search','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a4ee09e9-5f01-ecb1-111f-52a6822e25f5','sugarfeed_modified_user','Users','users','id','SugarFeed','sugarfeed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aa4d045c-aef2-f5b3-7a11-52a68277b9ae','sugarfeed_created_by','Users','users','id','SugarFeed','sugarfeed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('aee502ca-019c-d4a9-b657-52a682a59160','sugarfeed_assigned_user','Users','users','id','SugarFeed','sugarfeed','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1bfcd267-02f6-b985-4440-52a682ee7cd0','eapm_modified_user','Users','users','id','EAPM','eapm','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1e0fd2e3-9dfe-d0eb-7ed6-52a682dd0eab','eapm_created_by','Users','users','id','EAPM','eapm','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('1e4910d6-2795-c19d-51f0-52a68202ba14','eapm_assigned_user','Users','users','id','EAPM','eapm','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('20cbbf71-08cc-505a-62cd-52a682f9b018','oauthkeys_modified_user','Users','users','id','OAuthKeys','oauthkeys','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2120b728-b842-c2e3-1486-52a6826af938','oauthkeys_created_by','Users','users','id','OAuthKeys','oauthkeys','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2161f570-c3a4-e09c-8656-52a682f7249c','oauthkeys_assigned_user','Users','users','id','OAuthKeys','oauthkeys','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('23b20722-f2a0-2342-d2d9-52a68214d57b','consumer_tokens','OAuthKeys','oauth_consumer','id','OAuthTokens','oauth_tokens','consumer',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('23fd63eb-a869-a2b3-ff42-52a682bc2486','oauthtokens_assigned_user','Users','users','id','OAuthTokens','oauth_tokens','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('296dd9e6-b009-a21b-a10c-52a682226bc6','aor_reports_modified_user','Users','users','id','AOR_Reports','aor_reports','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2aeec62b-6b2b-ab22-0322-52a68270b1ee','aor_reports_created_by','Users','users','id','AOR_Reports','aor_reports','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2b3679b6-88e0-396e-b793-52a68243d897','aor_reports_assigned_user','Users','users','id','AOR_Reports','aor_reports','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2b8b5a61-4d6e-ae40-42c9-52a6822a15dd','aor_reports_aor_fields','AOR_Reports','aor_reports','id','AOR_Fields','aor_field','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('2bc9c235-85da-caca-9516-52a6824218ce','aor_reports_aor_conditions','AOR_Reports','aor_reports','id','AOR_Conditions','aor_conditions','aor_report_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('31167ed6-bdd6-b85c-2e36-52a682143b64','aor_fields_modified_user','Users','users','id','AOR_Fields','aor_fields','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('315480a1-40e1-d684-53cf-52a682de3515','aor_fields_created_by','Users','users','id','AOR_Fields','aor_fields','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('349939b3-cf3a-df7c-d4fa-52a6823359c7','aor_charts_modified_user','Users','users','id','AOR_Charts','aor_charts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('34cab0f3-0f58-94e4-104c-52a682b5d61c','aor_charts_created_by','Users','users','id','AOR_Charts','aor_charts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('386b3faf-77d1-749d-20b9-52a6821284bc','aor_conditions_modified_user','Users','users','id','AOR_Conditions','aor_conditions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('389f2932-d08b-6893-31b5-52a682a57df1','aor_conditions_created_by','Users','users','id','AOR_Conditions','aor_conditions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3cd368c0-c509-de57-8e83-52a6821e721a','aop_case_events_modified_user','Users','users','id','AOP_Case_Events','aop_case_events','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3d3a4956-86eb-185a-34c5-52a6829f4955','aop_case_events_created_by','Users','users','id','AOP_Case_Events','aop_case_events','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3dbf18e9-23b1-57d5-7ed2-52a682859751','aop_case_events_assigned_user','Users','users','id','AOP_Case_Events','aop_case_events','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3e9eb295-a2e6-8e4e-d992-52a6824070e5','cases_aop_case_events','Cases','cases','id','AOP_Case_Events','aop_case_events','case_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('44c37f4a-b8ce-447c-e1df-52a682e46b89','aop_case_updates_modified_user','Users','users','id','AOP_Case_Updates','aop_case_updates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('45725b87-1b68-a370-9759-52a682b682d8','aop_case_updates_created_by','Users','users','id','AOP_Case_Updates','aop_case_updates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('479b602c-4b57-1e9a-a078-52a68254731e','aop_case_updates_assigned_user','Users','users','id','AOP_Case_Updates','aop_case_updates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('47efbc4e-612a-9dfa-e6fd-52a682ee59bc','cases_aop_case_updates','Cases','cases','id','AOP_Case_Updates','aop_case_updates','case_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('4859daa7-a392-ea44-45ea-52a6826c26ad','aop_case_updates_notes','AOP_Case_Updates','aop_case_updates','id','Notes','notes','parent_id',NULL,NULL,NULL,'one-to-many','parent_type','AOP_Case_Updates',0,0),('52edf2ce-3a5d-19aa-f69f-52a6827557f4','fp_events_modified_user','Users','users','id','FP_events','fp_events','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('535a942f-ff68-bcc4-61f5-52a68283187a','fp_events_created_by','Users','users','id','FP_events','fp_events','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('53c86275-298d-dcd8-1a21-52a682b8a66a','fp_events_assigned_user','Users','users','id','FP_events','fp_events','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('595b92e0-cd06-12ca-a7cf-52a6823cffa1','fp_event_locations_modified_user','Users','users','id','FP_Event_Locations','fp_event_locations','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5a39845c-5fc6-67cd-6496-52a6820a570c','fp_event_locations_created_by','Users','users','id','FP_Event_Locations','fp_event_locations','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5a7dfe6e-0fc9-ec24-8362-52a682c2f430','fp_event_locations_assigned_user','Users','users','id','FP_Event_Locations','fp_event_locations','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('5abfaee3-8e54-19dc-d152-52a682329825','optimistic_locking',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('5b240cb6-f314-d68e-f5e6-52a68296daf8','unified_search',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),('61c45481-62fa-8081-034d-52a682f47cfb','calls_reschedule_modified_user','Users','users','id','Calls_Reschedule','calls_reschedule','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('61f857f3-df8d-7b8f-6333-52a682c80cfa','calls_reschedule_created_by','Users','users','id','Calls_Reschedule','calls_reschedule','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('623fb4e1-974b-39f8-fff4-52a682a8b114','calls_reschedule_assigned_user','Users','users','id','Calls_Reschedule','calls_reschedule','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6a0b3445-dff8-6cca-7c16-52a682ca05e9','aos_contracts_modified_user','Users','users','id','AOS_Contracts','aos_contracts','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6a4f2eef-8c4b-5f52-3417-52a682e7a353','aos_contracts_created_by','Users','users','id','AOS_Contracts','aos_contracts','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6a9c5d50-5e07-c2d9-0644-52a6825b0406','aos_contracts_assigned_user','Users','users','id','AOS_Contracts','aos_contracts','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('6b79c851-02ea-6c9c-4184-52a682705fb2','aos_contracts_aos_product_quotes','AOS_Contracts','aos_contracts','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('73810dbc-ef98-8f22-7f3d-52a682c837f2','aos_invoices_modified_user','Users','users','id','AOS_Invoices','aos_invoices','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('74aad64b-969a-8565-e470-52a682d64d06','aos_invoices_created_by','Users','users','id','AOS_Invoices','aos_invoices','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('74f2d644-ab52-5fc8-a1cf-52a682a47713','aos_invoices_assigned_user','Users','users','id','AOS_Invoices','aos_invoices','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('753cfe6c-858b-09f1-7b26-52a6829fe8b8','aos_invoices_aos_product_quotes','AOS_Invoices','aos_invoices','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7ca9dddf-343f-f2a7-0b8e-52a682ba2dc0','aos_pdf_templates_modified_user','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7ce32e86-c474-b044-82e6-52a682d71d5d','aos_pdf_templates_created_by','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('7d10e5d1-6156-d703-f254-52a68272f661','aos_pdf_templates_assigned_user','Users','users','id','AOS_PDF_Templates','aos_pdf_templates','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('81964661-beed-cb26-ed4f-52a6828290e6','aos_product_categories_modified_user','Users','users','id','AOS_Product_Categories','aos_product_categories','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('81ceb1c8-9027-f3b3-d693-52a6829c8d00','aos_product_categories_created_by','Users','users','id','AOS_Product_Categories','aos_product_categories','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('81fcf017-557d-dc4d-cd7a-52a682d2ee81','aos_product_categories_assigned_user','Users','users','id','AOS_Product_Categories','aos_product_categories','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8235517a-8576-63e1-bd74-52a68263da90','sub_product_categories','AOS_Product_Categories','aos_product_categories','id','AOS_Product_Categories','aos_product_categories','parent_category_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('868d714a-25ad-e53b-9bb9-52a6829bf034','aos_products_modified_user','Users','users','id','AOS_Products','aos_products','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('86d96496-d108-c9a9-f3e7-52a682210cde','aos_products_created_by','Users','users','id','AOS_Products','aos_products','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('876eddf8-107b-ad23-cdf3-52a682cce320','aos_products_assigned_user','Users','users','id','AOS_Products','aos_products','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('87b35ad7-c1bf-d529-9057-52a68220ec41','product_categories','AOS_Product_Categories','aos_product_categories','id','AOS_Products','aos_products','aos_product_category_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8df1dbff-f872-d09e-7ed7-52a682f27f5e','aos_products_quotes_modified_user','Users','users','id','AOS_Products_Quotes','aos_products_quotes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8e3559fb-a0dd-a481-8e0e-52a682662d5a','aos_products_quotes_created_by','Users','users','id','AOS_Products_Quotes','aos_products_quotes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8e75e0c5-022c-ea03-9dca-52a682670545','aos_products_quotes_assigned_user','Users','users','id','AOS_Products_Quotes','aos_products_quotes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('8ec6bc98-3438-9274-9b87-52a682b9a316','aos_product_quotes_aos_products','AOS_Products','aos_products','id','AOS_Products_Quotes','aos_products_quotes','product_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('949aafd4-3c37-2c99-352b-52a68298afa6','aos_line_item_groups_modified_user','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('94cf22f4-eba3-2505-65d5-52a6829b1f83','aos_line_item_groups_created_by','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9500f245-361a-d0e0-1e85-52a6826f5e90','aos_line_item_groups_assigned_user','Users','users','id','AOS_Line_Item_Groups','aos_line_item_groups','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9b9e24c9-f474-a1a5-c947-52a682c7e9b0','aos_quotes_modified_user','Users','users','id','AOS_Quotes','aos_quotes','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9bd3a448-e8a5-58d2-3d31-52a682bbed6b','aos_quotes_created_by','Users','users','id','AOS_Quotes','aos_quotes','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9c053f12-1a4e-5e24-e6d9-52a682746dd1','aos_quotes_assigned_user','Users','users','id','AOS_Quotes','aos_quotes','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('9c68f458-9dff-55d4-7bb4-52a68220fd7f','aos_quotes_aos_product_quotes','AOS_Quotes','aos_quotes','id','AOS_Products_Quotes','aos_products_quotes','parent_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a146c520-819b-f6d5-56c4-52a68211d9ef','securitygroups_modified_user','Users','users','id','SecurityGroups','securitygroups','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a18cb175-4350-e021-6714-52a6829ef8fb','securitygroups_created_by','Users','users','id','SecurityGroups','securitygroups','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('a37090dc-7653-e1b1-df22-52a682c9f0e5','securitygroups_assigned_user','Users','users','id','SecurityGroups','securitygroups','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b9660e5c-109f-8a11-38fc-52a682bfc704','jjwg_maps_modified_user','Users','users','id','jjwg_Maps','jjwg_maps','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('b9eae146-505a-22ba-0f08-52a682a04cae','jjwg_maps_created_by','Users','users','id','jjwg_Maps','jjwg_maps','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ba23509a-de19-aa3f-c457-52a68276e4e5','jjwg_maps_assigned_user','Users','users','id','jjwg_Maps','jjwg_maps','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('c9cc65a1-46d2-1bf7-67ac-52a6822635b7','jjwg_markers_modified_user','Users','users','id','jjwg_Markers','jjwg_markers','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ca199d8e-2232-aea9-10ba-52a68261bd11','jjwg_markers_created_by','Users','users','id','jjwg_Markers','jjwg_markers','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ca5dfc89-9e45-faa6-6168-52a68289fa6a','jjwg_markers_assigned_user','Users','users','id','jjwg_Markers','jjwg_markers','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d4735fc1-0fa9-3bb4-1f2a-52a6821f1796','jjwg_areas_modified_user','Users','users','id','jjwg_Areas','jjwg_areas','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d4bc7729-b0c2-4bfe-7b8b-52a6820da268','jjwg_areas_created_by','Users','users','id','jjwg_Areas','jjwg_areas','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('d5046f42-808a-9dac-581f-52a6824691d5','jjwg_areas_assigned_user','Users','users','id','jjwg_Areas','jjwg_areas','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('dfdb9f4c-7f05-ade1-7270-52a682bdd8cf','jjwg_address_cache_modified_user','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e038ffc8-69ce-a92d-9558-52a6822d8f4b','jjwg_address_cache_created_by','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e084e9aa-e47f-a3ca-0cde-52a682b6930d','jjwg_address_cache_assigned_user','Users','users','id','jjwg_Address_Cache','jjwg_address_cache','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e2c9bd65-5bba-2c9d-0487-52a682c93cd7','aow_actions_modified_user','Users','users','id','AOW_Actions','aow_actions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e30878e0-cfd0-ee23-de6e-52a682363720','aow_actions_created_by','Users','users','id','AOW_Actions','aow_actions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e6287f5d-6de1-798c-fbfa-52a6823ad9e5','aow_workflow_modified_user','Users','users','id','AOW_WorkFlow','aow_workflow','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e65f4ba7-dccc-374c-396d-52a6820bbf5a','aow_workflow_created_by','Users','users','id','AOW_WorkFlow','aow_workflow','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e691a476-8b7b-07b5-2471-52a6828df447','aow_workflow_assigned_user','Users','users','id','AOW_WorkFlow','aow_workflow','assigned_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e6c4942f-6631-7835-3a04-52a6824a402f','aow_workflow_aow_conditions','AOW_WorkFlow','aow_workflow','id','AOW_Conditions','aow_conditions','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e6f9be52-5323-8af4-afed-52a6825d0173','aow_workflow_aow_actions','AOW_WorkFlow','aow_workflow','id','AOW_Actions','aow_actions','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e72c3fb4-92ff-8265-fddb-52a682314cb4','aow_workflow_aow_processed','AOW_WorkFlow','aow_workflow','id','AOW_Processed','aow_processed','aow_workflow_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('e9ce01bf-865b-f8cb-0b69-52a68229f81c','aow_processed_modified_user','Users','users','id','AOW_Processed','aow_processed','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ea197053-8c3b-b611-2ed7-52a68235cd61','aow_processed_created_by','Users','users','id','AOW_Processed','aow_processed','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ed398bc3-337a-6f7d-ce15-52a68209d45c','aow_conditions_modified_user','Users','users','id','AOW_Conditions','aow_conditions','modified_user_id',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('ed6e082d-f4f9-a1ff-08c0-52a68247a966','aow_conditions_created_by','Users','users','id','AOW_Conditions','aow_conditions','created_by',NULL,NULL,NULL,'one-to-many',NULL,NULL,0,0),('3414f5b3-5db4-7129-aa62-52a6826d0428','accounts_bugs','Accounts','accounts','id','Bugs','bugs','id','accounts_bugs','account_id','bug_id','many-to-many',NULL,NULL,0,0),('34c5cd97-739d-6fc8-e98b-52a68291719a','accounts_contacts','Accounts','accounts','id','Contacts','contacts','id','accounts_contacts','account_id','contact_id','many-to-many',NULL,NULL,0,0),('3514e38c-7dda-c550-4e73-52a682b3eed2','accounts_opportunities','Accounts','accounts','id','Opportunities','opportunities','id','accounts_opportunities','account_id','opportunity_id','many-to-many',NULL,NULL,0,0),('356e2470-2fab-9dc4-bf21-52a682e34c20','calls_contacts','Calls','calls','id','Contacts','contacts','id','calls_contacts','call_id','contact_id','many-to-many',NULL,NULL,0,0),('35f4b981-ed68-9847-fdf0-52a6829483fd','calls_users','Calls','calls','id','Users','users','id','calls_users','call_id','user_id','many-to-many',NULL,NULL,0,0),('3670b557-ea5c-0341-17ea-52a682dfadcf','calls_leads','Calls','calls','id','Leads','leads','id','calls_leads','call_id','lead_id','many-to-many',NULL,NULL,0,0),('36c1e0bc-ee77-2968-c4d3-52a682d1a407','cases_bugs','Cases','cases','id','Bugs','bugs','id','cases_bugs','case_id','bug_id','many-to-many',NULL,NULL,0,0),('371764bd-952e-cc05-11c3-52a682cf689b','contacts_bugs','Contacts','contacts','id','Bugs','bugs','id','contacts_bugs','contact_id','bug_id','many-to-many',NULL,NULL,0,0),('3781167b-19b3-b3ff-de04-52a68289dd27','contacts_cases','Contacts','contacts','id','Cases','cases','id','contacts_cases','contact_id','case_id','many-to-many',NULL,NULL,0,0),('37e48069-474b-becc-f75a-52a6827dde87','contacts_users','Contacts','contacts','id','Users','users','id','contacts_users','contact_id','user_id','many-to-many',NULL,NULL,0,0),('386bd837-7084-2b33-5128-52a68265728f','emails_bugs_rel','Emails','emails','id','Bugs','bugs','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Bugs',0,0),('38a2b318-0f9f-c460-d867-52a682b53b3b','emails_cases_rel','Emails','emails','id','Cases','cases','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Cases',0,0),('391f824b-c305-fe77-7366-52a68214bb08','emails_opportunities_rel','Emails','emails','id','Opportunities','opportunities','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Opportunities',0,0),('3966e6ab-173c-9cca-cbcd-52a682b02316','emails_tasks_rel','Emails','emails','id','Tasks','tasks','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Tasks',0,0),('39aa8986-c2b3-2e10-7fd9-52a6823f80e4','emails_users_rel','Emails','emails','id','Users','users','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Users',0,0),('39f5c872-6b8a-1796-6df6-52a6826ffb60','emails_project_task_rel','Emails','emails','id','ProjectTask','project_task','id','emails_beans','email_id','bean_id','many-to-many','bean_module','ProjectTask',0,0),('3a4082bf-353e-2493-38a7-52a6825c5ac5','emails_projects_rel','Emails','emails','id','Project','project','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Project',0,0),('3a909a7e-ae73-b713-2040-52a68277d94c','emails_prospects_rel','Emails','emails','id','Prospects','prospects','id','emails_beans','email_id','bean_id','many-to-many','bean_module','Prospects',0,0),('3ae145ef-e9bb-56df-bcfd-52a682732ec1','meetings_contacts','Meetings','meetings','id','Contacts','contacts','id','meetings_contacts','meeting_id','contact_id','many-to-many',NULL,NULL,0,0),('3b2bf173-014a-4f62-bfee-52a6821cabd4','meetings_users','Meetings','meetings','id','Users','users','id','meetings_users','meeting_id','user_id','many-to-many',NULL,NULL,0,0),('3b817a4c-1b98-2e08-fbcf-52a682d0343a','meetings_leads','Meetings','meetings','id','Leads','leads','id','meetings_leads','meeting_id','lead_id','many-to-many',NULL,NULL,0,0),('3bce2545-9610-36d0-158e-52a6823587cb','opportunities_contacts','Opportunities','opportunities','id','Contacts','contacts','id','opportunities_contacts','opportunity_id','contact_id','many-to-many',NULL,NULL,0,0),('3c23f9ec-d747-1ec5-4e58-52a682e9118f','prospect_list_campaigns','ProspectLists','prospect_lists','id','Campaigns','campaigns','id','prospect_list_campaigns','prospect_list_id','campaign_id','many-to-many',NULL,NULL,0,0),('3c714098-8329-8aa7-b04f-52a6825e8b8d','prospect_list_contacts','ProspectLists','prospect_lists','id','Contacts','contacts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Contacts',0,0),('3cb5496a-93fb-3ce3-bb4a-52a68208541f','prospect_list_prospects','ProspectLists','prospect_lists','id','Prospects','prospects','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Prospects',0,0),('3cfb84cc-93d9-1c03-08c2-52a6822a67c0','prospect_list_leads','ProspectLists','prospect_lists','id','Leads','leads','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Leads',0,0),('3d3fa46d-e872-62bf-6022-52a6826301e2','prospect_list_users','ProspectLists','prospect_lists','id','Users','users','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Users',0,0),('3d92f16f-e0cc-f4af-0881-52a6827812f4','prospect_list_accounts','ProspectLists','prospect_lists','id','Accounts','accounts','id','prospect_lists_prospects','prospect_list_id','related_id','many-to-many','related_type','Accounts',0,0),('3dda7666-a5ee-6f4d-0176-52a682ded826','roles_users','Roles','roles','id','Users','users','id','roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('3e287c29-f20d-f7ff-bef9-52a682aa323f','projects_bugs','Project','project','id','Bugs','bugs','id','projects_bugs','project_id','bug_id','many-to-many',NULL,NULL,0,0),('3e7a2f2d-b879-4337-adce-52a682031bca','projects_cases','Project','project','id','Cases','cases','id','projects_cases','project_id','case_id','many-to-many',NULL,NULL,0,0),('3ecf13da-a00c-4441-d105-52a68269c97e','projects_accounts','Project','project','id','Accounts','accounts','id','projects_accounts','project_id','account_id','many-to-many',NULL,NULL,0,0),('3f0f969b-7561-7db0-bb8a-52a682de5f39','projects_contacts','Project','project','id','Contacts','contacts','id','projects_contacts','project_id','contact_id','many-to-many',NULL,NULL,0,0),('3f504690-1821-6e04-5254-52a68272ad3e','projects_opportunities','Project','project','id','Opportunities','opportunities','id','projects_opportunities','project_id','opportunity_id','many-to-many',NULL,NULL,0,0),('3f8f8509-a2af-1020-ec9d-52a682656687','acl_roles_actions','ACLRoles','acl_roles','id','ACLActions','acl_actions','id','acl_roles_actions','role_id','action_id','many-to-many',NULL,NULL,0,0),('3fd7a927-afb4-c54e-5045-52a682c837e7','acl_roles_users','ACLRoles','acl_roles','id','Users','users','id','acl_roles_users','role_id','user_id','many-to-many',NULL,NULL,0,0),('401c8d50-77b9-a870-c7b6-52a6828091e2','email_marketing_prospect_lists','EmailMarketing','email_marketing','id','ProspectLists','prospect_lists','id','email_marketing_prospect_lists','email_marketing_id','prospect_list_id','many-to-many',NULL,NULL,0,0),('4064dc94-19f5-945d-4549-52a682db7c30','leads_documents','Leads','leads','id','Documents','documents','id','linked_documents','parent_id','document_id','many-to-many','parent_type','Leads',0,0),('40a8144c-c350-3d41-e8e6-52a682128bd5','documents_accounts','Documents','documents','id','Accounts','accounts','id','documents_accounts','document_id','account_id','many-to-many',NULL,NULL,0,0),('40e44fb6-a0e7-5a93-5fc3-52a682defb9d','documents_contacts','Documents','documents','id','Contacts','contacts','id','documents_contacts','document_id','contact_id','many-to-many',NULL,NULL,0,0),('4120d2c7-f179-3d36-b8c6-52a6826e7caf','documents_opportunities','Documents','documents','id','Opportunities','opportunities','id','documents_opportunities','document_id','opportunity_id','many-to-many',NULL,NULL,0,0),('415f6f16-8ef8-4602-f7f1-52a682cccd3d','documents_cases','Documents','documents','id','Cases','cases','id','documents_cases','document_id','case_id','many-to-many',NULL,NULL,0,0),('4197fed5-d00b-8f2f-82d5-52a682f13295','documents_bugs','Documents','documents','id','Bugs','bugs','id','documents_bugs','document_id','bug_id','many-to-many',NULL,NULL,0,0),('41d34888-bf68-3c4d-13b6-52a682d85189','aos_quotes_aos_invoices','AOS_Quotes','aos_quotes','id','AOS_Invoices','aos_invoices','id','aos_quotes_aos_invoices_c','aos_quotes77d9_quotes_ida','aos_quotes6b83nvoices_idb','many-to-many',NULL,NULL,0,0),('421514d5-6fb8-0333-eff3-52a682c34a99','fp_events_contacts','FP_events','fp_events','id','Contacts','contacts','id','fp_events_contacts_c','fp_events_contactsfp_events_ida','fp_events_contactscontacts_idb','many-to-many',NULL,NULL,0,0),('425bb487-9f30-6a72-1b29-52a6827dee3d','aos_quotes_aos_contracts','AOS_Quotes','aos_quotes','id','AOS_Contracts','aos_contracts','id','aos_quotes_os_contracts_c','aos_quotese81e_quotes_ida','aos_quotes4dc0ntracts_idb','many-to-many',NULL,NULL,0,0),('42a587de-df80-1234-e503-52a682fe8d6e','aos_quotes_project','AOS_Quotes','aos_quotes','id','Project','project','id','aos_quotes_project_c','aos_quotes1112_quotes_ida','aos_quotes7207project_idb','many-to-many',NULL,NULL,0,0),('43127b04-8a12-14d3-41c1-52a682dec829','fp_events_leads_1','FP_events','fp_events','id','Leads','leads','id','fp_events_leads_1_c','fp_events_leads_1fp_events_ida','fp_events_leads_1leads_idb','many-to-many',NULL,NULL,0,0),('435405ef-90d6-eefa-9df9-52a6826f550c','fp_events_prospects_1','FP_events','fp_events','id','Prospects','prospects','id','fp_events_prospects_1_c','fp_events_prospects_1fp_events_ida','fp_events_prospects_1prospects_idb','many-to-many',NULL,NULL,0,0),('438d1ee3-7223-fe3c-9252-52a682d27962','jjwg_maps_jjwg_markers','jjwg_Maps','jjwg_maps','id','jjwg_Markers','jjwg_markers','id','jjwg_maps_jjwg_markers_c','jjwg_maps_b229wg_maps_ida','jjwg_maps_2e31markers_idb','many-to-many',NULL,NULL,0,0),('43c14baa-18ae-ac65-da7c-52a6821d6127','aos_contracts_documents','AOS_Contracts','aos_contracts','id','Documents','documents','id','aos_contracts_documents','aos_contracts_id','documents_id','many-to-many',NULL,NULL,0,0),('43f7c346-04c5-392a-833b-52a682748932','securitygroups_users','SecurityGroups','securitygroups','id','Users','users','id','securitygroups_users','securitygroup_id','user_id','many-to-many',NULL,NULL,0,0),('442af975-4041-d7a7-780f-52a68263478b','jjwg_maps_jjwg_areas','jjwg_Maps','jjwg_maps','id','jjwg_Areas','jjwg_areas','id','jjwg_maps_jjwg_areas_c','jjwg_maps_5304wg_maps_ida','jjwg_maps_41f2g_areas_idb','many-to-many',NULL,NULL,0,0),('4460b977-badb-ad5c-34cc-52a682f03676','fp_events_fp_event_locations_1','FP_events','fp_events','id','FP_Event_Locations','fp_event_locations','id','fp_events_fp_event_locations_1_c','fp_events_fp_event_locations_1fp_events_ida','fp_events_fp_event_locations_1fp_event_locations_idb','many-to-many',NULL,NULL,0,0),('4495d182-e0c2-0977-f14d-52a6826c4c25','fp_event_locations_fp_events_1','FP_Event_Locations','fp_event_locations','id','FP_events','fp_events','id','fp_event_locations_fp_events_1_c','fp_event_locations_fp_events_1fp_event_locations_ida','fp_event_locations_fp_events_1fp_events_idb','many-to-many',NULL,NULL,0,0),('44c962c4-6280-42aa-a0fb-52a682fdf306','aow_processed_aow_actions','AOW_Processed','aow_processed','id','AOW_Actions','aow_actions','id','aow_processed_aow_actions','aow_processed_id','aow_action_id','many-to-many',NULL,NULL,0,0),('44fe2a5f-174c-8670-5f39-52a6826249bb','securitygroups_acl_roles','SecurityGroups','securitygroups','id','ACLRoles','acl_roles','id','securitygroups_acl_roles','securitygroup_id','role_id','many-to-many',NULL,NULL,0,0),('45433fbb-4fe9-234b-5165-52a6829be622','securitygroups_accounts','SecurityGroups','securitygroups','id','Accounts','accounts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Accounts',0,0),('45751883-6c8b-5206-b880-52a682dfd93c','securitygroups_bugs','SecurityGroups','securitygroups','id','Bugs','bugs','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Bugs',0,0),('45a5b899-9d4f-6c6f-c9b4-52a6820c300d','securitygroups_calls','SecurityGroups','securitygroups','id','Calls','calls','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Calls',0,0),('45d83930-9c03-3196-c114-52a68266594a','securitygroups_campaigns','SecurityGroups','securitygroups','id','Campaigns','campaigns','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Campaigns',0,0),('46095a84-5758-e1b7-4317-52a6827b8290','securitygroups_cases','SecurityGroups','securitygroups','id','Cases','cases','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Cases',0,0),('463b7033-662a-a5c7-5ee0-52a682934974','securitygroups_contacts','SecurityGroups','securitygroups','id','Contacts','contacts','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Contacts',0,0),('466cd32c-c989-351e-f8a9-52a6823467b3','securitygroups_documents','SecurityGroups','securitygroups','id','Documents','documents','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Documents',0,0),('46a5b3ac-9a83-3356-613d-52a6824b655d','securitygroups_emails','SecurityGroups','securitygroups','id','Emails','emails','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Emails',0,0),('46d81520-b8f0-af2e-fcb8-52a6829eb77e','securitygroups_emailtemplates','SecurityGroups','securitygroups','id','EmailTemplates','email_templates','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','EmailTemplates',0,0),('470e07dd-c29b-c4a8-4c5a-52a682ae3710','securitygroups_leads','SecurityGroups','securitygroups','id','Leads','leads','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Leads',0,0),('4740d349-8da9-874e-bcd2-52a682fcb52e','securitygroups_meetings','SecurityGroups','securitygroups','id','Meetings','meetings','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Meetings',0,0),('47778db7-c935-73ea-1d6d-52a682228817','securitygroups_notes','SecurityGroups','securitygroups','id','Notes','notes','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Notes',0,0),('47b18a46-2abc-dbb0-0ec1-52a682d24298','securitygroups_opportunities','SecurityGroups','securitygroups','id','Opportunities','opportunities','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Opportunities',0,0),('47ef1227-da26-d5f9-9a8d-52a68291143b','securitygroups_project','SecurityGroups','securitygroups','id','Project','project','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Project',0,0),('482206a2-8657-8f99-2de4-52a682ec0223','securitygroups_project_task','SecurityGroups','securitygroups','id','ProjectTask','project_task','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProjectTask',0,0),('485c102a-0d15-717f-f669-52a6826765fb','securitygroups_prospect_lists','SecurityGroups','securitygroups','id','ProspectLists','prospect_lists','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','ProspectLists',0,0),('4891b5d6-5c5d-b50a-9d5d-52a682058fcf','securitygroups_prospects','SecurityGroups','securitygroups','id','Prospects','prospects','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Prospects',0,0),('48ca59da-cc4f-1512-44da-52a682985f45','securitygroups_tasks','SecurityGroups','securitygroups','id','Tasks','tasks','id','securitygroups_records','securitygroup_id','record_id','many-to-many','module','Tasks',0,0);
/*!40000 ALTER TABLE `relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `releases`
--

DROP TABLE IF EXISTS `releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `releases`
--

LOCK TABLES `releases` WRITE;
/*!40000 ALTER TABLE `releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `modules` text,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_modules`
--

DROP TABLE IF EXISTS `roles_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT '0',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_modules`
--

LOCK TABLES `roles_modules` WRITE;
/*!40000 ALTER TABLE `roles_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_search`
--

DROP TABLE IF EXISTS `saved_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_search`
--

LOCK TABLES `saved_search` WRITE;
/*!40000 ALTER TABLE `saved_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulers`
--

DROP TABLE IF EXISTS `schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulers`
--

LOCK TABLES `schedulers` WRITE;
/*!40000 ALTER TABLE `schedulers` DISABLE KEYS */;
INSERT INTO `schedulers` VALUES ('d4fb3fb5-5de6-ec51-4bb9-52a66b10c895',0,'2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','Prune Tracker Tables','function::trimTracker','2005-01-01 10:45:01','2020-12-31 23:59:59','0::2::1::*::*',NULL,NULL,NULL,'Active',1),('d8f07bb1-8683-36a1-fd3b-52a66bba73a2',0,'2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','Check Inbound Mailboxes','function::pollMonitoredInboxes','2005-01-01 15:00:01','2020-12-31 23:59:59','*::*::*::*::*',NULL,NULL,'2013-12-10 03:02:02','Active',0),('da03a7f4-41e9-e40a-e133-52a66b3514fd',0,'2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','Run Nightly Process Bounced Campaign Emails','function::pollMonitoredInboxesForBouncedCampaignEmails','2005-01-01 15:45:01','2020-12-31 23:59:59','0::2-6::*::*::*',NULL,NULL,'2013-12-10 02:00:02','Active',1),('dbd114f9-9648-40f6-747c-52a66befdb48',0,'2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','Run Nightly Mass Email Campaigns','function::runMassEmailCampaign','2005-01-01 18:45:01','2020-12-31 23:59:59','0::2-6::*::*::*',NULL,NULL,'2013-12-10 02:00:02','Active',1),('ddc268a2-cd11-1361-fe51-52a66bc6e359',0,'2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','Prune Database on 1st of Month','function::pruneDatabase','2005-01-01 14:15:01','2020-12-31 23:59:59','0::4::1::*::*',NULL,NULL,NULL,'Inactive',0),('df75ed13-b4ee-d602-e55f-52a66bf904a3',0,'2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','Run Email Reminder Notifications','function::sendEmailReminders','2008-01-01 12:30:01','2020-12-31 23:59:59','*::*::*::*::*',NULL,NULL,'2013-12-10 03:02:02','Active',0),('e175094f-9699-ca7f-a61f-52a66bd7ebc7',0,'2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','Clean Jobs Queue','function::cleanJobQueue','2012-01-01 08:00:01','2030-12-31 23:59:59','0::5::*::*::*',NULL,NULL,NULL,'Active',0),('e21a7410-829b-b718-e67b-52a66b0b4d87',0,'2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','Removal of documents from filesystem','function::removeDocumentsFromFS','2012-01-01 19:00:01','2030-12-31 23:59:59','0::3::1::*::*',NULL,NULL,NULL,'Active',0),('e3d3c84a-be19-fffc-0c8f-52a66b64394a',0,'2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','Prune SugarFeed Tables','function::trimSugarFeeds','2005-01-01 08:30:01','2020-12-31 23:59:59','0::2::1::*::*',NULL,NULL,NULL,'Active',1),('d4c8cfa9-f065-a4a0-a67e-52a66be9d560',0,'2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','Run AOW WorkFlow','function::processAOW_Workflow','2005-01-01 07:15:01','2020-12-31 23:59:59','*::*::*::*::*',NULL,NULL,NULL,'Active',0);
/*!40000 ALTER TABLE `schedulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups`
--

DROP TABLE IF EXISTS `securitygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups`
--

LOCK TABLES `securitygroups` WRITE;
/*!40000 ALTER TABLE `securitygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_acl_roles`
--

DROP TABLE IF EXISTS `securitygroups_acl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_acl_roles` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `role_id` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_acl_roles`
--

LOCK TABLES `securitygroups_acl_roles` WRITE;
/*!40000 ALTER TABLE `securitygroups_acl_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_acl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_audit`
--

DROP TABLE IF EXISTS `securitygroups_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text,
  `after_value_text` text,
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_audit`
--

LOCK TABLES `securitygroups_audit` WRITE;
/*!40000 ALTER TABLE `securitygroups_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_default`
--

DROP TABLE IF EXISTS `securitygroups_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_default` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_default`
--

LOCK TABLES `securitygroups_default` WRITE;
/*!40000 ALTER TABLE `securitygroups_default` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_records`
--

DROP TABLE IF EXISTS `securitygroups_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_records` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `record_id` char(36) DEFAULT NULL,
  `module` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_records_mod` (`module`,`deleted`,`record_id`,`securitygroup_id`),
  KEY `idx_securitygroups_records_del` (`deleted`,`record_id`,`module`,`securitygroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_records`
--

LOCK TABLES `securitygroups_records` WRITE;
/*!40000 ALTER TABLE `securitygroups_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `securitygroups_users`
--

DROP TABLE IF EXISTS `securitygroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `securitygroups_users` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `securitygroup_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `primary_group` tinyint(1) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `securitygroups_users_idxa` (`securitygroup_id`),
  KEY `securitygroups_users_idxb` (`user_id`),
  KEY `securitygroups_users_idxc` (`user_id`,`deleted`,`securitygroup_id`,`id`),
  KEY `securitygroups_users_idxd` (`user_id`,`deleted`,`securitygroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `securitygroups_users`
--

LOCK TABLES `securitygroups_users` WRITE;
/*!40000 ALTER TABLE `securitygroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `securitygroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sugarfeed`
--

DROP TABLE IF EXISTS `sugarfeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sugarfeed`
--

LOCK TABLES `sugarfeed` WRITE;
/*!40000 ALTER TABLE `sugarfeed` DISABLE KEYS */;
/*!40000 ALTER TABLE `sugarfeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text,
  `deleted` tinyint(1) DEFAULT '0',
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT '0',
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracker`
--

DROP TABLE IF EXISTS `tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracker`
--

LOCK TABLES `tracker` WRITE;
/*!40000 ALTER TABLE `tracker` DISABLE KEYS */;
INSERT INTO `tracker` VALUES (4,'f1191c34-2dca-ce7e-28db-52a67fb5cc11','1','Users','1','Daniel Blanco','2013-12-10 02:42:46','editview','hakdmsse12cr3lli9nmu7vv3q4',1,0);
/*!40000 ALTER TABLE `tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgrade_history`
--

DROP TABLE IF EXISTS `upgrade_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgrade_history`
--

LOCK TABLES `upgrade_history` WRITE;
/*!40000 ALTER TABLE `upgrade_history` DISABLE KEYS */;
INSERT INTO `upgrade_history` VALUES ('13507620-348b-d48f-7ccb-52a678bf3840','upload/upgrades/module/6516_Basic_SecuritySuite_268.zip','28d8d7b787df50615eca66a5def6c2c2','module','installed','2.6.8','SecurityGroups - Basic Edition','Assign Security Groups to records to control access','SecurityGroups','YTozOntzOjg6Im1hbmlmZXN0IjthOjEzOntzOjI1OiJhY2NlcHRhYmxlX3N1Z2FyX3ZlcnNpb25zIjthOjE6e3M6MTM6ImV4YWN0X21hdGNoZXMiO2E6MTp7aTowO3M6NjoiNi41LjE2Ijt9fXM6MjQ6ImFjY2VwdGFibGVfc3VnYXJfZmxhdm9ycyI7YToxOntpOjA7czoyOiJDRSI7fXM6NjoicmVhZG1lIjtzOjA6IiI7czozOiJrZXkiO3M6MDoiIjtzOjY6ImF1dGhvciI7czo0MDoiSmFzb24gRWdnZXJzIChlZ2dzdXJwbHVzIHNvbHV0aW9ucywgTExDKSI7czoxMToiZGVzY3JpcHRpb24iO3M6NTE6IkFzc2lnbiBTZWN1cml0eSBHcm91cHMgdG8gcmVjb3JkcyB0byBjb250cm9sIGFjY2VzcyI7czo0OiJpY29uIjtzOjA6IiI7czoxNjoiaXNfdW5pbnN0YWxsYWJsZSI7YjoxO3M6NDoibmFtZSI7czozMDoiU2VjdXJpdHlHcm91cHMgLSBCYXNpYyBFZGl0aW9uIjtzOjE0OiJwdWJsaXNoZWRfZGF0ZSI7czoxMDoiMTAvMjkvMjAxMyI7czo0OiJ0eXBlIjtzOjY6Im1vZHVsZSI7czo3OiJ2ZXJzaW9uIjtzOjU6IjIuNi44IjtzOjEzOiJyZW1vdmVfdGFibGVzIjtzOjY6InByb21wdCI7fXM6MTE6Imluc3RhbGxkZWZzIjthOjExOntzOjI6ImlkIjtzOjE0OiJTZWN1cml0eUdyb3VwcyI7czo1OiJiZWFucyI7YToxOntpOjA7YTo0OntzOjY6Im1vZHVsZSI7czoxNDoiU2VjdXJpdHlHcm91cHMiO3M6NToiY2xhc3MiO3M6MTM6IlNlY3VyaXR5R3JvdXAiO3M6NDoicGF0aCI7czo0MDoibW9kdWxlcy9TZWN1cml0eUdyb3Vwcy9TZWN1cml0eUdyb3VwLnBocCI7czozOiJ0YWIiO2I6MTt9fXM6OToiaW1hZ2VfZGlyIjtzOjE2OiI8YmFzZXBhdGg+L2ljb25zIjtzOjQ6ImNvcHkiO2E6Mjk6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo0NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9tb2R1bGVzL1NlY3VyaXR5R3JvdXBzIjtzOjI6InRvIjtzOjIyOiJtb2R1bGVzL1NlY3VyaXR5R3JvdXBzIjt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjQ0OiI8YmFzZXBhdGg+L2luY2x1ZGUvaW1hZ2VzL1NlY3VyaXR5R3JvdXBzLmdpZiI7czoyOiJ0byI7czo0MDoidGhlbWVzL2RlZmF1bHQvaW1hZ2VzL1NlY3VyaXR5R3JvdXBzLmdpZiI7fWk6MjthOjI6e3M6NDoiZnJvbSI7czo2NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9tb2R1bGVzL0FDTEFjdGlvbnMvYWN0aW9uZGVmcy5vdmVycmlkZS5waHAiO3M6MjoidG8iO3M6NDI6Im1vZHVsZXMvQUNMQWN0aW9ucy9hY3Rpb25kZWZzLm92ZXJyaWRlLnBocCI7fWk6MzthOjI6e3M6NDoiZnJvbSI7czo3NDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9jdXN0b20vbW9kdWxlcy9BQ0xSb2xlcy9tZXRhZGF0YS9kZXRhaWx2aWV3ZGVmcy5waHAiO3M6MjoidG8iO3M6NTE6ImN1c3RvbS9tb2R1bGVzL0FDTFJvbGVzL21ldGFkYXRhL2RldGFpbHZpZXdkZWZzLnBocCI7fWk6NDthOjI6e3M6NDoiZnJvbSI7czo3MjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9jdXN0b20vbW9kdWxlcy9BQ0xSb2xlcy9zdHlsZXMvc2VjdXJpdHlncm91cHMuY3NzIjtzOjI6InRvIjtzOjQ5OiJjdXN0b20vbW9kdWxlcy9BQ0xSb2xlcy9zdHlsZXMvc2VjdXJpdHlncm91cHMuY3NzIjt9aTo1O2E6Mjp7czo0OiJmcm9tIjtzOjY5OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2N1c3RvbS9tb2R1bGVzL0FDTFJvbGVzL3ZpZXdzL3ZpZXcuY2xhc3NpYy5waHAiO3M6MjoidG8iO3M6NDY6ImN1c3RvbS9tb2R1bGVzL0FDTFJvbGVzL3ZpZXdzL3ZpZXcuY2xhc3NpYy5waHAiO31pOjY7YToyOntzOjQ6ImZyb20iO3M6ODQ6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvY3VzdG9tL21vZHVsZXMvVXNlcnMvbWV0YWRhdGEvc3VicGFuZWxzL0ZvclNlY3VyaXR5R3JvdXBzLnBocCI7czoyOiJ0byI7czo2MToiY3VzdG9tL21vZHVsZXMvVXNlcnMvbWV0YWRhdGEvc3VicGFuZWxzL0ZvclNlY3VyaXR5R3JvdXBzLnBocCI7fWk6NzthOjI6e3M6NDoiZnJvbSI7czoxMDI6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvaW5jbHVkZS9nZW5lcmljL1N1Z2FyV2lkZ2V0cy9TdWdhcldpZGdldFN1YlBhbmVsRWRpdFNlY3VyaXR5R3JvdXBVc2VyQnV0dG9uLnBocCI7czoyOiJ0byI7czo3OToiaW5jbHVkZS9nZW5lcmljL1N1Z2FyV2lkZ2V0cy9TdWdhcldpZGdldFN1YlBhbmVsRWRpdFNlY3VyaXR5R3JvdXBVc2VyQnV0dG9uLnBocCI7fWk6ODthOjI6e3M6NDoiZnJvbSI7czo1NjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9ub3R1cGdyYWRlc2FmZS9kYXRhL1N1Z2FyQmVhbi5waHAiO3M6MjoidG8iO3M6MTg6ImRhdGEvU3VnYXJCZWFuLnBocCI7fWk6OTthOjI6e3M6NDoiZnJvbSI7czo3NjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9ub3R1cGdyYWRlc2FmZS9kYXRhL1JlbGF0aW9uc2hpcHMvTTJNUmVsYXRpb25zaGlwLnBocCI7czoyOiJ0byI7czozODoiZGF0YS9SZWxhdGlvbnNoaXBzL00yTVJlbGF0aW9uc2hpcC5waHAiO31pOjEwO2E6Mjp7czo0OiJmcm9tIjtzOjYyOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL25vdHVwZ3JhZGVzYWZlL2luY2x1ZGUvZXhwb3J0X3V0aWxzLnBocCI7czoyOiJ0byI7czoyNDoiaW5jbHVkZS9leHBvcnRfdXRpbHMucGhwIjt9aToxMTthOjI6e3M6NDoiZnJvbSI7czo1NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9ub3R1cGdyYWRlc2FmZS9pbmNsdWRlL3V0aWxzLnBocCI7czoyOiJ0byI7czoxNzoiaW5jbHVkZS91dGlscy5waHAiO31pOjEyO2E6Mjp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL25vdHVwZ3JhZGVzYWZlL2luY2x1ZGUvRGV0YWlsVmlldy9EZXRhaWxWaWV3LnBocCI7czoyOiJ0byI7czozMzoiaW5jbHVkZS9EZXRhaWxWaWV3L0RldGFpbFZpZXcucGhwIjt9aToxMzthOjI6e3M6NDoiZnJvbSI7czo2ODoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9ub3R1cGdyYWRlc2FmZS9pbmNsdWRlL0VkaXRWaWV3L0VkaXRWaWV3Mi5waHAiO3M6MjoidG8iO3M6MzA6ImluY2x1ZGUvRWRpdFZpZXcvRWRpdFZpZXcyLnBocCI7fWk6MTQ7YToyOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbm90dXBncmFkZXNhZmUvaW5jbHVkZS9MaXN0Vmlldy9MaXN0Vmlldy5waHAiO3M6MjoidG8iO3M6Mjk6ImluY2x1ZGUvTGlzdFZpZXcvTGlzdFZpZXcucGhwIjt9aToxNTthOjI6e3M6NDoiZnJvbSI7czo4NjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9ub3R1cGdyYWRlc2FmZS9pbmNsdWRlL1NtYXJ0eS9wbHVnaW5zL2Z1bmN0aW9uLnN1Z2FyX2J1dHRvbi5waHAiO3M6MjoidG8iO3M6NDg6ImluY2x1ZGUvU21hcnR5L3BsdWdpbnMvZnVuY3Rpb24uc3VnYXJfYnV0dG9uLnBocCI7fWk6MTY7YToyOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbm90dXBncmFkZXNhZmUvbW9kdWxlcy9BQ0wvQUNMQ29udHJvbGxlci5waHAiO3M6MjoidG8iO3M6Mjk6Im1vZHVsZXMvQUNML0FDTENvbnRyb2xsZXIucGhwIjt9aToxNzthOjI6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9ub3R1cGdyYWRlc2FmZS9tb2R1bGVzL0FDTEFjdGlvbnMvQUNMQWN0aW9uLnBocCI7czoyOiJ0byI7czozMjoibW9kdWxlcy9BQ0xBY3Rpb25zL0FDTEFjdGlvbi5waHAiO31pOjE4O2E6Mjp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL25vdHVwZ3JhZGVzYWZlL21vZHVsZXMvQUNMUm9sZXMvRWRpdEFsbEJvZHkudHBsIjtzOjI6InRvIjtzOjMyOiJtb2R1bGVzL0FDTFJvbGVzL0VkaXRBbGxCb2R5LnRwbCI7fWk6MTk7YToyOntzOjQ6ImZyb20iO3M6NjU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbm90dXBncmFkZXNhZmUvbW9kdWxlcy9DYW1wYWlnbnMvdXRpbHMucGhwIjtzOjI6InRvIjtzOjI3OiJtb2R1bGVzL0NhbXBhaWducy91dGlscy5waHAiO31pOjIwO2E6Mjp7czo0OiJmcm9tIjtzOjc3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL25vdHVwZ3JhZGVzYWZlL21vZHVsZXMvQ2FtcGFpZ25zL3ZpZXdzL3ZpZXcuZGV0YWlsLnBocCI7czoyOiJ0byI7czozOToibW9kdWxlcy9DYW1wYWlnbnMvdmlld3Mvdmlldy5kZXRhaWwucGhwIjt9aToyMTthOjI6e3M6NDoiZnJvbSI7czo2NDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9ub3R1cGdyYWRlc2FmZS9tb2R1bGVzL0VtYWlscy9FbWFpbFVJLnBocCI7czoyOiJ0byI7czoyNjoibW9kdWxlcy9FbWFpbHMvRW1haWxVSS5waHAiO31pOjIyO2E6Mjp7czo0OiJmcm9tIjtzOjczOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL25vdHVwZ3JhZGVzYWZlL21vZHVsZXMvRW1haWxUZW1wbGF0ZXMvRWRpdFZpZXcucGhwIjtzOjI6InRvIjtzOjM1OiJtb2R1bGVzL0VtYWlsVGVtcGxhdGVzL0VkaXRWaWV3LnBocCI7fWk6MjM7YToyOntzOjQ6ImZyb20iO3M6ODY6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbm90dXBncmFkZXNhZmUvbW9kdWxlcy9FbWFpbFRlbXBsYXRlcy9FbWFpbFRlbXBsYXRlRm9ybUJhc2UucGhwIjtzOjI6InRvIjtzOjQ4OiJtb2R1bGVzL0VtYWlsVGVtcGxhdGVzL0VtYWlsVGVtcGxhdGVGb3JtQmFzZS5waHAiO31pOjI0O2E6Mjp7czo0OiJmcm9tIjtzOjgzOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL25vdHVwZ3JhZGVzYWZlL21vZHVsZXMvRW1haWxUZW1wbGF0ZXMvdmlld3Mvdmlldy5jbGFzc2ljLnBocCI7czoyOiJ0byI7czo0NToibW9kdWxlcy9FbWFpbFRlbXBsYXRlcy92aWV3cy92aWV3LmNsYXNzaWMucGhwIjt9aToyNTthOjI6e3M6NDoiZnJvbSI7czo3NjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9ub3R1cGdyYWRlc2FmZS9tb2R1bGVzL0VtYWlsVGVtcGxhdGVzL0RldGFpbFZpZXcuaHRtbCI7czoyOiJ0byI7czozODoibW9kdWxlcy9FbWFpbFRlbXBsYXRlcy9EZXRhaWxWaWV3Lmh0bWwiO31pOjI2O2E6Mjp7czo0OiJmcm9tIjtzOjgwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL25vdHVwZ3JhZGVzYWZlL21vZHVsZXMvUHJvc3BlY3RMaXN0cy9UYXJnZXRMaXN0VXBkYXRlLnBocCI7czoyOiJ0byI7czo0MjoibW9kdWxlcy9Qcm9zcGVjdExpc3RzL1RhcmdldExpc3RVcGRhdGUucGhwIjt9aToyNzthOjI6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9ub3R1cGdyYWRlc2FmZS9tb2R1bGVzL1N1Z2FyRmVlZC9TdWdhckZlZWQucGhwIjtzOjI6InRvIjtzOjMxOiJtb2R1bGVzL1N1Z2FyRmVlZC9TdWdhckZlZWQucGhwIjt9aToyODthOjI6e3M6NDoiZnJvbSI7czoxMDI6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbm90dXBncmFkZXNhZmUvbW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7czoyOiJ0byI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fX1zOjEwOiJsYXlvdXRkZWZzIjthOjIwOntpOjA7YToyOntzOjQ6ImZyb20iO3M6NDM6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGF5b3V0ZGVmcy9Vc2Vycy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlVzZXJzIjt9aToxO2E6Mjp7czo0OiJmcm9tIjtzOjgzOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvQWNjb3VudHMvc2VjdXJpdHlncm91cHNfYWNjb3VudHNMYXlvdXRkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO31pOjI7YToyOntzOjQ6ImZyb20iO3M6ODM6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9BQ0xSb2xlcy9zZWN1cml0eWdyb3Vwc19hY2xyb2xlc0xheW91dGRlZnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBQ0xSb2xlcyI7fWk6MzthOjI6e3M6NDoiZnJvbSI7czo3NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9yZWxhdGlvbnNoaXBzL0J1Z3Mvc2VjdXJpdHlncm91cHNfYnVnc0xheW91dGRlZnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo0OiJCdWdzIjt9aTo0O2E6Mjp7czo0OiJmcm9tIjtzOjc3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvQ2FsbHMvc2VjdXJpdHlncm91cHNfY2FsbHNMYXlvdXRkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiQ2FsbHMiO31pOjU7YToyOntzOjQ6ImZyb20iO3M6ODU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9DYW1wYWlnbnMvc2VjdXJpdHlncm91cHNfY2FtcGFpZ25zTGF5b3V0ZGVmcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkNhbXBhaWducyI7fWk6NjthOjI6e3M6NDoiZnJvbSI7czo3NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9yZWxhdGlvbnNoaXBzL0Nhc2VzL3NlY3VyaXR5Z3JvdXBzX2Nhc2VzTGF5b3V0ZGVmcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkNhc2VzIjt9aTo3O2E6Mjp7czo0OiJmcm9tIjtzOjgzOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvQ29udGFjdHMvc2VjdXJpdHlncm91cHNfY29udGFjdHNMYXlvdXRkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO31pOjg7YToyOntzOjQ6ImZyb20iO3M6ODU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9Eb2N1bWVudHMvc2VjdXJpdHlncm91cHNfZG9jdW1lbnRzTGF5b3V0ZGVmcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7fWk6OTthOjI6e3M6NDoiZnJvbSI7czo3OToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9yZWxhdGlvbnNoaXBzL0VtYWlscy9zZWN1cml0eWdyb3Vwc19lbWFpbHNMYXlvdXRkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NjoiRW1haWxzIjt9aToxMDthOjI6e3M6NDoiZnJvbSI7czo5NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9yZWxhdGlvbnNoaXBzL0VtYWlsVGVtcGxhdGVzL3NlY3VyaXR5Z3JvdXBzX2VtYWlsdGVtcGxhdGVzTGF5b3V0ZGVmcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJFbWFpbFRlbXBsYXRlcyI7fWk6MTE7YToyOntzOjQ6ImZyb20iO3M6Nzc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9MZWFkcy9zZWN1cml0eWdyb3Vwc19sZWFkc0xheW91dGRlZnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJMZWFkcyI7fWk6MTI7YToyOntzOjQ6ImZyb20iO3M6ODM6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9NZWV0aW5ncy9zZWN1cml0eWdyb3Vwc19tZWV0aW5nc0xheW91dGRlZnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJNZWV0aW5ncyI7fWk6MTM7YToyOntzOjQ6ImZyb20iO3M6Nzc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9Ob3Rlcy9zZWN1cml0eWdyb3Vwc19ub3Rlc0xheW91dGRlZnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJOb3RlcyI7fWk6MTQ7YToyOntzOjQ6ImZyb20iO3M6OTM6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9PcHBvcnR1bml0aWVzL3NlY3VyaXR5Z3JvdXBzX29wcG9ydHVuaXRpZXNMYXlvdXRkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO31pOjE1O2E6Mjp7czo0OiJmcm9tIjtzOjgxOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvUHJvamVjdC9zZWN1cml0eWdyb3Vwc19wcm9qZWN0TGF5b3V0ZGVmcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjc6IlByb2plY3QiO31pOjE2O2E6Mjp7czo0OiJmcm9tIjtzOjkwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvUHJvamVjdFRhc2svc2VjdXJpdHlncm91cHNfcHJvamVjdF90YXNrTGF5b3V0ZGVmcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJQcm9qZWN0VGFzayI7fWk6MTc7YToyOntzOjQ6ImZyb20iO3M6OTM6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9Qcm9zcGVjdExpc3RzL3NlY3VyaXR5Z3JvdXBzX3Byb3NwZWN0X2xpc3RMYXlvdXRkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6IlByb3NwZWN0TGlzdHMiO31pOjE4O2E6Mjp7czo0OiJmcm9tIjtzOjg1OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvUHJvc3BlY3RzL3NlY3VyaXR5Z3JvdXBzX3Byb3NwZWN0c0xheW91dGRlZnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJQcm9zcGVjdHMiO31pOjE5O2E6Mjp7czo0OiJmcm9tIjtzOjc3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvVGFza3Mvc2VjdXJpdHlncm91cHNfdGFza3NMYXlvdXRkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiVGFza3MiO319czo3OiJ2YXJkZWZzIjthOjE5OntpOjA7YToyOntzOjQ6ImZyb20iO3M6ODA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9BY2NvdW50cy9zZWN1cml0eWdyb3Vwc19hY2NvdW50c1ZhcmRlZnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7fWk6MTthOjI6e3M6NDoiZnJvbSI7czo4MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9yZWxhdGlvbnNoaXBzL0FDTFJvbGVzL3NlY3VyaXR5Z3JvdXBzX2FjbHJvbGVzVmFyZGVmcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFDTFJvbGVzIjt9aToyO2E6Mjp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvQnVncy9zZWN1cml0eWdyb3Vwc19idWdzVmFyZGVmcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjQ6IkJ1Z3MiO31pOjM7YToyOntzOjQ6ImZyb20iO3M6NzQ6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9DYWxscy9zZWN1cml0eWdyb3Vwc19jYWxsc1ZhcmRlZnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJDYWxscyI7fWk6NDthOjI6e3M6NDoiZnJvbSI7czo4MjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9yZWxhdGlvbnNoaXBzL0NhbXBhaWducy9zZWN1cml0eWdyb3Vwc19jYW1wYWlnbnNWYXJkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiQ2FtcGFpZ25zIjt9aTo1O2E6Mjp7czo0OiJmcm9tIjtzOjc0OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvQ2FzZXMvc2VjdXJpdHlncm91cHNfY2FzZXNWYXJkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiQ2FzZXMiO31pOjY7YToyOntzOjQ6ImZyb20iO3M6ODA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9Db250YWN0cy9zZWN1cml0eWdyb3Vwc19jb250YWN0c1ZhcmRlZnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7fWk6NzthOjI6e3M6NDoiZnJvbSI7czo4MjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9yZWxhdGlvbnNoaXBzL0RvY3VtZW50cy9zZWN1cml0eWdyb3Vwc19kb2N1bWVudHNWYXJkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiRG9jdW1lbnRzIjt9aTo4O2E6Mjp7czo0OiJmcm9tIjtzOjc2OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvRW1haWxzL3NlY3VyaXR5Z3JvdXBzX2VtYWlsc1ZhcmRlZnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo2OiJFbWFpbHMiO31pOjk7YToyOntzOjQ6ImZyb20iO3M6OTI6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9FbWFpbFRlbXBsYXRlcy9zZWN1cml0eWdyb3Vwc19lbWFpbHRlbXBsYXRlc1ZhcmRlZnMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiRW1haWxUZW1wbGF0ZXMiO31pOjEwO2E6Mjp7czo0OiJmcm9tIjtzOjc0OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvTGVhZHMvc2VjdXJpdHlncm91cHNfbGVhZHNWYXJkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO31pOjExO2E6Mjp7czo0OiJmcm9tIjtzOjgwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvTWVldGluZ3Mvc2VjdXJpdHlncm91cHNfbWVldGluZ3NWYXJkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiTWVldGluZ3MiO31pOjEyO2E6Mjp7czo0OiJmcm9tIjtzOjc0OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvTm90ZXMvc2VjdXJpdHlncm91cHNfbm90ZXNWYXJkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTm90ZXMiO31pOjEzO2E6Mjp7czo0OiJmcm9tIjtzOjkwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvT3Bwb3J0dW5pdGllcy9zZWN1cml0eWdyb3Vwc19vcHBvcnR1bml0aWVzVmFyZGVmcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjt9aToxNDthOjI6e3M6NDoiZnJvbSI7czo3ODoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9yZWxhdGlvbnNoaXBzL1Byb2plY3Qvc2VjdXJpdHlncm91cHNfcHJvamVjdFZhcmRlZnMucGhwIjtzOjk6InRvX21vZHVsZSI7czo3OiJQcm9qZWN0Ijt9aToxNTthOjI6e3M6NDoiZnJvbSI7czo4NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9yZWxhdGlvbnNoaXBzL1Byb2plY3RUYXNrL3NlY3VyaXR5Z3JvdXBzX3Byb2plY3RfdGFza1ZhcmRlZnMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiUHJvamVjdFRhc2siO31pOjE2O2E6Mjp7czo0OiJmcm9tIjtzOjkwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvUHJvc3BlY3RMaXN0cy9zZWN1cml0eWdyb3Vwc19wcm9zcGVjdF9saXN0VmFyZGVmcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJQcm9zcGVjdExpc3RzIjt9aToxNzthOjI6e3M6NDoiZnJvbSI7czo4MjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9yZWxhdGlvbnNoaXBzL1Byb3NwZWN0cy9zZWN1cml0eWdyb3Vwc19wcm9zcGVjdHNWYXJkZWZzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiUHJvc3BlY3RzIjt9aToxODthOjI6e3M6NDoiZnJvbSI7czo3NDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9yZWxhdGlvbnNoaXBzL1Rhc2tzL3NlY3VyaXR5Z3JvdXBzX3Rhc2tzVmFyZGVmcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlRhc2tzIjt9fXM6MTM6InJlbGF0aW9uc2hpcHMiO2E6NDp7aTowO2E6Mzp7czo2OiJtb2R1bGUiO3M6NToiVXNlcnMiO3M6MTQ6Im1vZHVsZV92YXJkZWZzIjtzOjc0OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL3JlbGF0aW9uc2hpcHMvVXNlcnMvc2VjdXJpdHlncm91cHNfdXNlcnNWYXJkZWZzLnBocCI7czo5OiJtZXRhX2RhdGEiO3M6NzU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9Vc2Vycy9zZWN1cml0eWdyb3Vwc191c2Vyc01ldGFEYXRhLnBocCI7fWk6MTthOjI6e3M6NjoibW9kdWxlIjtzOjE0OiJTZWN1cml0eUdyb3VwcyI7czo5OiJtZXRhX2RhdGEiO3M6ODY6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9TZWN1cml0eUdyb3Vwcy9zZWN1cml0eWdyb3Vwc19yZWNvcmRzTWV0YURhdGEucGhwIjt9aToyO2E6Mjp7czo2OiJtb2R1bGUiO3M6MTQ6IlNlY3VyaXR5R3JvdXBzIjtzOjk6Im1ldGFfZGF0YSI7czo4ODoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9yZWxhdGlvbnNoaXBzL1NlY3VyaXR5R3JvdXBzL3NlY3VyaXR5Z3JvdXBzX2FjbF9yb2xlc01ldGFEYXRhLnBocCI7fWk6MzthOjI6e3M6NjoibW9kdWxlIjtzOjE0OiJTZWN1cml0eUdyb3VwcyI7czo5OiJtZXRhX2RhdGEiO3M6ODc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvcmVsYXRpb25zaGlwcy9TZWN1cml0eUdyb3Vwcy9zZWN1cml0eWdyb3Vwc19kZWZhdWx0c01ldGFEYXRhLnBocCI7fX1zOjg6Imxhbmd1YWdlIjthOjI0MDp7aTowO2E6Mzp7czo0OiJmcm9tIjtzOjU4OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL2FwcGxpY2F0aW9uL2VuX3VzLmxhbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiYXBwbGljYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9BZG1pbmlzdHJhdGlvbi9lbl91cy5hZG1pbi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJBZG1pbmlzdHJhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MjthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0FjY291bnRzL21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjM7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9BQ0xBY3Rpb25zL21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTA6IkFDTEFjdGlvbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjQ7YTozOntzOjQ6ImZyb20iO3M6NjY6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9CdWdzL21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NDoiQnVncyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6NTthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NhbGVuZGFyL21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ2FsZW5kYXIiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjY7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9DYWxscy9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkNhbGxzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo3O2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FtcGFpZ25zL21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiQ2FtcGFpZ25zIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aTo4O2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FzZXMvbW9kX3N0cmluZ3NfZW5fdXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJDYXNlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6OTthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NvbnRhY3RzL21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjEwO2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvRG9jdW1lbnRzL21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiRG9jdW1lbnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxMTthOjM6e3M6NDoiZnJvbSI7czo2ODoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0VtYWlscy9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjY6IkVtYWlscyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTI7YTozOntzOjQ6ImZyb20iO3M6NzY6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9FbWFpbFRlbXBsYXRlcy9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJFbWFpbFRlbXBsYXRlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTM7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9MZWFkcy9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkxlYWRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToxNDthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL01lZXRpbmdzL21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiTWVldGluZ3MiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE1O2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTm90ZXMvbW9kX3N0cmluZ3NfZW5fdXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJOb3RlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MTY7YTozOntzOjQ6ImZyb20iO3M6NzU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9PcHBvcnR1bml0aWVzL21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE3O2E6Mzp7czo0OiJmcm9tIjtzOjY5OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvamVjdC9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjc6IlByb2plY3QiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE4O2E6Mzp7czo0OiJmcm9tIjtzOjczOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvamVjdFRhc2svbW9kX3N0cmluZ3NfZW5fdXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiUHJvamVjdFRhc2siO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjE5O2E6Mzp7czo0OiJmcm9tIjtzOjc1OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvc3BlY3RMaXN0cy9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJQcm9zcGVjdExpc3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToyMDthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Byb3NwZWN0cy9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IlByb3NwZWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlbl91cyI7fWk6MjE7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9UYXNrcy9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlRhc2tzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToyMjthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1VzZXJzL21vZF9zdHJpbmdzX2VuX3VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiVXNlcnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZW5fdXMiO31pOjIzO2E6Mzp7czo0OiJmcm9tIjtzOjc1OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTW9kdWxlQnVpbGRlci9tb2Rfc3RyaW5nc19lbl91cy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJNb2R1bGVCdWlsZGVyIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVuX3VzIjt9aToyNDthOjM6e3M6NDoiZnJvbSI7czo1ODoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9hcHBsaWNhdGlvbi9lc19lcy5sYW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6ImFwcGxpY2F0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToyNTthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0FkbWluaXN0cmF0aW9uL2VzX2VzLmFkbWluLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IkFkbWluaXN0cmF0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToyNjthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0FjY291bnRzL21vZF9zdHJpbmdzX2VzX2VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjI3O2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQUNMQWN0aW9ucy9tb2Rfc3RyaW5nc19lc19lcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEwOiJBQ0xBY3Rpb25zIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToyODthOjM6e3M6NDoiZnJvbSI7czo2NjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0J1Z3MvbW9kX3N0cmluZ3NfZXNfZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo0OiJCdWdzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aToyOTthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NhbGVuZGFyL21vZF9zdHJpbmdzX2VzX2VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ2FsZW5kYXIiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjMwO2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FsbHMvbW9kX3N0cmluZ3NfZXNfZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJDYWxscyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19lcyI7fWk6MzE7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9DYW1wYWlnbnMvbW9kX3N0cmluZ3NfZXNfZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJDYW1wYWlnbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjMyO2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FzZXMvbW9kX3N0cmluZ3NfZXNfZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJDYXNlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19lcyI7fWk6MzM7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Db250YWN0cy9tb2Rfc3RyaW5nc19lc19lcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aTozNDthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0RvY3VtZW50cy9tb2Rfc3RyaW5nc19lc19lcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19lcyI7fWk6MzU7YTozOntzOjQ6ImZyb20iO3M6Njg6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9FbWFpbHMvbW9kX3N0cmluZ3NfZXNfZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo2OiJFbWFpbHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjM2O2E6Mzp7czo0OiJmcm9tIjtzOjc2OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvRW1haWxUZW1wbGF0ZXMvbW9kX3N0cmluZ3NfZXNfZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiRW1haWxUZW1wbGF0ZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjM3O2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTGVhZHMvbW9kX3N0cmluZ3NfZXNfZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJMZWFkcyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19lcyI7fWk6Mzg7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9NZWV0aW5ncy9tb2Rfc3RyaW5nc19lc19lcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aTozOTthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL05vdGVzL21vZF9zdHJpbmdzX2VzX2VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTm90ZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjQwO2E6Mzp7czo0OiJmcm9tIjtzOjc1OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvT3Bwb3J0dW5pdGllcy9tb2Rfc3RyaW5nc19lc19lcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aTo0MTthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Byb2plY3QvbW9kX3N0cmluZ3NfZXNfZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo3OiJQcm9qZWN0IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aTo0MjthOjM6e3M6NDoiZnJvbSI7czo3MzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Byb2plY3RUYXNrL21vZF9zdHJpbmdzX2VzX2VzLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6IlByb2plY3RUYXNrIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aTo0MzthOjM6e3M6NDoiZnJvbSI7czo3NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Byb3NwZWN0TGlzdHMvbW9kX3N0cmluZ3NfZXNfZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiUHJvc3BlY3RMaXN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19lcyI7fWk6NDQ7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9zcGVjdHMvbW9kX3N0cmluZ3NfZXNfZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJQcm9zcGVjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZXNfZXMiO31pOjQ1O2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvVGFza3MvbW9kX3N0cmluZ3NfZXNfZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJUYXNrcyI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19lcyI7fWk6NDY7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Vc2Vycy9tb2Rfc3RyaW5nc19lc19lcy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlVzZXJzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImVzX2VzIjt9aTo0NzthOjM6e3M6NDoiZnJvbSI7czo3NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL01vZHVsZUJ1aWxkZXIvbW9kX3N0cmluZ3NfZXNfZXMucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiTW9kdWxlQnVpbGRlciI7czo4OiJsYW5ndWFnZSI7czo1OiJlc19lcyI7fWk6NDg7YTozOntzOjQ6ImZyb20iO3M6NTg6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvYXBwbGljYXRpb24vaXRfaXQubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6NDk7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9BZG1pbmlzdHJhdGlvbi9pdF9pdC5hZG1pbi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJBZG1pbmlzdHJhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6NTA7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9BY2NvdW50cy9tb2Rfc3RyaW5nc19pdF9pdC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Iml0X2l0Ijt9aTo1MTthOjM6e3M6NDoiZnJvbSI7czo3MjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0FDTEFjdGlvbnMvbW9kX3N0cmluZ3NfaXRfaXQucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMDoiQUNMQWN0aW9ucyI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6NTI7YTozOntzOjQ6ImZyb20iO3M6NjY6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9CdWdzL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NDoiQnVncyI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6NTM7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9DYWxlbmRhci9tb2Rfc3RyaW5nc19pdF9pdC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNhbGVuZGFyIjtzOjg6Imxhbmd1YWdlIjtzOjU6Iml0X2l0Ijt9aTo1NDthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NhbGxzL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiQ2FsbHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaXRfaXQiO31pOjU1O2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FtcGFpZ25zL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiQ2FtcGFpZ25zIjtzOjg6Imxhbmd1YWdlIjtzOjU6Iml0X2l0Ijt9aTo1NjthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0Nhc2VzL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiQ2FzZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaXRfaXQiO31pOjU3O2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ29udGFjdHMvbW9kX3N0cmluZ3NfaXRfaXQucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6NTg7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Eb2N1bWVudHMvbW9kX3N0cmluZ3NfaXRfaXQucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJEb2N1bWVudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaXRfaXQiO31pOjU5O2E6Mzp7czo0OiJmcm9tIjtzOjY4OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvRW1haWxzL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NjoiRW1haWxzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Iml0X2l0Ijt9aTo2MDthOjM6e3M6NDoiZnJvbSI7czo3NjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0VtYWlsVGVtcGxhdGVzL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IkVtYWlsVGVtcGxhdGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Iml0X2l0Ijt9aTo2MTthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0xlYWRzL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaXRfaXQiO31pOjYyO2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTWVldGluZ3MvbW9kX3N0cmluZ3NfaXRfaXQucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJNZWV0aW5ncyI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6NjM7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Ob3Rlcy9tb2Rfc3RyaW5nc19pdF9pdC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6Ik5vdGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Iml0X2l0Ijt9aTo2NDthOjM6e3M6NDoiZnJvbSI7czo3NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL09wcG9ydHVuaXRpZXMvbW9kX3N0cmluZ3NfaXRfaXQucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6NjU7YTozOntzOjQ6ImZyb20iO3M6Njk6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9qZWN0L21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NzoiUHJvamVjdCI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6NjY7YTozOntzOjQ6ImZyb20iO3M6NzM6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9qZWN0VGFzay9tb2Rfc3RyaW5nc19pdF9pdC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJQcm9qZWN0VGFzayI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6Njc7YTozOntzOjQ6ImZyb20iO3M6NzU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9zcGVjdExpc3RzL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6IlByb3NwZWN0TGlzdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaXRfaXQiO31pOjY4O2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvc3BlY3RzL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiUHJvc3BlY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Iml0X2l0Ijt9aTo2OTthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Rhc2tzL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiVGFza3MiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaXRfaXQiO31pOjcwO2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvVXNlcnMvbW9kX3N0cmluZ3NfaXRfaXQucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJVc2VycyI7czo4OiJsYW5ndWFnZSI7czo1OiJpdF9pdCI7fWk6NzE7YTozOntzOjQ6ImZyb20iO3M6NzU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Nb2R1bGVCdWlsZGVyL21vZF9zdHJpbmdzX2l0X2l0LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik1vZHVsZUJ1aWxkZXIiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaXRfaXQiO31pOjcyO2E6Mzp7czo0OiJmcm9tIjtzOjU4OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL2FwcGxpY2F0aW9uL2ZyX0ZSLmxhbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiYXBwbGljYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjczO2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQWRtaW5pc3RyYXRpb24vZnJfRlIuYWRtaW4ucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiQWRtaW5pc3RyYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjc0O2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQWNjb3VudHMvbW9kX3N0cmluZ3NfZnJfRlIucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJmcl9GUiI7fWk6NzU7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9BQ0xBY3Rpb25zL21vZF9zdHJpbmdzX2ZyX0ZSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTA6IkFDTEFjdGlvbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjc2O2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQnVncy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjQ6IkJ1Z3MiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjc3O2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FsZW5kYXIvbW9kX3N0cmluZ3NfZnJfRlIucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDYWxlbmRhciI7czo4OiJsYW5ndWFnZSI7czo1OiJmcl9GUiI7fWk6Nzg7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9DYWxscy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkNhbGxzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImZyX0ZSIjt9aTo3OTthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NhbXBhaWducy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkNhbXBhaWducyI7czo4OiJsYW5ndWFnZSI7czo1OiJmcl9GUiI7fWk6ODA7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9DYXNlcy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkNhc2VzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImZyX0ZSIjt9aTo4MTthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NvbnRhY3RzL21vZF9zdHJpbmdzX2ZyX0ZSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjgyO2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvRG9jdW1lbnRzL21vZF9zdHJpbmdzX2ZyX0ZSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiRG9jdW1lbnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImZyX0ZSIjt9aTo4MzthOjM6e3M6NDoiZnJvbSI7czo2ODoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0VtYWlscy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjY6IkVtYWlscyI7czo4OiJsYW5ndWFnZSI7czo1OiJmcl9GUiI7fWk6ODQ7YTozOntzOjQ6ImZyb20iO3M6NzY6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9FbWFpbFRlbXBsYXRlcy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJFbWFpbFRlbXBsYXRlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJmcl9GUiI7fWk6ODU7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9MZWFkcy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkxlYWRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImZyX0ZSIjt9aTo4NjthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL01lZXRpbmdzL21vZF9zdHJpbmdzX2ZyX0ZSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiTWVldGluZ3MiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjg3O2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTm90ZXMvbW9kX3N0cmluZ3NfZnJfRlIucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJOb3RlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJmcl9GUiI7fWk6ODg7YTozOntzOjQ6ImZyb20iO3M6NzU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9PcHBvcnR1bml0aWVzL21vZF9zdHJpbmdzX2ZyX0ZSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjg5O2E6Mzp7czo0OiJmcm9tIjtzOjY5OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvamVjdC9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjc6IlByb2plY3QiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjkwO2E6Mzp7czo0OiJmcm9tIjtzOjczOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvamVjdFRhc2svbW9kX3N0cmluZ3NfZnJfRlIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiUHJvamVjdFRhc2siO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjkxO2E6Mzp7czo0OiJmcm9tIjtzOjc1OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvc3BlY3RMaXN0cy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJQcm9zcGVjdExpc3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImZyX0ZSIjt9aTo5MjthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Byb3NwZWN0cy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IlByb3NwZWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJmcl9GUiI7fWk6OTM7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9UYXNrcy9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlRhc2tzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImZyX0ZSIjt9aTo5NDthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1VzZXJzL21vZF9zdHJpbmdzX2ZyX0ZSLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiVXNlcnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZnJfRlIiO31pOjk1O2E6Mzp7czo0OiJmcm9tIjtzOjc1OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTW9kdWxlQnVpbGRlci9tb2Rfc3RyaW5nc19mcl9GUi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJNb2R1bGVCdWlsZGVyIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImZyX0ZSIjt9aTo5NjthOjM6e3M6NDoiZnJvbSI7czo1ODoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9hcHBsaWNhdGlvbi9wdF9ici5sYW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6ImFwcGxpY2F0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6InB0X2JyIjt9aTo5NzthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0FkbWluaXN0cmF0aW9uL3B0X2JyLmFkbWluLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IkFkbWluaXN0cmF0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6InB0X2JyIjt9aTo5ODthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0FjY291bnRzL21vZF9zdHJpbmdzX3B0X2JyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfYnIiO31pOjk5O2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQUNMQWN0aW9ucy9tb2Rfc3RyaW5nc19wdF9ici5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEwOiJBQ0xBY3Rpb25zIjtzOjg6Imxhbmd1YWdlIjtzOjU6InB0X2JyIjt9aToxMDA7YTozOntzOjQ6ImZyb20iO3M6NjY6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9CdWdzL21vZF9zdHJpbmdzX3B0X2JyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NDoiQnVncyI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9iciI7fWk6MTAxO2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FsZW5kYXIvbW9kX3N0cmluZ3NfcHRfYnIucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDYWxlbmRhciI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9iciI7fWk6MTAyO2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FsbHMvbW9kX3N0cmluZ3NfcHRfYnIucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJDYWxscyI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9iciI7fWk6MTAzO2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FtcGFpZ25zL21vZF9zdHJpbmdzX3B0X2JyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiQ2FtcGFpZ25zIjtzOjg6Imxhbmd1YWdlIjtzOjU6InB0X2JyIjt9aToxMDQ7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9DYXNlcy9tb2Rfc3RyaW5nc19wdF9ici5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkNhc2VzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InB0X2JyIjt9aToxMDU7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Db250YWN0cy9tb2Rfc3RyaW5nc19wdF9ici5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InB0X2JyIjt9aToxMDY7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Eb2N1bWVudHMvbW9kX3N0cmluZ3NfcHRfYnIucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJEb2N1bWVudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfYnIiO31pOjEwNzthOjM6e3M6NDoiZnJvbSI7czo2ODoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0VtYWlscy9tb2Rfc3RyaW5nc19wdF9ici5waHAiO3M6OToidG9fbW9kdWxlIjtzOjY6IkVtYWlscyI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9iciI7fWk6MTA4O2E6Mzp7czo0OiJmcm9tIjtzOjc2OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvRW1haWxUZW1wbGF0ZXMvbW9kX3N0cmluZ3NfcHRfYnIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiRW1haWxUZW1wbGF0ZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfYnIiO31pOjEwOTthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0xlYWRzL21vZF9zdHJpbmdzX3B0X2JyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfYnIiO31pOjExMDthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL01lZXRpbmdzL21vZF9zdHJpbmdzX3B0X2JyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiTWVldGluZ3MiO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfYnIiO31pOjExMTthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL05vdGVzL21vZF9zdHJpbmdzX3B0X2JyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTm90ZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfYnIiO31pOjExMjthOjM6e3M6NDoiZnJvbSI7czo3NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL09wcG9ydHVuaXRpZXMvbW9kX3N0cmluZ3NfcHRfYnIucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9iciI7fWk6MTEzO2E6Mzp7czo0OiJmcm9tIjtzOjY5OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvamVjdC9tb2Rfc3RyaW5nc19wdF9ici5waHAiO3M6OToidG9fbW9kdWxlIjtzOjc6IlByb2plY3QiO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfYnIiO31pOjExNDthOjM6e3M6NDoiZnJvbSI7czo3MzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Byb2plY3RUYXNrL21vZF9zdHJpbmdzX3B0X2JyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6IlByb2plY3RUYXNrIjtzOjg6Imxhbmd1YWdlIjtzOjU6InB0X2JyIjt9aToxMTU7YTozOntzOjQ6ImZyb20iO3M6NzU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9zcGVjdExpc3RzL21vZF9zdHJpbmdzX3B0X2JyLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6IlByb3NwZWN0TGlzdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicHRfYnIiO31pOjExNjthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Byb3NwZWN0cy9tb2Rfc3RyaW5nc19wdF9ici5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IlByb3NwZWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9iciI7fWk6MTE3O2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvVGFza3MvbW9kX3N0cmluZ3NfcHRfYnIucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJUYXNrcyI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9iciI7fWk6MTE4O2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvVXNlcnMvbW9kX3N0cmluZ3NfcHRfYnIucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJVc2VycyI7czo4OiJsYW5ndWFnZSI7czo1OiJwdF9iciI7fWk6MTE5O2E6Mzp7czo0OiJmcm9tIjtzOjc1OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTW9kdWxlQnVpbGRlci9tb2Rfc3RyaW5nc19wdF9ici5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJNb2R1bGVCdWlsZGVyIjtzOjg6Imxhbmd1YWdlIjtzOjU6InB0X2JyIjt9aToxMjA7YTozOntzOjQ6ImZyb20iO3M6NTg6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvYXBwbGljYXRpb24vZGVfZGUubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJkZV9kZSI7fWk6MTIxO2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQWRtaW5pc3RyYXRpb24vZGVfZGUuYWRtaW4ucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiQWRtaW5pc3RyYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjEyMjthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0FjY291bnRzL21vZF9zdHJpbmdzX2RlX2RlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjEyMzthOjM6e3M6NDoiZnJvbSI7czo3MjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0FDTEFjdGlvbnMvbW9kX3N0cmluZ3NfZGVfZGUucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMDoiQUNMQWN0aW9ucyI7czo4OiJsYW5ndWFnZSI7czo1OiJkZV9kZSI7fWk6MTI0O2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQnVncy9tb2Rfc3RyaW5nc19kZV9kZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjQ6IkJ1Z3MiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjEyNTthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NhbGVuZGFyL21vZF9zdHJpbmdzX2RlX2RlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ2FsZW5kYXIiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjEyNjthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NhbGxzL21vZF9zdHJpbmdzX2RlX2RlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiQ2FsbHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjEyNzthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NhbXBhaWducy9tb2Rfc3RyaW5nc19kZV9kZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkNhbXBhaWducyI7czo4OiJsYW5ndWFnZSI7czo1OiJkZV9kZSI7fWk6MTI4O2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FzZXMvbW9kX3N0cmluZ3NfZGVfZGUucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJDYXNlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJkZV9kZSI7fWk6MTI5O2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ29udGFjdHMvbW9kX3N0cmluZ3NfZGVfZGUucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJkZV9kZSI7fWk6MTMwO2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvRG9jdW1lbnRzL21vZF9zdHJpbmdzX2RlX2RlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiRG9jdW1lbnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImRlX2RlIjt9aToxMzE7YTozOntzOjQ6ImZyb20iO3M6Njg6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9FbWFpbHMvbW9kX3N0cmluZ3NfZGVfZGUucGhwIjtzOjk6InRvX21vZHVsZSI7czo2OiJFbWFpbHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjEzMjthOjM6e3M6NDoiZnJvbSI7czo3NjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0VtYWlsVGVtcGxhdGVzL21vZF9zdHJpbmdzX2RlX2RlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IkVtYWlsVGVtcGxhdGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImRlX2RlIjt9aToxMzM7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9MZWFkcy9tb2Rfc3RyaW5nc19kZV9kZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkxlYWRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImRlX2RlIjt9aToxMzQ7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9NZWV0aW5ncy9tb2Rfc3RyaW5nc19kZV9kZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImRlX2RlIjt9aToxMzU7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Ob3Rlcy9tb2Rfc3RyaW5nc19kZV9kZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6Ik5vdGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImRlX2RlIjt9aToxMzY7YTozOntzOjQ6ImZyb20iO3M6NzU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9PcHBvcnR1bml0aWVzL21vZF9zdHJpbmdzX2RlX2RlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjEzNzthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Byb2plY3QvbW9kX3N0cmluZ3NfZGVfZGUucGhwIjtzOjk6InRvX21vZHVsZSI7czo3OiJQcm9qZWN0IjtzOjg6Imxhbmd1YWdlIjtzOjU6ImRlX2RlIjt9aToxMzg7YTozOntzOjQ6ImZyb20iO3M6NzM6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9qZWN0VGFzay9tb2Rfc3RyaW5nc19kZV9kZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJQcm9qZWN0VGFzayI7czo4OiJsYW5ndWFnZSI7czo1OiJkZV9kZSI7fWk6MTM5O2E6Mzp7czo0OiJmcm9tIjtzOjc1OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvc3BlY3RMaXN0cy9tb2Rfc3RyaW5nc19kZV9kZS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJQcm9zcGVjdExpc3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6ImRlX2RlIjt9aToxNDA7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9zcGVjdHMvbW9kX3N0cmluZ3NfZGVfZGUucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJQcm9zcGVjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjE0MTthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Rhc2tzL21vZF9zdHJpbmdzX2RlX2RlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiVGFza3MiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjE0MjthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1VzZXJzL21vZF9zdHJpbmdzX2RlX2RlLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiVXNlcnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiZGVfZGUiO31pOjE0MzthOjM6e3M6NDoiZnJvbSI7czo3NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL01vZHVsZUJ1aWxkZXIvbW9kX3N0cmluZ3NfZGVfZGUucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiTW9kdWxlQnVpbGRlciI7czo4OiJsYW5ndWFnZSI7czo1OiJkZV9kZSI7fWk6MTQ0O2E6Mzp7czo0OiJmcm9tIjtzOjU4OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL2FwcGxpY2F0aW9uL3J1X3J1LmxhbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiYXBwbGljYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE0NTthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0FkbWluaXN0cmF0aW9uL3J1X3J1LmFkbWluLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IkFkbWluaXN0cmF0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxNDY7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9BY2NvdW50cy9tb2Rfc3RyaW5nc19ydV9ydS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxNDc7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9BQ0xBY3Rpb25zL21vZF9zdHJpbmdzX3J1X3J1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTA6IkFDTEFjdGlvbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE0ODthOjM6e3M6NDoiZnJvbSI7czo2NjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0J1Z3MvbW9kX3N0cmluZ3NfcnVfcnUucGhwIjtzOjk6InRvX21vZHVsZSI7czo0OiJCdWdzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxNDk7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9DYWxlbmRhci9tb2Rfc3RyaW5nc19ydV9ydS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNhbGVuZGFyIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxNTA7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9DYWxscy9tb2Rfc3RyaW5nc19ydV9ydS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkNhbGxzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxNTE7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9DYW1wYWlnbnMvbW9kX3N0cmluZ3NfcnVfcnUucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJDYW1wYWlnbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE1MjthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0Nhc2VzL21vZF9zdHJpbmdzX3J1X3J1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiQ2FzZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE1MzthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NvbnRhY3RzL21vZF9zdHJpbmdzX3J1X3J1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE1NDthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0RvY3VtZW50cy9tb2Rfc3RyaW5nc19ydV9ydS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MTU1O2E6Mzp7czo0OiJmcm9tIjtzOjY4OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvRW1haWxzL21vZF9zdHJpbmdzX3J1X3J1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NjoiRW1haWxzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxNTY7YTozOntzOjQ6ImZyb20iO3M6NzY6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9FbWFpbFRlbXBsYXRlcy9tb2Rfc3RyaW5nc19ydV9ydS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJFbWFpbFRlbXBsYXRlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MTU3O2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTGVhZHMvbW9kX3N0cmluZ3NfcnVfcnUucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJMZWFkcyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MTU4O2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTWVldGluZ3MvbW9kX3N0cmluZ3NfcnVfcnUucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJNZWV0aW5ncyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MTU5O2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTm90ZXMvbW9kX3N0cmluZ3NfcnVfcnUucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJOb3RlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MTYwO2E6Mzp7czo0OiJmcm9tIjtzOjc1OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvT3Bwb3J0dW5pdGllcy9tb2Rfc3RyaW5nc19ydV9ydS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxNjE7YTozOntzOjQ6ImZyb20iO3M6Njk6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9qZWN0L21vZF9zdHJpbmdzX3J1X3J1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NzoiUHJvamVjdCI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MTYyO2E6Mzp7czo0OiJmcm9tIjtzOjczOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvamVjdFRhc2svbW9kX3N0cmluZ3NfcnVfcnUucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiUHJvamVjdFRhc2siO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE2MzthOjM6e3M6NDoiZnJvbSI7czo3NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Byb3NwZWN0TGlzdHMvbW9kX3N0cmluZ3NfcnVfcnUucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiUHJvc3BlY3RMaXN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJydV9ydSI7fWk6MTY0O2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvc3BlY3RzL21vZF9zdHJpbmdzX3J1X3J1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiUHJvc3BlY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxNjU7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9UYXNrcy9tb2Rfc3RyaW5nc19ydV9ydS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlRhc2tzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxNjY7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Vc2Vycy9tb2Rfc3RyaW5nc19ydV9ydS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlVzZXJzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InJ1X3J1Ijt9aToxNjc7YTozOntzOjQ6ImZyb20iO3M6NzU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Nb2R1bGVCdWlsZGVyL21vZF9zdHJpbmdzX3J1X3J1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik1vZHVsZUJ1aWxkZXIiO3M6ODoibGFuZ3VhZ2UiO3M6NToicnVfcnUiO31pOjE2ODthOjM6e3M6NDoiZnJvbSI7czo1ODoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9hcHBsaWNhdGlvbi91YV91YS5sYW5nLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6ImFwcGxpY2F0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6InVhX3VhIjt9aToxNjk7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9BZG1pbmlzdHJhdGlvbi91YV91YS5hZG1pbi5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJBZG1pbmlzdHJhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJ1YV91YSI7fWk6MTcwO2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQWNjb3VudHMvbW9kX3N0cmluZ3NfdWFfdWEucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJBY2NvdW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJ1YV91YSI7fWk6MTcxO2E6Mzp7czo0OiJmcm9tIjtzOjcyOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQUNMQWN0aW9ucy9tb2Rfc3RyaW5nc191YV91YS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEwOiJBQ0xBY3Rpb25zIjtzOjg6Imxhbmd1YWdlIjtzOjU6InVhX3VhIjt9aToxNzI7YTozOntzOjQ6ImZyb20iO3M6NjY6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9CdWdzL21vZF9zdHJpbmdzX3VhX3VhLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NDoiQnVncyI7czo4OiJsYW5ndWFnZSI7czo1OiJ1YV91YSI7fWk6MTczO2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FsZW5kYXIvbW9kX3N0cmluZ3NfdWFfdWEucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDYWxlbmRhciI7czo4OiJsYW5ndWFnZSI7czo1OiJ1YV91YSI7fWk6MTc0O2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FsbHMvbW9kX3N0cmluZ3NfdWFfdWEucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJDYWxscyI7czo4OiJsYW5ndWFnZSI7czo1OiJ1YV91YSI7fWk6MTc1O2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FtcGFpZ25zL21vZF9zdHJpbmdzX3VhX3VhLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiQ2FtcGFpZ25zIjtzOjg6Imxhbmd1YWdlIjtzOjU6InVhX3VhIjt9aToxNzY7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9DYXNlcy9tb2Rfc3RyaW5nc191YV91YS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkNhc2VzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InVhX3VhIjt9aToxNzc7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Db250YWN0cy9tb2Rfc3RyaW5nc191YV91YS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNvbnRhY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6InVhX3VhIjt9aToxNzg7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Eb2N1bWVudHMvbW9kX3N0cmluZ3NfdWFfdWEucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJEb2N1bWVudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToidWFfdWEiO31pOjE3OTthOjM6e3M6NDoiZnJvbSI7czo2ODoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0VtYWlscy9tb2Rfc3RyaW5nc191YV91YS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjY6IkVtYWlscyI7czo4OiJsYW5ndWFnZSI7czo1OiJ1YV91YSI7fWk6MTgwO2E6Mzp7czo0OiJmcm9tIjtzOjc2OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvRW1haWxUZW1wbGF0ZXMvbW9kX3N0cmluZ3NfdWFfdWEucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiRW1haWxUZW1wbGF0ZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToidWFfdWEiO31pOjE4MTthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0xlYWRzL21vZF9zdHJpbmdzX3VhX3VhLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTGVhZHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToidWFfdWEiO31pOjE4MjthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL01lZXRpbmdzL21vZF9zdHJpbmdzX3VhX3VhLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiTWVldGluZ3MiO3M6ODoibGFuZ3VhZ2UiO3M6NToidWFfdWEiO31pOjE4MzthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL05vdGVzL21vZF9zdHJpbmdzX3VhX3VhLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiTm90ZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToidWFfdWEiO31pOjE4NDthOjM6e3M6NDoiZnJvbSI7czo3NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL09wcG9ydHVuaXRpZXMvbW9kX3N0cmluZ3NfdWFfdWEucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiT3Bwb3J0dW5pdGllcyI7czo4OiJsYW5ndWFnZSI7czo1OiJ1YV91YSI7fWk6MTg1O2E6Mzp7czo0OiJmcm9tIjtzOjY5OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvamVjdC9tb2Rfc3RyaW5nc191YV91YS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjc6IlByb2plY3QiO3M6ODoibGFuZ3VhZ2UiO3M6NToidWFfdWEiO31pOjE4NjthOjM6e3M6NDoiZnJvbSI7czo3MzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Byb2plY3RUYXNrL21vZF9zdHJpbmdzX3VhX3VhLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTE6IlByb2plY3RUYXNrIjtzOjg6Imxhbmd1YWdlIjtzOjU6InVhX3VhIjt9aToxODc7YTozOntzOjQ6ImZyb20iO3M6NzU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9zcGVjdExpc3RzL21vZF9zdHJpbmdzX3VhX3VhLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6IlByb3NwZWN0TGlzdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToidWFfdWEiO31pOjE4ODthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Byb3NwZWN0cy9tb2Rfc3RyaW5nc191YV91YS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IlByb3NwZWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJ1YV91YSI7fWk6MTg5O2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvVGFza3MvbW9kX3N0cmluZ3NfdWFfdWEucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJUYXNrcyI7czo4OiJsYW5ndWFnZSI7czo1OiJ1YV91YSI7fWk6MTkwO2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvVXNlcnMvbW9kX3N0cmluZ3NfdWFfdWEucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJVc2VycyI7czo4OiJsYW5ndWFnZSI7czo1OiJ1YV91YSI7fWk6MTkxO2E6Mzp7czo0OiJmcm9tIjtzOjc1OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTW9kdWxlQnVpbGRlci9tb2Rfc3RyaW5nc191YV91YS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJNb2R1bGVCdWlsZGVyIjtzOjg6Imxhbmd1YWdlIjtzOjU6InVhX3VhIjt9aToxOTI7YTozOntzOjQ6ImZyb20iO3M6NTg6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvYXBwbGljYXRpb24vbmxfTkwubGFuZy5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJhcHBsaWNhdGlvbiI7czo4OiJsYW5ndWFnZSI7czo1OiJubF9OTCI7fWk6MTkzO2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQWRtaW5pc3RyYXRpb24vbmxfTkwuYWRtaW4ucGhwIjtzOjk6InRvX21vZHVsZSI7czoxNDoiQWRtaW5pc3RyYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToibmxfTkwiO31pOjE5NDthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0FjY291bnRzL21vZF9zdHJpbmdzX25sX05MLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToibmxfTkwiO31pOjE5NTthOjM6e3M6NDoiZnJvbSI7czo3MjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0FDTEFjdGlvbnMvbW9kX3N0cmluZ3NfbmxfTkwucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMDoiQUNMQWN0aW9ucyI7czo4OiJsYW5ndWFnZSI7czo1OiJubF9OTCI7fWk6MTk2O2E6Mzp7czo0OiJmcm9tIjtzOjY2OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQnVncy9tb2Rfc3RyaW5nc19ubF9OTC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjQ6IkJ1Z3MiO3M6ODoibGFuZ3VhZ2UiO3M6NToibmxfTkwiO31pOjE5NzthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NhbGVuZGFyL21vZF9zdHJpbmdzX25sX05MLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ2FsZW5kYXIiO3M6ODoibGFuZ3VhZ2UiO3M6NToibmxfTkwiO31pOjE5ODthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NhbGxzL21vZF9zdHJpbmdzX25sX05MLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiQ2FsbHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToibmxfTkwiO31pOjE5OTthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NhbXBhaWducy9tb2Rfc3RyaW5nc19ubF9OTC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkNhbXBhaWducyI7czo4OiJsYW5ndWFnZSI7czo1OiJubF9OTCI7fWk6MjAwO2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ2FzZXMvbW9kX3N0cmluZ3NfbmxfTkwucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJDYXNlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJubF9OTCI7fWk6MjAxO2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvQ29udGFjdHMvbW9kX3N0cmluZ3NfbmxfTkwucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJDb250YWN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJubF9OTCI7fWk6MjAyO2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvRG9jdW1lbnRzL21vZF9zdHJpbmdzX25sX05MLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiRG9jdW1lbnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Im5sX05MIjt9aToyMDM7YTozOntzOjQ6ImZyb20iO3M6Njg6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9FbWFpbHMvbW9kX3N0cmluZ3NfbmxfTkwucGhwIjtzOjk6InRvX21vZHVsZSI7czo2OiJFbWFpbHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToibmxfTkwiO31pOjIwNDthOjM6e3M6NDoiZnJvbSI7czo3NjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0VtYWlsVGVtcGxhdGVzL21vZF9zdHJpbmdzX25sX05MLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IkVtYWlsVGVtcGxhdGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Im5sX05MIjt9aToyMDU7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9MZWFkcy9tb2Rfc3RyaW5nc19ubF9OTC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkxlYWRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Im5sX05MIjt9aToyMDY7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9NZWV0aW5ncy9tb2Rfc3RyaW5nc19ubF9OTC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Im5sX05MIjt9aToyMDc7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Ob3Rlcy9tb2Rfc3RyaW5nc19ubF9OTC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6Ik5vdGVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Im5sX05MIjt9aToyMDg7YTozOntzOjQ6ImZyb20iO3M6NzU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9PcHBvcnR1bml0aWVzL21vZF9zdHJpbmdzX25sX05MLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToibmxfTkwiO31pOjIwOTthOjM6e3M6NDoiZnJvbSI7czo2OToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Byb2plY3QvbW9kX3N0cmluZ3NfbmxfTkwucGhwIjtzOjk6InRvX21vZHVsZSI7czo3OiJQcm9qZWN0IjtzOjg6Imxhbmd1YWdlIjtzOjU6Im5sX05MIjt9aToyMTA7YTozOntzOjQ6ImZyb20iO3M6NzM6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9qZWN0VGFzay9tb2Rfc3RyaW5nc19ubF9OTC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjExOiJQcm9qZWN0VGFzayI7czo4OiJsYW5ndWFnZSI7czo1OiJubF9OTCI7fWk6MjExO2E6Mzp7czo0OiJmcm9tIjtzOjc1OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvc3BlY3RMaXN0cy9tb2Rfc3RyaW5nc19ubF9OTC5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJQcm9zcGVjdExpc3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Im5sX05MIjt9aToyMTI7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9zcGVjdHMvbW9kX3N0cmluZ3NfbmxfTkwucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJQcm9zcGVjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToibmxfTkwiO31pOjIxMzthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Rhc2tzL21vZF9zdHJpbmdzX25sX05MLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiVGFza3MiO3M6ODoibGFuZ3VhZ2UiO3M6NToibmxfTkwiO31pOjIxNDthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1VzZXJzL21vZF9zdHJpbmdzX25sX05MLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiVXNlcnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToibmxfTkwiO31pOjIxNTthOjM6e3M6NDoiZnJvbSI7czo3NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL01vZHVsZUJ1aWxkZXIvbW9kX3N0cmluZ3NfbmxfTkwucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiTW9kdWxlQnVpbGRlciI7czo4OiJsYW5ndWFnZSI7czo1OiJubF9OTCI7fWk6MjE2O2E6Mzp7czo0OiJmcm9tIjtzOjU4OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL2FwcGxpY2F0aW9uL2h1X2h1LmxhbmcucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiYXBwbGljYXRpb24iO3M6ODoibGFuZ3VhZ2UiO3M6NToiaHVfaHUiO31pOjIxNzthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0FkbWluaXN0cmF0aW9uL2h1X2h1LmFkbWluLnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTQ6IkFkbWluaXN0cmF0aW9uIjtzOjg6Imxhbmd1YWdlIjtzOjU6Imh1X2h1Ijt9aToyMTg7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9BY2NvdW50cy9tb2Rfc3RyaW5nc19odV9odS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkFjY291bnRzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Imh1X2h1Ijt9aToyMTk7YTozOntzOjQ6ImZyb20iO3M6NzI6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9BQ0xBY3Rpb25zL21vZF9zdHJpbmdzX2h1X2h1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTA6IkFDTEFjdGlvbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaHVfaHUiO31pOjIyMDthOjM6e3M6NDoiZnJvbSI7czo2NjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0J1Z3MvbW9kX3N0cmluZ3NfaHVfaHUucGhwIjtzOjk6InRvX21vZHVsZSI7czo0OiJCdWdzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Imh1X2h1Ijt9aToyMjE7YTozOntzOjQ6ImZyb20iO3M6NzA6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9DYWxlbmRhci9tb2Rfc3RyaW5nc19odV9odS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjg6IkNhbGVuZGFyIjtzOjg6Imxhbmd1YWdlIjtzOjU6Imh1X2h1Ijt9aToyMjI7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9DYWxscy9tb2Rfc3RyaW5nc19odV9odS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IkNhbGxzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Imh1X2h1Ijt9aToyMjM7YTozOntzOjQ6ImZyb20iO3M6NzE6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9DYW1wYWlnbnMvbW9kX3N0cmluZ3NfaHVfaHUucGhwIjtzOjk6InRvX21vZHVsZSI7czo5OiJDYW1wYWlnbnMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaHVfaHUiO31pOjIyNDthOjM6e3M6NDoiZnJvbSI7czo2NzoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0Nhc2VzL21vZF9zdHJpbmdzX2h1X2h1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NToiQ2FzZXMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaHVfaHUiO31pOjIyNTthOjM6e3M6NDoiZnJvbSI7czo3MDoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0NvbnRhY3RzL21vZF9zdHJpbmdzX2h1X2h1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQ29udGFjdHMiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaHVfaHUiO31pOjIyNjthOjM6e3M6NDoiZnJvbSI7czo3MToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL0RvY3VtZW50cy9tb2Rfc3RyaW5nc19odV9odS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjk6IkRvY3VtZW50cyI7czo4OiJsYW5ndWFnZSI7czo1OiJodV9odSI7fWk6MjI3O2E6Mzp7czo0OiJmcm9tIjtzOjY4OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvRW1haWxzL21vZF9zdHJpbmdzX2h1X2h1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NjoiRW1haWxzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Imh1X2h1Ijt9aToyMjg7YTozOntzOjQ6ImZyb20iO3M6NzY6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9FbWFpbFRlbXBsYXRlcy9tb2Rfc3RyaW5nc19odV9odS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjE0OiJFbWFpbFRlbXBsYXRlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJodV9odSI7fWk6MjI5O2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTGVhZHMvbW9kX3N0cmluZ3NfaHVfaHUucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJMZWFkcyI7czo4OiJsYW5ndWFnZSI7czo1OiJodV9odSI7fWk6MjMwO2E6Mzp7czo0OiJmcm9tIjtzOjcwOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTWVldGluZ3MvbW9kX3N0cmluZ3NfaHVfaHUucGhwIjtzOjk6InRvX21vZHVsZSI7czo4OiJNZWV0aW5ncyI7czo4OiJsYW5ndWFnZSI7czo1OiJodV9odSI7fWk6MjMxO2E6Mzp7czo0OiJmcm9tIjtzOjY3OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvTm90ZXMvbW9kX3N0cmluZ3NfaHVfaHUucGhwIjtzOjk6InRvX21vZHVsZSI7czo1OiJOb3RlcyI7czo4OiJsYW5ndWFnZSI7czo1OiJodV9odSI7fWk6MjMyO2E6Mzp7czo0OiJmcm9tIjtzOjc1OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvT3Bwb3J0dW5pdGllcy9tb2Rfc3RyaW5nc19odV9odS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjEzOiJPcHBvcnR1bml0aWVzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Imh1X2h1Ijt9aToyMzM7YTozOntzOjQ6ImZyb20iO3M6Njk6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Qcm9qZWN0L21vZF9zdHJpbmdzX2h1X2h1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6NzoiUHJvamVjdCI7czo4OiJsYW5ndWFnZSI7czo1OiJodV9odSI7fWk6MjM0O2E6Mzp7czo0OiJmcm9tIjtzOjczOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvamVjdFRhc2svbW9kX3N0cmluZ3NfaHVfaHUucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMToiUHJvamVjdFRhc2siO3M6ODoibGFuZ3VhZ2UiO3M6NToiaHVfaHUiO31pOjIzNTthOjM6e3M6NDoiZnJvbSI7czo3NToiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9sYW5ndWFnZS9tb2R1bGVzL1Byb3NwZWN0TGlzdHMvbW9kX3N0cmluZ3NfaHVfaHUucGhwIjtzOjk6InRvX21vZHVsZSI7czoxMzoiUHJvc3BlY3RMaXN0cyI7czo4OiJsYW5ndWFnZSI7czo1OiJodV9odSI7fWk6MjM2O2E6Mzp7czo0OiJmcm9tIjtzOjcxOiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL2xhbmd1YWdlL21vZHVsZXMvUHJvc3BlY3RzL21vZF9zdHJpbmdzX2h1X2h1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6OToiUHJvc3BlY3RzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Imh1X2h1Ijt9aToyMzc7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9UYXNrcy9tb2Rfc3RyaW5nc19odV9odS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlRhc2tzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Imh1X2h1Ijt9aToyMzg7YTozOntzOjQ6ImZyb20iO3M6Njc6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Vc2Vycy9tb2Rfc3RyaW5nc19odV9odS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlVzZXJzIjtzOjg6Imxhbmd1YWdlIjtzOjU6Imh1X2h1Ijt9aToyMzk7YTozOntzOjQ6ImZyb20iO3M6NzU6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbGFuZ3VhZ2UvbW9kdWxlcy9Nb2R1bGVCdWlsZGVyL21vZF9zdHJpbmdzX2h1X2h1LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6MTM6Ik1vZHVsZUJ1aWxkZXIiO3M6ODoibGFuZ3VhZ2UiO3M6NToiaHVfaHUiO319czoxNDoiYWRtaW5pc3RyYXRpb24iO2E6MTp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjc1OiI8YmFzZXBhdGg+L2luc3RhbGxfZGlyL21vZHVsZXMvQWRtaW5pc3RyYXRpb24vc2VjdXJpdHlncm91cHNhZG1pbm9wdGlvbi5waHAiO3M6MjoidG8iO3M6NTI6Im1vZHVsZXMvQWRtaW5pc3RyYXRpb24vc2VjdXJpdHlncm91cHNhZG1pbm9wdGlvbi5waHAiO319czo0OiJtZW51IjthOjI6e2k6MDthOjI6e3M6NDoiZnJvbSI7czo0NjoiPGJhc2VwYXRoPi9pbnN0YWxsX2Rpci9tZW51cy9BQ0xSb2xlcy9NZW51LnBocCI7czo5OiJ0b19tb2R1bGUiO3M6ODoiQUNMUm9sZXMiO31pOjE7YToyOntzOjQ6ImZyb20iO3M6NDM6IjxiYXNlcGF0aD4vaW5zdGFsbF9kaXIvbWVudXMvVXNlcnMvTWVudS5waHAiO3M6OToidG9fbW9kdWxlIjtzOjU6IlVzZXJzIjt9fXM6MTE6ImxvZ2ljX2hvb2tzIjthOjQ6e2k6MDthOjc6e3M6NjoibW9kdWxlIjtzOjA6IiI7czo0OiJob29rIjtzOjE1OiJhZnRlcl91aV9mb290ZXIiO3M6NToib3JkZXIiO2k6MTA7czoxMToiZGVzY3JpcHRpb24iO3M6MTI6InBvcHVwX29ubG9hZCI7czo0OiJmaWxlIjtzOjM5OiJtb2R1bGVzL1NlY3VyaXR5R3JvdXBzL0Fzc2lnbkdyb3Vwcy5waHAiO3M6NToiY2xhc3MiO3M6MTI6IkFzc2lnbkdyb3VwcyI7czo4OiJmdW5jdGlvbiI7czoxMjoicG9wdXBfb25sb2FkIjt9aToxO2E6Nzp7czo2OiJtb2R1bGUiO3M6MDoiIjtzOjQ6Imhvb2siO3M6MTQ6ImFmdGVyX3VpX2ZyYW1lIjtzOjU6Im9yZGVyIjtpOjIwO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjExOiJtYXNzX2Fzc2lnbiI7czo0OiJmaWxlIjtzOjM5OiJtb2R1bGVzL1NlY3VyaXR5R3JvdXBzL0Fzc2lnbkdyb3Vwcy5waHAiO3M6NToiY2xhc3MiO3M6MTI6IkFzc2lnbkdyb3VwcyI7czo4OiJmdW5jdGlvbiI7czoxMToibWFzc19hc3NpZ24iO31pOjI7YTo3OntzOjY6Im1vZHVsZSI7czowOiIiO3M6NDoiaG9vayI7czoxMDoiYWZ0ZXJfc2F2ZSI7czo1OiJvcmRlciI7aTozMDtzOjExOiJkZXNjcmlwdGlvbiI7czoxMjoicG9wdXBfc2VsZWN0IjtzOjQ6ImZpbGUiO3M6Mzk6Im1vZHVsZXMvU2VjdXJpdHlHcm91cHMvQXNzaWduR3JvdXBzLnBocCI7czo1OiJjbGFzcyI7czoxMjoiQXNzaWduR3JvdXBzIjtzOjg6ImZ1bmN0aW9uIjtzOjEyOiJwb3B1cF9zZWxlY3QiO31pOjM7YTo3OntzOjY6Im1vZHVsZSI7czowOiIiO3M6NDoiaG9vayI7czoxNDoiYWZ0ZXJfdWlfZnJhbWUiO3M6NToib3JkZXIiO2k6NDA7czoxMToiZGVzY3JpcHRpb24iO3M6MTM6InZlcnNpb25fY2hlY2siO3M6NDoiZmlsZSI7czozOToibW9kdWxlcy9TZWN1cml0eUdyb3Vwcy9WZXJzaW9uQ2hlY2sucGhwIjtzOjU6ImNsYXNzIjtzOjEyOiJWZXJzaW9uQ2hlY2siO3M6ODoiZnVuY3Rpb24iO3M6MTM6InZlcnNpb25fY2hlY2siO319fXM6MTY6InVwZ3JhZGVfbWFuaWZlc3QiO3M6MDoiIjt9','2013-12-10 02:13:43',1),('1e837d73-6c6a-1875-e4e5-52a67fc3fb41','upload/upgrades/langpack/SugarCRM-CE-6.5.16-LanguagePack-es_es.zip','8cf8e53e081251a7161aff2aa1f0d73b','langpack','installed','6.5.16','','','','YTozOntzOjg6Im1hbmlmZXN0IjthOjEyOntpOjA7YToyOntzOjEzOiJleGFjdF9tYXRjaGVzIjthOjA6e31zOjEzOiJyZWdleF9tYXRjaGVzIjthOjE6e2k6MDtzOjg6IjZcLjVcLjE2Ijt9fXM6MjQ6ImFjY2VwdGFibGVfc3VnYXJfZmxhdm9ycyI7YToxOntpOjA7czoyOiJDRSI7fXM6NDoibmFtZSI7czoyMToiUGFxdWV0ZSBFc3Bhw7FvbCBCTXlBIjtzOjI6ImlkIjtzOjEwOiJlc19lc19CTXlBIjtzOjE2OiJsYW5nX2ZpbGVfc3VmZml4IjtzOjU6ImVzX2VzIjtzOjExOiJkZXNjcmlwdGlvbiI7czozNDoiUGFxdWV0ZSBkZSB0cmFkdWNjacOzbiBhbCBFc3Bhw7FvbCI7czo2OiJhdXRob3IiO3M6ODoicmVkay5uZXQiO3M6MTY6ImlzX3VuaW5zdGFsbGFibGUiO2I6MTtzOjQ6InR5cGUiO3M6ODoibGFuZ3BhY2siO3M6NDoiaWNvbiI7czowOiIiO3M6MTQ6InB1Ymxpc2hlZF9kYXRlIjtzOjEwOiIyMDEzLzEyLzA5IjtzOjc6InZlcnNpb24iO3M6NjoiNi41LjE2Ijt9czoxMToiaW5zdGFsbGRlZnMiO3M6MDoiIjtzOjE2OiJ1cGdyYWRlX21hbmlmZXN0IjtzOjA6IiI7fQ==','2013-12-10 02:41:46',1);
/*!40000 ALTER TABLE `upgrade_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES ('d1e40f7c-9430-9919-fb46-52a66bfbea40','global',0,'2013-12-10 01:14:53','2013-12-10 02:04:56','1','YToyOTp7czoyMDoiY2FsZW5kYXJfcHVibGlzaF9rZXkiO3M6MzY6ImQxOWUwNGQwLTdhZjEtN2M4NS05ZDI4LTUyYTY2YjVmNWQ5NyI7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZTciO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjEyOiJtYWlsbWVyZ2Vfb24iO3M6Mjoib24iO3M6ODoidGltZXpvbmUiO3M6MjU6IkFtZXJpY2EvQXJnZW50aW5hL0NvcmRvYmEiO3M6MTY6InN3YXBfbGFzdF92aWV3ZWQiO3M6MDoiIjtzOjE0OiJzd2FwX3Nob3J0Y3V0cyI7czowOiIiO3M6MTk6Im5hdmlnYXRpb25fcGFyYWRpZ20iO3M6MjoiZ20iO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjE0OiJtb2R1bGVfZmF2aWNvbiI7czowOiIiO3M6OToiaGlkZV90YWJzIjthOjA6e31zOjExOiJyZW1vdmVfdGFicyI7YTowOnt9czo3OiJub19vcHBzIjtzOjM6Im9mZiI7czoxOToiZW1haWxfcmVtaW5kZXJfdGltZSI7aTotMTtzOjI6InV0IjtzOjE6IjEiO3M6ODoiY3VycmVuY3kiO3M6MzoiLTk5IjtzOjM1OiJkZWZhdWx0X2N1cnJlbmN5X3NpZ25pZmljYW50X2RpZ2l0cyI7czoxOiIyIjtzOjExOiJudW1fZ3JwX3NlcCI7czoxOiIuIjtzOjc6ImRlY19zZXAiO3M6MToiLCI7czo1OiJkYXRlZiI7czo1OiJkL20vWSI7czo1OiJ0aW1lZiI7czozOiJIOmkiO3M6MTU6Im1haWxfc210cHNlcnZlciI7czoxNDoic210cC5nbWFpbC5jb20iO3M6MTM6Im1haWxfc210cHVzZXIiO3M6MjY6ImRhbmllbEBibGFuY29tYXJ0aW4uY29tLmFyIjtzOjEzOiJtYWlsX3NtdHBwYXNzIjtzOjE2OiJhZnpvbmNmb3JnbGR4ZWZ1IjtzOjI2OiJkZWZhdWx0X2xvY2FsZV9uYW1lX2Zvcm1hdCI7czo1OiJzIGYgbCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDt9'),('b3e14316-a4c2-1171-b4c6-52a6763ff5e7','ETag',0,'2013-12-10 02:04:56','2013-12-10 02:13:43','1','YToxOntzOjEyOiJtYWluTWVudUVUYWciO2k6Mjt9'),('38e76bbf-5ba5-88d2-547b-52a6762ddb4a','Home',0,'2013-12-10 02:04:57','2013-12-10 02:05:12','1','YToyOntzOjg6ImRhc2hsZXRzIjthOjY6e3M6MzY6ImMxNzJkNDg4LTUzYmItNjRkMi1lYmY1LTUyYTY3NjhlN2Q0NiI7YTo0OntzOjk6ImNsYXNzTmFtZSI7czoxNjoiU3VnYXJGZWVkRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6OToiU3VnYXJGZWVkIjtzOjExOiJmb3JjZUNvbHVtbiI7aToxO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NDoibW9kdWxlcy9TdWdhckZlZWQvRGFzaGxldHMvU3VnYXJGZWVkRGFzaGxldC9TdWdhckZlZWREYXNobGV0LnBocCI7fXM6MzY6ImM5N2EwNmVhLWVlZTQtNjE5ZS1iYzE4LTUyYTY3NmFkMmNiMCI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNDoiTXlDYWxsc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjU6IkNhbGxzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo1NjoibW9kdWxlcy9DYWxscy9EYXNobGV0cy9NeUNhbGxzRGFzaGxldC9NeUNhbGxzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImNjMzExNjFiLTU4M2YtMjI3ZC0xNWY4LTUyYTY3NjY5ZTdmZSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoxNzoiTXlNZWV0aW5nc0Rhc2hsZXQiO3M6NjoibW9kdWxlIjtzOjg6Ik1lZXRpbmdzIjtzOjExOiJmb3JjZUNvbHVtbiI7aTowO3M6MTI6ImZpbGVMb2NhdGlvbiI7czo2NToibW9kdWxlcy9NZWV0aW5ncy9EYXNobGV0cy9NeU1lZXRpbmdzRGFzaGxldC9NeU1lZXRpbmdzRGFzaGxldC5waHAiO3M6Nzoib3B0aW9ucyI7YTowOnt9fXM6MzY6ImNlMjc2M2VkLTA4NTEtMzQyOS0zY2U1LTUyYTY3NjJkMzg4YSI7YTo1OntzOjk6ImNsYXNzTmFtZSI7czoyMjoiTXlPcHBvcnR1bml0aWVzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6MTM6Ik9wcG9ydHVuaXRpZXMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjgwOiJtb2R1bGVzL09wcG9ydHVuaXRpZXMvRGFzaGxldHMvTXlPcHBvcnR1bml0aWVzRGFzaGxldC9NeU9wcG9ydHVuaXRpZXNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiZDFiNDQwNGQtYmMxYy1kNDBmLWY4OWEtNTJhNjc2NmMxNTBmIjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE3OiJNeUFjY291bnRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6ODoiQWNjb3VudHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjY1OiJtb2R1bGVzL0FjY291bnRzL0Rhc2hsZXRzL015QWNjb3VudHNEYXNobGV0L015QWNjb3VudHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319czozNjoiZDRiMDM5YWYtNzZjYy0wOGI3LTM4NTAtNTJhNjc2ZDU2OGY3IjthOjU6e3M6OToiY2xhc3NOYW1lIjtzOjE0OiJNeUxlYWRzRGFzaGxldCI7czo2OiJtb2R1bGUiO3M6NToiTGVhZHMiO3M6MTE6ImZvcmNlQ29sdW1uIjtpOjA7czoxMjoiZmlsZUxvY2F0aW9uIjtzOjU2OiJtb2R1bGVzL0xlYWRzL0Rhc2hsZXRzL015TGVhZHNEYXNobGV0L015TGVhZHNEYXNobGV0LnBocCI7czo3OiJvcHRpb25zIjthOjA6e319fXM6NToicGFnZXMiO2E6MTp7aTowO2E6Mzp7czo3OiJjb2x1bW5zIjthOjI6e2k6MDthOjI6e3M6NToid2lkdGgiO3M6MzoiNjAlIjtzOjg6ImRhc2hsZXRzIjthOjU6e2k6MTtzOjM2OiJjOTdhMDZlYS1lZWU0LTYxOWUtYmMxOC01MmE2NzZhZDJjYjAiO2k6MjtzOjM2OiJjYzMxMTYxYi01ODNmLTIyN2QtMTVmOC01MmE2NzY2OWU3ZmUiO2k6MztzOjM2OiJjZTI3NjNlZC0wODUxLTM0MjktM2NlNS01MmE2NzYyZDM4OGEiO2k6NDtzOjM2OiJkMWI0NDA0ZC1iYzFjLWQ0MGYtZjg5YS01MmE2NzY2YzE1MGYiO2k6NTtzOjM2OiJkNGIwMzlhZi03NmNjLTA4YjctMzg1MC01MmE2NzZkNTY4ZjciO319aToxO2E6Mjp7czo1OiJ3aWR0aCI7czozOiI0MCUiO3M6ODoiZGFzaGxldHMiO2E6MTp7aTowO3M6MzY6ImMxNzJkNDg4LTUzYmItNjRkMi1lYmY1LTUyYTY3NjhlN2Q0NiI7fX19czoxMDoibnVtQ29sdW1ucyI7czoxOiIyIjtzOjE0OiJwYWdlVGl0bGVMYWJlbCI7czoyMDoiTEJMX0hPTUVfUEFHRV8xX05BTUUiO319fQ=='),('4395e8d3-a0c1-4901-ecb0-52a681b7e48a','SecurityGroups2_SECURITYGROUP',0,'2013-12-10 02:51:31','2013-12-10 02:51:31','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('39ee5432-1430-8954-0139-52a6760a66eb','Home2_CALL',0,'2013-12-10 02:04:57','2013-12-10 02:04:57','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('3aac2355-869a-98ce-d5b4-52a67686a386','Home2_MEETING',0,'2013-12-10 02:04:57','2013-12-10 02:04:57','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('3b4c0b87-04ca-6ce1-f73b-52a6763e3cbd','Home2_OPPORTUNITY',0,'2013-12-10 02:04:57','2013-12-10 02:04:57','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('3bc0e172-b9a1-84d1-110b-52a6761c7775','Home2_ACCOUNT',0,'2013-12-10 02:04:57','2013-12-10 02:04:57','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('3c400f7d-fa0a-9513-8a2e-52a6765b377c','Home2_LEAD',0,'2013-12-10 02:04:57','2013-12-10 02:04:57','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),('3cb8616c-df4c-4fc0-ec34-52a6764013e3','Home2_SUGARFEED',0,'2013-12-10 02:04:57','2013-12-10 02:04:57','1','YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ==');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT '1',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `external_auth_only` tinyint(1) DEFAULT '0',
  `receive_notifications` tinyint(1) DEFAULT '1',
  `description` text,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT '0',
  `show_on_employees` tinyint(1) DEFAULT '1',
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`,`first_name`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','admin','$1$nHeDqC1I$Ohnn4x6ZuJnrIvYBi78Cs/',0,NULL,NULL,1,'Daniel','Blanco',1,0,1,NULL,'2013-12-10 01:14:53','2013-12-10 02:04:56','1','','Administrator',NULL,NULL,'+5493512280893','+543515694621',NULL,NULL,'Active','Alberto Nicasio 6970','Córdoba','Córdoba','Argentina','X5021HPP',0,0,1,'Active','hdanielb','MSN','',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_feeds`
--

DROP TABLE IF EXISTS `users_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_feeds`
--

LOCK TABLES `users_feeds` WRITE;
/*!40000 ALTER TABLE `users_feeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_feeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_last_import`
--

DROP TABLE IF EXISTS `users_last_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_last_import`
--

LOCK TABLES `users_last_import` WRITE;
/*!40000 ALTER TABLE `users_last_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_last_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_password_link`
--

DROP TABLE IF EXISTS `users_password_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_password_link`
--

LOCK TABLES `users_password_link` WRITE;
/*!40000 ALTER TABLE `users_password_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_password_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_signatures`
--

DROP TABLE IF EXISTS `users_signatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text,
  `signature_html` text,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_signatures`
--

LOCK TABLES `users_signatures` WRITE;
/*!40000 ALTER TABLE `users_signatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_signatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vcals`
--

DROP TABLE IF EXISTS `vcals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vcals`
--

LOCK TABLES `vcals` WRITE;
/*!40000 ALTER TABLE `vcals` DISABLE KEYS */;
/*!40000 ALTER TABLE `vcals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_version` varchar(255) DEFAULT NULL,
  `db_version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_version` (`name`,`deleted`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES ('f15c51ad-a851-b0dc-f4f0-52a66b74740d',0,'2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','Chart Data Cache','3.5.1','3.5.1'),('f29bf76f-ae76-d73b-4802-52a66beededd',0,'2013-12-10 01:14:53','2013-12-10 01:14:53','1','1','htaccess','3.5.1','3.5.1'),('49211661-3be2-5138-c8d0-52a6827f33da',0,'2013-12-10 02:54:45','2013-12-10 02:54:45','1','1','Rebuild Relationships','4.0.0','4.0.0'),('57714a0e-334a-f34f-36eb-52a682ca9200',0,'2013-12-10 02:54:45','2013-12-10 02:54:45','1','1','Rebuild Extensions','4.0.0','4.0.0');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-10  0:02:06
