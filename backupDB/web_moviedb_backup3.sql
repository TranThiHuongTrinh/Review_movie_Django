-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: web_moviedb
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add movie',7,'add_movie'),(26,'Can change movie',7,'change_movie'),(27,'Can delete movie',7,'delete_movie'),(28,'Can view movie',7,'view_movie'),(29,'Can add user',8,'add_user'),(30,'Can change user',8,'change_user'),(31,'Can delete user',8,'delete_user'),(32,'Can view user',8,'view_user'),(33,'Can add review',9,'add_review'),(34,'Can change review',9,'change_review'),(35,'Can delete review',9,'delete_review'),(36,'Can view review',9,'view_review'),(37,'Can add favorite_movie',10,'add_favorite_movie'),(38,'Can change favorite_movie',10,'change_favorite_movie'),(39,'Can delete favorite_movie',10,'delete_favorite_movie'),(40,'Can view favorite_movie',10,'view_favorite_movie'),(41,'Can add notification',11,'add_notification'),(42,'Can change notification',11,'change_notification'),(43,'Can delete notification',11,'delete_notification'),(44,'Can view notification',11,'view_notification');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `home_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-04-21 05:27:24.515148','102203','Movie object (102203)',2,'[]',7,198),(2,'2023-04-21 05:28:30.973811','102203','Movie object (102203)',2,'[]',7,198),(3,'2023-04-21 05:31:19.279062','102205','Movie object (102205)',1,'[{\"added\": {}}]',7,198),(4,'2023-04-23 15:56:51.533503','1022004','Phim hay lam',1,'[{\"added\": {}}]',7,198),(5,'2023-04-23 16:03:52.507488','1022005','Bac si Doctortrange',1,'[{\"added\": {}}]',7,198),(6,'2023-04-30 02:28:56.704426','1','<p>Phim hay lắm&nbsp;<img alt=\"heart\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/heart.png\" style=\"height:23px; width:23px\" title=\"heart\" /></p>\r\n\r\n<p>&nbsp;</p>',1,'[{\"added\": {}}]',9,198),(7,'2023-04-30 02:50:40.526426','2','<p><img alt=\"\" src=\"/static/review/2023/04/30/green-view-modern-desktop-wallpaper.png\" style=\"height:281px; width:500px\" /></p>',1,'[{\"added\": {}}]',9,198),(8,'2023-05-13 13:37:55.810755','1022009','Em có thích nước Mỹ không',1,'[{\"added\": {}}, {\"added\": {\"name\": \"review\", \"object\": \"<p>tui thay phim hay</p>\"}}]',7,198),(9,'2023-05-13 15:35:59.061551','4','<p>hay qua di&nbsp;</p>',1,'[{\"added\": {}}]',9,198),(10,'2023-05-13 17:10:53.997280','1','Favorite_movie object (1)',1,'[{\"added\": {}}]',10,198),(11,'2023-05-13 17:11:07.718111','2','Favorite_movie object (2)',1,'[{\"added\": {}}]',10,198),(12,'2023-05-15 06:20:04.790689','3','Favorite_movie object (3)',1,'[{\"added\": {}}]',10,198),(13,'2023-05-15 06:26:22.458071','5','Da co phim moi',1,'[{\"added\": {}}]',11,198),(14,'2023-05-15 06:26:28.363283','5','Da co phim moi',2,'[]',11,198),(15,'2023-05-15 06:27:09.423029','6','Da co phim moi ne',1,'[{\"added\": {}}]',11,198),(16,'2023-05-15 14:10:15.805186','1022013','Chu dế mèn',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}, {\"changed\": {\"name\": \"review\", \"object\": \"<p>phim hay qua</p>\", \"fields\": [\"Content\", \"Rating\"]}}]',7,198),(17,'2023-05-15 14:12:30.869042','1022012','Alo tôi đến đây nè',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}, {\"added\": {\"name\": \"review\", \"object\": \"<p>phim hay ne</p>\"}}]',7,198),(18,'2023-05-15 14:26:41.346805','1022011','Alo tôi đến đây',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',7,198),(19,'2023-05-15 14:28:06.669999','1022010','Cô gái đến từ hôm kia',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\", \"Release\"]}}]',7,198),(20,'2023-05-15 14:28:42.394839','1022009','Em có thích nước Mỹ không',2,'[{\"changed\": {\"fields\": [\"Image\", \"Release\"]}}]',7,198),(21,'2023-05-15 14:29:41.514687','1022007','I love you',2,'[{\"changed\": {\"fields\": [\"Genre\", \"Description\", \"Image\", \"Link video\", \"Run time\", \"Release\"]}}]',7,198),(22,'2023-05-15 14:30:25.303512','1022005','Bac si Doctortrange',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\", \"Release\"]}}]',7,198),(23,'2023-05-15 14:30:43.946887','1022006','Vì sao đưa anh tới',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',7,198),(24,'2023-05-15 14:31:09.815525','1022005','Bac si Doctortrange',2,'[]',7,198),(25,'2023-05-15 14:31:29.319865','1022004','Phim hay lam',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',7,198),(26,'2023-05-15 14:32:00.550796','102205','Doraemon',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\", \"Release\"]}}]',7,198),(27,'2023-05-15 14:32:30.504578','102203','Superman',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\", \"Release\"]}}]',7,198),(28,'2023-05-15 14:33:01.649706','100201','Bo gia version2',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\", \"Release\"]}}]',7,198),(29,'2023-05-15 14:33:25.493090','100200','Tieng set ai tinh',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\", \"Release\"]}}]',7,198),(30,'2023-05-15 16:09:49.211460','1022013','Chu dế mèn',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(31,'2023-05-15 16:10:06.328145','1022012','Alo tôi đến đây nè',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(32,'2023-05-15 16:10:18.720316','1022011','Alo tôi đến đây',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(33,'2023-05-15 16:11:33.334774','1022010','Cô gái đến từ hôm kia',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(34,'2023-05-15 16:11:42.276884','1022009','Em có thích nước Mỹ không',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(35,'2023-05-15 16:11:54.090626','1022007','I love you',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(36,'2023-05-15 16:12:01.444495','1022006','Vì sao đưa anh tới',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(37,'2023-05-15 16:12:09.081763','1022005','Bac si Doctortrange',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(38,'2023-05-15 16:12:17.947897','1022004','Phim hay lam',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(39,'2023-05-15 16:12:34.213531','102205','Doraemon',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(40,'2023-05-15 16:12:48.649508','102203','Superman',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(41,'2023-05-15 16:12:56.317041','100201','Bo gia version2',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(42,'2023-05-15 16:13:03.541481','100200','Tieng set ai tinh',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(43,'2023-05-15 16:23:22.384376','1022013','Chu dế mèn',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(44,'2023-05-15 16:23:30.776902','1022012','Alo tôi đến đây nè',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(45,'2023-05-15 16:23:45.497502','1022011','Alo tôi đến đây',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(46,'2023-05-15 16:23:58.909177','1022010','Cô gái đến từ hôm kia',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(47,'2023-05-15 16:26:18.294605','1022009','Em có thích nước Mỹ không',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(48,'2023-05-15 16:26:24.969506','1022007','I love you',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(49,'2023-05-15 16:26:30.662595','1022007','I love you',2,'[]',7,198),(50,'2023-05-15 16:26:37.451895','1022006','Vì sao đưa anh tới',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(51,'2023-05-15 16:26:44.179519','1022005','Bac si Doctortrange',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(52,'2023-05-15 16:26:51.576933','1022004','Phim hay lam',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(53,'2023-05-15 16:27:05.778129','102205','Doraemon',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(54,'2023-05-15 16:27:13.063165','102203','Superman',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(55,'2023-05-15 16:27:19.842390','100201','Bo gia version2',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(56,'2023-05-15 16:27:27.336027','100200','Tieng set ai tinh',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(57,'2023-05-15 16:33:12.815382','1022013','Chu dế mèn',2,'[{\"changed\": {\"fields\": [\"Link video\"]}}]',7,198),(58,'2023-05-15 16:33:21.536384','1022012','Alo tôi đến đây nè',2,'[{\"changed\": {\"fields\": [\"Link video\"]}}]',7,198),(59,'2023-05-15 16:33:27.593373','1022011','Alo tôi đến đây',2,'[{\"changed\": {\"fields\": [\"Link video\"]}}]',7,198),(60,'2023-05-15 16:33:34.907450','1022010','Cô gái đến từ hôm kia',2,'[{\"changed\": {\"fields\": [\"Link video\"]}}]',7,198),(61,'2023-05-15 16:33:41.845841','1022009','Em có thích nước Mỹ không',2,'[{\"changed\": {\"fields\": [\"Link video\"]}}]',7,198),(62,'2023-05-15 16:33:55.337817','1022007','I love you',2,'[{\"changed\": {\"fields\": [\"Link video\"]}}]',7,198),(63,'2023-05-15 16:34:02.794424','1022006','Vì sao đưa anh tới',2,'[{\"changed\": {\"fields\": [\"Link video\"]}}]',7,198),(64,'2023-05-15 16:34:08.621884','1022005','Bac si Doctortrange',2,'[{\"changed\": {\"fields\": [\"Link video\"]}}]',7,198),(65,'2023-05-15 16:34:14.956996','1022004','Phim hay lam',2,'[{\"changed\": {\"fields\": [\"Link video\"]}}]',7,198),(66,'2023-05-15 16:34:22.378688','1022005','Bac si Doctortrange',2,'[]',7,198),(67,'2023-05-15 16:34:29.285901','102205','Doraemon',2,'[{\"changed\": {\"fields\": [\"Link video\"]}}]',7,198),(68,'2023-05-15 16:34:35.808661','1022004','Phim hay lam',2,'[]',7,198),(69,'2023-05-15 16:34:42.276544','102205','Doraemon',2,'[]',7,198),(70,'2023-05-15 16:34:48.270263','102203','Superman',2,'[{\"changed\": {\"fields\": [\"Link video\"]}}]',7,198),(71,'2023-05-15 16:34:54.629143','100201','Bo gia version2',2,'[{\"changed\": {\"fields\": [\"Link video\"]}}]',7,198),(72,'2023-05-15 16:35:01.126166','100200','Tieng set ai tinh',2,'[{\"changed\": {\"fields\": [\"Link video\"]}}]',7,198),(73,'2023-05-16 07:13:20.400400','1022017','Anh hung 23',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(74,'2023-05-16 07:13:59.835166','1022016','Lat mat',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(75,'2023-05-16 07:14:26.247944','1022015','Anh hung 2',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(76,'2023-05-16 07:14:47.203686','1022014','Anh hung',2,'[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]',7,198),(77,'2023-05-16 07:15:15.720273','1022012','Alo tôi đến đây nè',2,'[]',7,198),(78,'2023-05-16 07:15:26.051135','1022011','Alo tôi đến đây',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(79,'2023-05-16 07:15:55.959368','1022010','Cô gái đến từ hôm kia',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(80,'2023-05-16 07:16:04.114644','1022009','Em có thích nước Mỹ không',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(81,'2023-05-16 07:16:12.764671','1022007','I love you',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(82,'2023-05-16 07:16:19.632775','1022006','Vì sao đưa anh tới',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(83,'2023-05-16 07:16:30.461093','1022005','Bac si Doctortrange',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(84,'2023-05-16 07:16:51.766122','1022004','Phim hay lam',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(85,'2023-05-16 07:17:11.936746','100201','Bo gia version2',2,'[]',7,198),(86,'2023-05-16 07:17:24.667623','100200','Tieng set ai tinh',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,198),(87,'2023-05-16 09:08:32.807774','1','<p>Phim hay lắm</p>\r\n\r\n<p>&nbsp;</p>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',9,198),(88,'2023-05-16 09:09:05.826056','2','<p>thuy tien n\\gvgrfvertgtgretggertgb</p>\r\n\r\n<div class=\"ddict_btn\" style=\"left:63.375px; top:50px\"><img src=\"chrome-extension://cianljdimgjlpmjllcbahmpdnicglaap/logo/48.png\" /></div>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',9,198),(89,'2023-05-16 09:09:11.056935','3','<p>tui thay phim hay</p>',2,'[]',9,198),(90,'2023-05-16 09:09:14.657879','4','<p>hay qua di&nbsp;</p>',2,'[]',9,198),(91,'2023-05-16 09:09:18.544110','5','<p>phim hay qua</p>',2,'[]',9,198),(92,'2023-05-16 09:09:21.413451','6','<p>phim hay ne</p>',2,'[]',9,198),(93,'2023-05-16 11:40:27.975826','2','<p>thuy tien</p>\r\n\r\n<div><img src=\"chrome-extension://cianljdimgjlpmjllcbahmpdnicglaap/logo/48.png\" /></div>\r\n\r\n<div class=\"ddict_btn\" style=\"left:211.513px; top:40px\"><img src=\"chrome-extension://cia',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',9,198),(94,'2023-05-16 11:41:43.723566','2','<p>thuy tien</p>',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',9,198),(95,'2023-05-16 12:39:01.556457','12','<p>trinh</p>',1,'[{\"added\": {}}]',9,198),(96,'2023-05-17 23:34:30.961313','1022013','Chu dế mèn',2,'[{\"changed\": {\"fields\": [\"Release\"]}}, {\"added\": {\"name\": \"review\", \"object\": \"Hay qua ak\"}}, {\"added\": {\"name\": \"review\", \"object\": \"nh\\u00e2n v\\u1eadt \\u0111\\u1eb9p qu\\u00e1\"}}]',7,198),(97,'2023-05-17 23:34:55.996437','1022020','hehe',2,'[{\"added\": {\"name\": \"review\", \"object\": \"phim hay ne\"}}]',7,198),(98,'2023-05-17 23:36:12.278740','1022019','Anh hung gio',2,'[{\"changed\": {\"fields\": [\"Image\", \"Link video\", \"Release\"]}}, {\"added\": {\"name\": \"review\", \"object\": \"hay qua\"}}, {\"added\": {\"name\": \"review\", \"object\": \"hay qua hay luon\"}}]',7,198),(99,'2023-05-17 23:36:21.622638','1022019','Anh hung gio',2,'[]',7,198),(100,'2023-05-17 23:37:19.535583','1022018','Anh hung 234',2,'[{\"changed\": {\"fields\": [\"Image\", \"Link video\", \"Release\"]}}, {\"added\": {\"name\": \"review\", \"object\": \"phim nay toi \\u0111\\u00e3 xem nhi\\u1ec1u l\\u1ea7n v\\u00e0 th\\u1ea5y c\\u0169ng \\u0111\\u01b0\\u1ee3c\"}}]',7,198),(101,'2023-05-17 23:38:13.636014','1022017','Anh hung 23',2,'[{\"changed\": {\"fields\": [\"Link video\", \"Release\"]}}, {\"added\": {\"name\": \"review\", \"object\": \"kh\\u00e1 hay\"}}]',7,198),(102,'2023-05-17 23:38:45.001842','1022016','Lat mat',2,'[{\"changed\": {\"fields\": [\"Release\"]}}, {\"added\": {\"name\": \"review\", \"object\": \"Kh\\u00e1\"}}, {\"added\": {\"name\": \"review\", \"object\": \"phim qu\\u00e1 ok\"}}]',7,198),(103,'2023-05-17 23:39:28.852537','1022015','Anh hung 2',2,'[{\"changed\": {\"fields\": [\"Link video\", \"Release\"]}}, {\"added\": {\"name\": \"review\", \"object\": \"hay \\u0111\\u00f3\"}}]',7,198),(104,'2023-05-17 23:40:16.051292','1022014','Anh hung',2,'[{\"changed\": {\"fields\": [\"Link video\", \"Release\"]}}, {\"added\": {\"name\": \"review\", \"object\": \"hay \\u1ea1\"}}]',7,198),(105,'2023-05-17 23:40:51.717864','1022012','Alo tôi đến đây nè',2,'[{\"changed\": {\"fields\": [\"Release\"]}}, {\"added\": {\"name\": \"review\", \"object\": \"c\\u0169ng \\u0111\\u01b0\\u1ee3c ch\\u1ee9 theo quan \\u0111i\\u1ec3m c\\u00e1 nh\\u00e2n ch\\u01b0a hay l\\u1eafm\"}}]',7,198),(106,'2023-05-17 23:41:19.721230','1022011','Alo tôi đến đây',2,'[{\"changed\": {\"fields\": [\"Release\"]}}, {\"added\": {\"name\": \"review\", \"object\": \"phim \\u0111\\u01b0\\u1ee3c\"}}, {\"added\": {\"name\": \"review\", \"object\": \"hay nha\"}}]',7,198),(107,'2023-05-17 23:41:51.051596','1022009','Em có thích nước Mỹ không',2,'[{\"changed\": {\"fields\": [\"Release\"]}}, {\"added\": {\"name\": \"review\", \"object\": \"ok \\u0111\\u00f3\"}}, {\"added\": {\"name\": \"review\", \"object\": \"phim hay \\u0111\\u00f3 b\\u00e0\"}}]',7,198),(108,'2023-05-18 07:57:26.830243','207','admin3',1,'[{\"added\": {}}]',8,206),(109,'2023-05-18 08:40:46.252362','1022021','Cô gái đến từ hôm qua',2,'[{\"changed\": {\"fields\": [\"Name\", \"Genre\"]}}]',7,206),(110,'2023-05-18 08:41:00.669855','1022020','hehe',2,'[{\"changed\": {\"fields\": [\"Genre\"]}}]',7,206),(111,'2023-05-18 08:41:16.055754','1022019','Anh hùng gió',2,'[{\"changed\": {\"fields\": [\"Name\", \"Genre\"]}}]',7,206),(112,'2023-05-18 08:41:30.781828','1022018','Anh hung 234',2,'[{\"changed\": {\"fields\": [\"Genre\"]}}]',7,206),(113,'2023-05-18 08:41:38.472122','1022017','Anh hung 23',2,'[{\"changed\": {\"fields\": [\"Genre\"]}}]',7,206),(114,'2023-05-18 08:41:44.699744','1022016','Lat mat',2,'[{\"changed\": {\"fields\": [\"Genre\"]}}]',7,206),(115,'2023-05-18 08:41:51.275407','1022015','Anh hung 2',2,'[{\"changed\": {\"fields\": [\"Genre\"]}}]',7,206),(116,'2023-05-18 08:41:59.966586','1022014','Anh hung',2,'[{\"changed\": {\"fields\": [\"Genre\"]}}]',7,206),(117,'2023-05-18 08:42:07.545148','1022013','Chu dế mèn',2,'[]',7,206),(118,'2023-05-18 08:42:13.013045','1022012','Alo tôi đến đây nè',2,'[]',7,206),(119,'2023-05-18 08:42:18.184864','1022011','Alo tôi đến đây',2,'[]',7,206),(120,'2023-05-18 08:42:23.219910','1022010','Cô gái đến từ hôm kia',2,'[]',7,206),(121,'2023-05-18 08:42:32.435411','1022009','Em có thích nước Mỹ không',2,'[{\"changed\": {\"fields\": [\"Genre\"]}}]',7,206),(122,'2023-05-18 08:50:39.535920','1022019','Anh hùng gió',2,'[{\"changed\": {\"fields\": [\"Release\"]}}]',7,206),(123,'2023-05-18 08:50:50.665125','1022018','Anh hung 234',2,'[{\"changed\": {\"fields\": [\"Release\"]}}]',7,206),(124,'2023-05-18 08:51:01.550282','1022017','Anh hung 23',2,'[{\"changed\": {\"fields\": [\"Release\"]}}]',7,206),(125,'2023-05-18 08:51:15.446101','1022016','Lat mat',2,'[{\"changed\": {\"fields\": [\"Release\"]}}]',7,206),(126,'2023-05-18 08:51:25.660385','1022015','Anh hung 2',2,'[{\"changed\": {\"fields\": [\"Release\"]}}]',7,206),(127,'2023-05-18 08:51:38.476336','1022014','Anh hung',2,'[{\"changed\": {\"fields\": [\"Release\"]}}]',7,206),(128,'2023-05-18 08:51:45.458899','1022014','Anh hung',2,'[]',7,206),(129,'2023-05-18 08:51:54.525652','1022013','Chu dế mèn',2,'[{\"changed\": {\"fields\": [\"Release\"]}}]',7,206),(130,'2023-05-18 08:52:00.987054','1022013','Chu dế mèn',2,'[]',7,206),(131,'2023-05-18 08:52:10.486382','1022011','Alo tôi đến đây',2,'[{\"changed\": {\"fields\": [\"Release\"]}}]',7,206),(132,'2023-05-18 08:52:28.566390','1022010','Cô gái đến từ hôm kia',2,'[{\"changed\": {\"fields\": [\"Release\"]}}]',7,206),(133,'2023-05-18 08:52:39.152506','1022009','Em có thích nước Mỹ không',2,'[{\"changed\": {\"fields\": [\"Release\"]}}]',7,206),(134,'2023-05-18 08:53:42.090088','1022020','hehe',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,206),(135,'2023-05-18 08:54:08.957857','1022021','Cô gái đến từ hôm qua',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,206),(136,'2023-05-18 08:59:07.331079','1022022','MÈO MẬP ĐI PHƯỢT',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',7,206);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'home','favorite_movie'),(7,'home','movie'),(11,'home','notification'),(9,'home','review'),(8,'home','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-20 17:35:21.104229'),(2,'auth','0001_initial','2023-04-20 17:35:21.283943'),(3,'admin','0001_initial','2023-04-20 17:35:21.338377'),(4,'admin','0002_logentry_remove_auto_add','2023-04-20 17:35:21.344386'),(5,'admin','0003_logentry_add_action_flag_choices','2023-04-20 17:35:21.352924'),(6,'contenttypes','0002_remove_content_type_name','2023-04-20 17:35:21.393176'),(7,'auth','0002_alter_permission_name_max_length','2023-04-20 17:35:21.417995'),(8,'auth','0003_alter_user_email_max_length','2023-04-20 17:35:21.439762'),(9,'auth','0004_alter_user_username_opts','2023-04-20 17:35:21.449288'),(10,'auth','0005_alter_user_last_login_null','2023-04-20 17:35:21.478754'),(11,'auth','0006_require_contenttypes_0002','2023-04-20 17:35:21.480759'),(12,'auth','0007_alter_validators_add_error_messages','2023-04-20 17:35:21.489823'),(13,'auth','0008_alter_user_username_max_length','2023-04-20 17:35:21.534169'),(14,'auth','0009_alter_user_last_name_max_length','2023-04-20 17:35:21.567083'),(15,'auth','0010_alter_group_name_max_length','2023-04-20 17:35:21.589431'),(16,'auth','0011_update_proxy_permissions','2023-04-20 17:35:21.598477'),(17,'auth','0012_alter_user_first_name_max_length','2023-04-20 17:35:21.631784'),(18,'home','0001_initial','2023-04-20 17:35:21.728695'),(19,'sessions','0001_initial','2023-04-20 17:35:21.743864'),(20,'home','0002_alter_user_options_alter_user_managers_and_more','2023-04-21 05:08:09.061046'),(21,'home','0003_alter_movie_image_alter_user_img','2023-04-23 16:01:57.479284'),(22,'home','0004_rename_idmovie_favorite_movie_movie_and_more','2023-04-24 07:33:42.050366'),(23,'home','0005_alter_movie_image','2023-04-24 07:37:59.809028'),(24,'home','0006_alter_review_content','2023-04-30 02:22:28.448506'),(25,'home','0007_alter_favorite_movie_movie_alter_favorite_movie_user_and_more','2023-04-30 07:22:07.768549'),(26,'home','0008_movie_description_notification','2023-05-12 18:06:08.383854'),(27,'home','0009_rename_uer_notification_user','2023-05-15 07:09:35.291734'),(28,'home','0010_alter_movie_image_alter_user_img','2023-05-15 13:42:25.520357'),(29,'home','0011_alter_review_content','2023-05-16 11:44:12.223174'),(30,'home','0012_delete_notification','2023-05-18 07:38:13.263192');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('k29ewimkxgt5u09rbq21drdwdy83vffu','.eJxVjDsOwjAQBe_iGlm7Nv5R0nOGaL1ekwCKpXwqxN2RpRTQvpl5bzXQvo3DvsoyTEVdlAGvTr9rJn7K3FF50Hxvmtu8LVPWXdEHXfWtFXldD_fvYKR17HUiiz66CklKwGoYMpkIFSBaoTMWiCH5bL0LLBKdcGUPFdFaNIDq8wUm6DfJ:1pzYUD:ggIltXkaBAa2VEXxaQE8eftM3Fqe5kX-7gly_sp1bY4','2023-06-01 07:55:45.301972'),('o8zajuypac1s2dobqvu0m83y3iqxta8d','.eJxVjDsOwjAQBe_iGlm2E_8o6XMGa9e7xgGUSHFSIe4OQSmgecWb0TxFgm2taWu8pJHEWegYxOn3Rch3nnZEN5ius8zztC4jyl2RB21ymIkfl8P9C1Ro9Ru2RvUIQUcuqABM5zQXAG9L8eQzMwWXkXXPZNnmLjokb-JnlMZOvN5TlDlg:1pyorh:OCTiRBgOBb1OklCpLglhcKmD-n4JIts9MeJ-2VN2MBA','2023-05-30 07:12:57.573770'),('qdlqzbx2mdn4c84ghonal9uslgoulnqt','.eJxVjDsOwjAQBe_iGlm2E_8o6XMGa9e7xgGUSHFSIe4OQSmgecWb0TxFgm2taWu8pJHEWegYxOn3Rch3nnZEN5ius8zztC4jyl2RB21ymIkfl8P9C1Ro9Ru2RvUIQUcuqABM5zQXAG9L8eQzMwWXkXXPZNnmLjokb-JnlMZOvN5TlDlg:1pyYsQ:5N0erMIEkF_WeWixRN9iK9XDaOXW3oXHEYENgJDcGaA','2023-05-29 14:08:38.906533'),('x6krol0j5e48pavc6qvkms20rxelpz5r','.eJxVjDsOwjAQBe_iGlm2E_8o6XMGa9e7xgGUSHFSIe4OQSmgecWb0TxFgm2taWu8pJHEWegYxOn3Rch3nnZEN5ius8zztC4jyl2RB21ymIkfl8P9C1Ro9Ru2RvUIQUcuqABM5zQXAG9L8eQzMwWXkXXPZNnmLjokb-JnlMZOvN5TlDlg:1ppjD6:1vPwYNBPSpmHujahXvyLf081CqiS35xo3Npmf2tJBM0','2023-05-05 05:21:28.216433');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite_movie`
--

DROP TABLE IF EXISTS `favorite_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_movie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `movie_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favorite_movie_user_id_0e27e12b_fk_home_user_id` (`user_id`),
  KEY `favorite_movie_movie_id_e4cfe21d_fk` (`movie_id`),
  CONSTRAINT `favorite_movie_movie_id_e4cfe21d_fk` FOREIGN KEY (`movie_id`) REFERENCES `home_movie` (`id`),
  CONSTRAINT `favorite_movie_user_id_0e27e12b_fk_home_user_id` FOREIGN KEY (`user_id`) REFERENCES `home_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_movie`
--

LOCK TABLES `favorite_movie` WRITE;
/*!40000 ALTER TABLE `favorite_movie` DISABLE KEYS */;
INSERT INTO `favorite_movie` VALUES (11,1022009,197),(12,1022024,197);
/*!40000 ALTER TABLE `favorite_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_movie`
--

DROP TABLE IF EXISTS `home_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_movie` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci,
  `link_video` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `run_time` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `release` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1022025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_movie`
--

LOCK TABLES `home_movie` WRITE;
/*!40000 ALTER TABLE `home_movie` DISABLE KEYS */;
INSERT INTO `home_movie` VALUES (1022009,'Em có thích nước Mỹ không','bi kịch','../../assets/img/movie_know.png','https://www.youtube.com/embed/9H8CjHTNCtg','2h30ph','2023-05-04','phim hay'),(1022010,'Cô gái đến từ hôm kia','ngôn tình','../../assets/img/interstella.png','https://www.youtube.com/embed/9H8CjHTNCtg','1h20ph','2023-05-12','Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorem, fugit reiciendis? ....'),(1022011,'Alo tôi đến đây','hành động','../../assets/img/theRevenant.png','https://www.youtube.com/embed/9H8CjHTNCtg','2h30ph','2023-05-04','Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorem, fugit reiciendis? ....'),(1022012,'Alo tôi đến đây nè','hành động','../../assets/img/theRevenant.png','https://www.youtube.com/embed/9H8CjHTNCtg','2h30ph','2023-5-4','Lorem, ipsum dolor sit amet consectetur adipisicing elit. Dolorem, fugit reiciendis? ....'),(1022013,'Chu dế mèn','sci-fi','../../assets/img/die_hard.png','https://www.youtube.com/embed/9H8CjHTNCtg','1h30ph','2023-06-05','Phim nay la phim hanh dong'),(1022014,'Anh hung','hành động','../../assets/img/thewalk.png','https://www.youtube.com/embed/9H8CjHTNCtg','1h30ph','2023-05-04','phim dở lắm đừng xem'),(1022015,'Anh hung 2','hành động','../../assets/img/thewalk.png','https://www.youtube.com/embed/9H8CjHTNCtg','1h30ph','2023-05-04','phim hay'),(1022016,'Lat mat','hành động','../../assets/img/die_hard.png','https://www.youtube.com/embed/9H8CjHTNCtg','1h58p','2023-05-01','phim test'),(1022017,'Anh hung 23','hành động','../../assets/img/thewalk.png','https://www.youtube.com/embed/9H8CjHTNCtg','1h30ph','2923-05-04','phim hay'),(1022018,'Anh hung 234','hành động','../../assets/img/theRevenant.png','https://www.youtube.com/embed/9H8CjHTNCtg','1h30ph','2023-04-04','phim hay'),(1022019,'Anh hùng gió','hành động','../../assets/img/theRevenant.png','https://www.youtube.com/embed/9H8CjHTNCtg','1h30ph','2023-04-03','phim hay'),(1022020,'hehe','tiểu thuyết','../../assets/img/interestella.png','https://www.youtube.com/embed/9H8CjHTNCtg','1h20p','2023-05-16','hay lam'),(1022021,'Cô gái đến từ hôm qua','Tình cảm','../../assets/img/tetris.jpg','https://www.youtube.com/embed/9H8CjHTNCtg','3h20ph','2023-05-16','phim hay'),(1022022,'MÈO MẬP ĐI PHƯỢT','hành động','../../assets/img/movie_know.png','https://www.youtube.com/embed/RuPSxKtAr4c','1h20p','2023-05-18','Phim Hoạt Hình Chiếu Rạp Hài Hước Nhất Thuyết Minh 2021 - Mèo Mập Đi Phượt'),(1022023,'GIẤC MỘNG LÀM GIÀU','hành động','../../assets/img/film3.png','https://www.youtube.com/embed/vm33QXsb4Vw','1h30p','2023-05-18','Phim kể về câu chuyện của hai chàng trai nghèo rời quê lên miền Đông Bắc với ước mơ làm giàu và xuống miền Nam đãi vàng.'),(1022024,'XÓM TRỌ 3D','tiểu thuyết','../../assets/img/thewalk.png','https://www.youtube.com/embed/Uy0UElR8t8I','1h20p','2023-05-18','Một khu xóm trọ được mệnh danh là “Xóm Trọ 3D” của những người đồng tính nam: Lâm - chủ phòng trọ, mọi người đều gọi Lâm với biệt danh là má');
/*!40000 ALTER TABLE `home_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_user`
--

DROP TABLE IF EXISTS `home_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` longtext COLLATE utf8mb4_unicode_ci,
  `date_joined` datetime(6) NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `home_user_username_74de08bc_uniq` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_user`
--

LOCK TABLES `home_user` WRITE;
/*!40000 ALTER TABLE `home_user` DISABLE KEYS */;
INSERT INTO `home_user` VALUES (197,'trinh@gmail.com','trinhtranhihiu','trinh1234','../../assets/img/acc.png','2023-04-21 05:08:08.098970','',1,0,0,NULL,''),(198,'admin@gmail.com','admin','pbkdf2_sha256$600000$Qe7UTF34TCVYUIrrfIW76q$N1qjFgRgU/ZP2hZEQCXecS4WqrrppfzBo+JqDyHAcA8=','','2023-04-21 05:20:26.831399','',1,1,1,'2023-05-16 07:12:57.565714',''),(199,'dora@gmail.com','Doraemon','123456','../../assets/img/acc.png','2023-05-15 17:29:10.019394','',1,0,0,NULL,''),(200,'','trinhtran123','1234ttt',NULL,'2023-05-16 10:21:19.412395','',1,0,0,NULL,''),(201,'trinhtran.dmx2@gmail.com','trinhtrinh','1234','../../assets/img/acc.png','2023-05-16 10:53:30.297793','',1,0,0,NULL,''),(203,'thuytien180902@gmail.com','TrinhNhoTien','123456','../../assets/img/acc.png','2023-05-16 13:11:46.912473','',1,0,0,NULL,''),(204,'thuytien180902@gmail.com','thuytien','123456','../../assets/img/acc.png','2023-05-16 13:13:56.447338','',1,0,0,NULL,''),(205,'trinh@gmail.com','TrinhTrinhTran','123456','../../assets/img/acc.png','2023-05-16 13:15:25.754756','',1,0,0,NULL,''),(206,'admin2@gmail.com','admin2','pbkdf2_sha256$600000$KXuyP7mzG7XepwzVE1yBI6$uf3QMF3zM1vf9qrQWexyRUA+zDHdk2dUkoaoOlG6/sE=',NULL,'2023-05-17 23:44:44.990889','',1,1,1,'2023-05-18 07:55:45.299972',''),(207,'admin3@gmail.com','admin3','admin123456','../../assets/img/acc.png','2023-05-18 07:56:05.000000','',1,0,1,NULL,'');
/*!40000 ALTER TABLE `home_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_user_groups`
--

DROP TABLE IF EXISTS `home_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `home_user_groups_user_id_group_id_b0f141dd_uniq` (`user_id`,`group_id`),
  KEY `home_user_groups_group_id_87aa9e3d_fk_auth_group_id` (`group_id`),
  CONSTRAINT `home_user_groups_group_id_87aa9e3d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `home_user_groups_user_id_28bf3710_fk` FOREIGN KEY (`user_id`) REFERENCES `home_user` (`id`),
  CONSTRAINT `home_user_groups_user_id_28bf3710_fk_home_user_id` FOREIGN KEY (`user_id`) REFERENCES `home_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_user_groups`
--

LOCK TABLES `home_user_groups` WRITE;
/*!40000 ALTER TABLE `home_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_user_user_permissions`
--

DROP TABLE IF EXISTS `home_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `home_user_user_permissions_user_id_permission_id_98b37912_uniq` (`user_id`,`permission_id`),
  KEY `home_user_user_permi_permission_id_ccfbb3e4_fk_auth_perm` (`permission_id`),
  CONSTRAINT `home_user_user_permi_permission_id_ccfbb3e4_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `home_user_user_permissions_user_id_28c4b0a2_fk` FOREIGN KEY (`user_id`) REFERENCES `home_user` (`id`),
  CONSTRAINT `home_user_user_permissions_user_id_28c4b0a2_fk_home_user_id` FOREIGN KEY (`user_id`) REFERENCES `home_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_user_user_permissions`
--

LOCK TABLES `home_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `home_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `movie_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `review_user_id_1520d914_fk_home_user_id` (`user_id`),
  KEY `review_movie_id_ab825372_fk` (`movie_id`),
  CONSTRAINT `review_movie_id_ab825372_fk` FOREIGN KEY (`movie_id`) REFERENCES `home_movie` (`id`),
  CONSTRAINT `review_user_id_1520d914_fk_home_user_id` FOREIGN KEY (`user_id`) REFERENCES `home_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (14,'Hay qua ak',5,'2023-05-17 23:34:30.961313',1022013,201),(15,'nhân vật đẹp quá',4,'2023-05-17 23:34:30.961313',1022013,200),(16,'phim hay ne',5,'2023-05-17 23:34:55.996437',1022020,199),(17,'hay qua',4,'2023-05-17 23:36:12.278740',1022019,201),(18,'hay qua hay luon',5,'2023-05-17 23:36:12.278740',1022019,199),(19,'phim nay toi đã xem nhiều lần và thấy cũng được',4,'2023-05-17 23:37:19.535583',1022018,204),(20,'khá hay',4,'2023-05-17 23:38:13.636014',1022017,204),(21,'Khá',4,'2023-05-17 23:38:45.001842',1022016,199),(22,'phim quá ok',3,'2023-05-17 23:38:45.001842',1022016,205),(23,'hay đó',5,'2023-05-17 23:39:28.852537',1022015,201),(24,'hay ạ',5,'2023-05-17 23:40:16.051292',1022014,199),(25,'cũng được chứ theo quan điểm cá nhân chưa hay lắm',5,'2023-05-17 23:40:51.712850',1022012,201),(26,'phim được',4,'2023-05-17 23:41:19.721230',1022011,200),(27,'hay nha',5,'2023-05-17 23:41:19.721230',1022011,205),(28,'ok đó',3,'2023-05-17 23:41:51.051596',1022009,200),(29,'phim hay đó bà',5,'2023-05-17 23:41:51.051596',1022009,204);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-18 18:04:15
