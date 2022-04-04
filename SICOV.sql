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
INSERT INTO `authorities` VALUES ('dannyo.gonzalez2502@gmail.com','ROLE_ADMINISTRADOR');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
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
  `password` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(45) NOT NULL,
  `segundo_apellido` varchar(45) DEFAULT NULL,
  `municipio_idmunicipio` bigint NOT NULL,
  PRIMARY KEY (`idciudadano`),
  KEY `FKoms284ih1v8mu0hxgq9nwd4pk` (`municipio_idmunicipio`),
  CONSTRAINT `FKoms284ih1v8mu0hxgq9nwd4pk` FOREIGN KEY (`municipio_idmunicipio`) REFERENCES `municipio` (`idmunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudadano`
--

LOCK TABLES `ciudadano` WRITE;
/*!40000 ALTER TABLE `ciudadano` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciudadano` ENABLE KEYS */;
UNLOCK TABLES;

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
  `municipio_idmunicipio` bigint NOT NULL,
  PRIMARY KEY (`idcolonia`),
  KEY `FKgxuh6wkythoeds8x7sww8lx1s` (`municipio_idmunicipio`),
  CONSTRAINT `FKgxuh6wkythoeds8x7sww8lx1s` FOREIGN KEY (`municipio_idmunicipio`) REFERENCES `municipio` (`idmunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colonia`
--

LOCK TABLES `colonia` WRITE;
/*!40000 ALTER TABLE `colonia` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comite`
--

LOCK TABLES `comite` WRITE;
/*!40000 ALTER TABLE `comite` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
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
INSERT INTO `users` VALUES ('dannyo.gonzalez2502@gmail.com','$2a$10$97c5uJhR.L8.nm0HUTHwSOXSrHzgDQSP2sXSHiZX/3HNRMrTindfi',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

/*
	Triggers
*/

DROP TRIGGER IF EXISTS `insCiudadanoUser`;
DELIMITER //
  CREATE TRIGGER `insCiudadanoUser` AFTER INSERT ON `ciudadano`
  FOR EACH ROW BEGIN
    INSERT INTO users(username,enabled,password)
    VALUES (new.username, new.enabled, new.password);
    END
//

DROP TRIGGER IF EXISTS `insCiudadanoAuthorities`;
DELIMITER //
  CREATE TRIGGER `insCiudadanoAuthorities` AFTER INSERT ON `ciudadano`
  FOR EACH ROW BEGIN
    INSERT INTO authorities(username,authority)
    VALUES (new.username,'ROLE_ADMINISTRADOR');
    END
//

/*
	Inicio de sesion
*/

DROP TABLE IF EXISTS `bitacoralogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacoralogin` (
  `idControl` int NOT NULL AUTO_INCREMENT,
  `fechaAcceso` datetime NOT NULL,
  `correoUsuario` varchar(45) NOT NULL,
  PRIMARY KEY (`idControl`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP PROCEDURE IF EXISTS `sp_login`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login`(IN p_username VARCHAR(100), IN p_password VARCHAR(100), OUT acceso int)
BEGIN
	SELECT count(*) INTO acceso FROM users u WHERE u.username = p_username AND u.password = p_password;
	IF acceso = 1 THEN
		INSERT INTO `bitacoraLogin` (`fechaAcceso`, `correoUsuario`) VALUES (now(), p_username);
    END IF;
END ;;
DELIMITER ;

call sp_login('jeanhernandez@utez.edu.mx','12345',@acceso);



--
-- Dumping routines for database 'sicov'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-02 21:58:23
