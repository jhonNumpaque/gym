-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: u836658462_fitzone
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

--
-- Table structure for table `ft_concepts`
--

DROP TABLE IF EXISTS `ft_concepts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_concepts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_concepts`
--

/*!40000 ALTER TABLE `ft_concepts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ft_concepts` ENABLE KEYS */;

--
-- Table structure for table `ft_configuration_time`
--

DROP TABLE IF EXISTS `ft_configuration_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_configuration_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clase` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `campo` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_configuration_time`
--

/*!40000 ALTER TABLE `ft_configuration_time` DISABLE KEYS */;
INSERT INTO `ft_configuration_time` VALUES (1,'b_activo','{param} >= 6','$this->activos'),(2,'b_alerta','{param} >= 1 && {param} <= 5','$this->alerta'),(3,'b_inactivo','({param} <= 0) && {param} >= -15','$this->inactivos'),(4,'b_deads','{param} < -15','this->deads');
/*!40000 ALTER TABLE `ft_configuration_time` ENABLE KEYS */;

--
-- Table structure for table `ft_duracion`
--

DROP TABLE IF EXISTS `ft_duracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_duracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n_meses` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_duracion`
--

/*!40000 ALTER TABLE `ft_duracion` DISABLE KEYS */;
INSERT INTO `ft_duracion` VALUES (1,'Mes',1),(2,'Trimestre',3),(3,'Semestre',6),(4,'Año',12);
/*!40000 ALTER TABLE `ft_duracion` ENABLE KEYS */;

--
-- Table structure for table `ft_egresos`
--

DROP TABLE IF EXISTS `ft_egresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_egresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `valor` double(20,2) DEFAULT NULL,
  `concepto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `concepto` (`concepto`),
  CONSTRAINT `ft_egresos_ibfk_1` FOREIGN KEY (`concepto`) REFERENCES `ft_concepts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_egresos`
--

/*!40000 ALTER TABLE `ft_egresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ft_egresos` ENABLE KEYS */;

--
-- Table structure for table `ft_ingresos`
--

DROP TABLE IF EXISTS `ft_ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_ingresos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `concepto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `concepto` (`concepto`),
  CONSTRAINT `ft_ingresos_ibfk_1` FOREIGN KEY (`concepto`) REFERENCES `ft_concepts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_ingresos`
--

/*!40000 ALTER TABLE `ft_ingresos` DISABLE KEYS */;
/*!40000 ALTER TABLE `ft_ingresos` ENABLE KEYS */;

--
-- Table structure for table `ft_pago`
--

DROP TABLE IF EXISTS `ft_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona` int(11) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `plan` int(11) DEFAULT NULL,
  `fecha_vec` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persona` (`persona`),
  KEY `plan` (`plan`),
  CONSTRAINT `ft_pago_ibfk_1` FOREIGN KEY (`persona`) REFERENCES `ft_persona` (`id`),
  CONSTRAINT `ft_pago_ibfk_2` FOREIGN KEY (`plan`) REFERENCES `ft_plan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_pago`
--

/*!40000 ALTER TABLE `ft_pago` DISABLE KEYS */;
INSERT INTO `ft_pago` VALUES (4,14,'2020-01-26',3,'2020-07-26'),(5,15,'2020-07-16',1,'2020-08-16'),(7,15,'0020-10-05',1,'0020-11-05'),(8,15,'0020-11-05',NULL,'0020-12-05'),(9,15,'0020-11-05',1,'0020-12-05'),(10,15,'2020-11-11',1,'2020-11-11'),(11,15,'2020-11-05',1,'2020-12-05'),(16,37,'2020-11-06',1,'2020-12-06'),(17,35,'2020-11-05',1,'2020-12-05'),(18,34,'2020-11-03',1,'2020-12-03'),(19,33,'2020-11-19',1,'2020-12-19'),(20,32,'2020-10-19',1,'2020-11-19'),(22,29,'2020-11-09',1,'2020-12-09'),(23,31,'2020-11-09',1,'2020-12-09'),(24,30,'2020-11-06',1,'2020-12-06'),(25,28,'2020-10-15',1,'2020-11-15'),(26,27,'2020-10-26',1,'2020-11-26'),(27,25,'2020-11-14',1,'2020-12-14'),(28,26,'2020-11-13',1,'2020-12-13'),(29,44,'2020-11-10',1,'2020-12-10'),(30,45,'2020-11-17',1,'2020-12-17'),(31,46,'2020-11-12',1,'2020-11-12'),(32,46,'2020-11-17',1,'2020-12-17'),(33,49,NULL,NULL,'2020-12-10'),(34,48,'2020-11-10',1,'2020-12-10'),(35,50,'2020-11-10',1,'2020-11-10'),(37,22,'2020-10-27',1,'2020-11-27'),(38,28,'2020-11-14',1,'2020-12-14'),(40,58,'2020-11-04',1,'2020-12-04'),(41,56,'2020-11-03',1,'2020-12-03'),(43,55,'2020-01-07',6,'2021-03-20'),(44,55,'2020-01-07',6,'2021-04-20'),(45,54,'2020-11-03',1,'2020-12-03'),(46,51,'2020-11-18',1,'2020-12-18'),(47,50,'2020-11-10',1,'2020-12-10'),(48,65,'2020-11-05',1,'2020-12-05'),(49,64,'2020-10-19',1,'2020-11-19'),(50,67,'2020-11-05',1,'2020-12-05'),(51,68,'2020-11-19',1,'2020-12-19'),(52,69,'2020-10-30',1,'2020-11-30'),(53,63,'2020-10-26',1,'2020-11-26'),(54,70,'2020-10-26',1,'2020-11-26'),(55,62,'2020-11-05',1,'2020-12-05'),(56,61,'2020-11-03',1,'2020-12-03'),(57,53,'2020-03-04',6,'2021-06-08'),(58,57,'2020-11-09',1,'2020-12-09'),(59,43,'2020-10-31',1,'2020-11-30'),(60,42,'2020-11-10',1,'2020-12-10'),(61,41,'2020-11-09',1,'2020-12-09'),(62,40,'2020-11-07',1,'2020-12-07'),(63,39,'2020-11-06',1,'2020-12-06'),(64,71,'2020-11-16',1,'2020-12-16'),(66,72,'2020-11-05',1,'2020-12-05'),(67,73,'2020-11-19',1,'2020-12-19'),(72,75,'2020-01-12',6,'2021-01-12'),(73,76,'2020-11-10',1,'2020-12-10'),(74,77,'2020-10-27',1,'2020-11-27'),(75,78,'2020-11-09',1,'2020-12-09'),(76,79,'2020-11-17',1,'2020-12-17'),(83,89,'2020-11-23',1,'2020-12-23'),(84,90,'2020-11-23',1,'2020-12-23'),(85,88,'2020-11-10',1,'2020-12-10'),(86,91,'2020-11-17',1,'2020-12-17'),(87,92,'2020-10-05',1,'2020-11-05'),(88,92,'2020-11-05',1,'2020-12-05'),(89,52,'2020-11-05',1,'2020-12-05'),(90,38,'2020-10-28',1,'2020-11-28'),(91,64,'2020-11-25',1,'2020-12-25'),(92,93,'2020-11-04',1,'2020-12-04'),(93,94,'2020-10-30',1,'2020-11-30'),(94,95,'2020-11-09',1,'2020-12-09'),(95,96,'2020-11-09',1,'2020-12-09'),(96,97,'2020-11-30',4,'2021-01-30'),(97,36,'2020-12-30',1,'2021-01-30'),(98,32,'2020-12-02',1,'2021-01-02'),(99,36,'2020-11-30',1,'2020-12-30'),(101,99,'2020-12-03',1,'2021-01-03'),(102,95,'2020-12-09',1,'2021-01-09'),(103,96,'2020-12-09',1,'2021-01-09'),(106,92,'2020-12-14',1,'2021-01-14'),(107,93,'2020-12-04',1,'2021-01-04'),(109,94,'2021-03-04',1,'2021-04-04'),(110,94,NULL,NULL,NULL),(111,101,'2021-03-06',NULL,NULL),(112,101,'2021-03-06',1,'2021-04-06'),(113,102,'2021-03-18',1,'2021-04-18'),(114,103,'2021-03-18',1,'2021-04-18'),(115,93,'2021-01-04',3,'2021-07-04'),(116,92,'2021-03-14',1,'2021-04-14'),(117,64,'2021-02-23',1,'2021-03-23'),(118,64,NULL,NULL,NULL),(119,62,'2021-02-19',1,'2021-03-19'),(120,61,'2021-03-04',1,'2021-04-04'),(121,58,'2021-03-06',1,'2021-04-06'),(122,58,NULL,NULL,NULL),(123,56,'2021-02-03',2,'2021-05-03'),(124,54,'2021-02-03',1,'2021-03-03'),(125,54,'2021-03-03',1,'2021-04-03'),(126,51,'2021-02-16',1,'2021-03-16'),(127,50,'2021-03-10',1,'2021-04-10'),(128,46,'2021-02-09',1,'2021-03-09'),(129,46,NULL,NULL,NULL),(130,43,'2021-02-18',1,'2021-03-18'),(131,36,'2021-02-23',1,'2021-03-23'),(132,34,'2021-03-04',1,'2021-04-04'),(133,33,'2021-02-08',1,'2021-03-08'),(135,32,'2021-02-06',1,'2021-03-06'),(136,31,'2021-02-26',1,'2021-03-26'),(137,29,'2021-02-26',1,'2021-03-26'),(138,27,'2021-02-17',2,'2021-05-17'),(139,26,'2021-02-15',1,'2021-03-15'),(140,21,'2021-02-27',1,'2021-03-27'),(141,20,'2021-03-04',2,'2021-06-04'),(142,19,'2021-03-04',1,NULL),(143,19,'2021-03-04',1,NULL),(144,19,'2021-03-04',1,'2021-04-04'),(145,14,'2021-02-27',2,'2021-05-27'),(146,14,'2021-02-27',2,'2021-05-27'),(153,106,'2021-02-17',1,'2021-03-17'),(154,107,'2021-03-09',1,'2021-04-09'),(156,108,'2021-03-02',1,'2021-04-02'),(157,110,'2021-03-11',1,'2021-04-11'),(158,26,'2021-03-15',2,'2021-06-15'),(159,57,'2021-03-24',1,'2021-04-24'),(160,46,'2021-03-15',1,'2021-04-15'),(161,36,'2021-03-23',1,'2021-04-23'),(162,111,'2021-03-16',1,'2021-04-16'),(163,112,'2021-03-25',1,NULL),(164,106,'2021-03-29',1,'2021-04-29'),(165,112,'2021-03-25',1,'2021-04-25'),(166,113,'2021-03-25',1,'2021-04-25'),(167,51,'2021-03-16',1,'2021-04-16'),(168,21,'2021-03-27',1,'2021-04-27'),(169,117,'2021-04-08',2,'2021-07-08'),(170,54,'2021-04-03',1,'2021-05-03'),(171,50,'2021-03-10',1,'2021-04-10'),(172,118,'2021-03-09',1,'2021-04-09'),(173,123,'2021-04-12',1,'2021-05-12'),(174,122,'2021-04-08',1,'2021-05-08'),(175,121,'2021-04-08',1,'2021-05-08'),(176,120,'2021-04-08',1,'2021-05-08'),(177,119,'2021-04-08',1,'2021-05-08'),(178,118,'2021-04-12',1,'2021-05-12'),(179,116,'2021-03-19',1,'2021-04-19'),(180,115,'2021-03-18',1,'2021-04-18'),(181,114,'2021-03-18',1,'2021-04-18'),(182,110,'2021-03-11',2,'2021-06-11'),(183,108,'2021-04-05',1,'2021-05-05'),(184,101,'2021-04-06',1,'2021-05-06'),(185,92,'2021-03-14',1,'2021-04-14'),(186,61,'2021-04-05',1,'2021-05-05'),(187,58,'2021-04-06',1,'2021-05-06'),(188,64,'2021-04-05',1,'2021-05-05'),(189,62,'2021-04-08',3,'2021-10-08'),(190,50,'2021-04-10',1,'2021-05-10'),(191,32,'2021-03-19',1,'2021-04-19'),(192,31,'2021-04-05',1,'2021-05-05'),(193,29,'2021-04-07',1,'2021-05-07'),(194,34,'2021-04-05',1,'2021-05-05'),(195,19,'2021-04-05',1,'2021-05-05'),(196,17,'2021-03-23',3,'2021-09-23'),(197,33,'2021-03-10',1,'2021-04-10'),(198,33,'2021-03-10',1,'2021-04-10'),(199,33,'2021-03-10',1,'2021-04-10'),(200,43,'2021-03-27',1,'2021-04-27'),(201,133,'2021-04-16',3,'2021-10-16'),(202,132,'2021-04-12',1,'2021-05-12'),(203,124,'2021-04-12',2,'2021-07-12'),(204,135,'2021-04-07',1,'2021-05-07'),(205,134,'2021-04-19',1,'2021-05-19'),(206,131,'2021-04-05',1,'2021-05-05'),(207,130,'2021-04-05',1,'2021-05-05'),(208,129,'2021-04-06',1,'2021-05-06'),(209,128,'2021-04-06',1,'2021-05-06'),(210,127,'2021-04-05',1,'2021-05-05'),(211,126,'2021-04-09',1,'2021-05-09'),(212,125,'2021-04-13',3,'2021-10-13'),(213,136,'2021-02-05',2,'2021-05-05'),(214,138,'2021-04-07',1,'2021-05-07'),(215,137,'2021-04-19',1,'2021-05-19'),(216,55,'2020-05-27',6,'2021-05-27'),(217,51,'2021-04-17',1,'2021-05-17'),(218,33,'2021-04-19',1,'2021-05-19'),(219,32,'2021-04-20',1,'2021-05-20'),(220,170,'2021-06-24',3,'2021-12-24'),(221,169,'2021-06-08',1,'2021-07-08'),(222,168,'2021-05-16',1,'2021-06-16'),(223,167,'2021-07-11',6,'2022-07-11'),(224,136,'2021-05-26',1,'2021-06-26'),(225,166,'2021-05-20',6,'2022-05-20'),(226,165,'2021-05-31',1,'2021-06-30'),(227,164,'2021-06-08',1,'2021-07-08'),(228,163,'2021-06-02',1,'2021-07-02'),(229,162,'2021-06-23',1,'2021-07-23'),(230,160,'2021-05-23',1,'2021-06-23'),(231,159,'2021-11-01',1,'2021-12-01'),(232,158,'2021-06-05',1,'2021-07-05'),(233,157,'2021-06-21',1,'2021-07-21'),(234,156,'2021-07-08',1,'2021-08-08'),(235,155,'2021-07-10',1,'2021-08-10'),(236,154,'2021-07-06',1,'2021-08-06'),(237,154,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ft_pago` ENABLE KEYS */;

--
-- Table structure for table `ft_persona`
--

DROP TABLE IF EXISTS `ft_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_doc` int(11) DEFAULT NULL,
  `documento` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rh` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto` varchar(600) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_nac` date NOT NULL,
  `sede` int(11) DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sede` (`sede`),
  KEY `tipo_doc` (`tipo_doc`),
  KEY `tipo` (`tipo`),
  CONSTRAINT `ft_persona_ibfk_1` FOREIGN KEY (`sede`) REFERENCES `ft_sede` (`id`),
  CONSTRAINT `ft_persona_ibfk_2` FOREIGN KEY (`tipo_doc`) REFERENCES `ft_tipo_doc` (`id`),
  CONSTRAINT `ft_persona_ibfk_3` FOREIGN KEY (`tipo`) REFERENCES `ft_tipo_persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_persona`
--

/*!40000 ALTER TABLE `ft_persona` DISABLE KEYS */;
INSERT INTO `ft_persona` VALUES (1,'Jhon Alexander Gonzalez Numpaque',1,'1052405955','O+','Crra 111-111','3003619575','NA','','jhongonzalez@sqdm.com','1995-11-19',1,2),(2,'luis carlos leguizamon',1,'1018434845','A+','Cra 3 # 42-91','','NA','13047825_10208380131174549_6911694817205266939_o.jpg','luiska147@gmail.com','1990-04-04',1,2),(3,'Erika Vargas',1,'1049635675','O+','Dg 17 # 17-160','','NA','leo.jpg','erickavargalba@hotmail.com','1993-05-01',1,2),(14,'Claudia Orjuela',1,'33366808','O+','Cr 5#4ab 11','','NA','5efa6fbc79f1a.jpg','yulixapineda9@gmail.com','1982-01-01',1,1),(15,'Wilfredo pineda',1,'7178546','O+','Carret5 #5ab 11 doña eva','','NA','5efb585d31967.jpg','xxxxx@hotmail.com','1981-12-26',1,1),(17,'Moises Monroy',1,'1049646603','O+','Barrio florida','3112264226','NA','','moisesmonroy91@gmail.com','1996-07-14',1,1),(19,'Luis enrrique gil pineda',1,'106788','A-','Ricauirte','','NA','5fad32f8ec711.jpg','Jelemer9001@yahoo.es','2020-11-11',1,1),(20,'Cristian fagua',2,'837383','O+','Djdjd','','NA','5fad33876cdb3.jpg','bdhdh@hotmail.com','2020-11-11',1,1),(21,'Julian neira',1,'1058588600','A-','Florida','','NA','5fad33ecc187b.jpg','erickavaralba@hotmail.com','2020-11-11',1,1),(22,'Yenifer Soler',1,'1083838700','B-','Florida','','NA','5faea23857024.jpg','saritains903@hotmail.com','2020-11-13',1,1),(23,'Camilo muñoz',1,'1064856895','B-','Ricaurte','','NA','5faea2a11ea83.jpg','saritapins03@hotmail.com','2020-11-13',1,1),(25,'Cristian Martinez',1,'1976542890','A-','Siberia','','NA','5faea47d7ca8a.jpg','saapins903@hotmail.com','2020-11-13',1,1),(26,'Daniela Parra',1,'1076549675','A-','Wuiteodbd','','NA','5faea6d41b840.jpg','evars@jdc.edu.co','2020-11-13',1,1),(27,'Clara pulido',1,'40019756','O+','Francia','','NA','5faea68bb1363.jpg','sritapins903@hotmail.com','2020-11-13',1,1),(28,'Brayan Martinez',1,'1049645345','B-','Hdjdbsbsbsjs','','NA','5faea8756ef6e.jpg','erickalba@hotmail.com','2020-11-13',1,1),(29,'Paola Rojas',1,'40019567','B+','Florida','','NA','5faea8f4a8e6d.jpg','saritapins3@hotmail.com','2020-11-13',1,1),(30,'Duvan Sánchez Mayordomo',1,'1049567432','B+','Topo tunja','','NA','5faea95db7bdb.jpg','jelem9001@hotmail.com','2020-11-13',1,1),(31,'Marcela Baron',1,'40076543','B+','Centro tunja','','NA','5faea9e5c9906.jpg','saritapins803@hotmail.com','2020-11-13',1,1),(32,'Santiago perez',1,'1049675123','B-','Paraiso','','NA','5faeaa44a9905.jpg','sarbhapins903@hotmail.com','2020-11-13',1,1),(33,'Paula Ospina',1,'1049654576','AB+','Paraiso','','NA','5faeab27d60e9.jpg','evar6s@jdc.edu.co','2020-11-13',1,1),(34,'Lucy Rincon',1,'1076538628','O+','Surinama','','NA','5faeab722a00a.jpg','erickavargalba5@hotmail.com','2020-11-13',1,1),(35,'Carlos Rodríguez',1,'105634234','O-','Muiscas','','NA','5faeabd8bbef3.jpg','Jelemer90061@hotmail.com','2020-11-13',1,1),(36,'Daniel abello',2,'2000675783','B+','Jordan','','NA','5faeac860b0a3.jpg','sarita01pins903@hotmail.com','2020-11-13',1,1),(37,'Michael puentes',2,'200376527','O-','Surinama','','NA','5faead27ecc10.jpg','evar09gas@jdc.edu.co','2020-11-13',1,1),(38,'Marcela Gil Pineda',1,'967756453','B+','Florida','','NA','5fb123ccf250e.jpg','Jelemer900651@hotmail.com','2020-11-15',1,1),(39,'Santiago Saavedra',2,'2005838474','O+','Florida','','NA','5fb3d1c73d076.jpg','Jelemer900691@hotmail.com','2020-11-17',1,1),(40,'Felipe mora',1,'1056839295','O+','Florida','','NA','5fb3d3a08675e.jpg','saritap6ins903@hotmail.com','2020-11-17',1,1),(41,'William otalora',1,'9851736391','B+','Florida','','NA','5fb3d46915a68.jpg','saritapins9903@hotmail.com','2020-11-17',1,1),(42,'Steven Blanco',1,'1986553839','O+','Florida','','NA','5fb3da9c17122.jpg','sarita56pins903@hotmail.com','2020-11-17',1,1),(43,'Mauricio Ussa',1,'40019765','B-','Florida','','NA','5fb3d6278787d.jpg','evarga67s@jdc.edu.co','2020-11-17',1,1),(44,'Sonia Galvis',1,'1754329876','O+','Surinama','','NA','5fb3e3af18f22.jpg','erickavar76galba@hotmail.com','2020-11-07',1,1),(45,'Andres Sogamoso',1,'1049638389','O+','Surinama','','NA','5fb3e5c26b554.jpg','andressoga22@hotmail.com','1994-05-22',1,1),(46,'Gerardo Molina',1,'8763543126','O+','Surinama','','NA','5fb3ecf12f775.jpg','erickava10rgalba@hotmail.com','2020-11-17',1,1),(48,'Nicolás Arias',2,'1111222233','O+','Surinama','','NA','5fb3f2a95e2f0.jpg','evar87gas@jdc.edu.co','2020-11-17',1,1),(49,'Santiago Arias',1,'1111999972','O+','Surinam','','NA','5fb7f675a924e.jpg','evarga78s@jdc.edu.co','2020-11-17',1,1),(50,'Nansy cano',1,'9999999911','O+','Surinam','','NA','5fb3f371531bd.jpg','evargas91@jdc.edu.co','2020-11-17',1,1),(51,'Alejandro Posso',1,'1113779445','O+','Florida','','NA','5fb4fc5c9aeb6.jpg','saritains6903@hotmail.com','2020-11-18',1,1),(52,'Yeison Rojas',1,'1049614338','O+','Obrero','','NA','5fb4fee576cc9.jpg','evarga954s@jdc.edu.co','2020-11-18',1,1),(53,'Alejandro Gonzalez',1,'1049643780','O-','Libertador','','NA','5fb5008b7378d.jpg','evarg74as@jdc.edu.co','2020-11-18',1,1),(54,'Fabián guevara',1,'1049629135','O+','Americas','','NA','5fb501b1c901b.jpg','saritapin6s903@hotmail.com','2020-11-18',1,1),(55,'Yuli Sosa',1,'1118887765','O+','Paraiso','','NA','5fb5027774141.jpg','erickaargalba@hotmail.com','2020-11-18',1,1),(56,'Adrián a López',1,'2098765656','O+','Americas','','NA','5fb5058035cd6.jpg','erickargalba@hotmail.com','2020-11-18',1,1),(57,'José Rincón',1,'1987878787','O+','Centro','','NA','5fb50636ad5a5.jpg','saritap76ins903@hotmail.com','2020-11-18',1,1),(58,'Bairon gomez',1,'1049675456','O-','Surinama','','NA','5fb507b05f94d.jpg','evarg764as@jdc.edu.co','2020-11-18',1,1),(61,'Lucy Rincon',1,'1045676549','O+','Sutinama','','NA','5fb59350d363a.jpg','erickavargaglba09@hotmail.com','2020-11-18',1,1),(62,'Camilla Gonzalez',1,'1287654326','O+','Florida','','NA','5fb5a4d35f95f.jpg','saritapi7s903@hotmail.com','2020-11-18',1,1),(63,'Felipe aguilar',1,'1065218654','O+','Florida','','NA','5fb5a5831a67b.jpg','saripins903@hotmail.com','2020-11-18',1,1),(64,'Fabián pachon',1,'1065456765','O-','El domo','','Cancela el viernes 27 octubre','6046274cea7ae.jpg','saritahpins903@hotmail.com','2020-11-18',1,1),(65,'Jorge piracoca',1,'1049654346','O+','Florida','','NA','5fb7d11864bce.jpg','saritapinsyy63@hotmail.com','2020-11-20',1,1),(67,'Alejandro Garcia',1,'108756234','O+','Surinam','','NA','5fb7d88a64471.jpg','saritapinh6s903@hotmail.com','2020-11-20',1,1),(68,'Gustavo gonzalez',1,'1067545679','O+','Surinam','','NA','5fb7df96bea53.jpg','saritapin455903@hotmail.com','2020-11-20',1,1),(69,'Brayan contreras',1,'1049876543','O+','Surinam','','NA','5fb7e07d0cf7b.jpg','evargav6s@jdc.edu.co','2020-11-20',1,1),(70,'Carol Montoya',1,'1976543242','O+','Surinam','','NA','5fbed780e4b12.jpg','saritapins90m3@hotmail.com','2020-11-20',1,1),(71,'Elmer Hely casallas farfan',1,'1048563258','O+','jordan','','NA','5fbb091d6c579.jpeg','jhoana.vargas00220207@gmail.com','1593-02-12',2,1),(72,'Kelly Jhoana morales lopez',1,'52885290','O+','portal de oriente m-9 c-9','','NA','5fbb0beabd14e.jpg','kelly@gmail.com','1983-08-12',2,1),(73,'Leydi manela cely nuñes',1,'1049657981','O+','calle7#6-48','','NA','5fbb0e4378f13.jpeg','manuelacelyy99@gmail.com','1999-07-19',2,1),(75,'YENNY ANDREA CASALLAS CHAPARROL',1,'33379007','O+','mztz casa17ciudadela sol de oriente','','NA','5fbb15457f5b6.jpeg','jaccasallas.13@gmail.com','1986-09-13',2,1),(76,'Lina mayerli Gomez Arias',1,'1049636077','O+','urbanizacion   sol de oriente','','NA','5fbb16fbc96a8.jpeg','imagoar@hotmail.com','1993-07-10',2,1),(77,'Claudia patricia Gonzalez',1,'52934514','O+','calle15#4-10','','NA','5fbb19c6e49a4.jpeg','claudiapg2009cp@gmail.com','1983-06-24',2,1),(78,'Karen florido Gutierrez',1,'1049666666','O+','jordan','','NA','5fbb1c188ffce.jpeg','555555vargas07@gmail.com','1999-02-26',2,1),(79,'MARIA ALEJANDRA RAMIRES  JIMENES',1,'1104955555','O+','jordan','','NA','5fbb1d63acab2.jpeg','alejandrapg2009@gmail.com','1995-08-26',2,1),(88,'Sandra Torres Cobos',1,'1075426574','O+','Surinam','','NA','5fbba3ca9c9ac.jpg','saritarspins903@hotmail.com','2020-11-23',1,1),(89,'Fabián David Molina Pacheco',1,'1049625329','O+','Surinam','','NA','5fbbaab44c010.jpg','saritapinsh5903@hotmail.com','2020-11-23',1,1),(90,'Diana Talero Benitez',1,'1049646146','O+','Surinama','','NA','5fbbacd766540.jpg','evargat64s@jdc.edu.co','2020-11-23',1,1),(91,'Maireth Rosendo',1,'1987652515','O+','Surinama','','NA','5fbbb3f912a83.jpg','evar9d8gas@jdc.edu.co','2020-11-23',1,1),(92,'Brayan Malagon',1,'1049656684','O+','Glotida','','NA','5fbbb91a5f795.jpg','evarkcgas@jdc.edu.co','2020-11-23',1,1),(93,'Diego Tovar',2,'1050604227','O+','Surinama','','NA','5fbec9f08efe5.jpg','dietovarne@gmail.com','2020-11-25',1,1),(94,'Diego piracoca',1,'1234543212','O+','Surinam','','NA','5fbeda64d71b6.jpg','evargaxi7s@jdc.edu.co','2020-11-25',1,1),(95,'Adriána Murillo',1,'7296515282','O+','El domo','','NA','5fbedd21ea6e7.jpg','saritapiv6ns903@hotmail.com','2020-11-25',1,1),(96,'Valentina murillo',2,'905437321','O+','El domo','','NA','5fbee3ce54ef1.jpg','saritapins903h9@hotmail.com','2020-11-25',1,1),(97,'Jorge orlando Morales',1,'75057201','O+','Siberia','','NA','5fc282a9acbb4.jpg','Jelemer9001jv8@hotmail.com','2020-11-28',1,1),(99,'Cristian Alexander Numpeque',1,'1087476536','O+','Surinama','','NA','5fd9ea795d165.jpg','erickavarghdjalba@hotmail.com','2020-12-16',1,1),(100,'Jeisson Alejandro  Borda',1,'1049658245','O+','Digonal1112','','NA','6021be2f51cbc.jpg','jeison@gmail.com','2021-02-08',2,1),(101,'Juan Camilo Vargas',1,'1054123789','O+','Florida','','NA','60461ba31469b.jpg','evargahe7s@jdc.edu.co','2021-03-08',1,1),(102,'Alix pizza',1,'1049654378','O-','Florida','','NA','604621f0952c1.jpg','erickavarjd7galba@hotmail.com','2021-03-08',1,1),(103,'Nicolás camargo',1,'1056478564','O+','Florida','','NA','604622d1971d9.jpg','saritapinbdi7s903@hotmail.com','2021-03-08',1,1),(106,'Elver Zuñiga',1,'1049675432','A+','Surinam','','NA','604648523001e.jpg','erickavargauvlba@hotmail.com','2021-03-08',1,1),(107,'Andrea ruiz',1,'3213094785','O+','Florida','','NA','60479a7751a37.jpg','evargajd9s@jdc.edu.co','2021-03-09',1,1),(108,'Jasmeire Vega navarro',1,'6781654343','O+','Florida','','NA','605b5f6e986dd.jpg','saritapi4s903@hotmail.com','2021-03-09',1,1),(109,'Lorena torres',1,'1049619606','O+','Florida','','Plan vip','6048aea1d56e9.jpg','Jelemer9s001@hotmail.com','2021-03-10',1,1),(110,'Yolanda garavito',1,'400186743','A-','Surinama','','NA','604f82d259d40.jpg','Jelemefhr9001@hotmail.com','2021-03-15',1,1),(111,'Daniela Gonzalez',1,'1073638383','B+','Surinam','','NA','605b60a1b97e5.jpg','saritapijdkns903@hotmail.com','2021-03-24',1,1),(112,'Gilma leonor torres',1,'1076545312','O+','Surinama','3143493618','NA','60632ee13559f.jpg','Jelemer900b1@hotmail.com','2021-03-29',1,1),(113,'Diana Paola Rodriguez Lopez',1,'10496196057','O+','Surinama','3133876173','NA','60632f6c95890.jpg','Jelemer900v1@hotmail.com','2021-03-30',1,1),(114,'Engell balvuena',1,'1357891212','O+','Surinama','3227695341','NA','6064b1e7aa9c5.jpg','erickavargalnba@hotmail.com','2021-03-31',1,1),(115,'Jessica Antolinez',1,'7654321123','O-','Surinama','3254321356','NA','6064b267081ef.jpg','Jelemerj9001@hotmail.com','2021-03-31',1,1),(116,'Elkin Duriel Espitia Nope',1,'1987654532','A+','Surinama','3195300941','NA','6064dc6791780.jpg','Jelemer90es01@hotmail.com','2021-03-31',1,1),(117,'Maryorid Corredor',1,'1087637289','O+','San Francisco','3142005347','NA','6071105a9cbef.jpg','Jelemer9j001@hotmail.com','2021-04-09',1,1),(118,'Alejandra Marcela Cabrera',1,'1057123455','O+','Surinama','3134039321','NA','6071ad91eabd3.jpg','erickavarghdalba@hotmail.com','2021-04-10',1,1),(119,'Adriana gisel Bernal',1,'10496196034','O+','Surinama','3223812885','NA','607201b19ae7e.jpg','Jelemer9w01@hotmail.com','2021-04-10',1,1),(120,'Omar Alba',1,'1076123543','O+','Surinama','3232433104','NA','607505e0d1b1a.jpg','erickavarksgalba@hotmail.com','2021-04-12',1,1),(121,'Yulieth Mireya Vargas',1,'1866555751','O+','Surinama','321 322 88 85','NA','607507dd0afe5.jpg','jelemer9001bs@hotmail.com','2021-04-12',1,1),(122,'Laura katerine Bernal Suares',1,'1049619700','O+','Surinama','338383838','NA','607512fcc52c1.jpg','Jelemer900d@hotmail.com','2021-04-12',1,1),(123,'Cristian becerra',1,'1049653059','O+','Surinama','3017279158','NA','6075b7f1c21d3.jpg','erickavargcalba@hotmail.com','2021-04-13',1,1),(124,'Edwin Camilo Moreno',1,'1976545867','O+','Surinama','3114791641','NA','607658d122587.jpg','erickavafhrgalba@hotmail.com','2021-04-13',1,1),(125,'Mayra Tatiana Diaz',1,'1076765428','O+','Surinama','3002366191','NA','607664c443b89.jpg','Jelemer9gh001@hotmail.com','2021-04-13',1,1),(126,'Karen Cely',1,'1076356612','O+','San carlos','3223014301','NA','607668a6a0b06.jpg','erickavadfrgalba@hotmail.com','2021-04-13',1,1),(127,'Sulaim Yurani Garcia Sandoval',1,'1076567876','O+','Surinama','3219575077','NA','60766b3ed4340.jpg','Jelemer9001hj@hotmail.com','2021-04-13',1,1),(128,'Laura Michel Hernandez Sosa',1,'1067543217','O+','Surinama','3124722761','NA','6076f8ffbde8f.jpg','Jelemer9vsi001@hotmail.com','2021-04-14',1,1),(129,'Luz Hernandez',1,'40042813','A-','Surinama','3103045643','NA','6076f993c7ab0.jpg','erickavargadslba@hotmail.com','2021-04-14',1,1),(130,'Claudia Marcela Benavidez Mancipe',1,'40046455','O+','Surinam','3125337320','NA','607901c622adc.jpg','erickavarcbgalba@hotmail.com','2021-04-15',1,1),(131,'Alisson Camila Fagua',1,'1049658849','O+','Surinama','321 322 88 89','NA','60790241e06d3.jpg','Jelemehdr9001@hotmail.com','2021-04-15',1,1),(132,'Luis Miguel Martinez jimenez',1,'1002330927','O+','Surinama','3212859447','NA','607d6a3eddd2e.jpg','Jelemey9001@hotmail.com','2021-04-16',1,1),(133,'Pedro Pablo Galan',1,'1049619680','O+','Surinama','3017059091','NA','607b9ce1cf0f4.jpg','Jelemer90do@hotmail.com','2021-04-17',1,1),(134,'Aura leticia Rodriguez',1,'1067654543','O+','Surinama','3133564469','NA','607edd980fbbf.jpg','erickavargalghba@hotmail.com','2021-04-20',1,1),(135,'Laura liseth católico gonzalez',1,'1049619605','O+','Surinama','3105278316','NA','607ee163b6925.jpg','erickavafrgalba@hotmail.com','2021-04-20',1,1),(136,'Cristian camilo Rojas',1,'1057784836','A+','Surinama','3023983734','NA','607eec22789e6.jpg','Jelemer900vd1@hotmail.com','2003-05-24',1,1),(137,'Marisol verdugo',1,'1036493748','O+','Surinama','3123445206','NA','607eee7bc643d.jpg','erickadrgalba@hotmail.com','2021-04-20',1,1),(138,'Juan Pablo pulido',1,'1074739472','O+','Surinama','3373747373','NA','607ef17f676b1.jpg','Jeleme001@hotmail.com','2021-04-20',1,1),(139,'Elkin felipe Aguilar Espitia',1,'1056928004','O+','Surinama','3227443677','NA','6080c8be828f4.jpg','erickargaljdidba@hotmail.com','2021-04-21',1,1),(140,'Diana garavito',1,'1002331404','O+','Surinama','3228299981','NA','6088ca1aa3d1e.jpg','erickavargjjhalba@hotmail.com','2021-04-27',1,1),(141,'Angelica gonzalez',1,'107468373','O+','Surinama','3225900062','NA','60b7646413240.jpg','Jelemerd001@hotmail.com','2021-06-02',1,1),(142,'Nicolas Arias',2,'5643234567','O+','Surinama','3154954628','NA','60b764d820e38.jpg','erickavargahdblba@hotmail.com','2021-06-02',1,1),(143,'Damaris pulido',1,'1087564579','O+','Surinama','3164312930','NA','60b76578c6694.jpg','erickavargalbjdja@hotmail.com','2021-06-02',1,1),(144,'Omar Mora',1,'40765545','O+','Surinama','3209608160','NA','60b7662cbb052.jpg','jelemer9dj01@hotmail.com','2021-06-02',1,1),(145,'Nansy cano',1,'638373837','O+','Surinama','3219857875','NA','60b767882e24a.jpg','Jelemer9dj1@hotmail.com','2021-06-02',1,1),(147,'Paula zuñiga',1,'1846383838','O+','Surinama','3133483986','NA','60b76a7f7564c.jpg','erickavargHDIalba@hotmail.com','2021-06-02',1,1),(148,'Nurian lopez',1,'1086538393','O-','Surinam','3133048121','NA','60b76aee24e37.jpg','erickavargmalba@hotmail.com','2021-06-02',1,1),(149,'Maria Duran',1,'183764738','O+','Surinama','3108854485','NA','60b76b6d7a6f9.jpg','Jelemer9f001@hotmail.com','2021-06-02',1,1),(150,'Mateo Rocha',1,'1074838384','O+','Kr 11#3-08 GIMNASIO','3136713290','NA','60b77724939f5.jpg','erickavargalbjssa@hotmail.com','2021-06-02',1,1),(151,'Sarq alejandra lopez',1,'1049619603','O+','Surinama','3228142505','NA','60b7c2afbc04f.jpg','Jelemer9341@hotmail.com','2021-06-02',1,1),(152,'Anderson Alvarez',1,'1049617600','O+','Surinama','3205914387','NA','60b7c3ade2b9b.jpg','erickavarg3alba@hotmail.com','2021-06-02',1,1),(153,'Brayan Avila',1,'1042619600','O+','Surinama','3223506920','NA','60b7c4dcb8291.jpg','Jelem34r9001@hotmail.com','2021-06-02',1,1),(154,'Jorge Daza',1,'1049679600','O+','Surinama','3214075739','NA','60b7c56f00697.jpg','erickavargalzsba@hotmail.com','2021-06-02',1,1),(155,'Lorena Camacho',1,'1049619900','O+','Surinama','3213069031','NA','60b7c5e460799.jpg','Jelemer90b1@hotmail.com','2021-06-02',1,1),(156,'Diana Lopez',1,'1049615600','O+','Surinama','3124022886','NA','60b7c672c2acd.jpg','alba@hotmail.com','2021-06-02',1,1),(157,'Alejandro Garzon',1,'1049619608','O+','Surinama','3143493619','NA','60b7c79f16488.jpg','Jelem90011@hotmail.com','2021-06-02',1,1),(158,'Johan gonzalez',1,'1048619600','O+','Surinama','3208538603','NA','60b7c80ab2746.jpg','Jeleme97001@hotmail.com','2021-06-02',1,1),(159,'Marisol Mancipe',1,'1049659600','O+','Surinama','3142777923','NA','60b7c86bc6ce4.jpg','Jelemer90019@hotmail.com','2021-06-02',1,1),(160,'Dora Rincon',1,'134556643','O+','Surinama','3133483986','NA','60cd5d21a9378.jpg','erickavargakoba@hotmail.com','2021-06-18',1,1),(162,'Monica moreno',1,'1099619600','O+','Surinama','3143493619','NA','60cd5effdee31.jpg','Jelemer91@hotmail.com','2021-06-18',1,1),(163,'Diana niño',1,'1909619600','O+','Surinama','3143493618','NA','60cd5f95ad11c.jpg','jelemer9541@hotmail.com','2021-06-18',1,1),(164,'Diana Rojas',1,'1049612600','O+','Surinama','3143493611','NA','60cd6061c98cb.jpg','erickavorgalba@hotmail.com','2021-06-18',1,1),(165,'Amanda castiblanco',1,'1009619600','O+','Surinama','3143493618','NA','60cd60d3c0b8b.jpg','erickavargzslba@hotmail.com','2021-06-18',1,1),(166,'Deisy Castro',1,'1049656600','O+','Surinama','3159264789','NA','60cd6170a8287.jpg','Jelemer9761@hotmail.com','2021-06-18',1,1),(167,'Alejandra Buitrago',1,'1048769600','O+','Surinama','3134902413','NA','60cd61ef25708.jpg','erickalorgalba@hotmail.com','2021-06-18',1,1),(168,'Julian Martinez',1,'1067519600','O+','Surinama','3112263696','NA','60cd642b3db8b.jpg','Jelemedj201@hotmail.com','2021-06-18',1,1),(169,'Yudy Najar',1,'1292919600','O+','Surinama','3114520230','NA','60cd64f5b4f79.jpg','Jelemey2001@hotmail.com','2021-06-18',1,1),(170,'Maria Alejandra Ruiz',1,'1049019600','O+','Surinama','3213103049','NA','60cd65b25b81c.jpg','erickavargsmba@hotmail.com','2021-06-18',1,1),(171,'Mauricio gonzales',1,'1049629600','O+','Surinama','3102522729','NA','60cd6639301a0.jpg','Jelemerp001@hotmail.com','2021-06-18',1,1),(172,'Andres Huertas',1,'1040619600','O+','Surinama','3115287696','Vip','60dbcc3a3c69f.jpg','yulixapinedo9@gmail.com','2021-06-18',1,1);
/*!40000 ALTER TABLE `ft_persona` ENABLE KEYS */;

--
-- Table structure for table `ft_plan`
--

DROP TABLE IF EXISTS `ft_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_plan` int(11) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `duracion` (`duracion`),
  KEY `tipo_plan` (`tipo_plan`),
  CONSTRAINT `ft_plan_ibfk_1` FOREIGN KEY (`duracion`) REFERENCES `ft_duracion` (`id`),
  CONSTRAINT `ft_plan_ibfk_2` FOREIGN KEY (`tipo_plan`) REFERENCES `ft_tipo_plan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_plan`
--

/*!40000 ALTER TABLE `ft_plan` DISABLE KEYS */;
INSERT INTO `ft_plan` VALUES (1,1,1,70000),(2,1,2,160000),(3,1,3,270000),(4,2,1,77000),(5,3,1,60000),(6,4,4,380000);
/*!40000 ALTER TABLE `ft_plan` ENABLE KEYS */;

--
-- Table structure for table `ft_profesion`
--

DROP TABLE IF EXISTS `ft_profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_profesion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_profesion`
--

/*!40000 ALTER TABLE `ft_profesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ft_profesion` ENABLE KEYS */;

--
-- Table structure for table `ft_referencia`
--

DROP TABLE IF EXISTS `ft_referencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_referencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(700) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ocupacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ocupacion` (`ocupacion`),
  CONSTRAINT `ft_referencia_ibfk_1` FOREIGN KEY (`ocupacion`) REFERENCES `ft_profesion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_referencia`
--

/*!40000 ALTER TABLE `ft_referencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ft_referencia` ENABLE KEYS */;

--
-- Table structure for table `ft_referencia_persona`
--

DROP TABLE IF EXISTS `ft_referencia_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_referencia_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona` int(11) DEFAULT NULL,
  `referencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_referencia_persona`
--

/*!40000 ALTER TABLE `ft_referencia_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `ft_referencia_persona` ENABLE KEYS */;

--
-- Table structure for table `ft_rol`
--

DROP TABLE IF EXISTS `ft_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_rol`
--

/*!40000 ALTER TABLE `ft_rol` DISABLE KEYS */;
INSERT INTO `ft_rol` VALUES (1,'admin'),(2,'usuario');
/*!40000 ALTER TABLE `ft_rol` ENABLE KEYS */;

--
-- Table structure for table `ft_sede`
--

DROP TABLE IF EXISTS `ft_sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_sede` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_sede`
--

/*!40000 ALTER TABLE `ft_sede` DISABLE KEYS */;
INSERT INTO `ft_sede` VALUES (1,'Surinama','Cra 11 No. 3-08 brr surinama'),(2,'Jordan','Cra 5 no. 12ª-11 brr jordan'),(3,'VIP','Todas las sedes');
/*!40000 ALTER TABLE `ft_sede` ENABLE KEYS */;

--
-- Table structure for table `ft_tipo_doc`
--

DROP TABLE IF EXISTS `ft_tipo_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_tipo_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_tipo_doc`
--

/*!40000 ALTER TABLE `ft_tipo_doc` DISABLE KEYS */;
INSERT INTO `ft_tipo_doc` VALUES (1,'Cédula de Ciudadanía'),(2,'Tarjeta de Identidad'),(3,'Pasaporte');
/*!40000 ALTER TABLE `ft_tipo_doc` ENABLE KEYS */;

--
-- Table structure for table `ft_tipo_persona`
--

DROP TABLE IF EXISTS `ft_tipo_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_tipo_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_tipo_persona`
--

/*!40000 ALTER TABLE `ft_tipo_persona` DISABLE KEYS */;
INSERT INTO `ft_tipo_persona` VALUES (1,'Cliente'),(2,'Admin');
/*!40000 ALTER TABLE `ft_tipo_persona` ENABLE KEYS */;

--
-- Table structure for table `ft_tipo_plan`
--

DROP TABLE IF EXISTS `ft_tipo_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_tipo_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_tipo_plan`
--

/*!40000 ALTER TABLE `ft_tipo_plan` DISABLE KEYS */;
INSERT INTO `ft_tipo_plan` VALUES (1,'Basicó'),(2,'VIP'),(3,'Grupal'),(4,'Anualidad');
/*!40000 ALTER TABLE `ft_tipo_plan` ENABLE KEYS */;

--
-- Table structure for table `ft_tipo_usuario`
--

DROP TABLE IF EXISTS `ft_tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_tipo_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_tipo_usuario`
--

/*!40000 ALTER TABLE `ft_tipo_usuario` DISABLE KEYS */;
INSERT INTO `ft_tipo_usuario` VALUES (1,'Admin'),(2,'Usuario');
/*!40000 ALTER TABLE `ft_tipo_usuario` ENABLE KEYS */;

--
-- Table structure for table `ft_usuario`
--

DROP TABLE IF EXISTS `ft_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ft_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona` int(11) DEFAULT NULL,
  `contrasena` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `persona` (`persona`),
  KEY `tipo` (`tipo`),
  CONSTRAINT `ft_usuario_ibfk_1` FOREIGN KEY (`persona`) REFERENCES `ft_persona` (`id`),
  CONSTRAINT `ft_usuario_ibfk_2` FOREIGN KEY (`tipo`) REFERENCES `ft_tipo_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ft_usuario`
--

/*!40000 ALTER TABLE `ft_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `ft_usuario` ENABLE KEYS */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` int(11) DEFAULT NULL,
  `texto` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('jhongonzalez@sqdm.com','$2y$10$Gka/cZTrjmY9xh.uPNO7ue92FRTxzazL3MgDGs43GxUd3MofasR06','2020-02-18 06:50:29');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `person` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `documento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `person` (`person`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`person`) REFERENCES `ft_persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jhon Alexander Gonzalez Numpaque','jhongonzalez@sqdm.com',NULL,'$2y$10$t4suJX1LvH47..m07l6Kr.1bTJbWc2Tw4ENDvBzcGI2qlgmYm50rm','ogzfja6RmMFRX4lR8DHl1hOkUchPXNrrHxX7wfeQjYqoi8pO0DZ2jWtDH4pM',1,'2020-02-17 02:14:19','2020-02-17 02:14:19','1052405955'),(2,'luis carlos leguizamon','luiska147@gmail.com',NULL,'$2y$10$vMx.WjRj2FLVih.JKKAH.eT2YRi7KGj8LPsV1JSSOJrKBPbCpgdOa',NULL,2,'2020-02-18 20:29:21','2020-02-18 20:29:21','1018434845'),(3,'Erika Vargas','erickavargalba@hotmail.com',NULL,'$2y$10$NKgWgxq2kgu6jCe/.SIPXeaoQWDKUFq3a7txD9W30m2XGP5ai7r.q','Wo7ctEUxJEVy36mlZjOYPU0sCGy2CgFZZ82xLV61jCEDrdXEpvBq6M9Dtaty',3,'2020-02-18 22:08:29','2020-02-18 22:08:29','1049635675'),(12,'Claudia Orjuela','yulixapineda9@gmail.com',NULL,'$2y$10$/Pq4d/vBka2RzeiDAbuNPO/M0naRXl6W7s.HRzznnhkX4hxfvPoFy',NULL,14,'2020-06-29 17:48:28','2020-06-29 17:48:28','33366808'),(13,'Wilfredo pineda','xxxxx@hotmail.com',NULL,'$2y$10$ZfrOy7ELhqvkeQK8I.LZnOIV3zX0Y2cR62PGIdrUomfc/xWOTEPeG',NULL,15,'2020-06-30 10:21:01','2020-06-30 10:21:01','7178546'),(15,'Moises Monroy','moisesmonroy91@gmail.com',NULL,'$2y$10$uq1qctL/spti.7Fx7UGliec8uUfPJAByfwGtgyeNkM32gt82g3bIi',NULL,17,'2020-11-11 15:17:16','2020-11-11 15:17:16','1049646603'),(17,'Luis enrrique gil pineda','Jelemer9001@yahoo.es',NULL,'$2y$10$ex9qAwIHtPgkZ5nl6Usowey/fC8SpZ1XrUWwxEBdYCP76KmfvDQiW',NULL,19,'2020-11-11 20:47:25','2020-11-11 20:47:25','106788'),(18,'Cristian fagua','bdhdh@hotmail.com',NULL,'$2y$10$MOOnSMzKfr7ftbcTezRU0.TeFgKmBSNpwD2KpRfllwaYiOeI0sASC',NULL,20,'2020-11-11 20:50:51','2020-11-11 20:50:51','837383'),(19,'Julian neira','erickavaralba@hotmail.com',NULL,'$2y$10$5G4/NBV1rWPXkiq.U1epzuclSxrd/20C2PtrbrlyfkhLD3g.TBFCW',NULL,21,'2020-11-11 20:56:59','2020-11-11 20:56:59','1058588600'),(20,'Yenifer Soler','saritains903@hotmail.com',NULL,'$2y$10$NbhtqJ/RbsM7qkp0ktmSUON2sztP4K47W3IyMD8m3HylJlQISo5H2',NULL,22,'2020-11-13 10:11:52','2020-11-13 10:11:52','1083838700'),(21,'Camilo muñoz','saritapins03@hotmail.com',NULL,'$2y$10$KJtsZsgX4CFEXLWe3nDF5./GbVSb.IwQfHeM/lmk9uUiQlyImB5sG',NULL,23,'2020-11-13 10:13:37','2020-11-13 10:13:37','1064856895'),(23,'Cristian Martinez','saapins903@hotmail.com',NULL,'$2y$10$TTBwPLMcgGXkU5JtbO5KveqP8XcYS/Dpeez5VAvGv2K8dpy10Zh.m',NULL,25,'2020-11-13 10:21:33','2020-11-13 10:21:33','1976542890'),(24,'Daniela Parra','evars@jdc.edu.co',NULL,'$2y$10$k9cZmp3zjxsIZuYX60ZFdeyfGMQeRi35MtCKxSfuG1ZAUENTo3wG6',NULL,26,'2020-11-13 10:27:39','2020-11-13 10:27:39','1076549675'),(25,'Clara pulido','sritapins903@hotmail.com',NULL,'$2y$10$QOUrZMo9bfqabBy5jmjJrOxYBH2jmLLghL9Tg5s0Wk3zPQ46gUJEC',NULL,27,'2020-11-13 10:30:19','2020-11-13 10:30:19','40019756'),(26,'Brayan Martinez','erickalba@hotmail.com',NULL,'$2y$10$KHhK786HC1UidQXhhTfS/uazjvg7KhOsAF8Yp7oNHojtFhXbQJ8dy',NULL,28,'2020-11-13 10:38:29','2020-11-13 10:38:29','1049645345'),(27,'Paola Rojas','saritapins3@hotmail.com',NULL,'$2y$10$Yg0do8KD/aCqR5O05vQgVOXxjpACk6gD48rlcD1jEYklZK/Ie.5ou',NULL,29,'2020-11-13 10:40:36','2020-11-13 10:40:36','40019567'),(28,'Duvan Sánchez Mayordomo','jelem9001@hotmail.com',NULL,'$2y$10$bINqn5KrNp2aa5Np/xCE1eLNH7cIBBpJ4TnfT3TEP1tJH88.r61ue',NULL,30,'2020-11-13 10:42:21','2020-11-13 10:42:21','1049567432'),(29,'Marcela Baron','saritapins803@hotmail.com',NULL,'$2y$10$cH9weKSOMEOvSxJlmgHUT.reOVVfAGPXw/dua5v9yRa24py29qz/G',NULL,31,'2020-11-13 10:44:37','2020-11-13 10:44:37','40076543'),(30,'Santiago perez','sarbhapins903@hotmail.com',NULL,'$2y$10$E63hej4ZBwmAUipyyt76NufBCEipNEf05CSIlptLDs6ucJLEHcUgu',NULL,32,'2020-11-13 10:46:12','2020-11-13 10:46:12','1049675123'),(31,'Paula Ospina','evar6s@jdc.edu.co',NULL,'$2y$10$TsSwGwUDtq3JmFgJh3WpluVY7LPH5vvTopSqRMApC30b7Ft5ov8.i',NULL,33,'2020-11-13 10:49:59','2020-11-13 10:49:59','1049654576'),(32,'Lucy Rincon','erickavargalba5@hotmail.com',NULL,'$2y$10$X01.93JtZGFFQjyL9kuRh.eZk4e18eQDPuoKZcx0YqtREwyRS4dzK',NULL,34,'2020-11-13 10:51:14','2020-11-13 10:51:14','1076538628'),(33,'Carlos Rodríguez','Jelemer90061@hotmail.com',NULL,'$2y$10$BJgsou4ye.chyBFwEjR74uI.y6UJC8cYAbHdWABVlkhtuY4THRBgS',NULL,35,'2020-11-13 10:52:56','2020-11-13 10:52:56','105634234'),(34,'Daniel abello','sarita01pins903@hotmail.com',NULL,'$2y$10$B2BtR20n7eibx0S/sVlyBuu5ckSU3JuXR6nnp1GCX7fp9m29xHgJW',NULL,36,'2020-11-13 10:55:50','2020-11-13 10:55:50','2000675783'),(35,'Michael puentes','evar09gas@jdc.edu.co',NULL,'$2y$10$5VeNzLTyuGiyYxHecAdp2O2GiT5qNTZhFoi9smxAGdj9hxtDmxMoi',NULL,37,'2020-11-13 10:58:32','2020-11-13 10:58:32','200376527'),(36,'Marcela Gil Pineda','Jelemer900651@hotmail.com',NULL,'$2y$10$uQl91Y/E0LaDG5BhTk5CE.gYaGS2vZS7LQ82j0McyEvWeTkTACoa2',NULL,38,'2020-11-15 07:49:17','2020-11-15 07:49:17','967756453'),(37,'Santiago Saavedra','Jelemer900691@hotmail.com',NULL,'$2y$10$14FYZ6lTwqqZndGLoa77Je0We2rnycfUdbtExbhrrI9VUGE3sjL3m',NULL,39,'2020-11-17 08:36:10','2020-11-17 08:36:10','2005838474'),(38,'Felipe mora','saritap6ins903@hotmail.com',NULL,'$2y$10$SoFNieaRZAnD/LnunpnRw.HgvGF309Ry08fAkaH8FlaIXYC5E.7oW',NULL,40,'2020-11-17 08:44:00','2020-11-17 08:44:00','1056839295'),(39,'William otalora','saritapins9903@hotmail.com',NULL,'$2y$10$0d49Crc9toB35xErJT7PQ.M/qnchvdGRZ8Mvl9wzUARfjO.O1hGBS',NULL,41,'2020-11-17 08:47:21','2020-11-17 08:47:21','9851736391'),(40,'William otalora','sarita56pins903@hotmail.com',NULL,'$2y$10$y8vPCW90PamrQkJUtkg24OAR8WUWZTpaiGccupSaEyogQx6t..eva',NULL,42,'2020-11-17 08:50:07','2020-11-17 08:50:07','1986553839'),(41,'Mauricio Ussa','evarga67s@jdc.edu.co',NULL,'$2y$10$wVberJEFYLIDNSVP46wqNeLNyfd/eAXkNlxayN.7pZSlxpZfdkU7K',NULL,43,'2020-11-17 08:54:47','2020-11-17 08:54:47','40019765'),(42,'Sonia Galvis','erickavar76galba@hotmail.com',NULL,'$2y$10$1L4CzId9exBCgo4vppHNXeIiNgjvJMl3BLdbw67966STT/H4bwTNO',NULL,44,'2020-11-17 09:52:31','2020-11-17 09:52:31','1754329876'),(43,'Andres Sogamoso','andressoga22@hotmail.com',NULL,'$2y$10$nX8h5dQfKtYpWFrNicJbZeR1QrEjtVI7NPWnPJ89MdVWI8Vpay6x6',NULL,45,'2020-11-17 10:01:22','2020-11-17 10:01:22','1049638389'),(44,'Gerardo Molina','erickava10rgalba@hotmail.com',NULL,'$2y$10$WcSBYXk3qiWFYa7GgOvZHOxdwlQH0YIgCA.7HN3KMf0CuGzvh4Ose',NULL,46,'2020-11-17 10:32:01','2020-11-17 10:32:01','8763543126'),(46,'Nicolás Arias','evar87gas@jdc.edu.co',NULL,'$2y$10$qnaukGfMc.LMSSHy9ztgfOeBb0v0gWIH.QAhL9qjQa3C.PpQQggEK',NULL,48,'2020-11-17 10:41:32','2020-11-17 10:41:32','1111222233'),(47,'Santiago Arias','evarga78s@jdc.edu.co',NULL,'$2y$10$LanC5FC67c5NEosInk7Z9uXTFXpLUnmB6v4fDeAdkXzoCHKgjDFI6',NULL,49,'2020-11-17 10:42:22','2020-11-17 10:42:22','1111999972'),(48,'Nansy cano','evargas91@jdc.edu.co',NULL,'$2y$10$BmnnzHFmYdir6hwTkW5SeOPo2HFv8DLFSzpIPSl5wsJIZLQesdh5i',NULL,50,'2020-11-17 10:59:45','2020-11-17 10:59:45','9999999911'),(49,'Alejandro Posso','saritains6903@hotmail.com',NULL,'$2y$10$Gc5iXmDiMIEY2tgDqbwXjOFxvsJz.eCAg5oSSX7xPSytBnIK8bBYG',NULL,51,'2020-11-18 05:50:04','2020-11-18 05:50:06','1113779445'),(50,'Yeison Rojas','evarga954s@jdc.edu.co',NULL,'$2y$10$t68cighYxks5WXSKFyJX4O5Vm4xAvkeZtCmnCakn1WswM1fYiY8aa',NULL,52,'2020-11-18 06:00:53','2020-11-18 06:00:53','1049614338'),(51,'Alejandro Gonzalez','evarg74as@jdc.edu.co',NULL,'$2y$10$omShLWqD3qziiii5rBZ/c.s.fkhj1P/aJ49pHZA0hFIsdIzF67U5K',NULL,53,'2020-11-18 06:07:55','2020-11-18 06:07:55','1049643780'),(52,'Fabián guevara','saritapin6s903@hotmail.com',NULL,'$2y$10$5q74cuiX5v7WAkiimVRaVeL6RTKN5iCaXcgWaT8lQQAi4dRH4/dxG',NULL,54,'2020-11-18 06:12:49','2020-11-18 06:12:49','1049629135'),(53,'Yuli Sosa','erickaargalba@hotmail.com',NULL,'$2y$10$2BZ7kHp1IlY1WjpaR351Ae9GBIAn5Nj6Vlji462SVA7zj7LkS7QVK',NULL,55,'2020-11-18 06:16:07','2020-11-18 06:16:07','1118887765'),(54,'Adrián a López','erickargalba@hotmail.com',NULL,'$2y$10$407RW/p6O836H6APEvCYK.EGLx6b5CjkKmiS.X01cxEbITz0JlOzi',NULL,56,'2020-11-18 06:29:04','2020-11-18 06:29:04','2098765656'),(55,'José Rincón','saritap76ins903@hotmail.com',NULL,'$2y$10$ZO2OgYpkO8PX1qUWaVFGbeMRuEdwpVilvv9tTnMx6SFUCv08kotXC',NULL,57,'2020-11-18 06:32:06','2020-11-18 06:32:07','1987878787'),(56,'Bairon gomez','evarg764as@jdc.edu.co',NULL,'$2y$10$bzUohE7aNi9bTa73.5rjPeun/M5m0gciti9.9WsJG3eWCyNZRbjru',NULL,58,'2020-11-18 06:38:24','2020-11-18 06:38:24','1049675456'),(59,'Lucy Rincon','erickavargaglba09@hotmail.com',NULL,'$2y$10$kBOOnhcqFEriHxO3loJ15uDYWzJongJXSrPPTQHAfbt1sKRaSS5yi',NULL,61,'2020-11-18 16:33:30','2020-11-18 16:33:30','1045676549'),(60,'Camilla Gonzalez','saritapi7s903@hotmail.com',NULL,'$2y$10$fnppBJgkj8/r.f3cSM8.XegsHq9Zj36fppWqFzYZo.Aby/mCzajnS',NULL,62,'2020-11-18 17:48:51','2020-11-18 17:48:51','1287654326'),(61,'Felipe aguilar','saripins903@hotmail.com',NULL,'$2y$10$lYRJdiC2rw6adF40LidZbeCiuhX44NXUkU5cV0i5gYC4YqRuqxkOa',NULL,63,'2020-11-18 17:51:47','2020-11-18 17:51:47','1065218654'),(62,'Fabián pachon','saritahpins903@hotmail.com',NULL,'$2y$10$cS4T9giiEiA5p0v8knIRNud9EeeqS.EBf10CJrD/gIzPY0jAsc3Wm',NULL,64,'2020-11-18 17:56:33','2020-11-18 17:56:33','1065456765'),(63,'Jorge piracoca','saritapinsyy63@hotmail.com',NULL,'$2y$10$qsMNosD3em3o7Q9aKO6i7ed8g4lS8AwghLrGYLb0.Ltb2vI7IiMRS',NULL,65,'2020-11-20 09:21:19','2020-11-20 09:21:19','1049654346'),(65,'Alejandro Garcia','saritapinh6s903@hotmail.com',NULL,'$2y$10$3wGzACxSO.8beXb/SmHhg.Pvaey97YQp88TYF.D3i2w7jAUrE4Waa',NULL,67,'2020-11-20 09:54:02','2020-11-20 09:54:02','108756234'),(66,'Gustavo gonzalez','saritapin455903@hotmail.com',NULL,'$2y$10$pciLjYFCbrVPiYnZ9Orxde5V6Lmj2aGo4qYjD.jpsRIvhDCugVAAq',NULL,68,'2020-11-20 10:24:06','2020-11-20 10:24:06','1067545679'),(67,'Brayan contreras','evargav6s@jdc.edu.co',NULL,'$2y$10$kCDWxUw8AcVRso/T.SdiMOFM4ffz.WaH4a9cQY888NdwBxx3mu.ca',NULL,69,'2020-11-20 10:27:57','2020-11-20 10:27:57','1049876543'),(68,'Carol Montoya','saritapins90m3@hotmail.com',NULL,'$2y$10$hyHolhkU5IqitP1CQvFkVuGrdUPPknfeTifCwOaKgpgpLZgIdAdAq',NULL,70,'2020-11-20 10:39:56','2020-11-20 10:39:56','1976543242'),(69,'Elmer Hely casallas farfan','jhoana.vargas00220207@gmail.com',NULL,'$2y$10$9TBeRHURQmCY2lri.fQqOOgjI8tRFI5ijCUp04oK34XIoAvvlednm',NULL,71,'2020-11-22 19:58:05','2020-11-22 19:58:05','1048563258'),(70,'Kelly Jhoana morales lopez','kelly@gmail.com',NULL,'$2y$10$jGcpw6qdYscCjX088Qperunx3W0NrhYO1PI2kYcc34Q2GkqZ8wSvu',NULL,72,'2020-11-22 20:10:02','2020-11-22 20:10:02','52885290'),(71,'Leydi manela cely nuñes','manuelacelyy99@gmail.com',NULL,'$2y$10$8mht3FnkW8XiEZdZvZ.VGuodJVNat4FWoSND/G.QGQkodSOaw8Wy.',NULL,73,'2020-11-22 20:20:03','2020-11-22 20:20:03','1049657981'),(73,'YENNY ANDREA CASALLAS CHAPARROL','jaccasallas.13@gmail.com',NULL,'$2y$10$5/ZYyAmNRV7p90IC6hdiBuwMTXibfTL4MCi0Riq.9z82kNL1eiIjK',NULL,75,'2020-11-22 20:49:57','2020-11-22 20:49:57','33379007'),(74,'Lina mayerli Gomez Arias','imagoar@hotmail.com',NULL,'$2y$10$qDu2pV72Q/mn7D.ZgrE0HOGse2hG74qAOF5q4q3Vc/fcbk/velKvK',NULL,76,'2020-11-22 20:57:15','2020-11-22 20:57:15','1049636077'),(75,'Claudia patricia Gonzalez','claudiapg2009cp@gmail.com',NULL,'$2y$10$eJFTljYui.YNKVz.ltCS9.o5NsqV/84Y6BqvxKy.2mSbVbL73GvMq',NULL,77,'2020-11-22 21:09:11','2020-11-22 21:09:11','52934514'),(76,'Karen florido Gutierrez','555555vargas07@gmail.com',NULL,'$2y$10$JRE4lcSts7d9ogIyCDfaYOTI6x/88KJ3efw9y7KOIYmOYcTBdqC1u',NULL,78,'2020-11-22 21:19:04','2020-11-22 21:19:04','1049666666'),(77,'MARIA ALEJANDRA RAMIRES  JIMENES','alejandrapg2009@gmail.com',NULL,'$2y$10$jEefDK5iHWLksuc1Dw5IjuuDnIkQu5zX/cmAK6O6D1Wsjkwsxzi6i',NULL,79,'2020-11-22 21:24:35','2020-11-22 21:24:35','1104955555'),(86,'Sandra Torres Cobos','saritarspins903@hotmail.com',NULL,'$2y$10$IRRMxkfrzJ.DBXbMKLZdJuJaO4//VMtqOXJ/iThw91QWkJlNY0hOC',NULL,88,'2020-11-23 06:58:02','2020-11-23 06:58:02','1075426574'),(87,'Fabián David Molina Pacheco','saritapinsh5903@hotmail.com',NULL,'$2y$10$eAxlFGSqTqYfX95V1gpjHeutuhE3tX6DAUjiAQ/Q3G63HDRIws//m',NULL,89,'2020-11-23 07:27:33','2020-11-23 07:27:33','1049625329'),(88,'Diana Talero Benitez','evargat64s@jdc.edu.co',NULL,'$2y$10$2LvJkAL0A7YSldnXj/gDtetT/gCw9igXBlPQkdTXYaaGGDDmyndGC',NULL,90,'2020-11-23 07:36:39','2020-11-23 07:36:39','1049646146'),(89,'Maireth Rosendo','evar9d8gas@jdc.edu.co',NULL,'$2y$10$cwOkPosPknu22XPU8ih91.Rfdt09tbwk5mEliH7Z9CIQ6M39oczXC',NULL,91,'2020-11-23 08:07:05','2020-11-23 08:07:05','1987652515'),(90,'Brayan Malagon','evarkcgas@jdc.edu.co',NULL,'$2y$10$Ix3pPBNDeOmEd9RsQShlA.l56c8b.4EWEZlsSf2zSmVTrk3mPjmOS',NULL,92,'2020-11-23 08:28:58','2020-11-23 08:28:58','1049656684'),(91,'Diego Tovar','dietovarne@gmail.com',NULL,'$2y$10$Qk1o6LwttLUU5Z.dAI3IceaNuyEKVHoKn2YsZj5lTgBB0dHSX2sXu',NULL,93,'2020-11-25 16:17:37','2020-11-25 16:17:37','1050604227'),(92,'Diego piracoca','evargaxi7s@jdc.edu.co',NULL,'$2y$10$fa1BGEwFUcMV4kJZMJH86u0H9ABSkNOm.NHaZtkd5cq9fXhbAC8/C',NULL,94,'2020-11-25 17:27:48','2020-11-25 17:27:48','1234543212'),(93,'Adriána Murillo','saritapiv6ns903@hotmail.com',NULL,'$2y$10$.iYt6ZByVd3AN1.ef/H15OY8s7AaM9r96EG/EkdMzlD2FvcqjCBHG',NULL,95,'2020-11-25 17:39:30','2020-11-25 17:39:30','7296515282'),(94,'Valentina murillo','saritapins903h9@hotmail.com',NULL,'$2y$10$zmPJl9oxMeRj80qvTVccB.aZVJFVbY3WxdEvrqglAkNbxvKj7.6TC',NULL,96,'2020-11-25 18:07:58','2020-11-25 18:07:58','905437321'),(95,'Jorge orlando Morales','Jelemer9001jv8@hotmail.com',NULL,'$2y$10$wshkFlptYTUM1tUqepfkiuXqXuky50h2JGChRjMkQlQqY4KHXoPqW',NULL,97,'2020-11-28 12:02:34','2020-11-28 12:02:34','75057201'),(97,'Cristian Alexander Numpeque','erickavarghdjalba@hotmail.com',NULL,'$2y$10$XjatTLXIhzrkm8TsM25/A.4p39gT5b8QMqR5H2n7mGVbcPapCHiD.',NULL,99,'2020-12-16 06:07:37','2020-12-16 06:07:37','1087476536'),(98,'Jeisson Alejandro  Borda','jeison@gmail.com',NULL,'$2y$10$COyWk12Ao9A6SGVyhucMCeMryzHRmU4Pm8oqrpRzWunb.yzIOboP.',NULL,100,'2021-02-08 17:41:51','2021-02-08 17:41:51','1049658245'),(99,'Juan Camilo Vargas','evargahe7s@jdc.edu.co',NULL,'$2y$10$PL9Nu/UXdcC4G9AvrNUOOegsyr1Z/08v0CFh9ewVY8O1XKNIFmhRm',NULL,101,'2021-03-08 07:42:11','2021-03-08 07:42:11','1054123789'),(100,'Alix pizza','erickavarjd7galba@hotmail.com',NULL,'$2y$10$5A/CmE6Hbf1Asmc3q.dtAuAC1Hijq7c4qMzg6Cq5iz4P.t4nmj/N2',NULL,102,'2021-03-08 08:09:07','2021-03-08 08:09:07','1049654378'),(101,'Nicolás camargo','saritapinbdi7s903@hotmail.com',NULL,'$2y$10$k4V7n68VFo/yodfjYga4COJ7fFe1uuz3G9lIhEaqIK3LKGoDfHHN2',NULL,103,'2021-03-08 08:12:49','2021-03-08 08:12:49','1056478564'),(104,'Elver Zuñiga','erickavargauvlba@hotmail.com',NULL,'$2y$10$WODLq..ic3xajXWTiJV6keVt5i8ILmOg5xZ24KI0ruiRa3Hs0DsSy',NULL,106,'2021-03-08 10:52:50','2021-03-08 10:52:50','1049675432'),(105,'Andrea ruiz','evargajd9s@jdc.edu.co',NULL,'$2y$10$w2NYWSFxlwyd//RTQ2I0..YqfiboxtXZZQATy/WPpY.Cu8VwLnN5K',NULL,107,'2021-03-09 10:55:35','2021-03-09 10:55:35','3213094785'),(106,'Jasmeire Vega navarro','saritapi4s903@hotmail.com',NULL,'$2y$10$Q5MppEXlzZdxKLetThfLxeCpF/MUK1qF6l9TP3J0q3VX2xVkF.dCK',NULL,108,'2021-03-09 10:58:12','2021-03-09 10:58:12','6781654343'),(107,'Lorena torres','Jelemer9s001@hotmail.com',NULL,'$2y$10$6UbGXY1CzAzQi3R169AdcOoXh6dvKECj6RWayuS9UhVcnrgv/MrF2',NULL,109,'2021-03-10 06:33:53','2021-03-10 06:33:53','1049619606'),(108,'Yolanda garavito','Jelemefhr9001@hotmail.com',NULL,'$2y$10$3lavMdRLWcSkQ9oIm0le0eMVYSr4r73F.WWzq6rNXC.t4CkK2m/U2',NULL,110,'2021-03-15 10:52:50','2021-03-15 10:52:51','400186743'),(109,'Daniela Gonzalez','saritapijdkns903@hotmail.com',NULL,'$2y$10$7W59d74y80v5/F0.lMoMC.ofiVUw9kjw/QgYEXc.jHD35OfTGHhDu',NULL,111,'2021-03-24 10:54:12','2021-03-24 10:54:13','1073638383'),(110,'Gilma leonor torres','Jelemer900b1@hotmail.com',NULL,'$2y$10$xSqGGc/h9nwS0rbyoj0KAuSOrvnoSO9Zo1Zeey/a5ZKkmcy6JwPTW',NULL,112,'2021-03-29 14:59:05','2021-03-29 14:59:05','1076545312'),(111,'Diana Paola Rodriguez Lopez','Jelemer900v1@hotmail.com',NULL,'$2y$10$3Urru0jDHcTHX5mQUkxe8.MOJhO3Xdbp6pRtzy0mzDWKtKAcsfhuK',NULL,113,'2021-03-30 09:02:20','2021-03-30 09:02:21','10496196057'),(112,'Engell balvuena','erickavargalnba@hotmail.com',NULL,'$2y$10$gxLPqkGxEmuwIgHadOGJ3.19LvrvbBLSiOR3gwAEi.RsCrHWMCAYK',NULL,114,'2021-03-31 12:31:20','2021-03-31 12:31:20','1357891212'),(113,'Jessica Antolinez','Jelemerj9001@hotmail.com',NULL,'$2y$10$iNKtC1qA.NnSxA9Dqdy2DejcNoscoVgzDru6A95Ic8rZkJ3tUBOLu',NULL,115,'2021-03-31 12:33:27','2021-03-31 12:33:27','7654321123'),(114,'Elkin Duriel Espitia Nope','Jelemer90es01@hotmail.com',NULL,'$2y$10$veApbnhxvhDxDpjQbl3pHuEkufIY6mGMcIZ51cofyoU09vWuXR.Eq',NULL,116,'2021-03-31 15:32:39','2021-03-31 15:32:39','1987654532'),(115,'Maryorid Corredor','Jelemer9j001@hotmail.com',NULL,'$2y$10$El1JT5Ug4.tjl38X5K7YuOCHfRvj02V1K1c38eZxyZVOQNtOs0tJu',NULL,117,'2021-04-09 21:41:30','2021-04-09 21:41:30','1087637289'),(116,'Alejandra Marcela Cabrera','erickavarghdalba@hotmail.com',NULL,'$2y$10$g4gyEC/n9F.1mjMVXGqkEuFWUbpc29yuHy9Wmo/PLMmOHRbKh9T2C',NULL,118,'2021-04-10 08:52:18','2021-04-10 08:52:18','1057123455'),(117,'Adriana gisel Bernal','Jelemer9w01@hotmail.com',NULL,'$2y$10$laM.NTzOPOEuXXD3.VdSnumWltceCt2/YtH0Yi9HOlt90qf2c6ZH.',NULL,119,'2021-04-10 14:51:13','2021-04-10 14:51:13','10496196034'),(118,'Omar Alba','erickavarksgalba@hotmail.com',NULL,'$2y$10$qb65yp1GZSHPRuVp8Rbh3ueWJZHcMRvFTviwX9sg8uDL55KQ9I7MK',NULL,120,'2021-04-12 21:45:52','2021-04-12 21:45:52','1076123543'),(119,'Yulieth Mireya Vargas','jelemer9001bs@hotmail.com',NULL,'$2y$10$lTlqYCWe1SLBD5WsTvFZ6.5UuOnLsFci7kj5QQNn4zDKw1FOU4pwe',NULL,121,'2021-04-12 21:54:21','2021-04-12 21:54:21','1866555751'),(120,'Laura katerine Bernal Suares','Jelemer900d@hotmail.com',NULL,'$2y$10$EgjQERO35cMZUJk77CYLUe37qoNZexV4j0FS1iaHE3C4VDWOKM8IG',NULL,122,'2021-04-12 22:41:48','2021-04-12 22:41:48','1049619700'),(121,'Cristian becerra','erickavargcalba@hotmail.com',NULL,'$2y$10$jReywdh5vvrK0T0ns/Wa.OxcwV9r.DXAC4Zliwc4ZrPLS7RGKHZxy',NULL,123,'2021-04-13 10:25:37','2021-04-13 10:25:37','1049653059'),(122,'Edwin Camilo Moreno','erickavafhrgalba@hotmail.com',NULL,'$2y$10$/PJS/7BU05V9SWwGX5pJ.ebMKpeO4O8xA3w2p/Bk1qrplsA.EHpUi',NULL,124,'2021-04-13 21:52:01','2021-04-13 21:52:01','1976545867'),(123,'Mayra Tatiana Diaz','Jelemer9gh001@hotmail.com',NULL,'$2y$10$xd/ElFKlsKd1wDtXX1RpJ.gAzp77LzGpE6YD.m9SBrZF4cYfHSteW',NULL,125,'2021-04-13 22:43:00','2021-04-13 22:43:00','1076765428'),(124,'Karen Cely','erickavadfrgalba@hotmail.com',NULL,'$2y$10$N48PZdP7grDcW3VUzn4yoOaAfrX.FRzZQV075dP1CctJ0w6t5z8.i',NULL,126,'2021-04-13 22:59:34','2021-04-13 22:59:34','1076356612'),(125,'Sulaim Yurani Garcia Sandoval','Jelemer9001hj@hotmail.com',NULL,'$2y$10$kJD0QcB0qlBrNtTWiZHm0uvKrjFaEJl82LeKYpZdyJjdj993fK/bO',NULL,127,'2021-04-13 23:10:38','2021-04-13 23:10:38','1076567876'),(126,'Laura Michel Hernandez Sosa','Jelemer9vsi001@hotmail.com',NULL,'$2y$10$M6XvRewhgfLAjcycf80XLOKMYslZNKLepsINIabVfx8IxWizxX4Oi',NULL,128,'2021-04-14 09:15:27','2021-04-14 09:15:27','1067543217'),(127,'Luz Hernandez','erickavargadslba@hotmail.com',NULL,'$2y$10$6dJOnYOIVW5yE4tcyaqZT.6IVxad3EK/W4hDBfTS2QtzH20A/N0vq',NULL,129,'2021-04-14 09:17:55','2021-04-14 09:17:55','40042813'),(128,'Claudia Marcela Benavidez Mancipe','erickavarcbgalba@hotmail.com',NULL,'$2y$10$MtsgFoJG255l7vtxAo.Uxuhtuf6xkKj5WxVJ82DkZwtLLKiP.cK2K',NULL,130,'2021-04-15 22:17:26','2021-04-15 22:17:26','40046455'),(129,'Alisson Camila Fagua','Jelemehdr9001@hotmail.com',NULL,'$2y$10$YsljkQfsXP3VywWeQYBFmuyQABoOTZZ1jAuz/5/ZHucmMD/LKo/kq',NULL,131,'2021-04-15 22:19:30','2021-04-15 22:19:30','1049658849'),(130,'Luis Miguel Martinez jimenez','Jelemey9001@hotmail.com',NULL,'$2y$10$1tZypN8ersVLri.9/KMAIO1/6JUsWCP8IiWfglz7b9OMKtXQ6RpWm',NULL,132,'2021-04-16 12:37:37','2021-04-16 12:37:37','1002330927'),(131,'Pedro Pablo Galan','Jelemer90do@hotmail.com',NULL,'$2y$10$UDjn0Fif6g3ETJjjlsKpu.81JdxQSaUzhhppik3hjBGP4PyEbKXV.',NULL,133,'2021-04-17 21:43:45','2021-04-17 21:43:45','1049619680'),(132,'Aura leticia Rodriguez','erickavargalghba@hotmail.com',NULL,'$2y$10$Tx.tZ792/sJQK3JON7LFH.ma7VqU5UzomrmH8325YwL3.fTdr4ceO',NULL,134,'2021-04-20 08:56:40','2021-04-20 08:56:40','1067654543'),(133,'Laura liseth católico gonzalez','erickavafrgalba@hotmail.com',NULL,'$2y$10$RdY7LJ68WTkxSldzmKh/8uVE8cMj1jBlNUrBDEVf/kNiCMy3kkC0i',NULL,135,'2021-04-20 09:12:51','2021-04-20 09:12:51','1049619605'),(134,'Cristian camilo Rojas','Jelemer900vd1@hotmail.com',NULL,'$2y$10$fkh9vpkEk/G.FUoTHqE3Wuf9ERYgUyicQhR0l7xJn/EbAxBOMyVE.',NULL,136,'2021-04-20 09:58:43','2021-04-20 09:58:43','1057784836'),(135,'Marisol verdugo','erickadrgalba@hotmail.com',NULL,'$2y$10$RXP0MTNRAM7xaqkmL7ry8.Ayh2630J2SEzeLg5YDdbOGK.2PWgTuy',NULL,137,'2021-04-20 10:07:02','2021-04-20 10:07:02','1036493748'),(136,'Juan Pablo pulido','Jeleme001@hotmail.com',NULL,'$2y$10$2cAxR/3gGd/Pbltkez.XletF6nwlUz0MGC1BesJJbOEAPWbD/HMZi',NULL,138,'2021-04-20 10:21:37','2021-04-20 10:21:37','1074739472'),(137,'Elkin felipe Aguilar Espitia','erickargaljdidba@hotmail.com',NULL,'$2y$10$3uXPxUj8.9pLvzhzWKJ1wetc88hHYnI.DkUZyTVwh.tVp4frCgW0q',NULL,139,'2021-04-21 19:52:14','2021-04-21 19:52:14','1056928004'),(138,'Diana garavito','erickavargjjhalba@hotmail.com',NULL,'$2y$10$7Se3JGhWAh5Vx8Lp1IqgXuynGufyMyYxJKx4YDK9SZFZpAOV869iu',NULL,140,'2021-04-27 21:36:10','2021-04-27 21:36:10','1002331404'),(139,'Angelica gonzalez','Jelemerd001@hotmail.com',NULL,'$2y$10$mWGkJjtgCOodXm.RFBiFNOARbvHDIzch/0UF9KBTH4kIH5rcFZM.S',NULL,141,'2021-06-02 05:58:44','2021-06-02 05:58:44','107468373'),(140,'Nicolas Arias','erickavargahdblba@hotmail.com',NULL,'$2y$10$pYnv35CH8WDKWmAFeJME0.5/lkxQQg3x48qTw86aJH93sz6YhnKBC',NULL,142,'2021-06-02 06:00:40','2021-06-02 06:00:40','5643234567'),(141,'Damaris pulido','erickavargalbjdja@hotmail.com',NULL,'$2y$10$skz2IRfmBezB0ZHuoZgJM.TlFig6ru7/X1rLfX8xp5qpdpeWA/S5O',NULL,143,'2021-06-02 06:03:20','2021-06-02 06:03:20','1087564579'),(142,'Omar Mora','jelemer9dj01@hotmail.com',NULL,'$2y$10$t/EYtbE79h0JUhfjqgKs4.Un7XrqIhGrCxwA.jIPjQeHVEGAHMNg.',NULL,144,'2021-06-02 06:06:20','2021-06-02 06:06:20','40765545'),(143,'Nansy cano','Jelemer9dj1@hotmail.com',NULL,'$2y$10$jwR.5Lx6TJ/AXqhm5oVl8.zUDcorQLqUKrWTInS6ylVzFK9JEExm2',NULL,145,'2021-06-02 06:12:08','2021-06-02 06:12:08','638373837'),(145,'Paula zuñiga','erickavargHDIalba@hotmail.com',NULL,'$2y$10$eMqMDv0IvJLqxOOf3m/Vqu77AiHFYmXt6JtfXan..t4HSh6kf8Mpi',NULL,147,'2021-06-02 06:24:47','2021-06-02 06:24:47','1846383838'),(146,'Nurian lopez','erickavargmalba@hotmail.com',NULL,'$2y$10$GuH7JcUkzMzPCrfiwxrDDerT5Xw.BwGJi.oeja.j2hq1yMWzaHhuW',NULL,148,'2021-06-02 06:26:38','2021-06-02 06:26:38','1086538393'),(147,'Maria Duran','Jelemer9f001@hotmail.com',NULL,'$2y$10$UFtkkIVsA7qcUNSLnXNqyeLbq2iWkUl8vgoQ/DkQV1ZjIfnXYh5gi',NULL,149,'2021-06-02 06:28:45','2021-06-02 06:28:45','183764738'),(148,'Mateo Rocha','erickavargalbjssa@hotmail.com',NULL,'$2y$10$1c8XRMUgmCcRDMiTVlKAye3/GJsgPqFxoIOmUoeh5cqcLIfCUAHNO',NULL,150,'2021-06-02 07:18:44','2021-06-02 07:18:44','1074838384'),(149,'Sarq alejandra lopez','Jelemer9341@hotmail.com',NULL,'$2y$10$lFnKLgoq/je8bqpHJOEiPe/DfEshHZThqIiyT8l3FIFGaIkMvgis.',NULL,151,'2021-06-02 12:41:03','2021-06-02 12:41:04','1049619603'),(150,'Anderson Alvarez','erickavarg3alba@hotmail.com',NULL,'$2y$10$fG.wVzuRh3Vg9jO9iV1Etu2voJ90BokrgEh1ZVp0pGWWPDbF5cmCW',NULL,152,'2021-06-02 12:45:18','2021-06-02 12:45:18','1049617600'),(151,'Brayan Avila','Jelem34r9001@hotmail.com',NULL,'$2y$10$8LIXZ7ezDLR4yao5B1/R8.tNS.bSAWbVL8G3pXiXSoM0lfxGUIyS2',NULL,153,'2021-06-02 12:50:20','2021-06-02 12:50:20','1042619600'),(152,'Jorge Daza','erickavargalzsba@hotmail.com',NULL,'$2y$10$QnXgDGDHo10/hYkN7sUwNeNC9fKrTGgIVKlmGs4bWEBuEGp4O/ggK',NULL,154,'2021-06-02 12:52:47','2021-06-02 12:52:47','1049679600'),(153,'Lorena Camacho','Jelemer90b1@hotmail.com',NULL,'$2y$10$K32bW6yw4HhDV4EV7jSRruraESCTeST3jrF8xMk1nuqYa3Fd.Fv12',NULL,155,'2021-06-02 12:54:44','2021-06-02 12:54:44','1049619900'),(154,'Diana Lopez','alba@hotmail.com',NULL,'$2y$10$bYWo8/8IyPtJMBC/shrB4ucQvHj3.7aXIXnFWIAx9b8TPOsWX4X3S',NULL,156,'2021-06-02 12:56:25','2021-06-02 12:56:25','1049615600'),(155,'Alejandro Garzon','Jelem90011@hotmail.com',NULL,'$2y$10$9KAjxewD/iVoy2lSuVhk1OSMeDxDu64kWRmqyQUFyFRLjEc2fwywW',NULL,157,'2021-06-02 13:01:36','2021-06-02 13:01:36','1049619608'),(156,'Johan gonzalez','Jeleme97001@hotmail.com',NULL,'$2y$10$CHazAp8c88FzsMOhdvDnteIS2VImx2Io0hkLkhtSLwu/ui2gshsjC',NULL,158,'2021-06-02 13:03:54','2021-06-02 13:03:54','1048619600'),(157,'Marisol Mancipe','Jelemer90019@hotmail.com',NULL,'$2y$10$kSJJacLmvGwKl3ehDz0Shu88E9aInX/CVZSr.9jkScv3l9Vo2jfXy',NULL,159,'2021-06-02 13:05:31','2021-06-02 13:05:31','1049659600'),(158,'Dora Rincon','erickavargakoba@hotmail.com',NULL,'$2y$10$DRvbQeJWrMl30Jgz.sB0PuO4pSF5Ok8vE644Ql4JTLtWog.cdqnKS',NULL,160,'2021-06-18 21:57:37','2021-06-18 21:57:37','134556643'),(160,'Monica moreno','Jelemer91@hotmail.com',NULL,'$2y$10$N9jqkaJC.SV1.3faDxnIvurI/8OnVJRH3bzOhLCUgrIhys9u/1/qq',NULL,162,'2021-06-18 22:05:35','2021-06-18 22:05:36','1099619600'),(161,'Diana niño','jelemer9541@hotmail.com',NULL,'$2y$10$WmP0D78x266r.Kn03DPA3.t829eXsSOYiSxa8.JcVwA6tmp5g5cU6',NULL,163,'2021-06-18 22:08:05','2021-06-18 22:08:05','1909619600'),(162,'Diana Rojas','erickavorgalba@hotmail.com',NULL,'$2y$10$VjQdEh0yhigf9WZm4qt1A.0VIKCVai8Wx5Vfh9gfgmSb5zyY9lGhG',NULL,164,'2021-06-18 22:11:29','2021-06-18 22:11:29','1049612600'),(163,'Amanda castiblanco','erickavargzslba@hotmail.com',NULL,'$2y$10$r15KHWYuC/BMCmZwt2z1e.FKGlhzb0R59zzH9dSFnXj5CB39WHiqS',NULL,165,'2021-06-18 22:13:23','2021-06-18 22:13:23','1009619600'),(164,'Deisy Castro','Jelemer9761@hotmail.com',NULL,'$2y$10$sEZz3E5ZVTVKB4IQ2fHlje0/mZiRLN0iErhAXWVd2WP6SdsHH/BAC',NULL,166,'2021-06-18 22:16:00','2021-06-18 22:16:00','1049656600'),(165,'Alejandra Buitrago','erickalorgalba@hotmail.com',NULL,'$2y$10$lI8iFQxUK1AozqvhRuimJOX3NB.P1l.p8TM.GQLv5FF6621vLavne',NULL,167,'2021-06-18 22:18:07','2021-06-18 22:18:07','1048769600'),(166,'Julian Martinez','Jelemedj201@hotmail.com',NULL,'$2y$10$Wtgj6YabA6Nn1RDt/bfNKu4IQrb11QdPnexloIrS.9piy9I7dC7AK',NULL,168,'2021-06-18 22:27:39','2021-06-18 22:27:39','1067519600'),(167,'Yudy Najar','Jelemey2001@hotmail.com',NULL,'$2y$10$qZG9Tc5g74BjyiGqr1b1iOIMPkIjjOloavJfe45qJ9Xt.XKNw07F.',NULL,169,'2021-06-18 22:31:01','2021-06-18 22:31:01','1292919600'),(168,'Maria Alejandra Ruiz','erickavargsmba@hotmail.com',NULL,'$2y$10$TCXuSWutwoHgtaluVfY4W.4kgS.eWsdG.wmsUbAzFM6ibBeirLqUS',NULL,170,'2021-06-18 22:34:10','2021-06-18 22:34:10','1049019600'),(169,'Mauricio gonzales','Jelemerp001@hotmail.com',NULL,'$2y$10$SCgggn/ekVMX9m21OzTlS.29xOCr0IeQDfIyvqQXJDvk4/mKJJ0FO',NULL,171,'2021-06-18 22:36:25','2021-06-18 22:36:25','1049629600'),(170,'Andres Huertas','yulixapinedo9@gmail.com',NULL,'$2y$10$kdoqL4da0ISvOLPpuwmo/.iY3VMPS9ZXBUzs4q9sT1xXGwR7Xper2',NULL,172,'2021-06-18 22:41:24','2021-06-18 22:41:24','1040619600');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Dumping routines for database 'u836658462_fitzone'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-02 16:50:56
