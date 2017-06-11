-- MySQL dump 10.13  Distrib 5.6.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: noliktava
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (3,NULL,1,'Accessories','accessories','2017-06-11 13:42:53','2017-06-11 13:42:53'),(4,NULL,1,'Equipment','equipment','2017-06-11 13:43:24','2017-06-11 13:43:24'),(5,NULL,1,'Machines','machines','2017-06-11 13:43:55','2017-06-11 13:43:55');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,'',1),(2,1,'author_id','text','Author',1,0,1,1,0,1,'',2),(3,1,'category_id','text','Category',1,0,1,1,1,0,'',3),(4,1,'title','text','Title',1,1,1,1,1,1,'',4),(5,1,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',5),(6,1,'body','rich_text_box','Body',1,0,1,1,1,1,'',6),(7,1,'image','image','Post Image',0,1,1,1,1,1,'\n{\n    \"resize\": {\n        \"width\": \"1000\",\n        \"height\": \"null\"\n    },\n    \"quality\": \"70%\",\n    \"upsize\": true,\n    \"thumbnails\": [\n        {\n            \"name\": \"medium\",\n            \"scale\": \"50%\"\n        },\n        {\n            \"name\": \"small\",\n            \"scale\": \"25%\"\n        },\n        {\n            \"name\": \"cropped\",\n            \"crop\": {\n                \"width\": \"300\",\n                \"height\": \"250\"\n            }\n        }\n    ]\n}',7),(8,1,'slug','text','slug',1,0,1,1,1,1,'\n{\n    \"slugify\": {\n        \"origin\": \"title\",\n        \"forceUpdate\": true\n    }\n}',8),(9,1,'meta_description','text_area','meta_description',1,0,1,1,1,1,'',9),(10,1,'meta_keywords','text_area','meta_keywords',1,0,1,1,1,1,'',10),(11,1,'status','select_dropdown','status',1,1,1,1,1,1,'\n{\n    \"default\": \"DRAFT\",\n    \"options\": {\n        \"PUBLISHED\": \"published\",\n        \"DRAFT\": \"draft\",\n        \"PENDING\": \"pending\"\n    }\n}',11),(12,1,'created_at','timestamp','created_at',0,1,1,0,0,0,'',12),(13,1,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',13),(14,2,'id','number','id',1,0,0,0,0,0,'',1),(15,2,'author_id','text','author_id',1,0,0,0,0,0,'',2),(16,2,'title','text','title',1,1,1,1,1,1,'',3),(17,2,'excerpt','text_area','excerpt',1,0,1,1,1,1,'',4),(18,2,'body','rich_text_box','body',1,0,1,1,1,1,'',5),(19,2,'slug','text','slug',1,0,1,1,1,1,'{\"slugify\":{\"origin\":\"title\"}}',6),(20,2,'meta_description','text','meta_description',1,0,1,1,1,1,'',7),(21,2,'meta_keywords','text','meta_keywords',1,0,1,1,1,1,'',8),(22,2,'status','select_dropdown','status',1,1,1,1,1,1,'{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}',9),(23,2,'created_at','timestamp','created_at',1,1,1,0,0,0,'',10),(24,2,'updated_at','timestamp','updated_at',1,0,0,0,0,0,'',11),(25,2,'image','image','image',0,1,1,1,1,1,'',12),(26,3,'id','number','id',1,0,0,0,0,0,'',1),(27,3,'name','text','name',1,1,1,1,1,1,'',2),(28,3,'email','text','email',1,1,1,1,1,1,'',3),(29,3,'password','password','password',1,0,0,1,1,0,'',4),(30,3,'remember_token','text','remember_token',0,0,0,0,0,0,'',5),(31,3,'created_at','timestamp','created_at',0,1,1,0,0,0,'',6),(32,3,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(33,3,'avatar','image','avatar',0,1,1,1,1,1,'',8),(34,5,'id','number','id',1,0,0,0,0,0,'',1),(35,5,'name','text','name',1,1,1,1,1,1,'',2),(36,5,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(37,5,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(38,4,'id','number','id',1,0,0,0,0,0,'',1),(39,4,'parent_id','select_dropdown','parent_id',0,0,1,1,1,1,'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',2),(40,4,'order','text','order',1,1,1,1,1,1,'{\"default\":1}',3),(41,4,'name','text','name',1,1,1,1,1,1,'',4),(42,4,'slug','text','slug',1,1,1,1,1,1,'',5),(43,4,'created_at','timestamp','created_at',0,0,1,0,0,0,'',6),(44,4,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',7),(45,6,'id','number','id',1,0,0,0,0,0,'',1),(46,6,'name','text','Name',1,1,1,1,1,1,'',2),(47,6,'created_at','timestamp','created_at',0,0,0,0,0,0,'',3),(48,6,'updated_at','timestamp','updated_at',0,0,0,0,0,0,'',4),(49,6,'display_name','text','Display Name',1,1,1,1,1,1,'',5),(50,1,'seo_title','text','seo_title',0,1,1,1,1,1,'',14),(51,1,'featured','checkbox','featured',1,1,1,1,1,1,'',15),(52,3,'role_id','text','role_id',1,1,1,1,1,1,'',9),(109,13,'id','checkbox','Id',1,0,0,0,0,0,NULL,1),(110,13,'created_at','timestamp','Created At',0,1,1,1,0,1,NULL,2),(111,13,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,3),(112,13,'image_path','text','Image Path',1,1,1,1,1,1,NULL,4),(113,13,'title','text','Title',1,1,1,1,1,1,NULL,5),(114,13,'description','text','Description',1,1,1,1,1,1,NULL,6),(115,13,'price','text','Price',1,1,1,1,1,1,NULL,7),(116,13,'category_id','text','Category Id',1,1,1,1,1,1,NULL,8);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'posts','posts','Post','Posts','voyager-news','TCG\\Voyager\\Models\\Post','','',1,0,'2017-06-03 16:01:40','2017-06-03 16:01:40'),(2,'pages','pages','Page','Pages','voyager-file-text','TCG\\Voyager\\Models\\Page','','',1,0,'2017-06-03 16:01:40','2017-06-03 16:01:40'),(3,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','','',1,0,'2017-06-03 16:01:40','2017-06-03 16:01:40'),(4,'categories','categories','Category','Categories','voyager-categories','TCG\\Voyager\\Models\\Category','','',1,0,'2017-06-03 16:01:40','2017-06-03 16:01:40'),(5,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu','','',1,0,'2017-06-03 16:01:40','2017-06-03 16:01:40'),(6,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role','','',1,0,'2017-06-03 16:01:40','2017-06-03 16:01:40'),(13,'products','manageproducts','Product','Products',NULL,'App\\Product',NULL,NULL,1,0,'2017-06-08 15:22:06','2017-06-08 15:22:06');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dashboard','/admin','_self','voyager-boat',NULL,NULL,1,'2017-06-03 16:01:44','2017-06-03 16:01:44',NULL,NULL),(2,1,'Media','/admin/media','_self','voyager-images',NULL,NULL,5,'2017-06-03 16:01:44','2017-06-08 14:43:20',NULL,NULL),(3,1,'Posts','/admin/posts','_self','voyager-news',NULL,NULL,6,'2017-06-03 16:01:44','2017-06-08 14:43:20',NULL,NULL),(4,1,'Users','/admin/users','_self','voyager-person',NULL,NULL,4,'2017-06-03 16:01:44','2017-06-08 14:43:20',NULL,NULL),(5,1,'Categories','/admin/categories','_self','voyager-categories',NULL,NULL,8,'2017-06-03 16:01:44','2017-06-08 14:43:20',NULL,NULL),(6,1,'Pages','/admin/pages','_self','voyager-file-text',NULL,NULL,7,'2017-06-03 16:01:44','2017-06-08 14:43:20',NULL,NULL),(7,1,'Roles','/admin/roles','_self','voyager-lock',NULL,NULL,3,'2017-06-03 16:01:44','2017-06-08 14:43:20',NULL,NULL),(8,1,'Tools','','_self','voyager-tools',NULL,NULL,9,'2017-06-03 16:01:44','2017-06-08 14:43:20',NULL,NULL),(9,1,'Menu Builder','/admin/menus','_self','voyager-list',NULL,8,1,'2017-06-03 16:01:44','2017-06-03 18:31:43',NULL,NULL),(10,1,'Database','/admin/database','_self','voyager-data',NULL,8,3,'2017-06-03 16:01:44','2017-06-08 14:53:20',NULL,NULL),(11,1,'Settings','/admin/settings','_self','voyager-settings',NULL,NULL,10,'2017-06-03 16:01:44','2017-06-08 14:43:20',NULL,NULL),(12,2,'News','/','_self',NULL,'#000000',NULL,13,'2017-06-03 16:22:41','2017-06-03 16:22:41',NULL,''),(13,2,'About','/about','_self',NULL,'#000000',NULL,14,'2017-06-03 16:22:56','2017-06-03 16:22:56',NULL,''),(14,2,'Gallery','/gallery','_self',NULL,'#000000',NULL,15,'2017-06-03 16:23:14','2017-06-03 16:23:14',NULL,''),(15,2,'Shop','/shop','_self',NULL,'#000000',NULL,16,'2017-06-03 16:23:22','2017-06-03 16:23:22',NULL,''),(16,2,'Contacts','/contacts','_self',NULL,'#000000',NULL,17,'2017-06-03 16:23:35','2017-06-03 16:23:35',NULL,''),(21,1,'Manage Products','/admin/manageproducts','_self',NULL,'#000000',NULL,18,'2017-06-08 15:22:39','2017-06-08 15:22:39',NULL,'');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2017-06-03 16:01:44','2017-06-03 16:01:44'),(2,'main','2017-06-03 16:21:42','2017-06-03 16:21:42');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_06_03_181150_create_shoppingcart_table',2),(4,'2016_01_01_000000_add_voyager_user_fields',3),(5,'2016_01_01_000000_create_data_types_table',3),(6,'2016_01_01_000000_create_pages_table',3),(7,'2016_01_01_000000_create_posts_table',3),(8,'2016_02_15_204651_create_categories_table',3),(9,'2016_05_19_173453_create_menu_table',3),(10,'2016_10_21_190000_create_roles_table',3),(11,'2016_10_21_190000_create_settings_table',3),(12,'2016_11_30_135954_create_permission_table',3),(13,'2016_11_30_141208_create_permission_role_table',3),(14,'2016_12_26_201236_data_types__add__server_side',3),(15,'2017_01_13_000000_add_route_to_menu_items_table',3),(16,'2017_01_14_005015_create_translations_table',3),(17,'2017_01_15_000000_add_permission_group_id_to_permissions_table',3),(18,'2017_01_15_000000_create_permission_groups_table',3),(19,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',3),(20,'2017_03_06_000000_add_controller_to_data_types_table',3),(21,'2017_04_21_000000_add_order_to_data_rows_table',3),(22,'2017_06_04_122133_create_products_table',4),(27,'2017_06_04_181213_create_orders_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2017-06-11 08:07:35','2017-06-11 09:08:10',2,'nilsivanovs@inbox.lv','O:8:\"App\\Cart\":3:{s:5:\"items\";a:1:{i:13;a:3:{s:3:\"qty\";i:1;s:5:\"price\";d:420;s:4:\"item\";O:11:\"App\\Product\":25:{s:11:\"\0*\0fillable\";a:6:{i:0;s:10:\"image_path\";i:1;s:5:\"title\";i:2;s:11:\"description\";i:3;s:5:\"price\";i:4;s:4:\"type\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:13;s:10:\"created_at\";s:19:\"2017-06-10 19:27:49\";s:10:\"updated_at\";s:19:\"2017-06-11 09:45:31\";s:10:\"image_path\";s:14:\"1497123398.jpg\";s:5:\"title\";s:6:\"Hockey\";s:11:\"description\";s:18:\"This is hockey AYE\";s:5:\"price\";d:420;s:11:\"category_id\";i:1;}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:13;s:10:\"created_at\";s:19:\"2017-06-10 19:27:49\";s:10:\"updated_at\";s:19:\"2017-06-11 09:45:31\";s:10:\"image_path\";s:14:\"1497123398.jpg\";s:5:\"title\";s:6:\"Hockey\";s:11:\"description\";s:18:\"This is hockey AYE\";s:5:\"price\";d:420;s:11:\"category_id\";i:1;}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:9:\"\0*\0events\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:1;s:10:\"totalPrice\";d:420;}','a:4:{i:0;s:6:\"Street\";i:1;s:4:\"City\";i:2;s:7:\"Country\";i:3;s:8:\"Postcode\";}','Nils Ivanovs','2132123123','custom notherino',0),(2,'2017-06-11 08:53:04','2017-06-11 09:08:06',2,'nilsivanovs@inbox.lv','O:8:\"App\\Cart\":3:{s:5:\"items\";a:1:{i:13;a:3:{s:3:\"qty\";i:1;s:5:\"price\";d:420;s:4:\"item\";O:11:\"App\\Product\":25:{s:11:\"\0*\0fillable\";a:6:{i:0;s:10:\"image_path\";i:1;s:5:\"title\";i:2;s:11:\"description\";i:3;s:5:\"price\";i:4;s:4:\"type\";i:5;s:11:\"category_id\";}s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:8:{s:2:\"id\";i:13;s:10:\"created_at\";s:19:\"2017-06-10 19:27:49\";s:10:\"updated_at\";s:19:\"2017-06-11 09:45:31\";s:10:\"image_path\";s:14:\"1497123398.jpg\";s:5:\"title\";s:6:\"Hockey\";s:11:\"description\";s:18:\"This is hockey AYE\";s:5:\"price\";d:420;s:11:\"category_id\";i:1;}s:11:\"\0*\0original\";a:8:{s:2:\"id\";i:13;s:10:\"created_at\";s:19:\"2017-06-10 19:27:49\";s:10:\"updated_at\";s:19:\"2017-06-11 09:45:31\";s:10:\"image_path\";s:14:\"1497123398.jpg\";s:5:\"title\";s:6:\"Hockey\";s:11:\"description\";s:18:\"This is hockey AYE\";s:5:\"price\";d:420;s:11:\"category_id\";i:1;}s:8:\"\0*\0casts\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:9:\"\0*\0events\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}s:8:\"totalQty\";i:1;s:10:\"totalPrice\";d:420;}','a:4:{i:0;s:26:\"Nītaures pag., Ziedulejas\";i:1;s:8:\"Nītaure\";i:2;s:6:\"Latvia\";i:3;s:7:\"LV-4112\";}','ayyeey','+37125765415','asdasdsa',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (3,2,'About Us',NULL,'<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu quam in dui consectetur ultrices. Praesent accumsan nibh quis vestibulum imperdiet. Cras auctor, eros non imperdiet cursus, sem est sagittis sapien, ac mollis nisl metus non tellus. Vestibulum rutrum mi nisi, eget volutpat dui hendrerit ac. Cras posuere tristique tincidunt. Nulla neque orci, lobortis eu auctor eget, aliquet at metus. Integer porta rhoncus faucibus. Suspendisse iaculis, sem eget dictum gravida, tellus ex congue lectus, at dictum quam lorem auctor nibh. Vestibulum non vestibulum mi, nec ornare odio. Mauris venenatis, ex tincidunt congue maximus, lacus tortor viverra ex, quis mollis elit mi nec eros. Donec odio lacus, tempus id convallis quis, mattis sit amet eros. Donec ut augue semper, finibus orci id, suscipit nibh. Cras a lorem efficitur, auctor justo vitae, suscipit odio. Sed molestie risus et ipsum porttitor, nec eleifend sapien maximus. Mauris cursus nulla non urna hendrerit placerat.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">Curabitur tincidunt accumsan magna vel finibus. Praesent sit amet arcu malesuada, vulputate lorem et, aliquet dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a lacinia elit. Quisque rutrum faucibus lectus vitae viverra. Vestibulum quis risus in arcu elementum blandit. Ut nulla augue, dictum at condimentum vitae, sollicitudin non nisl. Pellentesque semper a ante a efficitur. Phasellus congue fringilla lacinia. Donec libero justo, iaculis non euismod sed, accumsan quis felis. Pellentesque hendrerit sapien vel ex pretium aliquam.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">Sed egestas felis eu leo volutpat, vitae ornare metus venenatis. Aliquam erat volutpat. Fusce aliquet turpis turpis, eu tincidunt leo consectetur pellentesque. Donec eu libero eu libero consequat tempor vel non mi. Nulla ut nunc semper, egestas nisl et, feugiat purus. Aliquam mauris nisi, accumsan vitae tincidunt at, malesuada ut lorem. Morbi non odio lacinia odio ultrices mollis vitae id lorem. Vivamus ut neque facilisis enim efficitur gravida.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">Nunc interdum ante a massa tempor tempus. Etiam aliquet sem a nisi dignissim, et lacinia turpis fringilla. Ut eu pretium nisi. Maecenas molestie arcu vitae risus congue volutpat. Suspendisse potenti. Cras ac molestie nulla. Mauris ut velit pellentesque, dictum odio nec, condimentum leo. Suspendisse accumsan volutpat libero, non viverra ligula eleifend eu. Nam ut lorem ac libero volutpat euismod sit amet vitae elit. Quisque viverra, urna vel ornare semper, lectus metus efficitur mi, vitae gravida turpis nisl non magna.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; color: #000000; font-family: \'Open Sans\', Arial, sans-serif;\">Aenean aliquam ipsum imperdiet diam pellentesque, nec aliquam metus hendrerit. Pellentesque cursus volutpat ultrices. Suspendisse commodo ultrices quam eu congue. Nam sit amet nisi interdum, sodales massa a, porta nisl. Cras hendrerit consectetur aliquet. Curabitur sagittis eget ante quis suscipit. Nulla vulputate pellentesque urna in ultrices. Integer aliquet mi quam, eu efficitur sapien laoreet et. Sed eget cursus est, eget sollicitudin leo. Etiam dignissim hendrerit volutpat. Donec vestibulum ipsum erat, sit amet molestie sapien pulvinar faucibus.</p>','pages/June2017/vucxiFnikaLNjwJFW6pW.jpg','about','about us','about us','ACTIVE','2017-06-03 17:46:56','2017-06-03 18:22:19');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_groups`
--

DROP TABLE IF EXISTS `permission_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_groups`
--

LOCK TABLES `permission_groups` WRITE;
/*!40000 ALTER TABLE `permission_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2017-06-03 16:01:44','2017-06-03 16:01:44',NULL),(2,'browse_database',NULL,'2017-06-03 16:01:44','2017-06-03 16:01:44',NULL),(3,'browse_media',NULL,'2017-06-03 16:01:44','2017-06-03 16:01:44',NULL),(4,'browse_settings',NULL,'2017-06-03 16:01:44','2017-06-03 16:01:44',NULL),(5,'browse_menus','menus','2017-06-03 16:01:44','2017-06-03 16:01:44',NULL),(6,'read_menus','menus','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(7,'edit_menus','menus','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(8,'add_menus','menus','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(9,'delete_menus','menus','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(10,'browse_pages','pages','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(11,'read_pages','pages','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(12,'edit_pages','pages','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(13,'add_pages','pages','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(14,'delete_pages','pages','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(15,'browse_roles','roles','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(16,'read_roles','roles','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(17,'edit_roles','roles','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(18,'add_roles','roles','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(19,'delete_roles','roles','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(20,'browse_users','users','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(21,'read_users','users','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(22,'edit_users','users','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(23,'add_users','users','2017-06-03 16:01:45','2017-06-03 16:01:45',NULL),(24,'delete_users','users','2017-06-03 16:01:46','2017-06-03 16:01:46',NULL),(25,'browse_posts','posts','2017-06-03 16:01:46','2017-06-03 16:01:46',NULL),(26,'read_posts','posts','2017-06-03 16:01:46','2017-06-03 16:01:46',NULL),(27,'edit_posts','posts','2017-06-03 16:01:46','2017-06-03 16:01:46',NULL),(28,'add_posts','posts','2017-06-03 16:01:46','2017-06-03 16:01:46',NULL),(29,'delete_posts','posts','2017-06-03 16:01:46','2017-06-03 16:01:46',NULL),(30,'browse_categories','categories','2017-06-03 16:01:46','2017-06-03 16:01:46',NULL),(31,'read_categories','categories','2017-06-03 16:01:46','2017-06-03 16:01:46',NULL),(32,'edit_categories','categories','2017-06-03 16:01:46','2017-06-03 16:01:46',NULL),(33,'add_categories','categories','2017-06-03 16:01:46','2017-06-03 16:01:46',NULL),(34,'delete_categories','categories','2017-06-03 16:01:46','2017-06-03 16:01:46',NULL),(60,'browse_products','products','2017-06-08 15:22:06','2017-06-08 15:22:06',NULL),(61,'read_products','products','2017-06-08 15:22:06','2017-06-08 15:22:06',NULL),(62,'edit_products','products','2017-06-08 15:22:06','2017-06-08 15:22:06',NULL),(63,'add_products','products','2017-06-08 15:22:06','2017-06-08 15:22:06',NULL),(64,'delete_products','products','2017-06-08 15:22:06','2017-06-08 15:22:06',NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (5,2,1,'PREDATORS MAKE LINEUP CHANGES FOR GAME 3 IN HOPES OF ADDING OFFENSE',NULL,'HOPES OF ADDING OFFENSE','<p>NASHVILLE &ndash; With his team seeking offense and his top players having gone dry in the Stanley Cup final, Nashville Predators coach Peter Laviolette is finally ready to bolster his bottom-six forwards with some players who actually give his team a chance to score. Laviolette was not tipping his hand as to who will be at the other end of the ice, but it&rsquo;s expected Pekka Rinne will get a chance to redeem himself after two disastrous outings.</p>\r\n<p>With the Predators facing a must-win situation in Game 3 on home ice Saturday night, veteran right winger P.A. Parenteau draws into the lineup after playing just one playoff game so far. He&rsquo;ll be joined by Harry Zolnierczyk, with both players flanking Frederick Gaudreau, who moves from the wing to center the fourth line. The most likely players to come out of the lineup are Vern Fiddler and Cody McLeod, who struggled mightily in Game 2.</p>\r\n<div id=\"fsk_splitbox_92_onscreen\" style=\"box-sizing: border-box; color: #000000; font-family: Ubuntu, sans-serif; font-size: 17px;\">\r\n<div id=\"fsk_splitbox_92\" class=\"  fsk_splitbox_92\" style=\"box-sizing: border-box; height: 0px; text-align: center;\"><iframe id=\"fsk_frame_splitbox\" style=\"box-sizing: border-box; width: 721.656px; height: 0px; border-width: initial; border-style: none; margin: 0px;\" name=\"fsk_frame_splitbox\" frameborder=\"0\" allowfullscreen=\"\"></iframe></div>\r\n</div>\r\n<p>Auston Watson, who had been playing the right side of the fourth line, is the likely candidate to move up to the third line with Calle Jarnkrok and Craig Smith. The top two lines remain the same with Colton Sissons between Filip Forsberg and Pontus Aberg and Mike Fisher playing the middle between Viktor Arvidsson and James Neal.</p>\r\n<p>The Penguins, meanwhile, might have to change their look out of necessity, with third-line center Nick Bonino questionable after taking a shot to the foot in Game 2. Bonino was seen wearing a walking cast and did not take part in the Penguins optional morning skate. Should he not be able to go, Carter Rowney would likely move over to center the third line from the right side and Carl Hagelin would move into Rowney&rsquo;s spot.</p>\r\n<p>Parenteau, who scored 20 goals in 2015-16&nbsp;and could help out on the power play, will be playing his first-ever game in the Stanley Cup final at the age of 34. He came to the Predators at the trade deadline, but was still recovering from a broken finger and struggled to create offense after he arrived. In fact, in eight regular season games and one playoff game, he has yet to find the back of the net in a Predators uniform. He&rsquo;s hoping that chances in Game 3.</p>','posts/June2017/5v22SmzLCFgev5i1zmkf.jpg','predators-make-lineup-changes','game','hockey','PUBLISHED',1,'2017-06-03 16:53:41','2017-06-03 17:01:07'),(6,2,1,'IN POTENTIAL SWAP WITH BLACKHAWKS, GOLDEN KNIGHTS SHOWING CAP SPACE MIGHT BE THEIR BEST WEAPON',NULL,'GOLDEN KNIGHTS SHOWING CAP SPACE MIGHT BE THEIR BEST WEAPON','<p><strong style=\"box-sizing: border-box;\">Reports have surfaced of a potential pre-expansion draft swap between Vegas and Chicago, and if the deal goes through, it could show how the Golden Knights plan to use their cap space as an asset.</strong></p>\r\n<div id=\"fsk_splitbox_92_onscreen\" style=\"box-sizing: border-box; color: #000000; font-family: Ubuntu, sans-serif; font-size: 17px;\">\r\n<div id=\"fsk_splitbox_92\" class=\"  fsk_splitbox_92\" style=\"box-sizing: border-box; height: 0px; text-align: center; min-height: 0px;\"><iframe id=\"fsk_frame_splitbox\" style=\"box-sizing: border-box; width: 721.656px; height: 0px; border-width: initial; border-style: none; margin: 0px;\" name=\"fsk_frame_splitbox\" frameborder=\"0\" allowfullscreen=\"\"></iframe></div>\r\n</div>\r\n<p>As the Vegas Golden Knights head towards the assembly of the team&rsquo;s first roster, GM George McPhee has a number of tools in his arsenal. Among them are a staff that has spent the better part of the past year scouting, an expansion draft that stands to help him build a competitive squad right out of the gate and draft rules that could see rival GMs strike deals to keep additional players safe.&nbsp;</p>\r\n<p>But as pre-expansion draft rumors and rumblings start to find the light of day, it appears that maybe the greatest weapon McPhee has at the ready is a boatload of cap space.</p>\r\n<p>Over the past few seasons, the league has seen a number of teams, namely the Arizona Coyotes, Carolina Hurricanes and New Jersey Devils, utilize cap space not only as a means to sign players but as an asset that can brighten up the future of their respective franchises. Teams with wiggle room under the cap have taken on bad contracts, or at least those that another team is dying to get out from under, in exchange for landing a contributing roster player, promising prospect or a worthwhile draft choice.&nbsp;</p>\r\n<p>The past summer was a prime example of GMs using their cap space as an asset, too.&nbsp;</p>\r\n<p>Almost exactly one year ago, the Devils used their cap space to take on the contract of retired center Marc Savard from the Florida Panthers. In order for New Jersey to accept the deal, though, a second-round selection in the 2018 draft was tacked on with Graham Black and Paul Thompson, two players who spent the majority of the past year in the AHL, heading the other way. Shortly after that, with Chicago set to undergo their now-annual cap purge, the Hurricanes took on Bryan Bickell&rsquo;s contract from the Blackhawks. However, in order for Carolina to agree, Chicago also had to throw in winger Teuvo Teravainen, an up-and-comer with oodles of potential who was no doubt hard for the Blackhawks to part ways with. And at the June draft, a deal was struck to send the KHL-bound Pavel Datsyuk from the Red Wings to the Coyotes. To sweeten the pot for Arizona, Detroit GM Ken Holland swapped first-round picks with the Coyotes, moving down four spots and giving the Desert Dogs the 16th-overall selection&nbsp;--&nbsp;one which turned in Jakob Chychrun, a rookie rearguard who wound up playing nearly 70 games in this past season.</p>\r\n<p>And with those deals in mind, it appears similar swaps could be in the works for Vegas as the expansion draft approaches.&nbsp;</p>\r\n<p>Wednesday afternoon,&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #000000;\" href=\"https://twitter.com/frank_seravalli/status/869956592845725697\">TSN&rsquo;s Frank Seravalli reported</a>&nbsp;that the Golden Knights could be on the verge of completing a deal with the Blackhawks that would see both center Marcus Kruger and defenseman Trevor van Riemsdyk end up Sin City next season. While the specifics of the deal are still a bit murky, it would make sense were the agreement to see Kruger, who was likely to go unprotected ahead of the expansion draft, plucked from Chicago with van Riemsdyk shipped out shortly thereafter as payment for Vegas at least partially relieving what is a tough cap situation in the Windy City.</p>\r\n<p>The swap would be one that would absolutely make sense for both sides, as well. From the Blackhawks&rsquo; perspective, being rid of Kruger&rsquo;s nearly $3.1-million cap hit makes the financial situation at least slightly easier to handle, even if it does come at the cost of losing a defenseman that coach Joel Quenneville has come to rely on as a second- or third-pairing player over the past few seasons. Meanwhile, it allows the Golden Knights to land not one but two players with incredible post-season and Stanley Cup championship experience. Acquiring both Kruger and van Riemsdyk would benefit Vegas beyond their respective backgrounds, however.&nbsp;</p>\r\n<p>While van Riemsdyk may not be the best and brightest rearguard Chicago has to offer, he&rsquo;s learned from some tremendous teammates over the past few seasons. And given he&rsquo;s only 25, van Riemsdyk could be far from reaching his ceiling. He has long been considered the best acquisition the Golden Knights would be able to make off the Blackhawks&rsquo; roster, and that&rsquo;s because he would bring size, a shot and some serious upside to the Vegas blueline.</p>','posts/June2017/YREDtnNtYzHErptq5gpo.jpg','in-potential-swap-with-blackhawks-golden-knights-showing-cap-space-might-be-their-best-weapon','game','hockey','PUBLISHED',0,'2017-06-03 17:38:15','2017-06-03 17:38:15'),(7,2,1,'DOWN GOES BROWN: FIVE TIMES GAME 2 OF THE STANLEY CUP FINAL WAS THE TURNING POINT',NULL,'CANADIENS VS. FLAMES','<p>Don\'t write off the Predators just yet, as these five series show no matter what happens in Game 1, the outcome of a series can still be completely changed in Game 2.</p>\r\n<p>The Nashville Predators suffered&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #000000;\" href=\"http://www.thehockeynews.com/news/article/nightmare-first-period-ruins-nashville-s-game-1\" target=\"_blank\" rel=\"noopener noreferrer\">one of the strangest</a>&nbsp;losses in Stanley Cup final history on Monday, erasing a 3-0 deficit while holding the Penguins without a shot for 37 straight minutes before allowing a back-breaking winning goal late in the third.</p>\r\n<p>The way they lost was bad enough. But just losing at all is a big deal. After all, as we\'re constantly told, the team that wins Game 1 in the final&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #000000;\" href=\"https://twitter.com/Sean_Leahy/status/869239074221039616\" target=\"_blank\" rel=\"noopener noreferrer\">wins almost 80 percent&nbsp;the series</a>, including each of the last five. To hear some tell it, this one\'s basically over.</p>\r\n<div id=\"fsk_splitbox_92_onscreen\" style=\"box-sizing: border-box; color: #000000; font-family: Ubuntu, sans-serif; font-size: 17px;\">\r\n<div id=\"fsk_splitbox_92\" class=\"  fsk_splitbox_92\" style=\"box-sizing: border-box; height: 0px; text-align: center; min-height: 0px;\"><iframe id=\"fsk_frame_splitbox\" style=\"box-sizing: border-box; width: 721.656px; height: 0px; border-width: initial; border-style: none; margin: 0px;\" name=\"fsk_frame_splitbox\" frameborder=\"0\" allowfullscreen=\"\"></iframe></div>\r\n</div>\r\n<p>It\'s tough times to be a Nashville fan. So as we head into Wednesday\'s&nbsp;crucial second game, let\'s offer up some hope for anyone rooting for the Predators. Here are five times in Stanley Cup final history that Game 1 didn\'t end up mattering, and Game 2 turned out to be the series turning point.<br style=\"box-sizing: border-box;\" />&nbsp;</p>\r\n<p style=\"box-sizing: border-box; font-family: Rajdhani, sans-serif; line-height: 19px; color: #000000; margin: 0px 0px 10px; font-size: 1.8rem; text-transform: uppercase;\"><em><strong style=\"box-sizing: border-box;\">1986 &ndash; CANADIENS VS. FLAMES</strong></em></p>\r\n<p>&nbsp;</p>\r\n<p><strong style=\"box-sizing: border-box;\">After one game:</strong>&nbsp;Calgary went into the final sporting a distinct \"team of destiny\" feel. After years of living in the Oilers\' shadow, the Flames had knocked off their provincial rivals in seven games on&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #000000;\" href=\"http://www.sportsnet.ca/hockey/nhl/goes-brown-10-nhl-goals-worth-remembering/\" target=\"_blank\" rel=\"noopener noreferrer\">Steve Smith\'s infamous own goal</a>. They arrived in the final holding home ice advantage, and opened the series with a convincing 5-2 win over the Canadiens.</p>\r\n<p><strong style=\"box-sizing: border-box;\">But then:</strong>&nbsp;Looking to take a 2-0 series lead back to Montreal, the Flames opened the scoring in the first and added another goal just seconds into the second period. But they let the Habs off the mat, as Montreal came back to send the game to overtime. Once they got there, it didn\'t take long to make some history.</p>\r\n<p><iframe title=\"\" src=\"https://www.youtube.com/embed/Wt0-JsN5IdA?wmode=opaque&amp;theme=dark\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"\"></iframe></p>','posts/June2017/q4oEq2nFg98ezPZxGLQt.jpg','down-goes-brown','game','hockey','PUBLISHED',0,'2017-06-03 17:41:06','2017-06-03 17:41:06'),(8,2,1,'THE HOCKEY NEWS PODCAST: IS SOMETHING WRONG WITH SIDNEY CROSBY?',NULL,'This week on The Hockey News Podcast','<p>This week on The Hockey News Podcast:</p>\r\n<p>--Sidney Crosby hasn\'t been at his best since returning from a concussion<br style=\"box-sizing: border-box;\" />--Who\'s more important to his team: Crosby or Karlsson?<br style=\"box-sizing: border-box;\" />--Is Pekka Rinne turning into a pumpkin?<br style=\"box-sizing: border-box;\" />--John Gibson has been under-the-radar for too long<br style=\"box-sizing: border-box;\" />--Expansion draft threatens to hurt Ducks core, tough decisions need to be made<br style=\"box-sizing: border-box;\" />--Reader Questions on: Hurricanes goaltending, Canucks future, Flames goaltending</p>','posts/June2017/1tcUQX1DYDcgxVXlRMLx.jpg','the-hockey-news-podcast-is-something','podcast','hockey','PUBLISHED',0,'2017-06-03 17:42:36','2017-06-03 17:42:36');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (15,'2017-06-11 13:45:54','2017-06-11 13:45:54','1497199554.jpg','Tear Drop With Oil','2-1/4\" x 1-3/4\" x 1/8\", dark gray with oil',12.00,3),(16,'2017-06-11 13:46:37','2017-06-11 13:46:37','1497199597.jpg','Cross Grind (turbo)','Double belt for Turbo machines. Designed for high speed, low inertia',68.50,3),(17,'2017-06-11 13:47:50','2017-06-11 13:47:50','1497199670.jpg','FILTER EXHAUST','Fits new Turbo, Liberty, and Classic Blackstone® Exhaust Systems. Double the capacity of any skate sharpening filter on the market',185.00,3),(18,'2017-06-11 13:49:54','2017-06-11 13:49:54','1497199794.jpg','Boot Stretcher','Capable of stretching boot 1/2 size longer and 2 sizes wider\r\nEdges and buttons which stretch the heated boot for greater foot comfort, 3 sets of shoe lasts of varying sizes',1500.00,5),(19,'2017-06-11 13:59:21','2017-06-11 13:59:21','1497200361.jpg','F-02 MACHINES','Blackstone® F-02 Professional Portables are perfect for low volume shops and teams who need to take their sharpener on the road. With a rugged wooden case with extendable handle and wheels, this machine is ready for anything.',4600.00,5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2017-06-03 16:01:44','2017-06-03 16:01:44'),(2,'user','Normal User','2017-06-03 16:01:44','2017-06-03 16:01:44');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'title','Site Title','Ice Hockey Shop','','text',1),(2,'description','Site Description','Site Description','','text',2),(3,'logo','Site Logo','','','image',3),(4,'admin_bg_image','Admin Background Image','','','image',9),(5,'admin_title','Admin Title','Voyager','','text',4),(6,'admin_description','Admin Description','Welcome to Ice Hockey Shop Admin','','text',5),(7,'admin_loader','Admin Loader','','','image',6),(8,'admin_icon_image','Admin Icon Image','','','image',7),(9,'google_analytics_client_id','Google Analytics Client ID','','','text',9);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcart`
--

DROP TABLE IF EXISTS `shoppingcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoppingcart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcart`
--

LOCK TABLES `shoppingcart` WRITE;
/*!40000 ALTER TABLE `shoppingcart` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'data_types','display_name_singular',1,'pt','Post','2017-06-03 16:06:05','2017-06-03 16:06:05'),(2,'data_types','display_name_singular',2,'pt','Página','2017-06-03 16:06:05','2017-06-03 16:06:05'),(3,'data_types','display_name_singular',3,'pt','Utilizador','2017-06-03 16:06:05','2017-06-03 16:06:05'),(4,'data_types','display_name_singular',4,'pt','Categoria','2017-06-03 16:06:05','2017-06-03 16:06:05'),(5,'data_types','display_name_singular',5,'pt','Menu','2017-06-03 16:06:05','2017-06-03 16:06:05'),(6,'data_types','display_name_singular',6,'pt','Função','2017-06-03 16:06:05','2017-06-03 16:06:05'),(7,'data_types','display_name_plural',1,'pt','Posts','2017-06-03 16:06:05','2017-06-03 16:06:05'),(8,'data_types','display_name_plural',2,'pt','Páginas','2017-06-03 16:06:05','2017-06-03 16:06:05'),(9,'data_types','display_name_plural',3,'pt','Utilizadores','2017-06-03 16:06:05','2017-06-03 16:06:05'),(10,'data_types','display_name_plural',4,'pt','Categorias','2017-06-03 16:06:05','2017-06-03 16:06:05'),(11,'data_types','display_name_plural',5,'pt','Menus','2017-06-03 16:06:06','2017-06-03 16:06:06'),(12,'data_types','display_name_plural',6,'pt','Funções','2017-06-03 16:06:06','2017-06-03 16:06:06'),(13,'pages','title',1,'pt','Olá Mundo','2017-06-03 16:06:06','2017-06-03 16:06:06'),(14,'pages','slug',1,'pt','ola-mundo','2017-06-03 16:06:06','2017-06-03 16:06:06'),(15,'pages','body',1,'pt','<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>','2017-06-03 16:06:06','2017-06-03 16:06:06'),(16,'menu_items','title',1,'pt','Painel de Controle','2017-06-03 16:06:06','2017-06-03 16:06:06'),(17,'menu_items','title',2,'pt','Media','2017-06-03 16:06:06','2017-06-03 16:06:06'),(18,'menu_items','title',3,'pt','Publicações','2017-06-03 16:06:06','2017-06-03 16:06:06'),(19,'menu_items','title',4,'pt','Utilizadores','2017-06-03 16:06:06','2017-06-03 16:06:06'),(20,'menu_items','title',5,'pt','Categorias','2017-06-03 16:06:06','2017-06-03 16:06:06'),(21,'menu_items','title',6,'pt','Páginas','2017-06-03 16:06:06','2017-06-03 16:06:06'),(22,'menu_items','title',7,'pt','Funções','2017-06-03 16:06:06','2017-06-03 16:06:06'),(23,'menu_items','title',8,'pt','Ferramentas','2017-06-03 16:06:06','2017-06-03 16:06:06'),(24,'menu_items','title',9,'pt','Menus','2017-06-03 16:06:06','2017-06-03 16:06:06'),(25,'menu_items','title',10,'pt','Base de dados','2017-06-03 16:06:06','2017-06-03 16:06:06'),(26,'menu_items','title',11,'pt','Configurações','2017-06-03 16:06:06','2017-06-03 16:06:06');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,2,'Nils Ivanovs','nilsivanovs@inbox.lv',NULL,'$2y$10$OJ5ObkpclTJveNhd09wQzOEZQZXT3KqupByurF0OmwF9fyelPHqBa','ohBfvPC5auJU38n9zgTAsAXI4ZLDXWaHVL7nw6SimgERaLbqAkIXKLC8A9pz','2017-06-03 09:19:30','2017-06-03 09:19:30'),(2,1,'admin','admin@admin.com',NULL,'$2y$10$OJ5ObkpclTJveNhd09wQzOEZQZXT3KqupByurF0OmwF9fyelPHqBa','oHVEQFsSycnSYLgdk2iUEActiaDauAtQpyBFiGnG5vAbmCmKkzD4DptmTAo0','2017-06-03 19:09:46','2017-06-03 19:09:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-11 20:12:09
