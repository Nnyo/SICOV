CREATE DATABASE  IF NOT EXISTS `sicov` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sicov`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sicov
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorities` (
  `username` varchar(100) NOT NULL,
  `authority` varchar(50) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `auth_user` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES ('administrador@gmail.com','ROLE_ADMINISTRADOR'),('dannyo.gonzalez2502@gmail.com','ROLE_ADMINISTRADOR'),('enlace@gmail.com','ROLE_ENLACE'),('enlace2@gmail.com','ROLE_ENLACE'),('presidente@gmail.com','ROLE_PRESIDENTE');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delCiudadanoUser` AFTER DELETE ON `authorities` FOR EACH ROW BEGIN
	DELETE FROM users WHERE (`username` = old.username);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bitacoralogin`
--

DROP TABLE IF EXISTS `bitacoralogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacoralogin` (
  `idControl` int NOT NULL AUTO_INCREMENT,
  `fechaAcceso` datetime NOT NULL,
  `correoUsuario` varchar(45) NOT NULL,
  PRIMARY KEY (`idControl`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacoralogin`
--

LOCK TABLES `bitacoralogin` WRITE;
/*!40000 ALTER TABLE `bitacoralogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `bitacoralogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idcategoria` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (2,'Agua');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudadano`
--

DROP TABLE IF EXISTS `ciudadano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudadano` (
  `idciudadano` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `enabled` tinyint NOT NULL,
  `fotografia` longblob,
  `nombre` varchar(45) NOT NULL,
  `numero_empleado` varchar(30) DEFAULT NULL,
  `numero_telefonico` varchar(10) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `primer_apellido` varchar(45) NOT NULL,
  `segundo_apellido` varchar(45) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `municipio_idmunicipio` bigint NOT NULL,
  PRIMARY KEY (`idciudadano`),
  KEY `FKoms284ih1v8mu0hxgq9nwd4pk` (`municipio_idmunicipio`),
  CONSTRAINT `FKoms284ih1v8mu0hxgq9nwd4pk` FOREIGN KEY (`municipio_idmunicipio`) REFERENCES `municipio` (`idmunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudadano`
--

LOCK TABLES `ciudadano` WRITE;
/*!40000 ALTER TABLE `ciudadano` DISABLE KEYS */;
INSERT INTO `ciudadano` VALUES (2,'enlace@gmail.com',1,'','Enlace','1200','7771076799','$2a$10$z0OcOjCC2vewJW5M1G/AVOR05MI0f5umVvn7x6/wRQvB0a7yYlK3W','Perez','Sanchez','ROLE_ENLACE',2),(3,'presidente@gmail.com',1,'','Presidente','1201','7771579210','$2a$10$gLoVrgoHCbVrD8jvYdrKWONBD7TNp9rtMYY2bCsI8rAAcR15vlKr.','Perez','Sanchez','ROLE_PRESIDENTE',2),(4,'administrador@gmail.com',1,'','administrador','1204','7771646278','$2a$10$p7xaMj.hnttJdFnf5E1cXejDeqvK2QaJIvpGn6VGvMWFYa25TX2Aa','Perez','Sanchez','ROLE_ADMINISTRADOR',6),(5,'enlace2@gmail.com',1,NULL,'Enlace 2','1202','7772648931','$2a$10$OhTbGJYUyVZP6WJVj7UMr.xIAhYbvDTMg6cYBYBa52FjyytjEVJ7O','Perez','Sanchez','ROLE_ENLACE',6);
/*!40000 ALTER TABLE `ciudadano` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insCiudadanoUser` AFTER INSERT ON `ciudadano` FOR EACH ROW BEGIN
    INSERT INTO users(username,enabled,password)
    VALUES (new.username, new.enabled, new.password);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insCiudadanoAuthorities` AFTER INSERT ON `ciudadano` FOR EACH ROW BEGIN
    INSERT INTO authorities(username,authority)
    VALUES (new.username,new.rol);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delCiudadanoAuthorities` AFTER DELETE ON `ciudadano` FOR EACH ROW BEGIN
	DELETE FROM authorities WHERE (`username` = old.username);
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `colonia`
--

DROP TABLE IF EXISTS `colonia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colonia` (
  `idcolonia` bigint NOT NULL AUTO_INCREMENT,
  `codigo_postal` varchar(10) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `ciudadano` varchar(100) NOT NULL,
  `municipio_idmunicipio` bigint NOT NULL,
  PRIMARY KEY (`idcolonia`),
  KEY `FKgxuh6wkythoeds8x7sww8lx1s` (`municipio_idmunicipio`),
  CONSTRAINT `FKgxuh6wkythoeds8x7sww8lx1s` FOREIGN KEY (`municipio_idmunicipio`) REFERENCES `municipio` (`idmunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colonia`
--

LOCK TABLES `colonia` WRITE;
/*!40000 ALTER TABLE `colonia` DISABLE KEYS */;
INSERT INTO `colonia` VALUES (1,'62765','Modesto Rangel','enlace@gmail.com',2),(2,'62765','Campo nuevo','enlace@gmail.com',2),(4,'62765','Tezoyuca','enlace@gmail.com',2),(6,'62493','Acapatzingo','enlace2@gmail.com',6),(7,'62433','Bosques de Chapultepec','enlace2@gmail.com',6),(8,'62210','Chamilpa','enlace2@gmail.com',6),(9,'62070','Chipitlán','enlace2@gmail.com',6),(10,'62350','Teopanzolco','enlace2@gmail.com',6),(13,'62765','Palo escrito','enlace@gmail.com',2);
/*!40000 ALTER TABLE `colonia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `idcomentario` bigint NOT NULL AUTO_INCREMENT,
  `anexo` longblob NOT NULL,
  `comentario` varchar(255) NOT NULL,
  `ciudadano_idciudadano` bigint NOT NULL,
  `incidencia_idincidencia` bigint NOT NULL,
  PRIMARY KEY (`idcomentario`),
  KEY `FKlj0s6fy2uxmjy4kxddljuy3fn` (`ciudadano_idciudadano`),
  KEY `FKss49gobr00kl2uce052o09adu` (`incidencia_idincidencia`),
  CONSTRAINT `FKlj0s6fy2uxmjy4kxddljuy3fn` FOREIGN KEY (`ciudadano_idciudadano`) REFERENCES `ciudadano` (`idciudadano`),
  CONSTRAINT `FKss49gobr00kl2uce052o09adu` FOREIGN KEY (`incidencia_idincidencia`) REFERENCES `incidencia` (`idincidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comite`
--

DROP TABLE IF EXISTS `comite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comite` (
  `idcomite` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `colonia_idcolonia` bigint NOT NULL,
  PRIMARY KEY (`idcomite`),
  KEY `FK89jjfwq9io3ajkwur5lsg5ohm` (`colonia_idcolonia`),
  CONSTRAINT `FK89jjfwq9io3ajkwur5lsg5ohm` FOREIGN KEY (`colonia_idcolonia`) REFERENCES `colonia` (`idcolonia`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comite`
--

LOCK TABLES `comite` WRITE;
/*!40000 ALTER TABLE `comite` DISABLE KEYS */;
INSERT INTO `comite` VALUES (1,'Modesto Rangel 1',1),(2,'Campo nuevo 1',2),(3,'Tezoyuca 1',4),(4,'Acapatzingo 1',6),(5,'Bosques de Chapultepec 1',7),(6,'Chamilpa 1',8),(7,'Chipitlán',9),(8,'Teopanzolco',10);
/*!40000 ALTER TABLE `comite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comite_vecinal`
--

DROP TABLE IF EXISTS `comite_vecinal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comite_vecinal` (
  `idcomite_vecinal` bigint NOT NULL AUTO_INCREMENT,
  `es_presidente` tinyint NOT NULL,
  `ciudadano_idciudadano` bigint NOT NULL,
  `comite_idcomite` bigint NOT NULL,
  PRIMARY KEY (`idcomite_vecinal`),
  KEY `FKsh40vyuua7pwe8h0f2pha2g3` (`ciudadano_idciudadano`),
  KEY `FK791t60674hashdyfny9d5duml` (`comite_idcomite`),
  CONSTRAINT `FK791t60674hashdyfny9d5duml` FOREIGN KEY (`comite_idcomite`) REFERENCES `comite` (`idcomite`),
  CONSTRAINT `FKsh40vyuua7pwe8h0f2pha2g3` FOREIGN KEY (`ciudadano_idciudadano`) REFERENCES `ciudadano` (`idciudadano`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comite_vecinal`
--

LOCK TABLES `comite_vecinal` WRITE;
/*!40000 ALTER TABLE `comite_vecinal` DISABLE KEYS */;
/*!40000 ALTER TABLE `comite_vecinal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidencia`
--

DROP TABLE IF EXISTS `evidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evidencia` (
  `idevidencia` bigint NOT NULL AUTO_INCREMENT,
  `evidencia` longblob NOT NULL,
  `incidencia_idincidencia` bigint NOT NULL,
  PRIMARY KEY (`idevidencia`),
  KEY `FKj290og69w05kn2s2b7npxq4ut` (`incidencia_idincidencia`),
  CONSTRAINT `FKj290og69w05kn2s2b7npxq4ut` FOREIGN KEY (`incidencia_idincidencia`) REFERENCES `incidencia` (`idincidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidencia`
--

LOCK TABLES `evidencia` WRITE;
/*!40000 ALTER TABLE `evidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `evidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidencia`
--

DROP TABLE IF EXISTS `incidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incidencia` (
  `idincidencia` bigint NOT NULL AUTO_INCREMENT,
  `costo` double DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `esta_pagado` tinyint NOT NULL,
  `estado` tinyint NOT NULL,
  `fecha_registro` datetime(6) DEFAULT NULL,
  `categoria_idcategoria` bigint NOT NULL,
  `comite_vecinal_idcomite_vecinal` bigint NOT NULL,
  PRIMARY KEY (`idincidencia`),
  KEY `FK780hhq8xv36lll81etv5g3wqw` (`categoria_idcategoria`),
  KEY `FKaynnrbyqwb9yst4gg017j2dlq` (`comite_vecinal_idcomite_vecinal`),
  CONSTRAINT `FK780hhq8xv36lll81etv5g3wqw` FOREIGN KEY (`categoria_idcategoria`) REFERENCES `categoria` (`idcategoria`),
  CONSTRAINT `FKaynnrbyqwb9yst4gg017j2dlq` FOREIGN KEY (`comite_vecinal_idcomite_vecinal`) REFERENCES `comite_vecinal` (`idcomite_vecinal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidencia`
--

LOCK TABLES `incidencia` WRITE;
/*!40000 ALTER TABLE `incidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `idmunicipio` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  PRIMARY KEY (`idmunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (2,'Emiliano Zapata'),(6,'Cuernavaca'),(9,'Jiutepec'),(14,'Xochitepec');
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('administrador@gmail.com','$2a$10$p7xaMj.hnttJdFnf5E1cXejDeqvK2QaJIvpGn6VGvMWFYa25TX2Aa',1),('dannyo.gonzalez2502@gmail.com','$2a$10$97c5uJhR.L8.nm0HUTHwSOXSrHzgDQSP2sXSHiZX/3HNRMrTindfi',1),('enlace@gmail.com','$2a$10$z0OcOjCC2vewJW5M1G/AVOR05MI0f5umVvn7x6/wRQvB0a7yYlK3W',1),('enlace2@gmail.com','$2a$10$OhTbGJYUyVZP6WJVj7UMr.xIAhYbvDTMg6cYBYBa52FjyytjEVJ7O',1),('presidente@gmail.com','$2a$10$gLoVrgoHCbVrD8jvYdrKWONBD7TNp9rtMYY2bCsI8rAAcR15vlKr.',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sicov'
--

--
-- Dumping routines for database 'sicov'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login`(IN p_username VARCHAR(100), IN p_password VARCHAR(100), OUT acceso int)
BEGIN
	SELECT count(*) INTO acceso FROM users u WHERE u.username = p_username AND u.password = p_password;
	IF acceso = 1 THEN
		INSERT INTO `bitacoraLogin` (`fechaAcceso`, `correoUsuario`) VALUES (now(), p_username);
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-13 19:55:42
