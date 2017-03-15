-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: sportistas
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `metadatos` text NOT NULL,
  `analytics` text NOT NULL,
  `correo_nuevo_registro` varchar(255) NOT NULL,
  `correo_alertas` varchar(255) NOT NULL,
  `memo_test` int(1) NOT NULL,
  `que_fue` int(1) NOT NULL,
  `que_es` int(1) NOT NULL,
  `trivia` int(1) NOT NULL,
  `video_promo` varchar(255) NOT NULL,
  `video_buen_resultado` varchar(255) NOT NULL,
  `video_mal_resultado` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` VALUES (1,'DirecTv - Sportistas','test','teest m','ana','test1@kood.com.ar','test2@kood.com.ar',0,0,0,1,'5eda28417f79ae6312ef3e2f31364f5c.mp4','cfacfc6f92d638f31073c650ce689037.mp4','6fa60609ab1892c1c067f14cc7c67695.mp4','2014-07-11 00:00:00','2017-02-28 14:23:00');
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memotest`
--

DROP TABLE IF EXISTS `memotest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `memotest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(255) NOT NULL,
  `img1` varchar(255) NOT NULL,
  `img2` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memotest`
--

LOCK TABLES `memotest` WRITE;
/*!40000 ALTER TABLE `memotest` DISABLE KEYS */;
INSERT INTO `memotest` VALUES (1,'jugadores editado','','','2017-02-27 20:51:54','2017-02-27 20:52:00'),(2,'tema2 mod','ef474b711f7a6d78a131883d0dddc351.png','fa705d371ff71c3bc58e5f068bdb7d00.png','2017-02-27 21:15:24','2017-02-27 21:25:06');
/*!40000 ALTER TABLE `memotest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfiles` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,1,'Administrador','Tiene acceso total al sitio y todos sus sub-sitios, as','2014-01-21 00:00:00','2014-01-21 00:00:00'),(2,0,'Standard','Usuarios standard del sistema','2014-05-01 00:00:00','2014-05-01 00:00:00');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quefue`
--

DROP TABLE IF EXISTS `quefue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quefue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  `fue` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quefue`
--

LOCK TABLES `quefue` WRITE;
/*!40000 ALTER TABLE `quefue` DISABLE KEYS */;
INSERT INTO `quefue` VALUES (1,'dwedewdwe','4054601caaca032b7d1cf6bc3c9ad377.mp4',1,'2017-02-28 00:00:41','2017-02-28 12:46:09'),(2,'modi','60337ac07a6473f9f8b99d475898516c.mp4',1,'2017-02-28 00:08:22','2017-02-28 12:47:18');
/*!40000 ALTER TABLE `quefue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quienes`
--

DROP TABLE IF EXISTS `quienes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quienes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `res_1` varchar(255) NOT NULL,
  `res_2` varchar(255) NOT NULL,
  `res_3` varchar(255) NOT NULL,
  `res_4` varchar(255) NOT NULL,
  `correcta` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quienes`
--

LOCK TABLES `quienes` WRITE;
/*!40000 ALTER TABLE `quienes` DISABLE KEYS */;
INSERT INTO `quienes` VALUES (1,'test mod','b0fdc6317a010b1ba45b779de9b0b76d.png','r1 m','r2','r3 mod','r4',3,'2017-02-27 22:47:46','2017-02-27 22:48:01');
/*!40000 ALTER TABLE `quienes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registros`
--

DROP TABLE IF EXISTS `registros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_registro_device` int(11) DEFAULT NULL,
  `id_origen_device` int(11) DEFAULT NULL,
  `id_juego` int(1) NOT NULL,
  `tiempo` datetime NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `proveedor_cable` varchar(255) DEFAULT NULL,
  `proveedor_internet` varchar(255) DEFAULT NULL,
  `recibe_info` int(11) DEFAULT NULL,
  `created_at_device` datetime DEFAULT NULL,
  `updated_at_device` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registros`
--

LOCK TABLES `registros` WRITE;
/*!40000 ALTER TABLE `registros` DISABLE KEYS */;
/*!40000 ALTER TABLE `registros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporales`
--

DROP TABLE IF EXISTS `temporales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporales` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `modulo` varchar(64) NOT NULL,
  `tipo` varchar(16) NOT NULL,
  `fuente` varchar(255) NOT NULL,
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `data_a` varchar(255) NOT NULL,
  `data_b` varchar(255) NOT NULL,
  `orden` int(3) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporales`
--

LOCK TABLES `temporales` WRITE;
/*!40000 ALTER TABLE `temporales` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trivia`
--

DROP TABLE IF EXISTS `trivia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trivia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(255) NOT NULL,
  `res_1` varchar(255) NOT NULL,
  `res_2` varchar(255) NOT NULL,
  `res_3` varchar(255) NOT NULL,
  `res_4` varchar(255) NOT NULL,
  `correcta` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trivia`
--

LOCK TABLES `trivia` WRITE;
/*!40000 ALTER TABLE `trivia` DISABLE KEYS */;
INSERT INTO `trivia` VALUES (1,'De que color es el sol a la tarde?','dewdew','dwed','d','dddd',0,'2017-02-26 00:06:15','2017-02-28 19:03:37'),(2,'primer','','','','',0,'2017-02-27 15:52:10','2017-02-27 15:52:10'),(4,'t2','t1','5y45y4','t3','t48888',3,'2017-02-27 15:58:46','2017-02-27 15:59:24');
/*!40000 ALTER TABLE `trivia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `perfil_id` int(5) unsigned NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` int(11) NOT NULL,
  `last_ip` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) DEFAULT NULL,
  `recovery` tinyint(1) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `perfil_id` (`perfil_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,'admin@koodstudio.com.ar','$2y$10$9bQgkOTfzXzYivOn6aOL/.m570XKhjhQkGiqRVpFYx0XGPR/a9VqK','Administrador','Kood Studio','admin@koodstudio.com.ar',1390317603,'127.0.0.1',1,0,'tN7Ghw9en7CCgr4ceFQMGBuOg1hsbyC4Ugl4OdgyIoT1gi1iAzairla8PAQy','2014-01-21 00:00:00','2017-02-25 23:36:04'),(2,2,'tesst@gll.com','$2y$10$lZXSHwtuuMAee079odugTefLasXL.SMycb5kQhHo0GH.gR/EL8IqO','test','test','tesst@gll.com',0,'',2,0,NULL,'2017-02-25 21:50:20','2017-02-25 23:40:47'),(3,2,'tesst@gll.com.ar','$2y$10$uznRio8L6p4DZJ7PaBV8E.vUHdG1UvZ9VJJbUXvG1KHDFA0OdKsmG','dos','dewdew','tesst@gll.com.ar',0,'',0,0,NULL,'2017-02-25 23:41:18','2017-02-28 22:34:06');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-28 20:04:28
