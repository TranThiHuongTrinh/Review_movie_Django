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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-04-21 05:27:24.515148','102203','Movie object (102203)',2,'[]',7,198),(2,'2023-04-21 05:28:30.973811','102203','Movie object (102203)',2,'[]',7,198),(3,'2023-04-21 05:31:19.279062','102205','Movie object (102205)',1,'[{\"added\": {}}]',7,198),(4,'2023-04-23 15:56:51.533503','1022004','Phim hay lam',1,'[{\"added\": {}}]',7,198),(5,'2023-04-23 16:03:52.507488','1022005','Bac si Doctortrange',1,'[{\"added\": {}}]',7,198),(6,'2023-04-30 02:28:56.704426','1','<p>Phim hay lắm&nbsp;<img alt=\"heart\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/heart.png\" style=\"height:23px; width:23px\" title=\"heart\" /></p>\r\n\r\n<p>&nbsp;</p>',1,'[{\"added\": {}}]',9,198),(7,'2023-04-30 02:50:40.526426','2','<p><img alt=\"\" src=\"/static/review/2023/04/30/green-view-modern-desktop-wallpaper.png\" style=\"height:281px; width:500px\" /></p>',1,'[{\"added\": {}}]',9,198),(8,'2023-05-13 13:37:55.810755','1022009','Em có thích nước Mỹ không',1,'[{\"added\": {}}, {\"added\": {\"name\": \"review\", \"object\": \"<p>tui thay phim hay</p>\"}}]',7,198),(9,'2023-05-13 15:35:59.061551','4','<p>hay qua di&nbsp;</p>',1,'[{\"added\": {}}]',9,198),(10,'2023-05-13 17:10:53.997280','1','Favorite_movie object (1)',1,'[{\"added\": {}}]',10,198),(11,'2023-05-13 17:11:07.718111','2','Favorite_movie object (2)',1,'[{\"added\": {}}]',10,198);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-20 17:35:21.104229'),(2,'auth','0001_initial','2023-04-20 17:35:21.283943'),(3,'admin','0001_initial','2023-04-20 17:35:21.338377'),(4,'admin','0002_logentry_remove_auto_add','2023-04-20 17:35:21.344386'),(5,'admin','0003_logentry_add_action_flag_choices','2023-04-20 17:35:21.352924'),(6,'contenttypes','0002_remove_content_type_name','2023-04-20 17:35:21.393176'),(7,'auth','0002_alter_permission_name_max_length','2023-04-20 17:35:21.417995'),(8,'auth','0003_alter_user_email_max_length','2023-04-20 17:35:21.439762'),(9,'auth','0004_alter_user_username_opts','2023-04-20 17:35:21.449288'),(10,'auth','0005_alter_user_last_login_null','2023-04-20 17:35:21.478754'),(11,'auth','0006_require_contenttypes_0002','2023-04-20 17:35:21.480759'),(12,'auth','0007_alter_validators_add_error_messages','2023-04-20 17:35:21.489823'),(13,'auth','0008_alter_user_username_max_length','2023-04-20 17:35:21.534169'),(14,'auth','0009_alter_user_last_name_max_length','2023-04-20 17:35:21.567083'),(15,'auth','0010_alter_group_name_max_length','2023-04-20 17:35:21.589431'),(16,'auth','0011_update_proxy_permissions','2023-04-20 17:35:21.598477'),(17,'auth','0012_alter_user_first_name_max_length','2023-04-20 17:35:21.631784'),(18,'home','0001_initial','2023-04-20 17:35:21.728695'),(19,'sessions','0001_initial','2023-04-20 17:35:21.743864'),(20,'home','0002_alter_user_options_alter_user_managers_and_more','2023-04-21 05:08:09.061046'),(21,'home','0003_alter_movie_image_alter_user_img','2023-04-23 16:01:57.479284'),(22,'home','0004_rename_idmovie_favorite_movie_movie_and_more','2023-04-24 07:33:42.050366'),(23,'home','0005_alter_movie_image','2023-04-24 07:37:59.809028'),(24,'home','0006_alter_review_content','2023-04-30 02:22:28.448506'),(25,'home','0007_alter_favorite_movie_movie_alter_favorite_movie_user_and_more','2023-04-30 07:22:07.768549'),(26,'home','0008_movie_description_notification','2023-05-12 18:06:08.383854');
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
INSERT INTO `django_session` VALUES ('l6tmmkoi7yoep0dnyhuieuzk1jnsx6t5','.eJxVjDsOwjAQBe_iGlm2E_8o6XMGa9e7xgGUSHFSIe4OQSmgecWb0TxFgm2taWu8pJHEWegYxOn3Rch3nnZEN5ius8zztC4jyl2RB21ymIkfl8P9C1Ro9Ru2RvUIQUcuqABM5zQXAG9L8eQzMwWXkXXPZNnmLjokb-JnlMZOvN5TlDlg:1puzSC:mTEHbsdCaro3pAa6d9Ii2-jwon_FOLILCU7xOJhoKSQ','2023-05-19 17:42:48.493436'),('x6krol0j5e48pavc6qvkms20rxelpz5r','.eJxVjDsOwjAQBe_iGlm2E_8o6XMGa9e7xgGUSHFSIe4OQSmgecWb0TxFgm2taWu8pJHEWegYxOn3Rch3nnZEN5ius8zztC4jyl2RB21ymIkfl8P9C1Ro9Ru2RvUIQUcuqABM5zQXAG9L8eQzMwWXkXXPZNnmLjokb-JnlMZOvN5TlDlg:1ppjD6:1vPwYNBPSpmHujahXvyLf081CqiS35xo3Npmf2tJBM0','2023-05-05 05:21:28.216433');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_movie`
--

LOCK TABLES `favorite_movie` WRITE;
/*!40000 ALTER TABLE `favorite_movie` DISABLE KEYS */;
INSERT INTO `favorite_movie` VALUES (1,100200,197),(2,102205,197);
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
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_video` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `run_time` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `release` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1022014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_movie`
--

LOCK TABLES `home_movie` WRITE;
/*!40000 ALTER TABLE `home_movie` DISABLE KEYS */;
INSERT INTO `home_movie` VALUES (100200,'Tieng set ai tinh','tinh cam','anh phim','abc.commm','2h30ph','12-13-2023',''),(100201,'Bo gia version2','Tinh cam','anh phim','bogia.com','2h30p','ok',''),(102203,'Superman','Khoa hoc vien tuong','anh phim','superman.com','3h30ph','ok',''),(102205,'Doraemon','hoat hinh','anh phim','hoathinh.phim','2h30ph','ok',''),(1022004,'Phim hay lam','Hoat hinh','movie/202304/332872062_240469181651107_7151170874888140351_n.jpg','ok.com','3h30','ok',''),(1022005,'Bac si Doctortrange','khoa hoc vien tuong','movie/202304/plane.jpg','ok.com','3h40ph','ok',''),(1022006,'Vì sao đưa anh tới','Ngôn tình','','phim.com','3h30ph','ok',''),(1022007,'I love you','','','','','',''),(1022009,'Em có thích nước Mỹ không','Hành động','movie/202305/327926813_490763649884890_3595378964542380509_n.jpg','abc.com','2h30ph','12/4/2023','phim hay'),(1022010,'Cô gái đến từ hôm kia','ngôn tình','movie/202305/327926813_490763649884890_3595378964542380509_n_0dfzbBq.jpg','abc.com','1h20ph','12/5/2023',''),(1022011,'Alo tôi đến đây','hành động','movie/202305/duy.jpg','abc.com','2h30ph','23/5/2023',''),(1022012,'Alo tôi đến đây nè','hành động','','abc.com','2h30ph','23/5/2023',''),(1022013,'Chu dế mèn','tiểu thuyết','','abc.com','1h30ph','13-6-2023','');
/*!40000 ALTER TABLE `home_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_notification`
--

DROP TABLE IF EXISTS `home_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `movie_id` bigint NOT NULL,
  `uer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_notification_movie_id_5c7d3ee3_fk_home_movie_id` (`movie_id`),
  KEY `home_notification_uer_id_06feb6c1_fk_home_user_id` (`uer_id`),
  CONSTRAINT `home_notification_movie_id_5c7d3ee3_fk_home_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `home_movie` (`id`),
  CONSTRAINT `home_notification_uer_id_06feb6c1_fk_home_user_id` FOREIGN KEY (`uer_id`) REFERENCES `home_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_notification`
--

LOCK TABLES `home_notification` WRITE;
/*!40000 ALTER TABLE `home_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_notification` ENABLE KEYS */;
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
  `img` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `home_user_username_74de08bc_uniq` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_user`
--

LOCK TABLES `home_user` WRITE;
/*!40000 ALTER TABLE `home_user` DISABLE KEYS */;
INSERT INTO `home_user` VALUES (197,'trinh@gmail.com','trinh tran','trinh123','anh trinh','2023-04-21 05:08:08.098970','',1,0,0,NULL,''),(198,'admin@gmail.com','admin','pbkdf2_sha256$600000$Qe7UTF34TCVYUIrrfIW76q$N1qjFgRgU/ZP2hZEQCXecS4WqrrppfzBo+JqDyHAcA8=','','2023-04-21 05:20:26.831399','',1,1,1,'2023-05-05 17:42:48.486906','');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'<p>Phim hay lắm&nbsp;<img alt=\"heart\" src=\"http://127.0.0.1:8000/static/ckeditor/ckeditor/plugins/smiley/images/heart.png\" style=\"height:23px; width:23px\" title=\"heart\" /></p>\r\n\r\n<p>&nbsp;</p>',4,'2023-04-30 02:28:56.696143',100200,197),(2,'<p><img alt=\"\" src=\"/static/review/2023/04/30/green-view-modern-desktop-wallpaper.png\" style=\"height:281px; width:500px\" /></p>',4,'2023-04-30 02:50:40.522095',1022007,197),(3,'<p>tui thay phim hay</p>',6,'2023-05-13 13:37:55.808754',1022009,197),(4,'<p>hay qua di&nbsp;</p>',4,'2023-05-13 15:35:59.060551',100200,197),(5,'phim hay qua',NULL,'2023-05-13 15:44:56.108792',1022013,197);
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

-- Dump completed on 2023-05-15  0:12:29
