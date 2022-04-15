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
INSERT INTO `authorities` VALUES ('administrador@gmail.com','ROLE_ADMINISTRADOR'),('dannyo.gonzalez2502@gmail.com','ROLE_ADMINISTRADOR'),('enlace@gmail.com','ROLE_ENLACE'),('enlace4@gmail.com','ROLE_ENLACE'),('presidente@gmail.com','ROLE_PRESIDENTE');
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
  `nombre` varchar(120) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (2,'Agua'),(4,'Luz elÃ©ctrica');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudadano`
--

LOCK TABLES `ciudadano` WRITE;
/*!40000 ALTER TABLE `ciudadano` DISABLE KEYS */;
INSERT INTO `ciudadano` VALUES (2,'enlace@gmail.com',1,'','Enlace','1200','7771076799','$2a$10$qRUxIA5dGpGHvusX8Sk8iOU.kuVFAr0TGwGZOp0LTmd6ebls5oZBC','Perez','','ROLE_ENLACE',2),(3,'presidente@gmail.com',1,'','Presidente','1201','7771579210','$2a$10$gLoVrgoHCbVrD8jvYdrKWONBD7TNp9rtMYY2bCsI8rAAcR15vlKr.','Perez','Sanchez','ROLE_PRESIDENTE',2),(4,'administrador@gmail.com',1,'','administrador','1204','7771646278','$2a$10$p7xaMj.hnttJdFnf5E1cXejDeqvK2QaJIvpGn6VGvMWFYa25TX2Aa','Perez','Sanchez','ROLE_ADMINISTRADOR',6),(15,'enlace4@gmail.com',1,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\á\0¼Exif\0\0II*\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0V\0\0\0\0\0\0\0^\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0i‡\0\0\0\0f\0\0\0\0\0\0\08c\0\0\è\0\08c\0\0\è\0\0\0\0\0\0\0\00210‘\0\0\0\0\0\0 \0\0\0\00100 \0\0\0\0ÿÿ\0\0 \0\0\0\0ð\0\0 \0\0\0\0x\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n\n\r\r#%$\"\"!&+7/&)4)!\"0A149;>>>%.DIC<H7=>;ÿ\Û\0C\n\r;(\"(;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ÿ\Â\0xð\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0ü¿\Ô\í$D\Ë9ˆR&fºP…\"\ê«<\âE¹\ç˜L’-˜–Š¡iS9iH™\"%X€l“[ Hd¥$€\0\0\0€\0\0\0\0\n\0 \0))\0\0ª\Ýmµ$‘umL¦`HK«uE¥¶\É)%µHV·B­«jd.‚@\Ï93.¨™—T\0.­\Ñ2Fq&b ‘feÐª\ÉE\"BH\0)\rn‹P˜(LÀ€\0@\n@\0\0\0\0\0\n\0\0\0¬@\0\0*ª®–\Ýn\É&%Õƒ2\0H´­n\ÝT].¬Ì-H˜‚\î\ÒE\Ø[E«»h!BB3‰3.ªL\åj\ê\É&Vµ\Ò\ÝQ1$L\Ì\âLK«3&JVÔ‰™2Ò&R@\0[·I™I)\0€\0@ \0€\0\0\0‚\0P@PR\0\0UP’\0ª«[]P3ˆ‹P™]) H­º\è-\Ò\ê\Ì\É„Œ\âR\î Zº@[u\Ò\ëH³2ê¤™H™“2\î¢I2º[Q{\ÓDL\ÉLó™\ç\Ý\É\0]]õ²3\Êg”µ	„\0\0¶\ÚT‰˜\0\0\0€\0\0\0\0\0€\0\0«h’\0ª‰ \0\n-VµZ$\Îº	DA\n\Ö\í\Ò\ê¢\è‰˜5»\0‹µ´Z»·A2´\ÊfB\ÚI”Ä‘®–fH\ßJ¢\É,\Ï4Ì™´Y™\"Ö·T3\ÎL‚…«l’D\Ì\n«$\0[I \0\0\0\0 €\0\r/It´ †S6`\0@\0)\04±\0\0\n¶¢H\0«ª•iI\"\êÚ‘HZ\ÌR\Ýl[PµmU¡!“K¢\ÉZÝ’U\×J«R-2™‹mL\Ì\ä’et™“-t·T\0œ\ç¢L\åh]\ÛS38 !JºL’H\0\0\0\0)\0\0\0\0\0.\Ý=\Òô]\0\0\0žN^\n€€\0AH\0\0-H\0\0\0¶‚	\0[HP¤-µuT…Zº¶•2E\Ø\"@D«­U+Z¹\Ì&%\Õ$Ä‘#8”.›\é \Z\"D\Ì\Ï8.ˆ\Ï9t[­Û¦8\æe\0\È(D@\0\0\0\0)\0\0\0\0\0®¿Fk¨\0\0\0\0Œðrð\ÐE²@\0\0\0Q\0µ@!\nZ\Ø!«­\ÛR-H™š\Ý$–Š­iwmª\×K1$#8–„&$\Ë9ˆ™–š»\éBm’g8–®¬\Êb4Ö­\ÝÖ®s3\Ë9\ÉH\0\0@ \0 €\0\0\0€=s~°\0\0\0\0sñ1\æ ZZ‰ \n\0\0( \0\ÕRH¶tU\ÕÖ­Ú¬H™š\Ý’U¶\íum\rõ\ÔÌ™I&@*fL3˜‰˜­n\Ý[Y\ç.—vežrH7»˜\Ï9tÖ­\ÕU®|s0(’\0\0H\0\0\0\0\"ôuú2Ò€\0\0.?6²HB\Ú$€\0\0\0\0¤\0(µV„„I-¡BÒµ»­\Õ\"B…©’ ]]lÕµ2\ß[\"fHB‚$gžD\Êf]\ÝhUgœºkw8“1jÌ‘jè¶ƒ8’\0D \0\0\n\0\0\0\0\0\0\0\0:{æ»…\0\0\0ˆ\0ŒyXòP\0@\0\0\0\0\0R€UE¨’\0´UR\î\Ý.ª$ˆ¶´\nDÌ¶\Ì\Åkv\Ò\ÛR5»t‘3$ 	™2’H\ZÐ²… «$\Î$\ÈZ´$HPI  \0\0\0\0\0\0\0\0\0\0\0£¯ÑA”\0  qù´ \0…!@\0\0\0\0 \0\0\nª\0\Ò\Ú+].·d ˆWB\Ú\nµ­\ÕL¤“3$Z˜’$KH#[Im+<³œ…¡ !@Z™’\0\0\0\0\0\0\0\0\0\0\0\Ó\Ù5\éŸ3ŸŽ«~©¿Z\Ð\æÇ‰ž5]}òõ sñ³Â„\0€€@\0\0\0@\0\0P@\0\0--µ»®•H… )\0*ÕµJÖ­\Òd&d‰D‰‘$Kª$ˆT„*fL ’£T	˜\0\0\0\0\0\0\0\0\0\0\0uúR\Ð\Ï?\0^“¯\Ñ]9ùñ\ÐN¿FPg›Ÿ‚€\0\0\0 \0\0\0\0P\0\0\0\0\0\0´¶Õ«»wP…)\0tš¶®¨™“)™m‰m™’3´)\n™“2et™HBHZ¢\Ý&$\0\0\0\0\0\0\0\0\0\0\0\rz\'OXL9|ú\0õk´Ç’€\0×¦o\Ô\åó\ë \0\0\0\0\0\0\0P@U\0\n¤in´\×MI$]-·IRiV\ÛKm‹d™\å ‹¥\\\âIVÐ¤”\ÎS2d… D\0(U’\0€\0\0\0\0\0\0\0\0\0\0§¶^¡\ÏÆœh\0\0\0\0uúyY\á@\0\0\0\0\0\0\0\0‚\0PB\É\Ôª\Ý5\Ò\ÝY–q‘m\Ö\ê¦bmº*ÚªwRc”™³,\æH@\Z\Ñj‘$$˜!Q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®¾ø©—?\0\0\0\0\0ý“]<˜òP\0\0\0\0\0\0\0\0\0€…´–\n¤\0[u\Ò\ë¥F9d]5»\"@¢®­«ª (¡žrfInˆ\Î\"\"!WV\Õ\ÕIœ$šÕ„Ä™ K\0\0\0\0\0\0\0\0\0\0\0\0\0\0z\Íú\Ã<óP\0\0\0\0\0k¼× \Ï\Ã@\0\0\0\0\0\0\0\0\0\0\0¡mPB„m\×EµY\ç$].ª$–Š.šÝ¶\Ý$\0-g2`.™\Ä\Î% t)\È)\0\0@P@\0\0\0\0\0\0\0\0\0\0k\Ó5\Ø1\åNT\0\0\0\0\0¬ß¤?d\0\0\0\0\0\0\0\0\0´¤‘m$UJ´­j\Ì\Ì\å­.®stº]Z4Bª$‚&`€f*@@\0ˆ\0\0\0\0\0\0\0\0\0\0\0\0\0õË°Ç’\Ì\0¦Œ\0\0>\ë>I\È¤×¤|\éÊ€\0\0\0\0\0\0\0\0\0 \0\0\0@… *\ÐPE\ÑhE¥EP´.\êq-)) ¶’e3$Z™4˜!d€\0\0\0¤\0\0\0 \0\0\0\0\0\0\0\0\0¯Tºù¬À}\ÃõÑ£\Î|³óµ\ä>ô~„õ”ü\Í~\\´\×`\âœh\0\0\0\0\0\0\0\0\0\n\0\0ª²@µ$-ª\è-L®­¥H» !V\Ó[²3‘\"bH\Ö\ê¦&yÆ”\ÎV³˜€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^\Ó]ƒ<•¨?G\É\Ì\ìh¥?#_\0\ZôK\Ðy\'\n\0\0\0\0\0\0\0\0\0\0V´I\0\ÒBª…«ªA2º]R¤’-\Ö\í©”Ì» Z\ß]I&Y\ç$—TI*Œ\ç9\æº	‘$\0\0\0\0\0B€\0 \0\0\0\0\0\0\0\0\04ß¦\"F|\Ôz\ßF\È@\nRœÀW0o\Õx\':\0\0\0\0\0\0\0\0( \0¬±\0\ÚBª\émº	‰œ†¶- «j¦d\Ì\Ö\édƒ¯§s2eœI™mHI™ž`\" \0€‚© \0€\0\0\0\0\0\0\0\0\0\0\rz`’s£\ë°\0)£‘øºð\î^\ÅŸ5@\0\0\0\0\0\0\0\0\0\0\0¤\0«m\Ð+[¶\Ñ3&d\ÊKm«ª\0’gœ»¶¤þ½\ça$)*’y\É$\É\n™€\0€€”€€\0\0\0\0\0\0\0\0\0\0\0\Ò^¤ð¨@ýdzJ|\ãòU\ç\0\×x\Ðg\Ï@\0\0\0\0\0\0\0\0\0\0\0\0@\nº¶­-º]QœI˜j\ê\ÝP3‹Bet\í\ë\ÞyÉ’\"ˆ\n™LL\æ\"@™€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0k´R&S•G\Ú>\äSó\ÕñÀs]J<LP\0\0\0\0\0\0\0\0\0\0@\0j\ê…\rj\ëuX\å…Z¶…Z‰%¶A&b\ÞÞ­Ì¤Œ¢\"EÒ™L³Œ L¤€ \0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0zÆ€9¦(\0\0\0´´¡\"p \0\0\0\0\0\0\0\0\0\0€\0U«º€­n\ÝVQ$\"Ô‹WvÐ‰%´I3ˆ;úúH™\Ìev33˜‰	$\0€\0 )\0\0\0@\0\0\0\0\0\0\0\0\0\0*õ€	Î²\0\0\0½#E9 \0\0\0\0\0\0\0\0\0\0¤\0\0\0Z»¨U]t²J²H3)®” 	 &\";ûzI&V†q$LÈ…˜‚BI\0\0 \0\0\0\0P\0\0\0\0\0\0\0\0\0\0\0—d0f€\0\n½`\ne9P\0\0\0\0\0\0\0\0\0\0\n@\0\0\0š¢Ö·U\"\Ò$kaœEH´RH™’=Þ™\Ìd«¦q&Hºg<\à$ˆ\0\0 \0\0\0\0P\0\0\0\0\0\0\0\0\0\0\0\é\0˜3@\0^±@\"r \0\0\0\0\0\0 \0\0\0\0\0\0\0­ªµ­\Ø\nIwn¬Ì5«3$€¶€\ÎdË¿·¤Ä’[T‰™2T\Ì\Ï9!H’\0€\0\0\0@ \0;œ\0\0\0\0\0\0\0\0\0\0«\Ò)\0L˜ \Ö(9T\0\0\0\0\0\0\0€\0P@HA\0ij­].­¶fg0kv\ÚI”5«33™@¶\è&dÃ·³s$(	™2’gœ‘$²©BH€€\0P\0\0€\0@ ô\Ðó3\0\0\0\0\0\0\0¤h\È)@\00fÝ®¬\Ö@D\Åd€\0\0\0\0\0\0€€@H\0)\0i«t@\ßZ¬\âD´¥ A	Yµn\Ö\Ü\æLNÞ¾„™I#8™\Äf@Qh’\0€\0\n\0 \0\0@ \ç\ëO\Ïó\è>9ò\0\0\0\0\0\0æº€\0\0Z¯Ž^‚\Ýñ\ç\é\áš\0ž\0\0\0\0\0\0\0+q€\0€ \0B•w-·EŠP\0H\0\0€–´$L\ÎÞ­‰’\"DÌ‘1&$\0 €\0(\0\0AA±ú¨\âxŽ\'\Ö!ò”\0\0\0\0\0^ˆ \0\0\0§6y=8l™¹ô÷óøûe\n³Â€\0\0\0\0\0\Øô®|S\ç€\0«£R\ÓKJP@\0\0€\0\0s¢³:ú¶R	B3‰œI˜\0\0\0€iKh)J´-\0¡ú/\é–H\ä\ë>Gµ2H•@B$2\Êf\Ý\Ë\Ô\0\0].\Þ\Þ7\É\âô\Ö\âfóõz8ù½y™L™@ùª\0\0\0\0\0\Øûg\Ð)\ã<g\Õ?+§=\Å]tPR\0\0\0\0\0H\0\0\0\ãC¯«v\Ð&fq&C<\æq&`\0)VÆŠº(\0ª(\0 \0´‡\Ýñ^™B\0|Š\ãõ%\Ó<ˆ\0\0\n€ˆ  Zi2\Ïó\ßW¾mlšc]yòô\ÍuL‘\"pgd\0\0\0\0SSZ~‹•ô\ã÷žŒ_L{°üÏªyv\0\0\0\0\0\0\0\"\0\0\0\0\\k·«£D\"I!”“\äÄ˜*H.‹ZP\0\0\0´ €P\Ð\nO\Êõò¢‘ñG_£&\0\0\0\0h	˜g’rNt¹wÎ¡\ÏS† i®³]—h\0Fl€€•iW£I÷þf¨ª\Ñ\æ\Üø \0\0\0\0\0\0U\nš™\"fL¢U!T@^þ¾Š™\nFq1\ÎNrHÑ©t\0(\0\0\0J\0)\n@(¤\0@\Ôzù»\åƒ\Å\èœ<–\í\Ó\ß&‘J\n´$!)“	›9€\0\0\0\0\0\Òôš\è½\r\0\0\0\0½\Z\èÇ™õ¼7\Ò¢ž^“\ãz@\0\0\0T*¨\0\0¶\Ôgbg -Z®¾­\Ûsˆ „I1\Ï2e \0\0 \0\0\0«@U\0@\0*\Ä\0\07\ì™\àºL¦f€\0\0ñL\0\0\0\0\0\0\0\0\0\0õ.¢” \0\ížLx\ï¬ú\Ä)M?´ù\ÝÀ\0UP€\0\0\0\ÅJ¤s\Ì\É\è¤HµuzwÕ©0\ç9™\0\0\0\n\0\0-Ò’€\0$\0\0\05\Ú4™L&\Ú\0\0\Ã<@\0\0\0\0\0\0\0\0\0z5\Ü\0‚À©‚®\Ó,x®½\Øz9\Òq\Û\ÍÑ!B€*€\0\0\0\0\0	\Í0[E©3‰!\è&Q-·Nµ\"\Öq.®f$€\0\0\0(\n5h¤\0\0\0\0R\0 \0\0¤‘0ež5•\è\×P\09\0\0¤\0\0\0\0\0\0\0\0^…\Ø\0(RL$—¢\ívVº\Ìy4”(Z (\0\0\0\0\0\0\0g’sH\Ö\ËQ3\È*Ô€…k¥\ßKœÊ³3,¬\0\0\0\0*\êÚ´Q@\0\0\0\0R\0 \0\0\0’\'0Z\ìº\03\Í9\0ô]³À\0\0\0\0\0\0/D\æ\0o\ÒPƒS’ô—ª\ív»\"q¥R¨\0\0\0\0\0\0\0\0	†<\ë¤\ÊÒ‘ T«M]iœ	$n\0\0\0un–\Ð\0d\0\0\0	\0 \0\0\0\0™g\0¶»3\Ét\Ï\0]µ\Ø3\Í9\0\0\0\0\0\0\Û~†x§ \0]µ\èI–8{K\Ñv²¥J \0\0\0\0\0\0\0$Ç• «I–X(R…Ò«KS)˜\ÞT\0\0m\Ú\Ú\0\0@\0\0 \0R\0 \0\0\0#>r\0\n@\0¶»\0Vy\' \0\0\0\0Ñ®\Åù\Ó\0\0\×e\ÙSð\0¿B\è\n\0R¨\0\0\0\0\0\0\0\0sóI€\ÚHURiJ£UE@\0\î\ëB€\0\0@\0\0 \0R\0 \0\0\0\0$g\Î@\0\0M÷(2Ïœ\0\0\0\0mz\0c\Îd\0P\0]·\è\0”(\0\0\0\0\0\0\0<X\ã\0\0Qh	%YZkAuT&d\Ìt€\0‰Š„@E¤R­].\ÊJ\0\0\0\"\0 \0\0\0\0\0L³À€\0[ô\0b\0\0\0\0«]€PHÇœ\È\0\0õo° \0”(\0\0\0\0\0\0\03k$B‹@HµV…\Õ\Ö\ì’De`˜¬‹$\0\0-¤\0\n\Ö\×k±@\0€H\0€\0\0\0\0\àd\0\n\×u\Ð\0\0Çœ\È\0\0\0®\ë\Ð\0ó™\0\0V»5\ÐP\0\0)B€\0\0\0\0\0\0\Ï\Ë \0\0,J-U\Òe­µ½+8Ì¹›0*\0¥¡$€\0Z\è\×BŠ \0b\0€\0\0\0\0\0#<S\0½ \0\03\Å9€\0\0\0õ\0\0#<\0\Û]ÖŠ\0\0P\0\0\0\0\0\0\01\Âg\0\0…TZmk¥º¶±\Ï2\ä3Y²¤I\0\0[UjC(€\0\0£]V\ÐH\0X€ \0\0\0\0\0\0g’r\rw]€\0\0\'6x€\0\0\0i¿H\0\0\0g‚s+]š\è(\0\0\0R…\0\0\0\0\0\0\0.~X\0\0\0¤U¬-»kwZ·n|³$­d‰’€I \0ª·I’\0\0\0!Z\ì\×@€\0R\0 \0\0\0\0\0\0	“+\Ð\0\0\0&Yó€\0\0\0½Z\ì\0\0\0 \Î\Z\Ø\0\0\0)B€\0\0\0\0\0\02fH€´T–Ð €­n\Ú\×Kt\Ç(-²I”’d¤LÀ,ª¤@\0\0\0»k¹@\n\0€\0\0\0\0\0\0\0\0\0\0ó\0\0\0\0×¡v\0\0HR\0\0\0)B€\0\0\0\0\0\0q“Š\0U‰ih@HµWDH¥Ñ«j\êªb[n“!œfdI$B\ê„I\0\0\0\0\n\×e\è© \0\0\0\0\0\0\0\0\0\0\0	–|\à\0\0\07\ê(\0\0 (\0\0\0\0\0¥\n\0\0\0\0\0\019ù€\0(Õº HB®–\Ù\"µV®\è\Ï9­Û°˜L\È\"f]&R‚B\Ñd€\0\0\0\0\ê\×e\nH\0€\0\0\0\0\0\0\0\0\0\0,ð \0\0\0v\ç\×7OW)\Ó \n\0P\0\0\0\0AT\0\0\0\0\0\0\0œü‰\0\0·]dwRH\Ò[£8š\éu«$™!RI˜Y\"2@A ¤\0\0\0\0\0m¾\ël@\0\0\0\0\0\0\0\0\0\0ó\0\0\07®{ò\ïz\é™\é\æ@\0\0\0\0\0\0R…\0\0\0\0\0\0\0\Ç	ž@†·nè™–­¢f]Y\n´¢\Ú\Î&º[R\0µ2’H¤‘lÌ˜D\0\0 \0\0\0­w]€\0\0\0\0\0\0\0\0\0\0ñN`\0\Ío=Œûs\ËÓ‡ƒ£&z±\ê…\0\0\0\0\0\0\0)B€\0\0\0\0\0\0g”\Ï€\0V·T‹«t¶¤«hT\Êf+Z¨\Æ3­[»2¶\é2’LE¶¤™\Âf\0\0\0 R\0\0®\Ë\Ô\0\0\0\0\0\0\0\0\0\0ðf‰,¦z&å§/6\à~•\Õ\0\0\0\0\0\0AT\0\0\0\0\0\0bsó¬@\0j\êÈº]]j\ÈI#[-\ç&eÝ¥\Õ\Ç,\Ý]n\É¶\Ô&fyËª©‰2DAH\0\0\0h\0ôk±H\0\0\0\0\0\0\0\0\0\Ë\Ö1‹g{c>\ÜòôecË·6ªy·žz\0/FûŠ\0\0\0\0\0\0¡@\0\0\0\0\039ù@\0\0Rµ«\"\Õ\Õ\Öè™“2\î\Ûfd€­\\ó\ÍÝ¶tS,\å1‘	ˆRB\Â\Ù \0\0\0´[¤‰˜\0\04ß ¤\0\0\0\0\0AA\0\rr\Ô\á¾ùÇ¯Í­yw­\ÌÛŽ\Z\0\0\0\Ó\Ö(\0lÜ»“F”DÅ¼k´*€\0\0\0\0\0F<²@‘\0€¡j\ê‹Z\Ýj¢I3-£9–Š«WVb-µt\ZÝ‘33‰3&Bd¤’\0\0\0\0º¶¦\0\0kº\ì€\0\0¨ô\Ç|»\ÇH\Ôh±B S1Ó“\ä\î|\ÊG«p\Ø\0\0\0ß»\Ño£.ñ\ß.\ÙuŽ±J\r\Z4h\Ôh\å^M<3«Ç¢€\0\0\0\0$Ç•\"\Û$´´’\0Û¥ÕºktL¤’D	•\ÕU.­\Ó¦·d–Û¥\ÒD\Ã9Œ\É\0HBjD\0¡H*\Ú&`\0\0\0\×u\è\0\05\Ü=\Ø{³}™zr¤LVL™2B„!\á>œ€\0\0\0Ò°½ŠR€AM\Z4l\ÜR”É·\Â\í>WVm\0\0\0\0	\'?)’­²K«tB$ T]5«wDÌ™ˆZª(«t\Ç®•\n@Ló‚è¶’I”ÁWI	$\0\0Z\0@€\0\0®\Ë\Ô\0ûœŸW›Ý‹¨\0\0!ŠÁ“&L!\0!G\ç\ìó\0\0\0ûQô@  ¥)£gC¤h µO.Ÿ‡õÅ \0\0\0L\Î~R€´¶d© TkH[n“)˜5\Ò\Ý[PfL®\îµq\Ë7T)IE\Ò\Ñn“2e\"Ð™ˆ\0P¢H-¤\0\0\0/F»\Ö?¡ù,2f2\0\0†LW3&W$\0„!\Í>yÀ\0Ÿn=eZPAJR”Ù³©\Ö5T\Ð(4SG\á}sÇº\0\0\0©\Í\Ï\Ï\0E¡‘ (Õµj¶¶\Ý[¤„¢³\Î]Y™m2D’d… ™\riH ¨ZZ&`\0\0\0MzS\Ýù\î2f2\0 \0ÁÊ¼§2\0!ƒ‘ñk\0\0¥óE(((*\ÓGC±è–´R”¥4l\Ñø\ÏLøýh\0\0y3È‰ \0\0- \"X‹KE\Ð 	’®–\Ýj¨\rt¨\Î$‘-\ÐI*\É3‰ V„-L\ÉB@[BE-B¦`\0\0\0_[¬þ‡\Â\à\æ¼Ì™2d‘\0\0\Ï*y+€0|îŽ±2ù \0v>œl¦ŠR”ƒF×±\ëŽ\Å5T\ÑJSFŽ‡D\ì~\Ôøý(\0#< ‰ «,@\0[T\0U¡iªŒ\âZP\Ö\í\Õ®­¬ó’&b­²KS,\æ\"\é2º¶¤-¤L¤ 	&µU2\0	 \0\0\0\0¡\Õû|>žŽkƒ&L\É @\0 9žJò\'˜ðtxzD½ò\á†D\î;ñôš>Ÿ+JŽ“—pôñ¿K•öF‹Z)¢”\ÑM›;\'c\æô<õ9¨\0<˜\âª\0ˆ‹i!I\Ñt‘E	Pºª’E¶\é#}-¶%µV¦fp˜@!$\Ë[ª‘At,’bg €5mH@R$€\0€\0\0\0º¾þ§\ëø\ßN\\\Ì\\™!“$ˆ@@x,ü—yšK$	fL©\×K\\´hO¥\Êúr\å\Öq\ì\á\éœû.å¦žœ>¯‹_cÁ{f\ÓFŠhÑ³¢v7_”\ìü—vT\0$c\Ï&\0H€£VÔ„²$\rl$L«JºŠ\×KmR­]Y™œ&$[d–\Ñ3‹¥\Õ@\n@’L³ˆ„–Û¤„’(  \0\0\0\0½;¿E\Éú¾OF\\\Ì\\É’!\"\0|N“ó]`K ‰I\"\ÓKM-6Ö\Z].\ãK¥\Ôj\ÝË§Cô_\'_g\ç\ëF\Z:\'R\×À\êüŸgT\0x\Ìq\0\0¶\É\0¶Ý©œ­HºZ\éfS39WB\Ý¶%[¦·UmU©–q3ˆ‰˜¤]P«Y\ÄVÒ$ 8“)‰mRH\0\0\0@\0\0\0\04\ßvôûüß§\äú`Á…Á’!’ˆB“\í>^\àD”‰ZŠ´«¢®Šº)WQµ\Ò\èÔ»·K¹töp~\ãó½4m4n¾f\ß£\àuq´\0q3\çH\0\0-\"j\Ý)œ€\ÐV·mgd$])wm·kS%oziiE˜“38“,\æQVÐ …]\0\"H\Î$ÀD\Z\ÕR$LÀ\0\0\0\0\0\0\0Vû/@ú™~§‹\î\á˜\æ`É•É’\É\Ç\â;\Ï D•«Jº*è«¢•u].—F\×K¹t\í\Íýó[\'«\áô|NŽ… 31Á9‚­A\Û$…µWKS ©º\n]\ÛlÌ™’$]-kum¥\rn\ÝQE[s™1$LL\âBÐ¶\Ý&B\èµ$‰™mI”’d‰ WZA”’@\0\0\0\0 \0\0½\î[ONg\ß\æû8}<70d\Ê\ä„2~´ùÚ‘¢­*è«¢®ŠU\Ômtº]š].\å­\áö~þW+@\0LLqN@E²@- ]ª¶”[S1S9])wm·d[uÒ¨\"E\Ò\Ô\ÊIžs8‚\Û$\Z\éQ\"\è\ÉC<\â•2fg$ˆ´´kV$Ä\0\0\0\0HR\0\0+~†ºTT÷aô#Ù—£-–1\\×|<6H@R®Šº4´«£KMF—K©wZ].£I\Êòù[\011\Å9\0\n–„\0-*B\0PK«jFµT) gfZ»¨ºk¦­n\É.\ê&%\ÕT\Ì38 e®”Hµ\"\ÒÙ‰\"Ùžr…¡2’\0-H\0\0\0P\0\0€\è\ßu\Õ\0)\0(L\Ìó	dI®·<\å¶–]¯E\è¶4»*\î]V—R\è\Ó-cÅ y\ÌñN`\0\n[i¤\ÈZµ2€B‚j\ÛvTZ$™*\ÚA¾•j­«j@™3‰0»	™uP\0»[FqœÉ˜€$(ZHU\nI\0 \0\0P¶¤€\0®\Íu]P\0\0\0&\"®…2F·d‚\Ú	 ]—¢ô.—F—Qn<W>jP&Y\å\'$„ \0.­«ªIƒA2\0)P\Ö\×Uv\Ô\ÊE 3ˆMoBI­Ð«m­n\ÝQ$™	$\Ë8ˆR$‚ê²’-\×E\Õe$˜“%R&JKl’e3‹h€\0\nÚ’\0 \0\0£]Z\Ùh\0\0\0\0\0\0\0\0\0n^\Ó] D\çs\ç©DÌœ\Ù\ä˜\0\0PÛ¥\Ý@™’-	•¥H\nºkt][£)\0D˜ƒ[Ô[u´„^—}-\ÝD\Ì)$\ÊfL®’$¶\Ý$#]-©2BL\áœEj ‰mn£8™\Ä\Ú&b\0\0\n±\0\0\0\0\n½\Z\Ú\î\Ý\0\0\0\0\0\0\0\0¡)‰2˜L‚\0P\0 (\0ª·kS)˜.¨‘t™\0€­mum²K«jD’@\Ö\ê‹µ\ÕE\Ó]-´L\É\Öq3ˆ.«2DÌ‘­Ù”“]-Q$&d‰˜‹C9­–¤˜g1VªÔ‰˜€€‚\0\0\0\0\0\0®—K²­4\Ð€\0I!”†S)’\0P@B\Û$\nR\0¶\Ý$\"H.‹Y(Z‘$°\Õ\Ö\Ë@µmE³1“Mn\ÌÁ2º]\Öb\Ýõ«mI&B\Öq&V†sH‘t˜Ö­\Ð\0$L\Ì\â!T\ÎV…Ý¦s&H$¶\ÔÌ€\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\n\0\0ªA\0(\0- €U@ ‹nš\Õ¥\ÕU«Y\É\Z\Ùl\Ì·fbµ½kamVqÌ˜—vDÄŒ\æ,¶\ëtL\Ì\à«H\Î%\Ñnµn˜\ã™PH\0\0 €\0\0\0\0\0\0\0\0\0\0\0\0\0A\0\0\0R­³0\0€ \0T’\n@£V\ÐD\0Ö·`-kv\ê\ÌE	–ºY$\È!\n¯K¾”[n\Ù\ÂfL¦%\Ò˜’$’‹m]\Ð\ÑÄ™‹m#8—K«umH\Ï9œA$E \0\0\0\0\0\0\0\0\0€\0\0\0\0\0\0¤\0\0Vš¨™€ ( \0 ‚AZ«B\é2‘hµi«­.­\ÕS(ˆ™]¨\\\æ !J\×K­[J»³)‰$™)fL¤ˆ™‹uº«YÄ¶Ý¦\Ì@\Ö\ì“<\åÕº[Ukfs\0ˆ„\0\0@ \0\0\0\0\0P@\0\0\0\0\0\0\0\0\0UµBf\0\0@E E´+Z5P’e3\Z´h.­/K­P’DiVÙ™!mt·V\Ô\Ëÿ\Ä\0,\0\0\0\0\0\0\0\0 0@`pP!1#\"34ÿ\Ú\0\0þ±¨®Â¸W\n\áTUxR¹•\á\Î#Á\àtÁ£\ÃÃ¢>\Z	\ßÅ¦\Õ\ïAði:A\ÞO$ø$r¤N±\àÁ¼ôg\Ãcyð8\Þzà¡¼ô#\Â ¸®<‰W\Ä\äÔ±>\î\Zƒ6vg-kY¹ð\Äõ.Ì…\ê|Iq\Ó\é\ÊqQcCý²7À\Ãyß²%ÿ\0#‘\r^N)õA1‚VH\Ù#\äO3`ŠG™d\Ô|…™\í\Ü\ÝRJ\ÈY•”\ì—øW1ø\æ)ãº2sc\ÇSO$\ïð»\\Za\Úoj‹*”¹PÂ§\Ú2Iýy2\'=¾\Ã\âõ\Ý}\'l÷#…0Nc™\á˜cõec[]™3f=Ž\\@‡\0\á6\ÐpP\Ü\ZH-=o¸;V\'˜¤k\Ã\Úø\Øó&# õ`’Õ¬\Èú\è\Ç+\Ý\Æýòÿ\0“:¦C#×²™	”xÕ–\È\â<ŠT«\îë ˆŸNÕ«V­dŸ\â­©R¥J•*T« \Æÿ\0nƒÿ\07QN•\Ñb\Æ\Í\Ü@\æ\Ä\Åò2M\'Fc}*U\ÚQ¸¹šr_rƒ}*T©V›Mqk¥½­/t·^º\è)DÁ-Zx—!\ì\Ã`LÇ‰Žâ¡‘ ’nÔŽv\ÕÞ‰$ô\ÚM‘\ÔZµz!bþ*ˆ\'Iø\ßjù4©R¥J´\ÒƒjÕ«V­d¸zºû°\â\ÔÜ‚½\Ã\Èjy/\è\íZµj\ÕôV¯¡%c›‹NCÀ¶\ë\îŽ\è$\àvœ‡´®¾\Ù\ã¸\É\ËG®\Å\î\Z\ä^\çxNü;}‹]˜|7\\¡¾û»4}™úkV­_a†»:\Õýð\è+´¯\ë\Ï\ß³¿­=Uv\Íý¸\æW–o\ì\àøqs‘cþ¸÷P\ß;Ó•-÷\'øQxú\Ã\ÜÔ«@\ÎüC\á\ZUº·ŒG0\ãj\âÄ‰I’$^ô\Ø\Ä÷—»@ð`Gð£þ5\ï@O®S\Z^d¹\Ý—¥\"öó/k:ö“¯i½¤\è\ã\Ìc‡w’†,\îCg\ä6d«\ã¾0/Žbøø—°‰{W±…{W²…{(W·h\â\Ê\ný/]:W8sÜ†,¥¡€Âˆ!B(\ÂürŒQ¹;\Éû1I‰4]\Ê)˜YL\ÙnM\Ù\Ð\ÜhX¿]\ØÌ•I¢<\Èq“cc5_A.$3)¶t¬DžßƒfºV3gÀ\Ä\Öt\Ïk^Ù¡1H˜1\Ã4Úµ}L\"h{z6z’U]jµjÕ«\Þ\à%‹\Óv°,\ÃŒt\0rò\Ù\é\åv\î\Îgw\n¥\\\ÎŒi\ÌpGð­Z½ö­Zxk›\Â\íPGÂ­Zµj\ÕòƒI@W&•*[PVo&ûSgd3,\È\Ò*U\Í,iN\Æ:µ~•\ï´ù\Ý\ÄÉ¸”\Ì\ân˜\Û\Ä\ëWÊ½\ím¦²¹t€A«j›\Ï\í\ì\\É±]‹´`\ÊEª•*T©W0±®N\Æ	\Ñ9¨©ß½²–£W¡ƒ…¨¸4:R\åœ\'I{BõÚ„\íM{\\™¹4©\0ƒPj\Í\Ú\á¶GºY5_l\Ú\Å\Ú\Ó@ Êƒ(ªT©R¥J¹“±­a6uß¨W¨\åû\ß\í·H\ÌÀŒ\è\È\çidòF£\Ï	lƒM*TƒPj%±·3l¢KŽ«\íÀH8\ÛbX\Ô0e\ÕJ•*T©R¥Jµ\í)*>pür\Ø÷0\âfzÎ­Ô©R¤\ZœYr6\ÔLYSd»U÷\0$}±<Jül•Â©R¥J•*T©R¥[öƒ¯\'ª\Ä5•J•.A¢]§‰\n›mL\å$²L\íW\ÜW¿h\ä\ã¬}¯*\áÂ©R¥J•*T©R¥™ÿ\0_UûøQ\á`—j\âÄ¥\Û3¹I4“E÷%\è‹\"h[n@£\ÚØ’&\ÉˆµR¥J•*T©g·‡3ªc¸6Ù™\êId”òoº/M\ÒfnLi»c(&\í²†Ú…|\Æ2ùlUò\Ø\È\íh\Ú\ìYy\æ^¨òm_\ÓÅ¾šº3®\Õ÷}ókM*\è\É\Õ}\éjþ‚\Õ\éµ}ójúûW\àV­Z¾‚Õ«V­_õoÿ\Ä\0#\0\0\0\0\0\0\0\0\0\0\0pP !0`1€Àÿ\Ú\0?þ-xÎ—\Ý\éJR”¥úö\Ñq–=\Êý¡–e¦W\ä\\1™i¤\ÊQ±\éºR÷ˆBq	¬®œºvù°»/Á~$2SN\Ó-/Š¢8¥\Ò},i¯F(ôŠ÷:Q’œb¸d\'Jb\á\Ô6Q2\é\Û\ç—P\Ý@Ÿ‘e¥\'\Ã4\Ä\æÏÿ\Ä\0+\0\0\0\0\0\0 0@!1PAQ2\"`BaRÿ\Ú\0?°\ä59\r‘þb8Sqf6\Í%J›O4ÿ\0†4œ`\ÒP¼¡t©².56”(F…QCÀ\á†x¤!y©¸a4\Ô^hQ¨¸P£þ^i*r©Sq\Â2\Z,5!FBQ¼úmŽ?h¿\é\ëø\Î_\Æ+ø\î_\Çz\è½t\Ü>=\Ø´\Ø*P7‹EFBhji7”jn>­Œ\Üa\r\ZŒo\Òˆ1\ê\ÂÑžp,4•4š\Â6\Â5>œ	Zl\Ø3j\é\î\ì\ÆI¨\ÈnšÍ¢„#\êtÿ\0G¬\È\î=pá‹¦\ãSQR…\n7]\ê\ÝÎŽ	!8APp\'	Bƒ©F\ÈB’Š\nQ¤\"/•(úmo]¿õ\ì%”…\"ø¸#y„o>M»\îÊ™À\\”‹‘ˆ1\ìEQ\Ã57\ÍB(ZrG \Øf®´vj™@‘\á3ò?ú@\Ïqcõ<§k9\Ôž¦ñf»{Ï± Š•7\Z¡BŠ\Í®J«­©…¬\Ô,)®)©¯ð\ÛZ\í¦P;„\×PK}ˆ¤©\à\ZMM‚±B±\Ð\æ¯v\Ñ*f\í7\ì+[W\á·\è;\âÇˆ>¼ZAi´\âši>¿HCkªù9Á‚š\ëó\ì\0P£i\Âl>À	5y†ðtõ®¨–ûCPjl\Í\r\n›	²}Žþ\Õ\Ö?S\Üzñ@Q¨¼P`(P\à”}®—Š\êþ\Ü/\Ú\Çyöƒ\åv\ÏÖ¯ý¸:~l\Õóþ*k\å‡ú\Õÿ\0·J\Í_br\n&¢„\ÐV}¦™® ù\à³Åšž=± ©¶jj/uµaƒS\ÜpEšž}p5šM\Ç÷@È«\Ç\ÎvI“\êE!B\Ç¬{†Œ\Í,q\ë…\r¡F°¢£¡÷@\ØD\åhµ\ç\×À0\Ê7Mg\ß4\Ø\áv°˜õñ| k7œ\ÇÝ‹H\Ä\Ñk®E&\éÁ\n,*TûÖ›HÀ®1\íˆQl©´\à5?\à¤_^/(P\ÞqŸðH´³\Â&}€Qh¸\ÞhpO¼kT´-m6Ñ¿ú¤X[+aP}xBVÕ·¶‚¦††\ã\ï\Z\'3\ÝV¾\ï{„O´­…l[B\Ú81‚.<\è*\n‚¶•´­§ey†Íº=û^ñ#\Ðm+¦\å\Ó]0¶œðVÒ¶±t\×L.˜[\ÚÐ ctOk´D¹l[VÐ¶7\ét\Ûôºm]&®“WE«¢Cÿ\0W@®‹—M\ËiL96”\ä~–þ?\ìi´-ª,<€\ÂWH®’é…±«hôb\ÓSŠ\n\ØVÅ°(w\0\rÀd-7‡‰Eš\ÚÀ¶±l[Å°-¢…ÀyN\ÖúNqw”>«\ái¸±\rV›!m[S´\Ý=–\Ç(\Élr\é›ÖŽ\è\ê}\"òh\Ñ\×B46\í+b\Ús¦~/\Ó~Â¥1\ÔhG_\éW•ý—öA¿u#\Â\Z\ßhj4\ßlj\éµtÚºm]6®›WM«cV\Ñ@%#¥\Ùx¹ƒûq\áB…\n*nî»©*J”)6Q¤ \Õ¹StJ:ka[\n\èK;y£¸Ô’·½o[\Öð·¸)\nE%n{WQ«ª\Õ\Ö®º\ÎGQÇ‚G„5Š\Z¡˜SW^;6ý0g\n2q„l•(¢£Ô	úMq”\0o„r¸ó²•¹Jœ ­g‘\Û˜<¢i56Ê›f“Y\áBŽK^‰DÔ˜AÀ\áqŽsJ•*T¢h£w\ni\èw)\ÚC\át\Ê\é9\r!òƒ@\å9\Êl›¤ð!BŽh68\Í\Ô\ÞL\ÜDrX\é\Â^PA±¤\Ï=\îø¨\È°\æ\î£\Ò:lt\Úós[òœ$pöÿ\0[„\Þ\çýQ†¥ó^\è\âJ6úr%‡Bò‹»­÷5µs~x-l\Ñ\íù¹®‹I9\Óc]4•<\Òa9\ÆxQêˆ”DZ^\ÖÍ¯o\ÎpÏ´*\æ\Å\Úes\ãÅ J\r\Ð9\Ó\ÅWZD¢#[7\Ìói\îœ\"\Ða*{E­l #\Ðj;\ã0¨©À\\·%IR¤©*J’·½Ë¨WUu\Ü=ˆŒ\0J/9t\î\"Qlbk>ý!`—pA+yA\àú\Ý9±p€Œó—O\Å\äJsbð%5‘\ç\Ñ9\ÒxBù\ãj} g\Ð9±k[u2Ž\Ã›µ¤ #\Ñj;\ãƒ4NsŒj} gžYõV¶1?\ÆF‰8\ÜØ  \Èôn08a\ÎA˜M<¶S[\Ý\ã&žM‚}+Œð…G¢k\á>Õƒ·°{¾8)\æ	¯ŸPL#ŒG¯{ pM¢Ðb\Ã\Ékþý10‰œc¿z1Û½iN2p„Ec B¦\Â(yMt g\Ò8\Êa‘\Óý½k\Ý8…¡E\Ã\æƒ	®ŸDó\Ï#°]7;ö[\Âþ\ËO±\ï\ë\ïŒ\ÂÁ„ pŠyMß qd\Új<\Ú\Ó#\Õ9ÑœY(T\Ü/4\'˜\×ó‰(¸›ºu	ðj9\r8[\ã\Ê\ÜO„[¦{ú—;j&s\rœE¡k¡<\Í_Ö‡¿`º_ú€\ÛBaÄ•¸-\Í[Ú·µoj\ÞÕ¸)\ã“™\à\0¢†Â…ð¢‡9„\×Ni[‚\ê\Ôªº‹¨WP®¡]B·•¼­\å¶;Wg\Ò\r+\\!oj\ê…\Õ]G-\îRq\É]G!«öƒÁ\áºmŒ\"€VnŠ…*hm@\×N	E\à.ª\ê¸û`ò\Ô;µ9\Óh\Æ©²PP¢ÁAt¢T\Ò,6[_i\ÔE\åO¼iƒ•\ÎÚ‰›†iSAi°^k*h}]RÀ3\Æ7>\ï\Ã6\nJ¢Ù°\"£š\×BSü€\Óýq9ÿ\0\\|`f\nz a\ì9A¨·\Ò\éþ¸€E\Äð#	´[bÁŒ\Ø8Ò»99„q\Ú>jZ¡EÐƒS…\Í\Ós¼?\èþ#þ´ž\ß#€\Ön@E\î\ÔúS\Ê*¨¼ð\Ï=¯ûE€øE¤r\Íam±\Â¡¢\â‡\ãý”\Ý&7Àµ\Ú\Zoò§\àŸø)\Ìs8dnŸ\Ý\åÀ\'<œC(\ÄPB‚‚…n5‹!E¤s\Úø^Q\ÓúE¤p™ƒj\r[VÕ±l[\Ú´X˜×ˆrüŸ\Ä\Zcs|`ò†™ùA ^\íO¬ƒ\n.„*T¢óÃ¡5\ÓC¦ixâŠŠþH\'\\4\ÜP\Ò(\0/v ¸ž8¡¸^-8\ãô\0\Âkæ¥€¢\Â37\Ç WWô5\Zd¡¤€¼\ç“\É8À¼\Ð\á4š•7\n[_P\ïR\ÐQ\ÓE…F&ø¸p…_ú”4‡\Ê0—\0©<xP¡E¦\è BÙ¤P\Ú(m<\Ê„×ƒl-¡t\Â\é.‘]2ºEtŠ\é\Ò[v\ß*T\çST\Ãð\Ô?£(²(kmÁ\ZÊšš\Æ=[u!WYEZ\Î\Ë\Å\0*·ƒ¸!QM}AE\çP^NX¤cJ›Š\"\ã’*mJ5>\Ð \ä\Ú\ÑahA€P€Td\0P9yph\îµ? žÍ´¸u~‘q9\Í\'¤¡CiBùB\ãCPÂhQ\Å\n=\0\Ô(<`q	ºƒ\åH[‚:\ÌþAøD“\æ¥À#«ôŽ¡9Å†\Ñx¤!C˜â†Ž#BŽ\é!\rB† [\æ\ïªT­\Äñg(¤\Òn4ŠEF€¡\Äk\n(.7žt•\Ôr\ê•\Õ]F­\í[‚‘’B\Üö®£WT.ªê•½\ÊxÂ“`F\Ó`\Æ¢’†Œ\\hTP\Ü}„©*J’¤©*}X¸Z3,…(#€c6\Â5?\éE€(¸\à\ÃA„\\Q\ÄB?\çF!`Á‹eX(o»üè ©\Â)8ŠWÿ\Ä\09\0	\0\0\0\0\0\0!\"1Q 02@A`aq‘#Bp¡3RbPr ’¢°±ÿ\Ú\0\0?ÿ\0›D–‰\é—*32^Nª­#jŸD\Í%&‹vb¬´C²\ÕO²±hY\Ä*­•\ZgU\à†}´GŸ¢o¢÷0\"!A\r\Ék>\Ñ\è›i±¶\ã™4Ž\Ùò‹\ÝyôR«§F~sLAË®ó\0¢d\ÑpôZ³;\Û&\ZOÁVyôb-0*¢¿ª\Ë\çV<ƒ,7\çûy9\Â\æ\ß\è\ì›XmF¶AÁYx*\à}Õ¦‘\è\ËYŠª\Ñ\0œÔ«bªˆP\"*µO\Ð\"\í»;ar×«\Â\Î\ëˆ8mQsA*Í’ª8Y=½\à÷×€7^Q9¤\ÆG[²\ÒV\Êòõ]\Ë\Ìy \Æy\ÝfÖ¿*\ë\Ð\Ä’\ÎgYƒT\íÈ•+\\³«W\ì(´\ì\ÝPNT0×ƒ°]\ãt]ñ\Ûp\Ö`;nƒx«F*054\\.\ÝX:Y1Q\×ñ+\Ë\ÞO ª´U\Z\Ìr\È\Çu\äU ¶©¢]UvŸF n9P\Û\è\Ìûe%3üùá‡£°h‰Q…þŽw|\ZªÐ³\Ý\ZöØ¼ã‚ª\Ñ\è¼{[\Ä\ÇÑ!n•HV* ‡´óQ¤x?‹T}š\ï9T¨”a6vC©ÁH˜l\Õ4Júnè¾›—\Ó+\é•ô\ÊúE}\'tSi\Û\Ý J•º-9•74)ÒŽŠt¿M\ËI\Ê÷u^n«\Í\Õyº¯7U\æ\ê 	U£_¶\Ó\Z\îaB@`3²iZ0\æ¦\æ…7ü-§\Ýh&7¢¸f­1§\ÙhC‘V):©²#¼²Z\æ­\Ò\ÉN³½Ô¨š¥¨F\çb á¬ù–«Zlñ\n,¶>T†ð¹õAØ´ksVZ-ZXŒsP\n.›¿óZsa=›¾\Öb` 5˜—\Ï\å®R7Ž\ïQðž¡,\Ü\nË¬o\×O\í¼))4a\Â;F£0¤V*y6nP2*;FW\ryü 7~4n–Ö›Š«¡IöNaY\í«\Û9…,¹¬»*em[TŠ‹³ðÒ¤\Ø\Ô\êG^\ã¼5i<Vq½xoŸ\Úo\ÕðQ\ÏC5ŠS96\\Wˆ\ßp¢\Ó\Ýg\0\ÚQgô¿\æ¢LI\Þ8ƒª\Óñ¸\í^\çö\íÔ›G÷gå›‹L\n\î\Þ-c˜¬÷Ž*\r\ï&\å\ZWÇ†\Íçˆ‘P¤ñ[\Æõ¾«¾\×jÀkt|òb\ã\ÅiW?Š…E\Æò«R<¸ñ\Þ\É>³~\×(RøN\ãr‹LFv“ž¶\Ï\Ü;\"ò\Z8«$\Ò\ÅB¢Œu*4.\ç¾1£¤-^-w%7\È+k¹\Óõ¶»\á4QŽ¥F‘\å\Ü÷\ÞJ\Í;ú«U\Ì+TØ©\Ñ<-ô^~Š\çôZR¡wU^¥Y?ÿ\Ä\0+\0\0\0\0\0\0 !01@APQqa`‘¡±Á\Ñð\áñÿ\Ú\0\0?!Ùœ§?Ž,±œ3Žyü˜\Ñåƒ”`\È†ñSS”¿w‹Å§8n9\"†\Å\Ýp£<f\Z/5\"*;‡`‰ñF\æ7˜Ñ©7Ž\ç`¨\Ì6š;\Ì9\'«•!\ã,ž¸Z7\Î:\ÍT6¨z°C9\Ýû¨\Ù\Í]¢„C\Ôólcø\Ù\n˜(ož Ø\Ä8Àf˜3\ÎA€\Ð\ÑC{Ž P\Ù=ƒ€\æp¡½^o6ˆo=3k,yŒ\"\ÄUl\ÍM\î\Ãq\Ì=\à\ì\ápyMl !3Vž\Äl…^A\È]˜±XZˆð\Ú\n1º\âˆ«\Ý2=ˆ\â\êJ±8…\çÅ‡×ˆ*c\Û§=–Š“9ã´Š‘†Ó’{A­ICc¢º;CQh\Ét6E	°ö:¿Á†¢ñ–(rOk¢º¶:¬:öÁøÒ§[ \'\Ôÿ\0\ï®\0’„\Æò‘>–\ruY«ð—x4©Ö ™$ƒ‚8÷0(ŸUˆ‡¸i@\Â\×\0D(=\æ	\Ã,M@¹°]à²†I´÷\à	:ƒþ\ëH‚& óð-\03\çöj4î†ƒdª{‘­Ú”žD2\ìlQ\ÇWG\î\Z—ˆY™\Ù\íB¦¢ók\Í=\é©ñ²q\ØA`‚9Ž8\ê!\Êgó?¯‹¨´õ£8\ìOv/\ä\ËSÿ\0o<…‚#\ê=\ÌD\Ïzá²†“Cø9 \ä‰††zF\r\Ã>Ñþ»T%–lž¸A\ã#%\Â^¿€8\r]\ç8þ-=PÚ¼\Ó}\èü\0dœ{ùø¼X(o9g¥¸,¿!\ÍA¤b>€B‡|T\à8M;Ôƒ\ëÜ Qdª±E\Ø!68\ã\Ë49¤\ÄD8ŒA¤a0|\ê @AÐˆˆƒÁŠ2Gb3ŠøøU\ÐX\èaÈ‘\Z\Þv\è1O\ç`ŒQm\ê\ã\Ð(¢3Ti0QÉ‚Ÿø\Ð\'h* k†ø=8ý&¦–°^v¢€ü¸(\â\ì!%ü\"oNrQ\ÙET!ˆE™Á‰\0?!OH¾\"<D‰->ô¼hŒŠ(j	¡T0\Ì <šŠ-²\ìø‰Hü§H0…\0™ƒ8>\ÜG10h\ê&­e\Z¢t\æÃ–¢‹p*QŽ8\ãŽÀ”6*+€¢£‡\Æš“ƒûg\Ê8\âƒ\ìøƒ\0(¢„¢9ª#’ \Ü|š0‡5t\Z1|a$\\xB$&|\n\\¡¡µEô¡\Ä\Ô\0,Zð!Z˜H\î|cXüMKC9Á5]ð°Í¾MZ‚Rõñ\ÄH‘\"DˆxŠ\ÆÀÀÁŽl\èeQEda‡¦4\Ì \\Ÿ\"`¤Q\nóp(68\ãŽ8ãµˆ\ÄH‘ix\Þv.<Hó…8D+E¬#Ž8ã‡…Ž†zŠ(³X¹\Ð\íVØ3L\âz³§ÿ\02#±Áa,d¨¢\Ú·i‡±QE¸\æòI\ßp1F\Å\Ì}B0­1­&\ÅÔ˜\ì{^zŠ.„\ÐƒrÜƒ’R\Ôü€°Çš¢‹£6»MÀC³X_­\çÂ‚×½%mqt\Ú\Ü\r	\Æ;€©\àU­B]€ô¨÷\Ê.«\\\Ð-#<X!\\P•Ch\0Qo\É{\æÀiª\ÕW»@qt\Æ\ÉP\ä¸\ãŽcq˜\Ìhô¤c£\Ö²\0{Á(t\"V\Èd½‹¡:\"údstd²D%\ß(ú-o\Ä+@p\Ñ1\Ð{ò*\Û¹d*(:1(lÅ†‹z7\â,\éÞ„½¨¡\Ø*>\Ôi\ØQw õ\Zwd­°\É[\ÑØ†&°\ÎH±f*lT4[€T¤9aDød þ&81\ã­,‘jŠ\ÅVŒƒ½\Òú\"r\Õh5.b\Æ?\Ãÿ\0f–kI‹ôŒW\ä/S\Öp°Zó†ô€\écBB\Â-c c¹\ÃÕ£\Õ¶Fƒ$TXl;Àwø¦0W\Í*À1/\êÿ\0UC`\Ä?¸5@|‘Ÿº“˜p\0\àu\ÂT\×8Xh6¡oA•#pI@@ýÂ 1Ä¶ô!o\Äoe¬ÐŸPOÙ€\Ú~ªý\Â\Ô!u¿“-¸•	{Sœªz6 /8šõ‚pRk^¡	þÈ˜?\Ä rR½PŸýE|\Õ\0>8Ò™%¨P?Èš@I0Q€–%\æ^µ\Ñ¿B›Šþ\Âss\ê5¯º9k\ÙsCP\0h¨\ãŽ8SYü\êG:?T\åú†c\Æö#dJ„¼\á@3…Ž:W@\È\"ˆ_b \Ã\ÎO\è\Îv|¤Ò§\É\0õa†a«Ž:‰)ñ?\Ìú,<\Õ-ý\ã?ªH\ê\ã¡\Çq\Ç\Ø\Â}c\Z—\ãø\ÈpB\Î%B]pŽ;DQ\\/q\Ñt`\Ú#À°•5b?œ€üI†a„\Çq\Çp¨L\å\î™A 2x‰F 8\ã°8\ãŽ8\ã€Á	`«?i˜J„½£Žƒ$e>\Z&¢€ \ÐD\"(¯\"„a0˜MÀq\Â²†ó‡ €\02c\ÑÄµ>#Ž8\ãŽ8\ãŽ8\ãŽ!`¨¢‹M1¼²V\é\ä\ÖH‡|\n‚)._ †\"W¨MªpŽ¡dq\Ô0Q¤a\Åzœ\Í> ¸q\ÇpA=D(¢±@ }\Ãú2@g¦!Ãš]Xš\Ñ2`ÂŠ(²t’bJš0H\Î\0\"‡(…b þ`\á0…Æ»£X @1\Çq\Çt&‘«QEQE\0€ASŒq\Çø2	P—¾¦\Ñ\Ój€ò $ù}\ZL˜0h(¢\É\Ò5„¦ #	\Ãû®7ª\'Xh)…D;œ_\Å\Úk(I\Ä<‚\á|\0€QEQET*Q\Æ\áAnŸ€^vg~!FÁ`ôcø¼ðê“&\r€¢‹ ‡l\08c—9†bñ<HBI2]q.¿\Ò\Ô\Ü\ä>¿\ïš\Óõo¼D;AU\ÄQE+\r[0½\"cú\ä\ìA\'Sq*\Ú,³¥–·\à¨4p4 \éþ”÷yõ@É“\rÀ+—\Z“>†BŠ(¢Š(GYFõ\Êcÿ\0 Q!€s( @JP\ä”rg¦ÿ\0\ÔjÀ\àWŸÁ–o‹\Î\Ô\ïÁP\0ˆA¡E }ÅŒ†™2`\ä\0(£ÿ\0n\Ûý`‘\"D\0’\01ð/ù|¸‡\Î\'yHKÛŒµAyÚž„T€\Ø•\ßcö˜<\' ±2d\ä\0Ý‚Eÿ\0‡5OsA(\è|	‡\î=ò¤ò\È$[r(rÀ¼\Ô\ì}±\ëJ\Ô^ûQPÿ\0´c¿\\\ZL›pc\Ü\ËÝˆ `E0ƒþO$!Û”TY¢“h¼õ@¨\Z\ÐDÈƒñ4ø<Ÿ\ãKýNV™\Æ`.¡úOŠg€ÿ\0I\Ã?\êsg¹|\Þ\ïFIB5V…†\Çx\ì\ÄóMŠÁ‚¨\Äf1Às‹\ÈBG=n\n\ãÜ8\ÞiX‘(„V!SQºZ\á–Nð\Z82@\Ì9F‡-E\ÐMãŽŽ%¶)lñ°U6¡zØ˜z\ç‹Þ±<g¦y‚£0\Ð\ÙÍ†ª.ÁÆ®±#\ÌD‹zÇ½ä€¨\È6\ãE{q\Çb6b‘’/5P\Ü(1y\Ëœ¢!üœl\Æy¨°P\Úh-?‘À³ÿ\Ú\0\0\0\0\0\0T¨ ®”\Ì;Mdû’2\ê\ÇÅ£\0\0{x\0\0	\0\0$€\0{\0À\0\0L.f\Î$\ì\Þ^«i4¯\ÂýŠ\0\r¬X\äHÄž‰³‰g\0sI\Â$€\à\0\0\0\0\0I$\0\0^~\0O„b;%\ÐSA’\ËZ3¢b<Åƒ\èƒ\Õó\Ë&\r\Æ\ÛÀj\à€@\0¼\0€\0\0\0@ €¼\0:€\Ú?wW\ÄÁCÀH6	\Û#\Û}‚\ËQ!Aò0m saø€!8ø \0\0\0\0\0\0\0%²À\rpÀIž\Ê¾\ÔM¶$„‰%&ðnm£1\Ï‘<ø`8\ëL˜@ øð$\0@$€­n\Ò GÀX0t\"Pø\"Š3ŽPhþR”°©g˜\é``Ý°\0X\Z{\Ã\Ê`\Èkˆ€\0\0@ i$\0 ‚\nÀ\0\àÀq‰C¢´ÀÎ ž£IC\ÉE´Û¿¢Ã¤¦šj“Ëµ¢@T\0\0\0\0\0\0€8I\0\0\0\0\0ƒ\Ð\0\0 \0Ip€úI2\äð\ÏÄ€x2X©1€\"½¯\åTQ\Ís@\0\0\0€\0 \0\0\0\00’\0\0\0‚\0 `€$@ \"m\0¸˜C€\Ç\ÅR€“î«…]´ª\'nI\Ø\'sT\'¨H\0\0 ’ \0\0‚\0$€\0„Š\0‚e€\0\0\0	 <@f0\0$º :I\Ã³m§ƒÂ¶£™·ƒÀ”“p€\0’\0\0\0\0¬€\0\0)&\á\0P\0\0\0d\Z´#B\"\×n\Ö\Òp\àq\0y›¼„NƒL{ mh$`\0\0\0$’\0\0\0\0\0\0	¤ˆ\0\0P\é\0\0\0\0\0B\Çù\0x\0c\ë$$€	`»(ž¶p\Ð\È‚L\0\0\0\0\0\0\0\0\0\0\0\0LÒ°\Z!À\0\0@\0\0\0\0\æ³\0\0\ÍÒ»	n„A%zy¡Ÿ´»L\ïrn\0\0\0\0\0\0\0\0\0\0\0\0€‚ ‰`€\0\0\0\0\0\0\0€\0\0ü\0>1?4\ÈL’Á84»‹\ÈÚ¶Ó’TO!A„\0\0\0\0\0\0\0\0\0\0\0\n’@\0!\0\0,“\0\0\0\0@\0\0\0 \0H—¡d7h2¹c/š­^\àl)–h¼\0.\à \0\0\0\0\0\0\0\0\0\0m@\0\0\0\0`\0\0\0\0\0\0\0€$`3A³[„¯D\r\Â«À³yµ\È]ÿ\0\0%€\0\0\0\0\0\0\0\0\0\0B\0\0\0\0\0\0D°\0\0\0\0\0\0\0\0\0\0C\n\Ð`/´\0d>1$Fƒ0Ë«.:ˆ2Ul\0\0\0\0@\0\0\0\0\0\0\0\0\0ö \0\0\0\0\0d€\0\0\0\0\0\0\0\0	’$›b\é\×.P\áT!k¬\ÊT@‚@\0\0\0\0\0\0\0\0\0\0\0\0P(\0\0\0\0\0I`\0\0\0\0\0\0\0\0\0\0\Çgúpó]ž„U\Ô“$ôf\Ð4\Ëˆ\0\0H\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ä„\0\0\0\0\0\0\0\0\0\0\0I.„±¶\Îd\Ëó¤•*\ÔS\r\\Žðd\0\0\0\0 \0\0\0\0\0\0\0\0\0\Ø\0\ØL¤\0]µ\0\0\0\0\0\0\0\0\0\0\0T >yi5+3#š±~XD«‚\Ä\0Y\0@\0\0\0\0\0\0\0\0\0\0\0À\àH\0J\0@\0\0\0\0\0 \0	.XŒSO>#0hW\Ã\ÍK€±ƒ€A\0\0\0\0\0\0\0\0\0\0\0\0\0`¢I\0h\00\0\0\0\0\0\0\0\0\0€aV\0lFû—3\Ìu‰{ù\Æ\á- k€‰$0`@\0\0\0\0\0\0\0\0\0\0lÀ\ZA À¤ˆ\0\0\0\0\0\0\0\0	\0\0\0MC(	©B\n§‘\Ô\äPi,\Óxû \0	\0\0\0\0\0\0\0\0\0\0\0aÀ€\í€\0\0\0\0\0\0\0\0\0@\0€\0Ï¤·¶6”B7§)>\n´¸\0I H\0\0\0\0\0\0\0\0\0\0€ \Ú@@\0\0\0\0\0\0\0\0\0 \0\0À³¡ œ\r\à\"S´Š‰]Ò¡¨	\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0tŒ\0$\0\Ð\0\0\0\0\0\0\0\0\0€\0\0@8±L9¸ý°)ƒ£4\0\0	\0’\0\0\0\0\0\0\0\0\0\0\0\0	À\0\0\0\é·\0\0\0\0\0\0\0\0\0$\0H\0\0ª‡^MY+l\\“8„ \0\0\0	\0\0 \0\0\0\0\0\0\0\0\0\0„‡\0\0B\0\0\0\0\0\0\0\0\0\0	\0\0›¡:\Äè¬¼Ä„ð\r ˆ\0\0\0\0€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0x\0‰\0\0\0\0\0\0\0\0\0’I\0\0\Ô\êdÝžL›\Í/ »§h¨@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0%\Ð\0­ \0\0\0\0\0\0\0\0\0\0	\0\01‘ ]Qð:\Þ\0ªÀ\í¥BJ\0 \0\0 \0\0€	\0\0\0\0\0\0\0¶ô\0O\Å\×i\0\0\0\0\0\0\0\0\0\0\0‚€OPZú“v€€‹SCfÛ€\0	\0H\0\0\0 \0€\0\0\0\0\0\0*@m¶Á.‡[m¤\0\0\0\0\0\0@2\0 \01I \0I&\Û-\å7j!…À\0\0\0\0€\0\0–$$\0\0\0\0\0\0\0-°\0\0\0\Ã\Òl@\0\0\0\0\0\0\0!…u²\0\0’I6\ÛxÞ¾|À€\0\0 –ôi\0B J”Óº\éžM¶\Ûhcv–Z@\0\0\0\0\0\0 \ry\ëh\0\0\0\0¤’M¶Ø›$6m¾\0#¼M´@\0’@\0€\0&\Â\0\0’If\nh’\ÊL¶üd†\ä\0\0\0\0\\Á.‘I$’\0\0\0\0\0+$’I6­H.F> \0m\0$\0\0\00€\0$’I$À‡h\\4¤’©/\ì&\è\r#’I$€\0\0@\éKŒš¨ˆ_…Ù‰\î@@\0\Ûd\0AŸöRI6[ 2|ŸB	E¬ \0\0\0\0\0NÌ’L\0\0\ä’I ^´I$’´W¦M¤ø\Ó$C\0\0\0\06\ÐÞ›IšI\0˜l\0\0\0@\0\0\0\0\0\0\0\0\0›³\0\0	\0$’«m$’I$t\Ã\äplE\ã\Ð\0\0\0\0w\É$„’&’H“(\0\0€\0\0\0\0\0\0\0\0\0\0	$Á6\Ñk»Æ‘-	 ’I$’H˜ñø`”ó`\0\0\0\0\í²I$†É¤’\0&P €\0`\0\0\0\0\0\0\0\0\0I$)¤\í°$\0\0I$’I$–P\Í\Æh$\0\0\0\0^r\Ûl’@I!²i$€\'\Ð\0\0\0€\06\0\0\0\0\0\0\0\0I	À€ú@\0\0\0I$’I ]b\Ú,\0\0\0¸\06\Û$HlšI \0€\0\0  \0\0\0\0\0\0\0’/€WO¶\Ð\0\0\0’I$’UÏ¢Ê´¶\ÕN\0\0\0E \0\0M¶\É$$’&’H\0\0D\0\0\0\0\0!€\0\0\0\0-¤\0\0Á\07m´\0\0\0$’I$”À\\\è …3T\0\08\ÒH\0\0m²I	$†É¤’\0\0 \0\0€\0`\0\0\0\0Id\0\00\0#¶\ÛI\0\0\0\0I$’I$\00ª2¸$\0\ÕI£Œl\Ï\Ûl’BI!²i$\0\0\0\0\0\0\0\0\0\0\0’“ \0\0\0m¶\Ú@\0\0\0I$’D ¬\Øa`\0,\×\0q3€›û$’HlšI$\0\0\0\0\0À\0\0À\0\0\0\0$’E€\0š\Ûm¶\0\0\0’I$ \0\0v \ÅJAVm@\0€~ m$d’‹&’I\0\0\0@\0\0\00\0\0\0\0	$’`\04¶\Ûi \0\0\0$’I.\0š—‡Áƒ~\Ðx\0B(°\0\é$¢\É$’@\0\0\0@\0\0\0\0\0\0\0\0’I$’³Im¶\ÚH\0\0\0\0I$’C€\'Î—õ‹\ÑGÄ\à=\ß(\0\0\0&I)’I$’\0\0\0\0\"\0\0\0\0\0\0\04’I$’\Ûm´\0\0\0\0I$’#9\ÈK\r¦\Ó0uy MµtD\0\0\0$’Bd’I$€\0\0\0\0\0\0\0\0H\0\0\0	$’Hi¥¶\Ûm$\0\0\0\0$’I*ð\Ë0b_“†N\n(\ÐI\é\0\0\0\0 4$’I$\0\0\0\0\0\0\0\02\0\0\0\É$’Km¶\Ûi\0\0\0\0	$’L~r§ºŽ›B•|Ž\0\0\0\0!I$’I$\0\0\0\0\0\0\0`\0\0\0\'\îI!$’\Ûm¶š\0\0\0\0I$Š\06ÿ\0‰ü6‡†|—{‹°OH\0\0\0\0	’I$’I$€\0\0\0\0\0X\0\0	a$€I$¶\Ûm´€\0\0\0’I\"\0	d­–ô\åˆ$N¬NQo»C\0\0-$’I$’I$’\0\0\0\0\0\0\0û.ŠI$’Im¶\Ûi\0\0\0\0	$’\\\àK‹\Å\Íp¦\Ø*¦+ªòò}\Ð\0{\Ä#p€)&’I$’I$’I$’``¡\0’I$’\Ûm¶š\0\0\0\0I$œt\0k´`\á<imøRñ]0\00Ç€\0\0i¤’I$’I$’I$¬Žº\n‡À4’I%¶\Ûm¤€\0\0\0’I|\0\0…`\ài e\0j\Å\Öb\0\0\0bÁ\0\0M$’I$’i6“m‘¬@\0\0\0A$³\åz\'\Í\0\0\0\0	$’ˆh_\éAnbR¥KŒ+C´ \0\0|@\0\0\Úm¤›i&<¿i,\ÈÅ€\0\0\0\È”	0ZD\0\0\0I%V\í¿H^þ\Ë>¨\Ï$†\0÷O€\0\0\ÒI$K\è„\n@$‚ \0\0\0\04\0$\0 v\0\0$’J\ÅÖ— ˜\ÒU¥\ïD—A×\ËÀ\0\0\ÖÀd€\0\0\0’C@\0\0	$’\0\0\0ðA\0\0$‘&’p\0I$‘Á~q>‡\ë—ñF2[Eáœ€Dk\0µ\Ì\0\0\0€\0 \0„’‰\0’P\0\0\0¬‚H$\0@\"A\0’I\0dMƒ¿\Ì\ØPl -\æš\Ý\ZFø†\Äf€$\0\0\0¯\0\0 H°‚\Ûm\0\0@\Ãd€!€H#	$’C2\0A‚ \é8j!ð3´\r\Ö#\âgø\í0\0\0\0\rõ\0@dH2\0\0\0\Â`\0’A&@\ÒI%\Û\Å)¢\n.\à\Ã\Û7\Í@.ò2Y\Å\n˜n\Øn\0A\0\0\0-µ’H&\0\"ÀDPH$oI%º@ ‚AT’M\Ä\0:x\Â$&š\ÈhŠ\'0/}³‘bDW&	\å0›\0\0\0\0/$\"@\"PL–Ý•\èÁ!£‹¿± ’)$ \âÀxE¨Ø»þ\ä\0o¼\0XÀˆùC\Ûp\0\0\0\0L$¢	@…eJ}\Õ&À`÷|À’I<óq5pJe=ßŠ»£t A…¹^2DŒ$˜€\0\0\0\0\0±0\"A	™2¡Xd3˜y‹bi$•ca,9\\\Ò@?$\\Š ±#ªH7@ Œ¸Z(˜\0\0\0\0\0ù‚Ô\0ƒfLDA–\æ\nbh\Ó¢I4aûR„’\Ö~V\á´hº!‡/„¡]`\ã\çQ\0\0\0@\0\0‚\ß¦@‘ “Ce†C9€˜·úI$§ˆ(÷ŠÁ[\Ï\ä\ÃÁ\ÝBR-\Ú{\Ñý\Z.Ð±Ì§3.@\0 \0\0‚	†\á	X\n+\"$\ÒNA”Gf&$’X€0A)¶\Ú0‘-»)\åÇ‘¯Áƒ4[Í‹\âa¶Ál—8\0\0 8\0 \àI\0I+_«›‰‰\Ý\É)%\0\0+¦jE&0Q1\ìOû¦’Ä€ a/Cm°ªAH\0\0\0\0À\0\à\0\0\0HF«\ÒwšyÈ“t \Çv›H&=Î @9<6“@h6¶%,ƒv€aI$ˆa@\0\00\0\0\ì\0\0\0’I$’I)\â\É\Ê@\0\0\ØDZ(ò¥µ<r›qÀ\Â \'•`0ŒH\è\ÙZ‡Xm0\0\0€]$‚\0\0\0’I$’I$’H6e\à`\0\0]O$-t€BG\âEö\Ê1¨y¶4x¥öð&\äŽU\ë\ÑN$ \0\0\0\0	3\Ý\á$\0!\Ýt€\0„$ û	º°h¥xÍ€\Îe\ÈGAB]i…·¢¼<v,$€\0\0\0\0\0\0\0H\0\0$\0\00@œI)¼<\Zh\éd!{0DÀ\ØZ\Öv3\ÂEj*òD\èXL\0\0\0	\0\0\0\0\0\0\0\0\0\0\0\0\0Y\0	\0\0ƒÀw\0ZIÓ ¸Í’Ž\Ù)‡$\Ô:\ç\Å&—4\0\0€H\0’@\0\0\0\0\0\0\0\0\0@\0\ÎJ@ =ŒAÊ†`ñ:*7kd„™\Òn¨xetS`û6Â¤\0 	 \0\0\0\0\0\0\0\0\0€\0°š€\0\0\0\0\ï$z\Ñ\Ì\Ó\Ê\Ø\à\Ìi\è1|#ÿ\Ä\0!\0\0\0\0\0\0\0\0 0@P!1`AQpÿ\Ú\0?‹§³\É\Ç3b\Ð|\ÜdÚŸ®C.8ö,G\ïC\Ð|aK€Ñ§\Ìx\ÇƒC#G’„xE;}\Ü>õ\ÜX§F8,G†1c\Æ2a\â,óÀŽŽ®>‚\ÇÁÛƒ*ž…>ƒƒõ±Ž8\ãŒyÆ…»|\Å\n}Á\âl\ä\Ç\Ù\à¨\í\Ó\Ã÷¿€:¸\ìr}Íœ8\ã¡ÀÒ‡Gìˆ9Ž.ò4rt6c³J…\rŸŒ|ô»\ZY0G_qn\n98q\ÑþûN\Üx˜04vNF£gn8r~¨ö.\Äq\ã÷À\ÅCF-š;0\àp?Ëˆm\Ç\Æ\ê20l\àÛ£GG¡øgkKc\à:‡w·ÀÚ‚\ÌSü\äô~0ð¿ˆ¢‡+Bß\ìÁ\Ì;\ìü#\Ìlü“\ÈAf8ùˆ¬\à[Žžœtt¾Y±\ãðpP£§txžg\æ	±ñÕœ\nldGÁ\ÃFÎœM=Ÿ˜lxO\Î:þ¬lu<_óM	ø\î\Ï!\æ=\ßð\'\â¸û¼(º*1\ÇK‹§óÏ\à|q\ÕEB>*\Ï1ƒôÍ(ú‚‡J\Ï\ÜQóU(¡±N•˜ ·F\Î\Ì8?dw?Hll\ìžF\î?”|G\é«Yp\ÒÁ‹J(¡Š\ã\Ér=\'ëŸ¼26\à<L=T?\Åž#±NŽ†U<›91\Ç÷O\Ý8øûÁb=N”4tl\ìÿ\0j22,Ù§“Gg\ë¸\ã\à\èô!ùôF„K\Z4hÑ˜\Ìf3Œ[9~¡\íûF\0`\Èb¾{ŽŽ?\01\Çb\Ö\r~\Ñ\ê¨ñFƒù\ØøN?P*\ìRŸ\æ‘\Çq\Ç\ã;q\Çq\Çßª(_\Ç\Ã†7~ó\á¨?ðÁ&§\äb\àû8ñù‹ä‚¸˜aÓ\Úý\ê(°	H[\n.8\ãŽ:}•E\0bD\"EQEP~#È†8\ãó¨¢ˆD\"\äÿ\09EQE”QE^5…l÷F(¢\âƒ¨Û†	ñ¨¢Š/ùª(¹Ž‚1E\î§g€·N:?ó	\'Â¢Š/:úŠ(¢À¢cŽ8\ÌüÚŠ(¢ò<8t`¡—	\ê(¼G™úcCá¾ŽŒ\'ª€E\å<\ÌQ}ƒ>\Ã\âi\Âz(½ø5`/s\àv,\Ñ<€‹\Öƒ¾ðž\Ü~š‹øF®\È³v\Ïwsýk\ÐÁ°\"Á\ä»Š?\Ð\Â<gõ`hó<œŠ?u|3ÁeEŒ€pg\àèŒS„8)Qÿ\0ÀO”X?\Ë#ôŽ-\rƒbÍ¯\ã\Ð†5ü\ÐÚŠ/Kùˆ\à`ƒüR‹\å\"\Õ(²¢‹Û‚\Zu¨\n\"1ò5	tÁ—‘\Äl\èCôÁ§\í0H`Á¿\ÎG\Í<\Î]»`Á‡\Îþ02_˜ÒžYƒñ?Z~ð ü£\'õ	ÿ\0¦þ\ÐÙ¡¡cg\í1Fa\Ø#ûJ\"\Î†	ä¹ŒJŠ(¢Š(¢µˆp%ø]— \ä\à`\Ã.\Î\ÉF^öONŽQdm\ÂiR\î<\ê/†>X·£CNÀ\ÉÀ\äù.§º‹\Âã·—\Í\Çq\Çò†\Ç!\Æ\×T^§ùðªq\Ñ1\Ç\ãt\àù£ \êx,¬¯Sð‘°v}ÏRƒ+bˆxcð(¼\Î$_„\áE\ädEÁ`eYø\ÂG…ˆ\ã\'?‘ýÀ_\ë1öt0:.Fª<QP\àº8ü¿œ8û8\ãŽ3\éúü¼®cŒ:Ñ¡”ügCûõÝ¸ð¸>\0Ã\Èp¢¡³gÀ\èÛ‚‡­\ÚË‰ýø_\Ì\\Ž\àRÈŠ…\Z4([Š,;6lq&\Í;4(Yö¬¸\à::=5\É\åQ\Ú\â©EgC#‰¥n<ˆG%£ðQ°\ãŽ¯ ýøAò\rªT,l˜ôx¯ø\Ç\n+V¢„Ež!þ\íøEÀŒ2-Z³\ìT¼\'Î¢ÂŠ\ÖQQp\Z>‚‡piÁ!U…C\'¢‡g\Òý„CDcjþ\0 (d\à\ÅB\Çc\È\àlCG\à¸ý\î8üoº·¥±cÙ£\0\ä¢\èb\Ñ÷¸\ãŽ>\î8ã¹\à2x‹@±À\à\äñ<Pÿ\0\Zü\Ø\æ`€\äÒ†#*6¡\ämÿ\0B3À`\Ù\æ4aÐ‚\Ô6ƒ>µ¡\ÈqvNM(t`£“C\'ø!ƒ\ÙeEc\'gˆ\Çÿ\Ä\0&\0\0\0\0\0 !01@AaQPq‘±Á\Ñÿ\Ú\0?[m\Ù8\r²G¸—bo¸x^®\æú™/«\Ó0\å·w9&|t\'\Æ\Ìüƒ\ä/¨aˆw„\à™\Úzvb ²\ãg†\É>\í½ò™ ·‚x)lEŽ@D“0¶fÞ¥\ïû¾ø&y-\Ù$²\Ïëƒ–\Û\Ë\ä|\çø%A\Ã\×\Ûy\Î\Þ€gº\î²{^ø\'ŸV\ä6òý¦É·%\äw\áœjz‡PoywŒ\ÂY‹c¿a\Îñ\ì²ež^\ÚÜ–yx|Gœ\êy9Þƒ‡\Ì1.6{Í±6\Ê\ÞNG\Ú\ì\á\ï/‹\Ú\Èl\ã½\Ø\ÄK\Ë&\É\Èr}Ë‡#\ÜDð:’¬œýÚ†fpx9&gƒ§m¶Yyx|{ð§\Ä3=lôœ1c«až-\á¶\Ø\à¢=\Ñ7†Í²A>\ì\àl\äpÍ°\É&\É»p\×=\ål<=I\È{Cl³w\à<\n^NT³Ñ“Ñ½o/A\Ëo€6=.„}‰~¤ÿ\0b	?©ö”‰\ìøA\Ë=cð÷Ê”6\Ät=JeÀ;,Ã„¾¦O{C\ÆÍ–\ßS0t¶L=\â-\îÈ˜^\ÖD\à÷s\Ëë†\Ùg£zw—\à™£;›z&x}\É\0\Æv^ü\'ÁÞ‚Þ‘—xx-»Á\È-½\Ù\Ã!\áz&ö\ËB\Þ3\á7¤Í¼Mœ$Ã\'\Ür}\Ä@7alŽ†\Û\Ãòž´XG\Û\ï\ÈñÚž\Ïgƒ|›oA<zž†\Ò\Ã\ÂL8\Þ\Üox——\ìpd\á\í0ö—d»\'\×\Ð\\†\Ò\Î\Ö\Ò]¾\â8\r÷Ã‡Œø¯À0ÿ\0\Ñoz7ýOÿ\0zƒƒ„ù=ºU\î\0Œ‚^V=\Ãl“6\Ì<·¶Ù‹Á\Æ\ÂygÔ¥\Ã\ÉpFd\Ï\Øe\í.üo\Å8|ù\ßH0\Ã\Èô)Y}rt¿\r\é8	\é{³/V\ÃÀxÙ‹Á±\Ã1\Èp8Ý¶d\è<vK[;L\Â\Ùì»™\ç¶lL!–b=[\ÓÏ–M½[\áxc‡\Ï\Þo@ø^À\çü†xy\Ûm†Ó‡d“†=I§µï‡¿\0[¼(&e—s\ÉFcë€‰\ä\r³;Û³\ZN–ô2÷›¿\ÄðqºO¶\È\Ã\à÷\ëß· ‘N‹\ë\ä;ÁÕ½\'%°\ä¶N\Ë\ÚÝ³““€ˆf\Î¢Y\ãm\ïÀd\àùn6’ö‡FÍ¶\Ä\Çü?ú>vý¥¬®¬“\×þñ4\èú½WbÝ•is\ß\Æûð\ïSó#Œ²öŽ2L\à{OyOAÁ\È\ï\È\Å\Ù\å8gó\ãƒ	õl\Í\áœm³\Æ\ÛÁ?\á°‡\×cûºv®teÿ\0\ÒUu\è`€¶\Û|ùG\ÃCc/&\ì\ÙfpKÀpGx!»¹\r¼¯swA#Às\Ép8mžv\Þv\áÿ\0_Ãø¥¯S\ëõo\Þ\í×Šó\Û\\ñ\ìyO	\ÔtŒ2„™—ƒH8x\Þ28C\Ã.ò\å¼l¥¶\Øe\Èa\áxo&\ç\á\èzw‡ü\Øm»Y\èó±$Km»O3~q\Èó\ì·x\"Ym·\à†-\å\é{K\ÃbXo¨\È\'—¹\àô>ü,‚;k?\\-\ãÿ\0òÎ“‚,²\Ï	\Ä\Î{\Ã\ê!—r9Át\àòS«m™[,´\à]‡½¤Œ–z#óv\×ò\Ûn\Ùð]Ä¶\Ø\èIŸ\à‘\ÐðO9\ÈxÍ°¶[a¶\ÙC(m\áb\Ò`Ã‚ó“Á,E°\Ûlòy^‡\æœM¶\Ëqüø+&\Ûlqÿ\0„K\r¼“Ñ‘ÁnÍ²cƒ‚%ˆ¶\É\Ë&Þ­›,\à–q½m³}[Õ¾\åù£>\ï‚}\í¶\Ø{ÿ\0‹±\Îóœ\ä0\ÌAg\'A\ë†Ø’I\ío«&<>¯¹;^º7¡\ê\Éÿ\0am±\î\ë\ÞvÞ¡\í¶\Ûa\éùgNs\'\'Y\Üd¶\Ã{³ “´¬›µ¶\ïd\í·x/–ÿ\0§\î9õ|Î«çœ“=\'gk2o»c½ÿ\0a<	”1,9=“e\é+oY6\Èõ\r\él¥\á³Õ½gù±Ð“ó†¹3¡n>yo‡\ÙdEšp%œ\É_seœok¶\Ñ\Â\Û\ÃÁ,‡\'¼dÁnKI‡\È™\Ü>\Ù\Þ6\Ûm‡üG¬p\Öp³\Þ\Î8:_pö·´û˜Oi\á ³—…\Þd\àõ=;m¼\ïøÿ\0W=\Ìm™\æ\ì\ã†õd1ÂˆK\ÆX\Â:G¹³ƒØ†z\Ù\Þ\Î	\É\ç|Ó¼\åŸ\â`\ìq¶N¬³«gb\Ûx\ÑÏ™–yw-oND³€\Û2O»9{3\Üä§‡\ßÀvf.\Ë\'~‡Ã¿ù»™\Ëi\Üñ†¹gF\rÿ\0zHƒ·	%\ãx;O\0Kx/\ÂL»\Ã6K\Þg\Ô\Äv–\Þ’\å³ðK\ÅX\íºt}Ç‹\í¼\í³Ÿ1\é<%¼nð-’H\áõ\Ëxo0\ÌÝŸ|¬\Çy\ì\à™m’b1xf|¯ùGO\Úx6yoK\æ¾b\Ý\à‚Ü•ú‡´¶\ä\ÈÀ·l—\"3f\Ë\×\r\áf%\í\'\r\ï\ãf\Þ>\æ~CþÓ§øõ¹\è@lº\ï\Ê\Ë8m\êÎ²9\r÷g,§½œ™a·œ‡½\ï»\'\×/¸e>\í¶\Þ2~Kþ\ÆBo9e¬‰Ñš\Ë,—\í\"ÿ\0\ròq\Þ\Ð<>\í¶9²õ\ËÐ³z“—\ã?3\ìe¾¹€,:rA÷,õÀðþ\Üe—õHz’ú³ül\é8x‰&·\0ƒŒ²\Â\ËòŸ\æD÷\Ö;p\ÞÖ°\å²\Ëg‡·Ï³\â~^\íl³£,²\Ë8\Ë \Ü%\Þ\ßÔ§Vdø§Ó¼\çX,/\Ô<?¶(þ®—\Çø—-“¡\à“Ã·o˜\Ëð¿+ò¿ñ¿Ž\Z\á\0\Îr\Ë,²\Ë,³®h?Ä‰ï«¸>\æ\Æ\ê\Û\íƒú‚ôY\ÆO…ñ¦É–\Ï\É$\ï2OiONø2\êü\âý\×#ø\Çó\ã~V\Ë9\Þw–ŸÓ©{6ÿ\0’eøœ…ùßý™ú™‡\èddþ¤ý’\Þ<a {Ž¼\ä‚\ßù=\å½Kú”{³Œ\ØcŸÐ‰?¶>\æ?”¢\Ï\á|rLs–Y\ÂA\á\àøFúˆ\Û\ÔIðX‡Q¯e‰@l<¹~üy,ÿ\0lÿ\0lÿ\0lÿ\0b\0ú\ã\Ù!;œS\Îÿ\0vY.#¿\í\ï;C¦œ¡ú‘k\êf„‡²Q\ìñ\ä7¢\ê3×£ú\ÆO Ce›Ø²Ï€ø_*m™-¶\ÉÈ›\è\Ç\ê\Z?¨€3\à™^\é\ßS\ëõ÷:ü\èemö\×ò^\é·y?ú°þÚ½`\ïsÏ»Lz^¡‡z¶ú¿ñŸ\ç~w\ç~w\ãaõõ`z“°…öÄ dV<\ç,Œø/FX\Ú\äÅ‹?—{²U•µmmmþ¡\åZ^3Ý!a2}Á:!Õ¶\Ûm­«V·{yG´O÷65Œ\ï(…¹\ÚXGn-/ø±ü\àý\ï\Þý¯\Ú\Óû û¿Y/¹/¹þóõ\ÏðKz½³*ûøÁ\ßy~û^™\ê|oÿ\0W.»Ô­ž|y0€\ë\\—X\ä{K¼lw›\Ñ\Æ^¹m\àð\rõ¬ñ–Yg•\ë\ì	\r‚RË¾²\Ý\Ã\æ$t·	o†`u®CÀ@=>ºúð\ãe…ž_V¼7d\á’\Äpf\Ã\ÛÁf\ÃüÎ¾¯-|3×¡ ²Ù·\Å¾v\Ì}t\ëj\ßØ»\Ê}Oe—\ÔŽý’pž\àûm\è&y´\íÀX÷l\ÇÝ¼\àƒf\Ü\à½\ã²]ñ\Z\î\Åzý;jK,¶«rc³;u.lÞ¥üœûðöŸ»6²”®\à;\Û\Ú~n.%·¼»q¶ð\Äpð\Úd¯gAû€>C\à;K\Ã\Ö=´Û§\é:¾\å\Ø\'\áw\ë\ï©–M\ê\Û\é\á‡h—;Xr+÷\ã\îe\Ëz\'‚È™™\Ü\ïŒ?«\å¾3Ì±\é~\Æi9‚lº\ïN\Ý\ß\\\í\ÙðvñŸgV\ÎþºM\ï/1\È=¢1:\è>I‘k\Æ\Ä[=C0Bx[d\× \í\á\åùo\Î2,zWÓ¯f¾ºC1\æ\rŸ\Ü\0a\ÂoiŸ\çV¦1žð‰·¥]z\ázž³\ä.m\Ûy&\Ùzˆ\ïz†ü.K°_RýÀ€|¦2u‰\äv\é:\'˜\é\é\0\ÆWß¥’-mþ/\ßõ\0Ã¬ù?CÁ¼g@S\É8f½J\ï\á~³ý¯\Òöý/\Úý¯\Úýl¾\â\Ï\è‡÷÷o\Ä|\Å\í:\ï\àu–\ë8§”w^ \ÌüZ÷žŒ<\È\Ë?³Õ¼òE\ê\Þ\r‡B‡»øÛ²[\ÖY= ôÁ{\á~þ\ç\0\ÆGÔ‹6xyCß¬2?Î´XA\Ý\íñ\Ï¬›tgŒo®†t¸õ=\Û8g¨\ç8z“\Ñ\â§ø&7´t¸@|#¸ùN\Æw\Û\×OüX\Î\ái\Ù\á\Î^°œ‹8YVM¼=G0§©ˆŸ?nñ3Œšûño&Iû\\zHûŸ!ò9\ï\ßË—®K²PA\Îmœ<mžó\ã_H^\Ï\Ï)\í>3¯\È}¾Oz\0õþ\Z­«e\à\è\Ë<)‚%˜M›\'9Yð±õ\Óü—¹=Ÿ\èw\ì\á\à\ã8\Î2NBYd\ï‚\ØorXp\Ë ,–zw†\ß2- \ì\È!¬µ\ß\îHÁù\'\Ç\'»½;ÀÙ¶Y6AK€\Þ6XÅ°ÁÀOk6fd½ì„[ð°\íþ¿\Å¬‹_\Z\Ät³w÷ñÏŒ€\Ö]ž²Cg~÷²K#\Øxö\à3Ý†Áeœ,²K>2À\Z†¸l\ë|hñþ-ŸŸfto@#µ»Yd\âÈŒK88P\Ûoõ>ø\r\æeøê´€…«‡s‚CðRGÑ»{v~<3;\ÐCm¯@’ô²	›a‚eÁõ,1\Ã\î[eÂ—K\ä\Ï\0\å§hrŸ\àb!Þ…\ß8\Ékü\é\ïó?³\Ý×‡¨\àxÜ‡yl±ô\àKÀ¾¡\à‡{f,‰8<ƒz_\ÆY\áC³ú\áùe²wX¼/ó‚K\êl}Ž\Òw{\è-\éŸü±œ\é\Ã\ß\ÄŠ¼‹^	ð<\r\\{\Þ\ì8\'\Ô	„8<ú\áøÁ\'‰h>Ye\Ú\íe…\Ú\ív»_dcÜ4°~ý¬€\ëw;ø\Ç‡Mðcû~·\í~—\é~\×\é÷õÁñL\ë;×§,³Œ\ä‹ \íivrÎ‘½¯¹;pvcº))›e˜\'ƒ\ÈðG—À\ë´œe–te–s¶$þø_¨±ü—ü¿.µWR\0À\á\Æ\Ï\Ù\'7\ï\ÊNöK\îC\Ñ+è–”û¿{_À^˜»ø¯¶‚cYž¼g8x\ÎN\0<–\Ìx-“c\Èoxû—G6X\ï\'“‚Í‘$ñO®\0£¤=^\È/²‘ôKú”ö\Úô+~\Õ\ê\ïy\Úõ\æ¬^y\ä\ÆzNVD86\Ì\Ôðe‘œ3´s„ƒ·œ†b\Î0„\ÄpxÞœ\ã —9lñ\í\Ù\é!À—)÷\á?\Ëzr\ÎŸ)‰Ö½J\Ûe\åà³€\í\Æ\Çg\r\Øl÷¡\é6\Û&\ØoH\éLð\í³Á&ys\ì\Ã\Æ\Þûóž·ü½Ç…iy\ÏL=\ÉZø‡œ\à\äà½¡\í2‡8+e\à‚H8}\Ç	dÄ¶8\"\ÌC2\Ë,‰\à\è\È8|\Ë\0i<}9\'ƒc\â?xÏ‡({´\í^\á\ém°\Ï{ ™™m°\ä<ˆLI=§½–L93¿a!\';g¶[/^xöŸ®D\ìõ¶xvÞ \Øs½—s\ã¯\ã\È`ðß&|Á\ÆL\Ë# \ïg\È,†ÁdlD\è\Î^ü°\àg\Ç9=¥\ÞDòK\"X“\àt„q÷ÁŸI\à/¾¬Àú·nzD½¢=ÚºüO´!š†ö\ÇFy~@0\ë´t\ë\ÒÁ%œ†\ÉÁ\'\Éd{\àpdC€²;\Ùe“gx²\Ë,³„„\ïxž8\ÛbY~\0\å·i\ß\'¸ð\å–td_sl\Z\ägò;o¶`Až¡\ãfÞ¾«#\âÀˆˆœ¡w\Ûñÿ\0ûvð|a½‹ï¡Ž¢{\ßñzN7¡“dAÛ†\æo¸¶8	2ƒ¸»¬„!g;F8gk8$\á7\' ‡´\Ï\à|‰\Øú„=\ç¸<™\Ððu\Þ^Œ\Þ(B‡ûû8b\"#\Ãi;øð\ØN„ö\ê{\Z\Ã\ê*º\Ù\ÒO$&xû‰\äŽ\ç½œ\ï	‚=\É–u\r\à3€›¼Av³„\å!f\ÌðpÏ‰ò³\íA÷3\Õ\ï<™\Ð3¨GDDDDDp#[ó§\×\0	\é¿C{ž	\àž6xvÞ“Á\äcHe;ng\Ç6{K\ÆöˆÕœ\ìË“l²½7\ßÀIœ>Éœ\"\Òõˆô“\Ûß“/OK‘\î\"\"8\Ã\æÿ\0ò\ÈÃ‚¸GcÁ\în\ÉÑœœ$‘\ÊG~2:“€Œˆx^\Ðor%¼’w\ä\í{³·ß‚ð­ˆ»l¦=*!$ø^¼\é:² iÏ°!úa\Ë=ž\'\Ù\Ðôˆˆˆˆˆˆˆ\àq\ÞŒH‡‡\Þ\Ë\ØK¼eõ\ÐLIg#ilð‘\È <}ô;³P\à±.[&\'²	•õ\ãb.K¼\çH\ÂO[9~½º,˜¯²W\Ôÿ\0ÿ\0N[o¶0Î‡@	DDG\Ðj?<>\êwh«\ï¨s„³Œ²#œ1\Æ\ÛlCÛ‡YwI\Ã \Þ(vHõnF\Ëg³†\É\Ãxa\Çr\êM\ã\'\ß!\Ã\Î\ÏFY\ÐùÞ„\ìa4ò7±Ÿ\á(ösö}²+—è€÷Rs´D=¢8=p7¨\ï\ã\â8xõ>Y–\Ï¹\'\Ü1\'%›0-nñ\'Exm–	Œ\Âbx&Lt$ó·¾r|DøE=Nvž‘ò€GnU%¼{B=¡o¨õ!OV>ï¸ˆˆˆ´/©Ÿ`\Å=‹\Æxƒl‚§ƒ\ê\Þ2\Î\à”^\×uœ3`‚KÛ\Úa¶\ïoÁ$\ÙÁr[3ÉÄ“ðB\\‡\r\à\'´\ÌL\ZEc<œe“ñ‡=@÷\Þü\è\ïëŒ³Œ²\Ë,ø^¶Wñ\r÷c\í¾\Ãfö9+«yöLK\î¥\ß!\ãg‘3\ÃmžöA}ÃŸg&Ù’\"NöDY%”\Ã2Jda–GIýYÁ\î-ž&<\'\'\r–fúˆ\à™ò6ù=Ü¿q\ë1òô$}²>‰OS\í3ðHa&o{a“´D¶M¶\Ä#†\Ä\Ò\É,±„\Ù\ËÔ·„\à[\ÃÁ\Þf\î\à!\ÂAÇ¸m‹º\É6c‰•²\ÌY\Þ/K`\Ø8>º¶\ß\æ\Ó÷aì††û‡û¿kO\í¶ž\r/\ÒG\îý8¿)D¬·Ü§\Ûð\é\\·\à¡\Ëx3¤»C\ÃpLÉ¼’i9¼#\Ë\ÞN>¸12ð\Ûl\Û\'œ\ÛIVC´\Ù¶Y\Ö-–\Å\Ö\Ö\×öý/\Òý/\Òý-mzÁ\Ã\Òu\ï$O/<</rA\È\'Œ\á–\ÌðK’\ï6\Û)G=“>¤½¯N³Â¶ð¡–·l\í\Ã{`²¯»´\Þôy8\í¿ó\ç\Äz\Î	<OQÑ\'fOIwo\Ùg\r÷ní›¼¬;\á\èx#¼d’ú\áŽ\Æ[\×@7\Ô\ßplD<8zŸ9\Ðü÷¬ˆ\á\'—\Ëõa$ðr \Þœ,C{˜\Ïs9\Ù\à.ðr“\Ãr}Kß¡lq\êg\ß‚^\Ý²xg«:ò\Èù\ï„äŸ‡\ÈO»9\í²;C\âRœ6b\ï\ÊLC€cÁL=\ïÿ\Ä\0*\0\0\0\0\0\0!1A 0Qaq@P‘¡±Á\Ñðñ\áÿ\Ú\0\0?Yr\î$t†\Z0t‹\r%\ÇxN\"@›ML\â$g˜˜\à¦\ZºV8wÉŽqxLV=¢$\"ýI\ÑrújmÁ’bB±³x8T¨b\âË—r£¤¼&	p„b@Ží¾sH²\å\Ë\×L8[.8©´Xk\Ð\Ä\È\ÇYX¬=<`\ÚT#‹Ã‡´}˜\Å`\"t™&é³‚Ü¸\â°\äÀ2õƒxrF(µ\Ã.¥é‹—˜¨Ë‹¤pM¡\Æ\î6B.N¬»\ÅQ0e\Ã\\QŽÙ¸3yQÃ€À\ËÀ\Ö/¼.³¢\ãõõ+¤z¤\ß*iƒ¬eÁŽ¹qÉ´¨`C;Á\Ö\ß6Æ·-EŽ\Ä\Ò2 FT\æbCxm1†Ma±3\Î¤E`ô‘\Þ9#\ÓxX¸2õŸd#“M`Á¼\"\ãxâ¨Žn\\!6Ah—†T¨ G\'@\è¸1Œ`@ƒ+^°t—xš`i`±„\ç‹=øc“.//¢ðõÑ¶PhøsÔž¤÷\áýÄ¸ˆ\î¥\'\â/Q›É¾\ròtp‹^X°uÂƒ, \Ö^:À\ÂN#7abƒƒh\Ê\ËXeËŠ-\\\ß,…B&˜¨@4uË‹,Í’þ¹\ê@x¿˜À\í:\Í0\æ\"!ß¸t˜%Ç¥\Í0—.^F-\Ã¼›\åXÝ•‘‡x\Zƒ\\5•¤Mg‹±—¬µaqAŒr°£¼6Ng*Íë—¢\âýˆ£˜5r\î÷¨Ù¹üõ½+\èÞ“¥\é:E„.’´\Å\âõ†\Ñ\Ë-¼L(:`p˜c¼·*3‰\ÌaÒºƒ/H\Ç.\Ù\ã¼!®-\Ö\n\ÃqöNnü}\êlöŒ\'\Ðñ\ÔC¥ƒ\Ð57B\Ãyr\âF;B,•Ë‹.\\c´wŒ1·\Ñk‡i*£Q\Þ(5.±t¾Šû%9\Ç?B0(<vG~ƒ‰·N\ÐÀe\Îò±pf\È1eË‹\Ô\íF^²\ìÃ’8t‹Xœ\Æ¨hK—¤\Ôà¸¥\\ T\"\ëƒH:K…#;º]þÇªòýó\Ú%ýG¨\Å\å\ÅË©rð:\ÃFŒJ›\à\Û.’\íÃ®\n†\Ðb\áJ‚$©¶\"\Üa\ÛL\åV°n$’ú\n~Ð£:P\Ý#³}„·6ô˜)O]x#\\¹rúŒ\\b¹Q0¬\í7•’2Ch\ÊÁƒH\êD—/\\.0\Ò(CizË‹ÒºŽ/¥iö:½j\ë\æ*¶Á\rF\Û_¸ ±³£y\ß\ÄÚš=`Q²n[›\æ\åI\åöÁ´¨M\Ðc*8#ôdk%Æ‘n8«•¥EŠ‰¢\\\Ñ8—^‘sr\ã.,~\Ä-2¨¥MúQé·ˆ§O\Þ-¶ô1$(œ‹~\ÉR£\ÓX„1—4K¼²Gk*uŒe\Ë\Çp³T¥@\ÒsR¢\ã¸\àŽ\Ý\Ç\ìWz3vó\Ä[m\ê\Ö8w–\êi\Ë×®þ™¸l>\Êô¹0¢ŽñŠvBq\ÓR±ZC\í^‹\Ò(²\åÁ‹	xZ\è.^jm+¤e\Ëû¯ž.iœõHÁ²\Éx\Z\Ú8\Åf\á´u—K—.\r\àe\Â\\%\Ã-\Ø.D¸2ô…0#‘=¼1Ûªþ\Ä,¸~…\ß\Ç&þ?c3Z\Ê\Ë\ÐC›b\ë.)r\ã8›%\ÃC#‚\ét†E¹r\å\Å.*‚J\"\Ü`‘zþ\Øoá• }\nÜ—.:‰ö3°À\Å\Â˜‘2¸²\à\âò2òo†$ºN°b¸8¸½E}¤\Òe\ã\Ç\Òû\ßcX8a¾¼2ak\Ìs¨Ã ¼\\°f¹eb\ã+YU*$¬\\eö¢þÓ¤\ç¢\Ô_Ø™mñ\ÄDi)ñ\Òv`g\í´ŸÌ´Ÿ*ÿ\0SQ,Q¹\äy>\Ò›—ƒ°KeÊ„¼Œaœ\â¢GLœD‰q9‰¦n,¼\×\ÛŸX¹¿–~f\Ä\Ý\×\Ñ›(‘I¯ôEÁ\Ï#¸ù\'kjü?\âkc5ª>™°\r¯0N\\\Ðü®\ÇóWø\ïü²\ïvþe\Í-9Õªjÿ\0¾sÍ—.\\\àýˆ:Mó\Ì:*aV\ZƒŠ\ÉV’£po$!.(°‹¦/Hº\Ëû’\Ü\È\Ù\Ê\ÓD/&\ß\á,X°ž\rÁ\ì‹\ßwŸ\Îð`Á—-%­We¿\è2k¡°úòi4\Ã\Ðg˜a+L;B\\0#.,a]#*1X0ŒXÍ\Ú\\\Û.X\Ë\Íiß¿±:\Â\ã©Y\Ö\ãQÁ7?$©Iú=>È±†.\\ aýxÌ¾Q¿·¬\n+¡k__¶G	‹À\Î\"B®’¦Ž…\ëUÊ¬^#L.LX‘*kLTZb\Ò9{a*W\ÚF\Ë\É\ç;ô!j¿ø²Z`Œ8P±m¼¯\Ë*ct¿g—\Ê\ä\ë}*ß±zŒ4•†ã¬¬V+-n’ôŽ,eD•+.7GlTc*=›—¾\Òø\ÎúD§4µ²Ý·¿W“­M>s&\nFš/“\ã‡ñz€\ã (\èT}¤!dD‹R t¸œ\ÇyX:`4À[*3yXIZ\ÊÂºNÿ\0v\ZzÎ¼Y ¢ŸðAÿ\0\Þ2\íªÿ\0¯\Ì\0vhª\Ã\Û\Ç\â#\"®ªó\Ð5¾•mxûI›©\ÌÙ’¥`.*¨\á\ß)f..\Â,¸1eÅ¹q\è~î´®„\éˆ\êm*U\ÝzMa¦GÚ‰Za @\Ò\ZE—¦M,ƒ/\Å¨µ°p\Îc8Žð\Þr™1tûÀ\Ó/.\'hsÒ­ûZ\åË¸o	xv†XCirò\Ò1wò±†±4•xIƒ†?y\\t§`/¥hûY\Ð	x\"Í \Z@¹´»•!‚ð˜r\ïE²$e\ëzß¼ô§^\ÝQ\×\ígBñX¼(\êJŒ\Ý*\rpbða‹®x\ÂFQ\Þ\\¾‡\ëB\á¤\×Í¾ViÔ—\Òt:E¿¶¨i°°Á\ÅM˜1Ne\à\Å0eW*¡IqÂ¨\Ã¥ú\×W©SQ»lW¯‚÷‹ürª–-Š_aÆ•ý\'$£Ä¤¤ ë¨¬;­D·YmÌ¿Ì¤\ã\íd\'Š{0xÊ†’Ä¼·™l¶[\ç+\Ü\Ö°0.UF^’\àÔ¸±\\c“¬n`€ÕƒE4\äùò\Í\ÍÀM8}Ê§¯ù \'kEŒV\ï¸\ÙÂ†«oôÿ\0ˆˆš#\ÇÐ‹et\×]KØ‹\Êö|@Bˆ\Î!‚m~\â\n]Žª‚Ÿ§Yn\'8\ï“\Ñ/iR¡%%\Ç\\vŽ	´rvúÊ”ø”øe¼2\Þo°ry9%aªMB„”¿ý‰½ j¾Iq[‰\äÁŠ\"I\Ë\Ãôm@»¥\Ý\Ýð\Îs¤ôp~°\Å<‘[Î…þªm¿P³\ã\é5<\Õ¸]þ|¶¨\rV\å\É|\Ü*«\å·]OFr\Êy•q(8\ÅýK	R¥i*1‰¤t‹û\Ôø–ñ//\æò˜½S\Ñ)\à”xšx\í\0€Cƒ‰\ížÉ¤\Þ|\å¼\Â5¨@ø\Ö[\Â#\Ãõ=õ\'¡=\×üÏŸ÷=Œ§—ü“\áˆñ(\áýC\Ïn \àMõ†º”ˆ¢\Ñ\Z`\éQóbOZ}\âe\å\'\Ð\êK[›p‘\á>ˆÀ\0Á´m»d –‚¾\Z~\Ù@è›­¹¥`À\Ôõí…›\'ø§\ÎS\Ë=Rž°˜	R§&ö)ñ/+\æRQ\â\'\Ð\Z7-»Ÿ³\Ìe\Ï#Whh<À°ß˜\ë»µ(ðJx•ñ)\îS\Ë>Lù2žYYCŒ Ý¨\"C¤ŸSPa,Š:7M‡–m£ƒ\Èsùb·Ó¢ž%\'\Î1Ð¹W§¹on!±V´CØº¹654]‚¼­\0<ûaGŸ\ZR·CeY	\nkR€ž&I\ä9ûA…—¤\ÞTp3FRTö€ñ\ÖtŸB\ëV«wJrNF\âË—5­<\Ìz\ímf¿\Ç1côŒPÝ¨Ÿ7ñ\î/\ÏC\0<¿\ÔtQ/þ\0/ò\Ãc.Á¿•È¶1\rË‚sûë§‰\êa>éžŸ\æzg¦z’ž	Av‡“\rS°\Ã6\ÐY†™óÈ¨¥Z\rŸ1\ß\é)ñ-->s\ç))\âT\â q‡£YZKe°`\Ü\â.N€Ê•(\è;‡rº¬ôÁ€‚…£\â\Õ}\é/Æƒ\Æ\Z‰´¹l´øOŒø\ÊJy”ó,ó,ó.Y\æ{	\î\'²{£\àc\âG‚ˆ¯)wô6aÉ¬} ž§± „¯ûf«Ã„‚G4C:+oqß¹R™i\í))(ñ\ØGH·‹†±P\ÓiÌ¹r\ê0û‹ƒ°w)–•*WY\Û4	xþ ‚¢Ë—Û»O¬\Zn\rƒ.\\¹}kR\à\Å\04\\\'¿\Êj—2kD#W—Áï®¥2\ØRPw\î»Ž’\\Ypa.¦\ÈÅ—.N\ïd\ë¦\ZJ\îK\í[¼X±eÅ¢²¨÷õ\Ô4\í\Ó}K¬!5\ÃrTMN„\0\Í\0Þ¤vÏš?®ºš	.¬SNñzb¥d¢WÒj¼òc´!2\å\Å\Ö–\ÇøvÎ0ó”8úhö\ïH±Â·,Û©Š\Û\êPŸ©¸®N\È| Þ°`\Â]d\×\Öñ’ô—¬1rð\à\è¨M˜]e\é±¶\Ñ<C\ÎS\é\r£Ý©k§ Q\Òôô¾®f>Ÿž¡¦\È4¾§IÅ‚\â`Á‡\ÖÔ¬ó\\Ypb\Ë\é•…\Òs[\í‚\ìC\Ê\0\ã\éÍ£\Þ@k\ZzT\Þ\r\í\Ñ^\â\Û\Óv®Ù»S\ènz\Å\Z›u\\õÒ¬_‡Eƒõ\Ô.6m\Å\àÃ†0@\Ê\é.;ö†ÀŸJô›G¾”‰OH¦\Ývj\í\ÒU}ô\æcÔ¹\ëªÂ \rf‰r¶\ÛÐ‹H)O\ëx¹{\×AÓ¿I¬\Ú-E\ì\ìC\Ê³\éÞ“hý	Q×µc\ÔÛ¥,{\Û=\Ä]#M‘m¶Zªô\é_„\0QöPõm€&]\ËyŠò\Ëye¼²ü™o,–{\ïg¶|\Þ \Û\Ù\ä\î=&\Ñú¦±b\Ä\n+­\Ñ{£UÉ”¢.\ÕÚ¿¨}‚§¾\Åõ’\å\Å\Í\ã¿O¦^Ž:+¨F\Ì:Á½A¾\Ã\Ðaú$˜‹¨-¢+°kºd˜‹\×X+D#W°­5½»†q—°\ï\ÓYzƒ)+ Ž6p€\ìöŒ?GBk)\ÔÛ Õ”=öwÐ ;	e2÷®•ø@\Z}‹\Òô\×A.\à\\—nŠC\Ô`#‡~‹\è\ÛhœÀ;9zL?K\Êgy\Ïkgp\Ø\ínS7\Æ\Ø´WW\ì1”ÀJ›A\ÍJ•a¬\r&’\Â*1\éz	\Ì%\Ç\\;ö…6€\ï8\ê#·Ó„S«\Û»‡w¹K¿\âmö;­eˆ\à\Îò¥v…Ê†,•+H’ è¨’¥J\Ç=\Ý]	§S·\Û\Íp\ãN:SX±]&B‰·@a*\âJÁ%e\é\ç/|Q²£¿K·\Ø\ÔÅ¶ûAs·\Ô÷9ƒ\Þ	ZJ•š*.òµ\ÈÀ„H\é+X\ÅT\æTNš†¡\àfûCØ”b«} €n\é\r¶4>\ÙWº+\í*³X\ë O‘•xT7•$2\Û\\\r¢Á¬	R£ªJÁ%t\×Hw\á4Ã¿\ÑW~\ëX­\ìS\âUb\Ä[@¸@/\Å\Z€´\Ø[Š•ö«4:¯øm„’µ‡ˆš\ÂÒ˜Tª†C.^\í!\åkÅ—\í‚=wEV@ù}Šæ»5ØDv­L«„•\è&\âÆŠvQKü\ÂÓˆ\Úü+h®z~† ­N\ß\Ûþ>\ÙIFý’¸=$›%BTp»„`Á\×\á8Œb\à‘j.+L;uœ`\ÞVS±n\Ø|º›\Ð Uu¼i0ô¡¾³¥ý¨­\î:¶\á\ì.2´ƒ“\Î \à‚\\r2a.,®8\ÃÛ¨\é/±NŽ\Ó®F¦7Vž .\Ú\Ã6Å\ÒPn¬7<\Ã@±)ZK Z`Ü¿\íŠt›¤\ÓPV;?©J\à\â’qA·À°Gf6b\Ø:Vµ\ç\í$uŠ«{fm—3d¸º\Íòo k„	Q0I\ÆG‡²KÁWe>D³\ëZµù–,#Û‘¢9\àŸ¶¹?¢>	h—O÷4\èø†tSnE”‹. P\Ð\Ò)Z«\ï´h\Ü¬Aøzl\ÝOüxŸÝŠÁöþ/÷\Û÷ÿ\0´ÿ\0\Ûÿ\0i¹~\Ì\Ù\ç\Ã©ü†Ó€¶\"·¢¢J‰]$0JÊµ\Ê\Ã%i\è\ÃT¢\Å^=k7›\Ó½‘- w— xGú…‹‡š\ÌþWõp+ÿ\0˜lJ\Ú?•ÿ\0$\ã\à?\Ì7\à f«ø?Ä¯ýõ(\åü?\Ôÿ\0—ÿ\00ÿ\0—ýOú?\ê?ùø”ù­~\ÄóE&\×\Çúˆ¤DM\Æpj\'`\ì\Þ\æ«|ù\îU\í|\ê\Æ\ê\ã\ÈEW\ã-P·¨þ\å7ñ\Ï\è‡\éó/ò”\Z7!Ÿ\Ã\à%\å\àá€Œ )ðÂ«\á\ØIrŸ\ÃR«õþYþ HüF¤ô\éô -ˆ­„¨À+A•`\n—-ô0Á¼+\È\ÍÑ“\Z±0¨\à\ÂJ\ì„\Í{cSe\Ï`Ë‡°o”?Ì |ò_\í©Bþ*~÷(®¬¿m\ÃÀ\'¿©¾øzAE‹…‹\0„·øs4Šðjž\î¤F¦\Ïõ@¦\ä³ûu†ˆ0aÒ¢ ƒ\"P†H\nÿ\0“gó(=ñ\Ï\â:\ßr—ó\ÞlEnN\Ø!9\ÓT5C|\\Z•PHJ\Òn\ÃL\Üa´­aIR¥DÁ†=‚V/)\Ü\ázD[µŠ\ÙðJô¯7Ÿ¢Vv\à¤®z\Ø\âŠ(°0\Í|ÏœK\Ìa‚OûÇ²s…i\Ãï´\Ý@5`û£SýŸx$\Ò|¦®aïœƒ\Ú\Ð\È\ë‚%JTG\Ø\Òj:šû\ÛóH”š\'pÏ¸ŠÜ‘p2\åô82\Zb\á¢0·°*H\Z\ÃBI‹¤¸¸\\r+)¯Y‹‹\'v½±ShVW¶ %F\à(Ê²Ó©Š\í<HN#N…^2\Éi%#+¥ÿ\0\á\ß}„ÌŠ™[Áÿ\0 BI\'\ç>y\É1’I%¢¸n3Z¯˜!	R B	¯a˜«Î¸\Õþ{{#x\Ú\Û\Ø:²t:K—¦\r\à\à2\ã‚t›°\ï$¨\ÂV	pb\àƒ\0•*T©Q+-—€\Ã\ÞXVY\Z¤‰\'ù¨\ÄX™VU+©\á8š‹þD³nž¢”„­M}\r‡\0£¾O™¿¢\ß\É\ÖBz:^p’I&&2I»\×*¼˜6…¾XAY¡z û\å\í,ÐŽ\Åô8%\àc©*TL\\5Ìf‚:±:n\åGB2¥`@‰+\\VR%e•V^ú)Hš#mUu\É\n»\ÝÀ%<OTõOD}c\ëf«¥Ç¨-+\ÝK\ä?u}X=·¼_xh€\Z¬SVˆ²þRŽ”\Ù\á…W£\'Qy}½N‰¤ŒHÃ¬H”oø„=!A/®[\Ä\äH´\Ùù\Ð_ó\Ø¬X2\Ã\Ôb¥J\é¸k*;b J\Ö\r JX	Z\ã™r°m…J\ÖQ9‚=5*£ð\Â0„L„¨÷\Å»\Ý°Žf°T1Nþ§\ãx\äõt\È0\Ë*•\Ò\ä\Ï\ã\"\î\ÏÃ´»<¦Ñ¨\ë’õ.¤)vÁ\âS\Ð^À\Ã\Ó\ÛÁ\ËUñ_–ZBûº\Û\Ì\Ìr\åÍ„>\Ø/\èV\rò—,¸º™PJ;reAAaX\Æj«n	~Ïƒùa³x\nú\ë3Hµm„\\°\Å\\­eJ\ÖT˜\"t’´†˜IP\"T7€À[€„¨\"BHm7‰Xv•¬\"@œÊ•„ƒ,#*$Xý\ri{›0+úAÿ\0/\ÃüBJRÿ\0ú“\ä²(\í=S\Õ=3\ÑHúG\Ò2¸¨XšK‡ \Ò÷7Fvõ&\0°Ö¼ÀShx¨¡K\à%¡/+”u¿ç¬Oj›k^~€{w4\n4!\Ñ[Ê³ð\ÊË¿”üGŸV§\É\Ä=!$‘\é–ODôK8ž¸w’Àµ–_ú+ûQ÷5½§•\ê¬oC7€ŽHJ\Å`4Žñ„0¨\æ\å`.%@\×7F\"J\Ç\á¥1P!¼­ J•Ð—MzN0²\åË\Ñ.\í£šXW¤\ÚSi¨\Îß—\îi™où9ý‘N34ña†aq›3_ð\Ï}”0Z\Î!‹*¤¥\ZŠV•ö\ç˜B„ ò.Wýpo \í\è^§¢›<M¥›ô\ãùŒ4,?Ž‡Ì§\\\ß\ê§\ç~§M\ç*\î\ä`Ž\ç˜G$) \Ö$L¼\àD7D*pp\ËÁ€”D•i*:D\Ê@JŒa1:Í¾¸\å\ÆÖŠô›@Ï£Z¥\ë—\æU‡Œ\Ý\é\ÙüGñ\Äô\ÏTô\áa†aôŒ>2þc[\ØO\Î\ïd†D!¾Bx¥+ó§ù‹(\âY\Äwr?\Öbûg¥t\Ï\ÛH:³Cÿ\0\0ý1B\Ç.Ÿ\Çã¬¶j\ÅÝ‚8¼Œp;dŒw\Å\ËÁ\r\à‘´0Œa¬ª†8—¦\åf\ã\\]\"\Ã.\áúq¦\ÈNŽQ|7«\ÔüB@-Zú\áù€šœŸ’z\ç®zg¢zc\éHúFHú\ÆR\ßþÑƒId†=EýH+iÌ¾--8þe;\Þ(ýšKò\Ú\0þGO\â%\\\×]ƒc±ºDô:+Hô$#‚\Åb²J\ÐTpB˜±t‚°A\èV‘ƒXFyZ`!X1e\Å6G\Ø!$¨ýK\Z;AÌ™òýS\åi<\ë¥þ¥¨MÊƒð²\nù\Ï\Öñ\rôù\"ø‹\â$a–\\m\ÈvŒ:HB!…,7A\Z¿\î™üŽ„TšÝ¿ðÛ³º1]´\é¬80\Â$¬šK\Ò^ÁZ`†Tp`t†¬H\í\"Ô¸2¢D¬¨\é²\ã]\Â\ï\r%\Ù:™¬TŒ~©4l\æ±\î\Å*ˆPÚ‡ô\Êò\Èý\ÒhþiO\î\áú\äO\ì\\ÿ\01_ô\Ü?ôWùŸÚ€Aÿ\0\Ñ‘Ñj\ç¡\è¸0O0„!\Ò`†aS}u\Ö7®†cŠ•ŠÀG¦\å\Ë\Öô\Å\ÃlV+¥@Á\Â\î&K¸A\rðºaw2ð“C\ç˜M\âJ›Fq+±r\ã„¨\ï\Ý{*h\ê@\Z=U+¨Ù“YoŒòwbSL \ÜJ%\á õÁS¬^\ç!]²TL=‚	D¬¹¹0„›K„¸B%‘€\ÅB=—HË—q‘ŒL\Z\Ç+\ç)\r0\ä\ìmò€\Ø÷)J¬©\Ä	½ð¦\ä±\Ñg\Ø\'œÁ-j&™]7g€Žñ\ÅJ\ì @‰6—LÔ¬=\'t\Õ*2¯Hï“´%\é9—.,\Ä\ÅFmH\àÂ¡¤#\r¡„v\ÈGH\Æ!;t¨šw»cQMõƒsPoo«\ÌÌ§’!\ÍüE;[[\Ê[±N{\ë\àŽ²\ãžzH0B2ða¼\"k*\ÚT¦\à„6Œp‘„‰*IQ\Ò¬À\ÒŒ&É³#  \éÇ©mzÐ¦\Ì}`›\é\Ùúš\Íû‰nÇˆXðmØ½d{ Ë‹•§EË„\r!.^°\Ñ/5*$\ZGyPŠðôœ\ZÄŒuP—$a¤`Ô¸\Ç¬\r!1•\ÕF=÷¼#f\Ì$$³\ÌöË¹%žIgž\×\æY\ä•rOnS`¯2×ž\Øaß¦±pa‹—( \ËÁÁ\Â\Ò5Œ`B&³J‰¸Y¾\ë*m8Ã˜‹¹q`Á„e\\¬0D–LT	P2¬kXK‹ök|\Ë|\Ë|\Ëye¼²\ÞYo,·–[\Ë-ó-úg±P‹.^H\ë+jUš„¨aœ\Ã¸`\ë.1EpÀJ‰„Žódbt\\¼†,\Z—+L*Žð2s•¤\Z\Ä\ÂF\åýô%vž\Í_@J†k¨‹L D\ÒT\Ö$\Ö\á´c¼¸\â\åÁŽ¸1‰“¼6›Ä‰8\ÃÁ\ÈgŽð!‚§8ISŽ\á÷#	¡#\Ò`%£ƒ*¨B2°°\Þ“x‘Œ#‰.,X±pcˆ‘••“´zð\Û|t\é\Ôc÷#´`Ž\Ñ\ï®Š•“yP#\Ð!«*mƒ,¸\à\Û)F5›!¼qÿ\Ù','Daniel','1212','7771076799','$2a$10$Pa.ntZfyPt4EaNsZzWM7S.4SI0oKKW1V.9nwyNdlqN0HTNfRIgQi2','Perez','Sanchez','ROLE_ENLACE',9);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colonia`
--

LOCK TABLES `colonia` WRITE;
/*!40000 ALTER TABLE `colonia` DISABLE KEYS */;
INSERT INTO `colonia` VALUES (1,'62765','Modesto Rangel','enlace@gmail.com',2),(2,'62765','Campo nuevo','enlace@gmail.com',2),(4,'62765','Tezoyuca','enlace@gmail.com',2),(6,'62493','Acapatzingo','enlace2@gmail.com',6),(7,'62433','Bosques de Chapultepec','enlace2@gmail.com',6),(8,'62210','Chamilpa','enlace2@gmail.com',6),(9,'62070','ChipitlÃ¡n','enlace2@gmail.com',6),(10,'62350','Teopanzolco','enlace2@gmail.com',6),(14,'62766','Palo escrito 2','enlace@gmail.com',2);
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
  CONSTRAINT `FKlj0s6fy2uxmjy4kxddljuy3fn` FOREIGN KEY (`ciudadano_idciudadano`) REFERENCES `ciudadano` (`idciudadano`) ON DELETE CASCADE ON UPDATE CASCADE,
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comite`
--

LOCK TABLES `comite` WRITE;
/*!40000 ALTER TABLE `comite` DISABLE KEYS */;
INSERT INTO `comite` VALUES (2,'Campo nuevo 1',2),(4,'Acapatzingo 1',6),(5,'Bosques de Chapultepec 1',7),(6,'Chamilpa 1',8),(7,'ChipitlÃ¡n',9),(8,'Teopanzolco',10),(11,'Modesto Rangel 2',1);
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
  `ciudadano_idciudadano` bigint DEFAULT NULL,
  `comite_idcomite` bigint NOT NULL,
  `es_presidente` varchar(100) DEFAULT NULL,
  `participante_idparticipante` bigint DEFAULT NULL,
  PRIMARY KEY (`idcomite_vecinal`),
  KEY `FKsh40vyuua7pwe8h0f2pha2g3` (`ciudadano_idciudadano`),
  KEY `FK791t60674hashdyfny9d5duml` (`comite_idcomite`),
  KEY `FK8j3vxsdrx1c9aj6hyqgxr4brh` (`participante_idparticipante`),
  CONSTRAINT `FK791t60674hashdyfny9d5duml` FOREIGN KEY (`comite_idcomite`) REFERENCES `comite` (`idcomite`),
  CONSTRAINT `FK8j3vxsdrx1c9aj6hyqgxr4brh` FOREIGN KEY (`participante_idparticipante`) REFERENCES `participante` (`idparticipante`),
  CONSTRAINT `FKsh40vyuua7pwe8h0f2pha2g3` FOREIGN KEY (`ciudadano_idciudadano`) REFERENCES `ciudadano` (`idciudadano`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comite_vecinal`
--

LOCK TABLES `comite_vecinal` WRITE;
/*!40000 ALTER TABLE `comite_vecinal` DISABLE KEYS */;
INSERT INTO `comite_vecinal` VALUES (4,2,2,'',NULL),(9,NULL,2,NULL,1);
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
  `nombre` varchar(120) NOT NULL,
  PRIMARY KEY (`idmunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (2,'Emiliano Zapata'),(6,'Cuernavaca'),(9,'Jiutepec'),(14,'Xochitepec'),(15,'Temixco');
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante`
--

DROP TABLE IF EXISTS `participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participante` (
  `idparticipante` bigint NOT NULL AUTO_INCREMENT,
  `fotografia` longblob NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `numero_telefonico` varchar(10) NOT NULL,
  `primer_apellido` varchar(120) NOT NULL,
  `segundo_apellido` varchar(120) DEFAULT NULL,
  `municipio_idmunicipio` bigint NOT NULL,
  `es_presidente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idparticipante`),
  KEY `FKpv8bf5spoi1ehk13rrm79gqiq` (`municipio_idmunicipio`),
  CONSTRAINT `FKpv8bf5spoi1ehk13rrm79gqiq` FOREIGN KEY (`municipio_idmunicipio`) REFERENCES `municipio` (`idmunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante`
--

LOCK TABLES `participante` WRITE;
/*!40000 ALTER TABLE `participante` DISABLE KEYS */;
INSERT INTO `participante` VALUES (1,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\á\0¼Exif\0\0II*\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0V\0\0\0\0\0\0\0^\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0\0i‡\0\0\0\0f\0\0\0\0\0\0\08c\0\0\è\0\08c\0\0\è\0\0\0\0\0\0\0\00210‘\0\0\0\0\0\0 \0\0\0\00100 \0\0\0\0ÿÿ\0\0 \0\0\0\0ð\0\0 \0\0\0\0x\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n\n\r\r#%$\"\"!&+7/&)4)!\"0A149;>>>%.DIC<H7=>;ÿ\Û\0C\n\r;(\"(;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ÿ\Â\0xð\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0\0ü¿\Ô\í$D\Ë9ˆR&fºP…\"\ê«<\âE¹\ç˜L’-˜–Š¡iS9iH™\"%X€l“[ Hd¥$€\0\0\0€\0\0\0\0\n\0 \0))\0\0ª\Ýmµ$‘umL¦`HK«uE¥¶\É)%µHV·B­«jd.‚@\Ï93.¨™—T\0.­\Ñ2Fq&b ‘feÐª\ÉE\"BH\0)\rn‹P˜(LÀ€\0@\n@\0\0\0\0\0\n\0\0\0¬@\0\0*ª®–\Ýn\É&%Õƒ2\0H´­n\ÝT].¬Ì-H˜‚\î\ÒE\Ø[E«»h!BB3‰3.ªL\åj\ê\É&Vµ\Ò\ÝQ1$L\Ì\âLK«3&JVÔ‰™2Ò&R@\0[·I™I)\0€\0@ \0€\0\0\0‚\0P@PR\0\0UP’\0ª«[]P3ˆ‹P™]) H­º\è-\Ò\ê\Ì\É„Œ\âR\î Zº@[u\Ò\ëH³2ê¤™H™“2\î¢I2º[Q{\ÓDL\ÉLó™\ç\Ý\É\0]]õ²3\Êg”µ	„\0\0¶\ÚT‰˜\0\0\0€\0\0\0\0\0€\0\0«h’\0ª‰ \0\n-VµZ$\Îº	DA\n\Ö\í\Ò\ê¢\è‰˜5»\0‹µ´Z»·A2´\ÊfB\ÚI”Ä‘®–fH\ßJ¢\É,\Ï4Ì™´Y™\"Ö·T3\ÎL‚…«l’D\Ì\n«$\0[I \0\0\0\0 €\0\r/It´ †S6`\0@\0)\04±\0\0\n¶¢H\0«ª•iI\"\êÚ‘HZ\ÌR\Ýl[PµmU¡!“K¢\ÉZÝ’U\×J«R-2™‹mL\Ì\ä’et™“-t·T\0œ\ç¢L\åh]\ÛS38 !JºL’H\0\0\0\0)\0\0\0\0\0.\Ý=\Òô]\0\0\0žN^\n€€\0AH\0\0-H\0\0\0¶‚	\0[HP¤-µuT…Zº¶•2E\Ø\"@D«­U+Z¹\Ì&%\Õ$Ä‘#8”.›\é \Z\"D\Ì\Ï8.ˆ\Ï9t[­Û¦8\æe\0\È(D@\0\0\0\0)\0\0\0\0\0®¿Fk¨\0\0\0\0Œðrð\ÐE²@\0\0\0Q\0µ@!\nZ\Ø!«­\ÛR-H™š\Ý$–Š­iwmª\×K1$#8–„&$\Ë9ˆ™–š»\éBm’g8–®¬\Êb4Ö­\ÝÖ®s3\Ë9\ÉH\0\0@ \0 €\0\0\0€=s~°\0\0\0\0sñ1\æ ZZ‰ \n\0\0( \0\ÕRH¶tU\ÕÖ­Ú¬H™š\Ý’U¶\íum\rõ\ÔÌ™I&@*fL3˜‰˜­n\Ý[Y\ç.—vežrH7»˜\Ï9tÖ­\ÕU®|s0(’\0\0H\0\0\0\0\"ôuú2Ò€\0\0.?6²HB\Ú$€\0\0\0\0¤\0(µV„„I-¡BÒµ»­\Õ\"B…©’ ]]lÕµ2\ß[\"fHB‚$gžD\Êf]\ÝhUgœºkw8“1jÌ‘jè¶ƒ8’\0D \0\0\n\0\0\0\0\0\0\0\0:{æ»…\0\0\0ˆ\0ŒyXòP\0@\0\0\0\0\0R€UE¨’\0´UR\î\Ý.ª$ˆ¶´\nDÌ¶\Ì\Åkv\Ò\ÛR5»t‘3$ 	™2’H\ZÐ²… «$\Î$\ÈZ´$HPI  \0\0\0\0\0\0\0\0\0\0\0£¯ÑA”\0  qù´ \0…!@\0\0\0\0 \0\0\nª\0\Ò\Ú+].·d ˆWB\Ú\nµ­\ÕL¤“3$Z˜’$KH#[Im+<³œ…¡ !@Z™’\0\0\0\0\0\0\0\0\0\0\0\Ó\Ù5\éŸ3ŸŽ«~©¿Z\Ð\æÇ‰ž5]}òõ sñ³Â„\0€€@\0\0\0@\0\0P@\0\0--µ»®•H… )\0*ÕµJÖ­\Òd&d‰D‰‘$Kª$ˆT„*fL ’£T	˜\0\0\0\0\0\0\0\0\0\0\0uúR\Ð\Ï?\0^“¯\Ñ]9ùñ\ÐN¿FPg›Ÿ‚€\0\0\0 \0\0\0\0P\0\0\0\0\0\0´¶Õ«»wP…)\0tš¶®¨™“)™m‰m™’3´)\n™“2et™HBHZ¢\Ý&$\0\0\0\0\0\0\0\0\0\0\0\rz\'OXL9|ú\0õk´Ç’€\0×¦o\Ô\åó\ë \0\0\0\0\0\0\0P@U\0\n¤in´\×MI$]-·IRiV\ÛKm‹d™\å ‹¥\\\âIVÐ¤”\ÎS2d… D\0(U’\0€\0\0\0\0\0\0\0\0\0\0§¶^¡\ÏÆœh\0\0\0\0uúyY\á@\0\0\0\0\0\0\0\0‚\0PB\É\Ôª\Ý5\Ò\ÝY–q‘m\Ö\ê¦bmº*ÚªwRc”™³,\æH@\Z\Ñj‘$$˜!Q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®¾ø©—?\0\0\0\0\0ý“]<˜òP\0\0\0\0\0\0\0\0\0€…´–\n¤\0[u\Ò\ë¥F9d]5»\"@¢®­«ª (¡žrfInˆ\Î\"\"!WV\Õ\ÕIœ$šÕ„Ä™ K\0\0\0\0\0\0\0\0\0\0\0\0\0\0z\Íú\Ã<óP\0\0\0\0\0k¼× \Ï\Ã@\0\0\0\0\0\0\0\0\0\0\0¡mPB„m\×EµY\ç$].ª$–Š.šÝ¶\Ý$\0-g2`.™\Ä\Î% t)\È)\0\0@P@\0\0\0\0\0\0\0\0\0\0k\Ó5\Ø1\åNT\0\0\0\0\0¬ß¤?d\0\0\0\0\0\0\0\0\0´¤‘m$UJ´­j\Ì\Ì\å­.®stº]Z4Bª$‚&`€f*@@\0ˆ\0\0\0\0\0\0\0\0\0\0\0\0\0õË°Ç’\Ì\0¦Œ\0\0>\ë>I\È¤×¤|\éÊ€\0\0\0\0\0\0\0\0\0 \0\0\0@… *\ÐPE\ÑhE¥EP´.\êq-)) ¶’e3$Z™4˜!d€\0\0\0¤\0\0\0 \0\0\0\0\0\0\0\0\0¯Tºù¬À}\ÃõÑ£\Î|³óµ\ä>ô~„õ”ü\Í~\\´\×`\âœh\0\0\0\0\0\0\0\0\0\n\0\0ª²@µ$-ª\è-L®­¥H» !V\Ó[²3‘\"bH\Ö\ê¦&yÆ”\ÎV³˜€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^\Ó]ƒ<•¨?G\É\Ì\ìh¥?#_\0\ZôK\Ðy\'\n\0\0\0\0\0\0\0\0\0\0V´I\0\ÒBª…«ªA2º]R¤’-\Ö\í©”Ì» Z\ß]I&Y\ç$—TI*Œ\ç9\æº	‘$\0\0\0\0\0B€\0 \0\0\0\0\0\0\0\0\04ß¦\"F|\Ôz\ßF\È@\nRœÀW0o\Õx\':\0\0\0\0\0\0\0\0( \0¬±\0\ÚBª\émº	‰œ†¶- «j¦d\Ì\Ö\édƒ¯§s2eœI™mHI™ž`\" \0€‚© \0€\0\0\0\0\0\0\0\0\0\0\rz`’s£\ë°\0)£‘øºð\î^\ÅŸ5@\0\0\0\0\0\0\0\0\0\0\0¤\0«m\Ð+[¶\Ñ3&d\ÊKm«ª\0’gœ»¶¤þ½\ça$)*’y\É$\É\n™€\0€€”€€\0\0\0\0\0\0\0\0\0\0\0\Ò^¤ð¨@ýdzJ|\ãòU\ç\0\×x\Ðg\Ï@\0\0\0\0\0\0\0\0\0\0\0\0@\nº¶­-º]QœI˜j\ê\ÝP3‹Bet\í\ë\ÞyÉ’\"ˆ\n™LL\æ\"@™€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0k´R&S•G\Ú>\äSó\ÕñÀs]J<LP\0\0\0\0\0\0\0\0\0\0@\0j\ê…\rj\ëuX\å…Z¶…Z‰%¶A&b\ÞÞ­Ì¤Œ¢\"EÒ™L³Œ L¤€ \0 \0\0\0\0\0\0\0\0\0\0\0\0\0\0zÆ€9¦(\0\0\0´´¡\"p \0\0\0\0\0\0\0\0\0\0€\0U«º€­n\ÝVQ$\"Ô‹WvÐ‰%´I3ˆ;úúH™\Ìev33˜‰	$\0€\0 )\0\0\0@\0\0\0\0\0\0\0\0\0\0*õ€	Î²\0\0\0½#E9 \0\0\0\0\0\0\0\0\0\0¤\0\0\0Z»¨U]t²J²H3)®” 	 &\";ûzI&V†q$LÈ…˜‚BI\0\0 \0\0\0\0P\0\0\0\0\0\0\0\0\0\0\0—d0f€\0\n½`\ne9P\0\0\0\0\0\0\0\0\0\0\n@\0\0\0š¢Ö·U\"\Ò$kaœEH´RH™’=Þ™\Ìd«¦q&Hºg<\à$ˆ\0\0 \0\0\0\0P\0\0\0\0\0\0\0\0\0\0\0\é\0˜3@\0^±@\"r \0\0\0\0\0\0 \0\0\0\0\0\0\0­ªµ­\Ø\nIwn¬Ì5«3$€¶€\ÎdË¿·¤Ä’[T‰™2T\Ì\Ï9!H’\0€\0\0\0@ \0;œ\0\0\0\0\0\0\0\0\0\0«\Ò)\0L˜ \Ö(9T\0\0\0\0\0\0\0€\0P@HA\0ij­].­¶fg0kv\ÚI”5«33™@¶\è&dÃ·³s$(	™2’gœ‘$²©BH€€\0P\0\0€\0@ ô\Ðó3\0\0\0\0\0\0\0¤h\È)@\00fÝ®¬\Ö@D\Åd€\0\0\0\0\0\0€€@H\0)\0i«t@\ßZ¬\âD´¥ A	Yµn\Ö\Ü\æLNÞ¾„™I#8™\Äf@Qh’\0€\0\n\0 \0\0@ \ç\ëO\Ïó\è>9ò\0\0\0\0\0\0æº€\0\0Z¯Ž^‚\Ýñ\ç\é\áš\0ž\0\0\0\0\0\0\0+q€\0€ \0B•w-·EŠP\0H\0\0€–´$L\ÎÞ­‰’\"DÌ‘1&$\0 €\0(\0\0AA±ú¨\âxŽ\'\Ö!ò”\0\0\0\0\0^ˆ \0\0\0§6y=8l™¹ô÷óøûe\n³Â€\0\0\0\0\0\Øô®|S\ç€\0«£R\ÓKJP@\0\0€\0\0s¢³:ú¶R	B3‰œI˜\0\0\0€iKh)J´-\0¡ú/\é–H\ä\ë>Gµ2H•@B$2\Êf\Ý\Ë\Ô\0\0].\Þ\Þ7\É\âô\Ö\âfóõz8ù½y™L™@ùª\0\0\0\0\0\Øûg\Ð)\ã<g\Õ?+§=\Å]tPR\0\0\0\0\0H\0\0\0\ãC¯«v\Ð&fq&C<\æq&`\0)VÆŠº(\0ª(\0 \0´‡\Ýñ^™B\0|Š\ãõ%\Ó<ˆ\0\0\n€ˆ  Zi2\Ïó\ßW¾mlšc]yòô\ÍuL‘\"pgd\0\0\0\0SSZ~‹•ô\ã÷žŒ_L{°üÏªyv\0\0\0\0\0\0\0\"\0\0\0\0\\k·«£D\"I!”“\äÄ˜*H.‹ZP\0\0\0´ €P\Ð\nO\Êõò¢‘ñG_£&\0\0\0\0h	˜g’rNt¹wÎ¡\ÏS† i®³]—h\0Fl€€•iW£I÷þf¨ª\Ñ\æ\Üø \0\0\0\0\0\0U\nš™\"fL¢U!T@^þ¾Š™\nFq1\ÎNrHÑ©t\0(\0\0\0J\0)\n@(¤\0@\Ôzù»\åƒ\Å\èœ<–\í\Ó\ß&‘J\n´$!)“	›9€\0\0\0\0\0\Òôš\è½\r\0\0\0\0½\Z\èÇ™õ¼7\Ò¢ž^“\ãz@\0\0\0T*¨\0\0¶\Ôgbg -Z®¾­\Ûsˆ „I1\Ï2e \0\0 \0\0\0«@U\0@\0*\Ä\0\07\ì™\àºL¦f€\0\0ñL\0\0\0\0\0\0\0\0\0\0õ.¢” \0\ížLx\ï¬ú\Ä)M?´ù\ÝÀ\0UP€\0\0\0\ÅJ¤s\Ì\É\è¤HµuzwÕ©0\ç9™\0\0\0\n\0\0-Ò’€\0$\0\0\05\Ú4™L&\Ú\0\0\Ã<@\0\0\0\0\0\0\0\0\0z5\Ü\0‚À©‚®\Ó,x®½\Øz9\Òq\Û\ÍÑ!B€*€\0\0\0\0\0	\Í0[E©3‰!\è&Q-·Nµ\"\Öq.®f$€\0\0\0(\n5h¤\0\0\0\0R\0 \0\0¤‘0ež5•\è\×P\09\0\0¤\0\0\0\0\0\0\0\0^…\Ø\0(RL$—¢\ívVº\Ìy4”(Z (\0\0\0\0\0\0\0g’sH\Ö\ËQ3\È*Ô€…k¥\ßKœÊ³3,¬\0\0\0\0*\êÚ´Q@\0\0\0\0R\0 \0\0\0’\'0Z\ìº\03\Í9\0ô]³À\0\0\0\0\0\0/D\æ\0o\ÒPƒS’ô—ª\ív»\"q¥R¨\0\0\0\0\0\0\0\0	†<\ë¤\ÊÒ‘ T«M]iœ	$n\0\0\0un–\Ð\0d\0\0\0	\0 \0\0\0\0™g\0¶»3\Ét\Ï\0]µ\Ø3\Í9\0\0\0\0\0\0\Û~†x§ \0]µ\èI–8{K\Ñv²¥J \0\0\0\0\0\0\0$Ç• «I–X(R…Ò«KS)˜\ÞT\0\0m\Ú\Ú\0\0@\0\0 \0R\0 \0\0\0#>r\0\n@\0¶»\0Vy\' \0\0\0\0Ñ®\Åù\Ó\0\0\×e\ÙSð\0¿B\è\n\0R¨\0\0\0\0\0\0\0\0sóI€\ÚHURiJ£UE@\0\î\ëB€\0\0@\0\0 \0R\0 \0\0\0\0$g\Î@\0\0M÷(2Ïœ\0\0\0\0mz\0c\Îd\0P\0]·\è\0”(\0\0\0\0\0\0\0<X\ã\0\0Qh	%YZkAuT&d\Ìt€\0‰Š„@E¤R­].\ÊJ\0\0\0\"\0 \0\0\0\0\0L³À€\0[ô\0b\0\0\0\0«]€PHÇœ\È\0\0õo° \0”(\0\0\0\0\0\0\03k$B‹@HµV…\Õ\Ö\ì’De`˜¬‹$\0\0-¤\0\n\Ö\×k±@\0€H\0€\0\0\0\0\àd\0\n\×u\Ð\0\0Çœ\È\0\0\0®\ë\Ð\0ó™\0\0V»5\ÐP\0\0)B€\0\0\0\0\0\0\Ï\Ë \0\0,J-U\Òe­µ½+8Ì¹›0*\0¥¡$€\0Z\è\×BŠ \0b\0€\0\0\0\0\0#<S\0½ \0\03\Å9€\0\0\0õ\0\0#<\0\Û]ÖŠ\0\0P\0\0\0\0\0\0\01\Âg\0\0…TZmk¥º¶±\Ï2\ä3Y²¤I\0\0[UjC(€\0\0£]V\ÐH\0X€ \0\0\0\0\0\0g’r\rw]€\0\0\'6x€\0\0\0i¿H\0\0\0g‚s+]š\è(\0\0\0R…\0\0\0\0\0\0\0.~X\0\0\0¤U¬-»kwZ·n|³$­d‰’€I \0ª·I’\0\0\0!Z\ì\×@€\0R\0 \0\0\0\0\0\0	“+\Ð\0\0\0&Yó€\0\0\0½Z\ì\0\0\0 \Î\Z\Ø\0\0\0)B€\0\0\0\0\0\02fH€´T–Ð €­n\Ú\×Kt\Ç(-²I”’d¤LÀ,ª¤@\0\0\0»k¹@\n\0€\0\0\0\0\0\0\0\0\0\0ó\0\0\0\0×¡v\0\0HR\0\0\0)B€\0\0\0\0\0\0q“Š\0U‰ih@HµWDH¥Ñ«j\êªb[n“!œfdI$B\ê„I\0\0\0\0\n\×e\è© \0\0\0\0\0\0\0\0\0\0\0	–|\à\0\0\07\ê(\0\0 (\0\0\0\0\0¥\n\0\0\0\0\0\019ù€\0(Õº HB®–\Ù\"µV®\è\Ï9­Û°˜L\È\"f]&R‚B\Ñd€\0\0\0\0\ê\×e\nH\0€\0\0\0\0\0\0\0\0\0\0,ð \0\0\0v\ç\×7OW)\Ó \n\0P\0\0\0\0AT\0\0\0\0\0\0\0œü‰\0\0·]dwRH\Ò[£8š\éu«$™!RI˜Y\"2@A ¤\0\0\0\0\0m¾\ël@\0\0\0\0\0\0\0\0\0\0ó\0\0\07®{ò\ïz\é™\é\æ@\0\0\0\0\0\0R…\0\0\0\0\0\0\0\Ç	ž@†·nè™–­¢f]Y\n´¢\Ú\Î&º[R\0µ2’H¤‘lÌ˜D\0\0 \0\0\0­w]€\0\0\0\0\0\0\0\0\0\0ñN`\0\Ío=Œûs\ËÓ‡ƒ£&z±\ê…\0\0\0\0\0\0\0)B€\0\0\0\0\0\0g”\Ï€\0V·T‹«t¶¤«hT\Êf+Z¨\Æ3­[»2¶\é2’LE¶¤™\Âf\0\0\0 R\0\0®\Ë\Ô\0\0\0\0\0\0\0\0\0\0ðf‰,¦z&å§/6\à~•\Õ\0\0\0\0\0\0AT\0\0\0\0\0\0bsó¬@\0j\êÈº]]j\ÈI#[-\ç&eÝ¥\Õ\Ç,\Ý]n\É¶\Ô&fyËª©‰2DAH\0\0\0h\0ôk±H\0\0\0\0\0\0\0\0\0\Ë\Ö1‹g{c>\ÜòôecË·6ªy·žz\0/FûŠ\0\0\0\0\0\0¡@\0\0\0\0\039ù@\0\0Rµ«\"\Õ\Õ\Öè™“2\î\Ûfd€­\\ó\ÍÝ¶tS,\å1‘	ˆRB\Â\Ù \0\0\0´[¤‰˜\0\04ß ¤\0\0\0\0\0AA\0\rr\Ô\á¾ùÇ¯Í­yw­\ÌÛŽ\Z\0\0\0\Ó\Ö(\0lÜ»“F”DÅ¼k´*€\0\0\0\0\0F<²@‘\0€¡j\ê‹Z\Ýj¢I3-£9–Š«WVb-µt\ZÝ‘33‰3&Bd¤’\0\0\0\0º¶¦\0\0kº\ì€\0\0¨ô\Ç|»\ÇH\Ôh±B S1Ó“\ä\î|\ÊG«p\Ø\0\0\0ß»\Ño£.ñ\ß.\ÙuŽ±J\r\Z4h\Ôh\å^M<3«Ç¢€\0\0\0\0$Ç•\"\Û$´´’\0Û¥ÕºktL¤’D	•\ÕU.­\Ó¦·d–Û¥\ÒD\Ã9Œ\É\0HBjD\0¡H*\Ú&`\0\0\0\×u\è\0\05\Ü=\Ø{³}™zr¤LVL™2B„!\á>œ€\0\0\0Ò°½ŠR€AM\Z4l\ÜR”É·\Â\í>WVm\0\0\0\0	\'?)’­²K«tB$ T]5«wDÌ™ˆZª(«t\Ç®•\n@Ló‚è¶’I”ÁWI	$\0\0Z\0@€\0\0®\Ë\Ô\0ûœŸW›Ý‹¨\0\0!ŠÁ“&L!\0!G\ç\ìó\0\0\0ûQô@  ¥)£gC¤h µO.Ÿ‡õÅ \0\0\0L\Î~R€´¶d© TkH[n“)˜5\Ò\Ý[PfL®\îµq\Ë7T)IE\Ò\Ñn“2e\"Ð™ˆ\0P¢H-¤\0\0\0/F»\Ö?¡ù,2f2\0\0†LW3&W$\0„!\Í>yÀ\0Ÿn=eZPAJR”Ù³©\Ö5T\Ð(4SG\á}sÇº\0\0\0©\Í\Ï\Ï\0E¡‘ (Õµj¶¶\Ý[¤„¢³\Î]Y™m2D’d… ™\riH ¨ZZ&`\0\0\0MzS\Ýù\î2f2\0 \0ÁÊ¼§2\0!ƒ‘ñk\0\0¥óE(((*\ÓGC±è–´R”¥4l\Ñø\ÏLøýh\0\0y3È‰ \0\0- \"X‹KE\Ð 	’®–\Ýj¨\rt¨\Î$‘-\ÐI*\É3‰ V„-L\ÉB@[BE-B¦`\0\0\0_[¬þ‡\Â\à\æ¼Ì™2d‘\0\0\Ï*y+€0|îŽ±2ù \0v>œl¦ŠR”ƒF×±\ëŽ\Å5T\ÑJSFŽ‡D\ì~\Ôøý(\0#< ‰ «,@\0[T\0U¡iªŒ\âZP\Ö\í\Õ®­¬ó’&b­²KS,\æ\"\é2º¶¤-¤L¤ 	&µU2\0	 \0\0\0\0¡\Õû|>žŽkƒ&L\É @\0 9žJò\'˜ðtxzD½ò\á†D\î;ñôš>Ÿ+JŽ“—pôñ¿K•öF‹Z)¢”\ÑM›;\'c\æô<õ9¨\0<˜\âª\0ˆ‹i!I\Ñt‘E	Pºª’E¶\é#}-¶%µV¦fp˜@!$\Ë[ª‘At,’bg €5mH@R$€\0€\0\0\0º¾þ§\ëø\ßN\\\Ì\\™!“$ˆ@@x,ü—yšK$	fL©\×K\\´hO¥\Êúr\å\Öq\ì\á\éœû.å¦žœ>¯‹_cÁ{f\ÓFŠhÑ³¢v7_”\ìü—vT\0$c\Ï&\0H€£VÔ„²$\rl$L«JºŠ\×KmR­]Y™œ&$[d–\Ñ3‹¥\Õ@\n@’L³ˆ„–Û¤„’(  \0\0\0\0½;¿E\Éú¾OF\\\Ì\\É’!\"\0|N“ó]`K ‰I\"\ÓKM-6Ö\Z].\ãK¥\Ôj\ÝË§Cô_\'_g\ç\ëF\Z:\'R\×À\êüŸgT\0x\Ìq\0\0¶\É\0¶Ý©œ­HºZ\éfS39WB\Ý¶%[¦·UmU©–q3ˆ‰˜¤]P«Y\ÄVÒ$ 8“)‰mRH\0\0\0@\0\0\0\04\ßvôûüß§\äú`Á…Á’!’ˆB“\í>^\àD”‰ZŠ´«¢®Šº)WQµ\Ò\èÔ»·K¹töp~\ãó½4m4n¾f\ß£\àuq´\0q3\çH\0\0-\"j\Ý)œ€\ÐV·mgd$])wm·kS%oziiE˜“38“,\æQVÐ …]\0\"H\Î$ÀD\Z\ÕR$LÀ\0\0\0\0\0\0\0Vû/@ú™~§‹\î\á˜\æ`É•É’\É\Ç\â;\Ï D•«Jº*è«¢•u].—F\×K¹t\í\Íýó[\'«\áô|NŽ… 31Á9‚­A\Û$…µWKS ©º\n]\ÛlÌ™’$]-kum¥\rn\ÝQE[s™1$LL\âBÐ¶\Ý&B\èµ$‰™mI”’d‰ WZA”’@\0\0\0\0 \0\0½\î[ONg\ß\æû8}<70d\Ê\ä„2~´ùÚ‘¢­*è«¢®ŠU\Ômtº]š].\å­\áö~þW+@\0LLqN@E²@- ]ª¶”[S1S9])wm·d[uÒ¨\"E\Ò\Ô\ÊIžs8‚\Û$\Z\éQ\"\è\ÉC<\â•2fg$ˆ´´kV$Ä\0\0\0\0HR\0\0+~†ºTT÷aô#Ù—£-–1\\×|<6H@R®Šº4´«£KMF—K©wZ].£I\Êòù[\011\Å9\0\n–„\0-*B\0PK«jFµT) gfZ»¨ºk¦­n\É.\ê&%\ÕT\Ì38 e®”Hµ\"\ÒÙ‰\"Ùžr…¡2’\0-H\0\0\0P\0\0€\è\ßu\Õ\0)\0(L\Ìó	dI®·<\å¶–]¯E\è¶4»*\î]V—R\è\Ó-cÅ y\ÌñN`\0\n[i¤\ÈZµ2€B‚j\ÛvTZ$™*\ÚA¾•j­«j@™3‰0»	™uP\0»[FqœÉ˜€$(ZHU\nI\0 \0\0P¶¤€\0®\Íu]P\0\0\0&\"®…2F·d‚\Ú	 ]—¢ô.—F—Qn<W>jP&Y\å\'$„ \0.­«ªIƒA2\0)P\Ö\×Uv\Ô\ÊE 3ˆMoBI­Ð«m­n\ÝQ$™	$\Ë8ˆR$‚ê²’-\×E\Õe$˜“%R&JKl’e3‹h€\0\nÚ’\0 \0\0£]Z\Ùh\0\0\0\0\0\0\0\0\0n^\Ó] D\çs\ç©DÌœ\Ù\ä˜\0\0PÛ¥\Ý@™’-	•¥H\nºkt][£)\0D˜ƒ[Ô[u´„^—}-\ÝD\Ì)$\ÊfL®’$¶\Ý$#]-©2BL\áœEj ‰mn£8™\Ä\Ú&b\0\0\n±\0\0\0\0\n½\Z\Ú\î\Ý\0\0\0\0\0\0\0\0¡)‰2˜L‚\0P\0 (\0ª·kS)˜.¨‘t™\0€­mum²K«jD’@\Ö\ê‹µ\ÕE\Ó]-´L\É\Öq3ˆ.«2DÌ‘­Ù”“]-Q$&d‰˜‹C9­–¤˜g1VªÔ‰˜€€‚\0\0\0\0\0\0®—K²­4\Ð€\0I!”†S)’\0P@B\Û$\nR\0¶\Ý$\"H.‹Y(Z‘$°\Õ\Ö\Ë@µmE³1“Mn\ÌÁ2º]\Öb\Ýõ«mI&B\Öq&V†sH‘t˜Ö­\Ð\0$L\Ì\â!T\ÎV…Ý¦s&H$¶\ÔÌ€\0\0\0\0\0\0\0\0\0\0\0\0\0@\0\0\0\0\0\n\0\0ªA\0(\0- €U@ ‹nš\Õ¥\ÕU«Y\É\Z\Ùl\Ì·fbµ½kamVqÌ˜—vDÄŒ\æ,¶\ëtL\Ì\à«H\Î%\Ñnµn˜\ã™PH\0\0 €\0\0\0\0\0\0\0\0\0\0\0\0\0A\0\0\0R­³0\0€ \0T’\n@£V\ÐD\0Ö·`-kv\ê\ÌE	–ºY$\È!\n¯K¾”[n\Ù\ÂfL¦%\Ò˜’$’‹m]\Ð\ÑÄ™‹m#8—K«umH\Ï9œA$E \0\0\0\0\0\0\0\0\0€\0\0\0\0\0\0¤\0\0Vš¨™€ ( \0 ‚AZ«B\é2‘hµi«­.­\ÕS(ˆ™]¨\\\æ !J\×K­[J»³)‰$™)fL¤ˆ™‹uº«YÄ¶Ý¦\Ì@\Ö\ì“<\åÕº[Ukfs\0ˆ„\0\0@ \0\0\0\0\0P@\0\0\0\0\0\0\0\0\0UµBf\0\0@E E´+Z5P’e3\Z´h.­/K­P’DiVÙ™!mt·V\Ô\Ëÿ\Ä\0,\0\0\0\0\0\0\0\0 0@`pP!1#\"34ÿ\Ú\0\0þ±¨®Â¸W\n\áTUxR¹•\á\Î#Á\àtÁ£\ÃÃ¢>\Z	\ßÅ¦\Õ\ïAði:A\ÞO$ø$r¤N±\àÁ¼ôg\Ãcyð8\Þzà¡¼ô#\Â ¸®<‰W\Ä\äÔ±>\î\Zƒ6vg-kY¹ð\Äõ.Ì…\ê|Iq\Ó\é\ÊqQcCý²7À\Ãyß²%ÿ\0#‘\r^N)õA1‚VH\Ù#\äO3`ŠG™d\Ô|…™\í\Ü\ÝRJ\ÈY•”\ì—øW1ø\æ)ãº2sc\ÇSO$\ïð»\\Za\Úoj‹*”¹PÂ§\Ú2Iýy2\'=¾\Ã\âõ\Ý}\'l÷#…0Nc™\á˜cõec[]™3f=Ž\\@‡\0\á6\ÐpP\Ü\ZH-=o¸;V\'˜¤k\Ã\Úø\Øó&# õ`’Õ¬\Èú\è\Ç+\Ý\Æýòÿ\0“:¦C#×²™	”xÕ–\È\â<ŠT«\îë ˆŸNÕ«V­dŸ\â­©R¥J•*T« \Æÿ\0nƒÿ\07QN•\Ñb\Æ\Í\Ü@\æ\Ä\Åò2M\'Fc}*U\ÚQ¸¹šr_rƒ}*T©V›Mqk¥½­/t·^º\è)DÁ-Zx—!\ì\Ã`LÇ‰Žâ¡‘ ’nÔŽv\ÕÞ‰$ô\ÚM‘\ÔZµz!bþ*ˆ\'Iø\ßjù4©R¥J´\ÒƒjÕ«V­d¸zºû°\â\ÔÜ‚½\Ã\Èjy/\è\íZµj\ÕôV¯¡%c›‹NCÀ¶\ë\îŽ\è$\àvœ‡´®¾\Ù\ã¸\É\ËG®\Å\î\Z\ä^\çxNü;}‹]˜|7\\¡¾û»4}™úkV­_a†»:\Õýð\è+´¯\ë\Ï\ß³¿­=Uv\Íý¸\æW–o\ì\àøqs‘cþ¸÷P\ß;Ó•-÷\'øQxú\Ã\ÜÔ«@\ÎüC\á\ZUº·ŒG0\ãj\âÄ‰I’$^ô\Ø\Ä÷—»@ð`Gð£þ5\ï@O®S\Z^d¹\Ý—¥\"öó/k:ö“¯i½¤\è\ã\Ìc‡w’†,\îCg\ä6d«\ã¾0/Žbøø—°‰{W±…{W²…{(W·h\â\Ê\ný/]:W8sÜ†,¥¡€Âˆ!B(\ÂürŒQ¹;\Éû1I‰4]\Ê)˜YL\ÙnM\Ù\Ð\ÜhX¿]\ØÌ•I¢<\Èq“cc5_A.$3)¶t¬DžßƒfºV3gÀ\Ä\Öt\Ïk^Ù¡1H˜1\Ã4Úµ}L\"h{z6z’U]jµjÕ«\Þ\à%‹\Óv°,\ÃŒt\0rò\Ù\é\åv\î\Îgw\n¥\\\ÎŒi\ÌpGð­Z½ö­Zxk›\Â\íPGÂ­Zµj\ÕòƒI@W&•*[PVo&ûSgd3,\È\Ò*U\Í,iN\Æ:µ~•\ï´ù\Ý\ÄÉ¸”\Ì\ân˜\Û\Ä\ëWÊ½\ím¦²¹t€A«j›\Ï\í\ì\\É±]‹´`\ÊEª•*T©W0±®N\Æ	\Ñ9¨©ß½²–£W¡ƒ…¨¸4:R\åœ\'I{BõÚ„\íM{\\™¹4©\0ƒPj\Í\Ú\á¶GºY5_l\Ú\Å\Ú\Ó@ Êƒ(ªT©R¥J¹“±­a6uß¨W¨\åû\ß\í·H\ÌÀŒ\è\È\çidòF£\Ï	lƒM*TƒPj%±·3l¢KŽ«\íÀH8\ÛbX\Ô0e\ÕJ•*T©R¥Jµ\í)*>pür\Ø÷0\âfzÎ­Ô©R¤\ZœYr6\ÔLYSd»U÷\0$}±<Jül•Â©R¥J•*T©R¥[öƒ¯\'ª\Ä5•J•.A¢]§‰\n›mL\å$²L\íW\ÜW¿h\ä\ã¬}¯*\áÂ©R¥J•*T©R¥™ÿ\0_UûøQ\á`—j\âÄ¥\Û3¹I4“E÷%\è‹\"h[n@£\ÚØ’&\ÉˆµR¥J•*T©g·‡3ªc¸6Ù™\êId”òoº/M\ÒfnLi»c(&\í²†Ú…|\Æ2ùlUò\Ø\È\íh\Ú\ìYy\æ^¨òm_\ÓÅ¾šº3®\Õ÷}ókM*\è\É\Õ}\éjþ‚\Õ\éµ}ójúûW\àV­Z¾‚Õ«V­_õoÿ\Ä\0#\0\0\0\0\0\0\0\0\0\0\0pP !0`1€Àÿ\Ú\0?þ-xÎ—\Ý\éJR”¥úö\Ñq–=\Êý¡–e¦W\ä\\1™i¤\ÊQ±\éºR÷ˆBq	¬®œºvù°»/Á~$2SN\Ó-/Š¢8¥\Ò},i¯F(ôŠ÷:Q’œb¸d\'Jb\á\Ô6Q2\é\Û\ç—P\Ý@Ÿ‘e¥\'\Ã4\Ä\æÏÿ\Ä\0+\0\0\0\0\0\0 0@!1PAQ2\"`BaRÿ\Ú\0?°\ä59\r‘þb8Sqf6\Í%J›O4ÿ\0†4œ`\ÒP¼¡t©².56”(F…QCÀ\á†x¤!y©¸a4\Ô^hQ¨¸P£þ^i*r©Sq\Â2\Z,5!FBQ¼úmŽ?h¿\é\ëø\Î_\Æ+ø\î_\Çz\è½t\Ü>=\Ø´\Ø*P7‹EFBhji7”jn>­Œ\Üa\r\ZŒo\Òˆ1\ê\ÂÑžp,4•4š\Â6\Â5>œ	Zl\Ø3j\é\î\ì\ÆI¨\ÈnšÍ¢„#\êtÿ\0G¬\È\î=pá‹¦\ãSQR…\n7]\ê\ÝÎŽ	!8APp\'	Bƒ©F\ÈB’Š\nQ¤\"/•(úmo]¿õ\ì%”…\"ø¸#y„o>M»\îÊ™À\\”‹‘ˆ1\ìEQ\Ã57\ÍB(ZrG \Øf®´vj™@‘\á3ò?ú@\Ïqcõ<§k9\Ôž¦ñf»{Ï± Š•7\Z¡BŠ\Í®J«­©…¬\Ô,)®)©¯ð\ÛZ\í¦P;„\×PK}ˆ¤©\à\ZMM‚±B±\Ð\æ¯v\Ñ*f\í7\ì+[W\á·\è;\âÇˆ>¼ZAi´\âši>¿HCkªù9Á‚š\ëó\ì\0P£i\Âl>À	5y†ðtõ®¨–ûCPjl\Í\r\n›	²}Žþ\Õ\Ö?S\Üzñ@Q¨¼P`(P\à”}®—Š\êþ\Ü/\Ú\Çyöƒ\åv\ÏÖ¯ý¸:~l\Õóþ*k\å‡ú\Õÿ\0·J\Í_br\n&¢„\ÐV}¦™® ù\à³Åšž=± ©¶jj/uµaƒS\ÜpEšž}p5šM\Ç÷@È«\Ç\ÎvI“\êE!B\Ç¬{†Œ\Í,q\ë…\r¡F°¢£¡÷@\ØD\åhµ\ç\×À0\Ê7Mg\ß4\Ø\áv°˜õñ| k7œ\ÇÝ‹H\Ä\Ñk®E&\éÁ\n,*TûÖ›HÀ®1\íˆQl©´\à5?\à¤_^/(P\ÞqŸðH´³\Â&}€Qh¸\ÞhpO¼kT´-m6Ñ¿ú¤X[+aP}xBVÕ·¶‚¦††\ã\ï\Z\'3\ÝV¾\ï{„O´­…l[B\Ú81‚.<\è*\n‚¶•´­§ey†Íº=û^ñ#\Ðm+¦\å\Ó]0¶œðVÒ¶±t\×L.˜[\ÚÐ ctOk´D¹l[VÐ¶7\ét\Ûôºm]&®“WE«¢Cÿ\0W@®‹—M\ËiL96”\ä~–þ?\ìi´-ª,<€\ÂWH®’é…±«hôb\ÓSŠ\n\ØVÅ°(w\0\rÀd-7‡‰Eš\ÚÀ¶±l[Å°-¢…ÀyN\ÖúNqw”>«\ái¸±\rV›!m[S´\Ý=–\Ç(\Élr\é›ÖŽ\è\ê}\"òh\Ñ\×B46\í+b\Ús¦~/\Ó~Â¥1\ÔhG_\éW•ý—öA¿u#\Â\Z\ßhj4\ßlj\éµtÚºm]6®›WM«cV\Ñ@%#¥\Ùx¹ƒûq\áB…\n*nî»©*J”)6Q¤ \Õ¹StJ:ka[\n\èK;y£¸Ô’·½o[\Öð·¸)\nE%n{WQ«ª\Õ\Ö®º\ÎGQÇ‚G„5Š\Z¡˜SW^;6ý0g\n2q„l•(¢£Ô	úMq”\0o„r¸ó²•¹Jœ ­g‘\Û˜<¢i56Ê›f“Y\áBŽK^‰DÔ˜AÀ\áqŽsJ•*T¢h£w\ni\èw)\ÚC\át\Ê\é9\r!òƒ@\å9\Êl›¤ð!BŽh68\Í\Ô\ÞL\ÜDrX\é\Â^PA±¤\Ï=\îø¨\È°\æ\î£\Ò:lt\Úós[òœ$pöÿ\0[„\Þ\çýQ†¥ó^\è\âJ6úr%‡Bò‹»­÷5µs~x-l\Ñ\íù¹®‹I9\Óc]4•<\Òa9\ÆxQêˆ”DZ^\ÖÍ¯o\ÎpÏ´*\æ\Å\Úes\ãÅ J\r\Ð9\Ó\ÅWZD¢#[7\Ìói\îœ\"\Ða*{E­l #\Ðj;\ã0¨©À\\·%IR¤©*J’·½Ë¨WUu\Ü=ˆŒ\0J/9t\î\"Qlbk>ý!`—pA+yA\àú\Ý9±p€Œó—O\Å\äJsbð%5‘\ç\Ñ9\ÒxBù\ãj} g\Ð9±k[u2Ž\Ã›µ¤ #\Ñj;\ãƒ4NsŒj} gžYõV¶1?\ÆF‰8\ÜØ  \Èôn08a\ÎA˜M<¶S[\Ý\ã&žM‚}+Œð…G¢k\á>Õƒ·°{¾8)\æ	¯ŸPL#ŒG¯{ pM¢Ðb\Ã\Ékþý10‰œc¿z1Û½iN2p„Ec B¦\Â(yMt g\Ò8\Êa‘\Óý½k\Ý8…¡E\Ã\æƒ	®ŸDó\Ï#°]7;ö[\Âþ\ËO±\ï\ë\ïŒ\ÂÁ„ pŠyMß qd\Új<\Ú\Ó#\Õ9ÑœY(T\Ü/4\'˜\×ó‰(¸›ºu	ðj9\r8[\ã\Ê\ÜO„[¦{ú—;j&s\rœE¡k¡<\Í_Ö‡¿`º_ú€\ÛBaÄ•¸-\Í[Ú·µoj\ÞÕ¸)\ã“™\à\0¢†Â…ð¢‡9„\×Ni[‚\ê\Ôªº‹¨WP®¡]B·•¼­\å¶;Wg\Ò\r+\\!oj\ê…\Õ]G-\îRq\É]G!«öƒÁ\áºmŒ\"€VnŠ…*hm@\×N	E\à.ª\ê¸û`ò\Ô;µ9\Óh\Æ©²PP¢ÁAt¢T\Ò,6[_i\ÔE\åO¼iƒ•\ÎÚ‰›†iSAi°^k*h}]RÀ3\Æ7>\ï\Ã6\nJ¢Ù°\"£š\×BSü€\Óýq9ÿ\0\\|`f\nz a\ì9A¨·\Ò\éþ¸€E\Äð#	´[bÁŒ\Ø8Ò»99„q\Ú>jZ¡EÐƒS…\Í\Ós¼?\èþ#þ´ž\ß#€\Ön@E\î\ÔúS\Ê*¨¼ð\Ï=¯ûE€øE¤r\Íam±\Â¡¢\â‡\ãý”\Ý&7Àµ\Ú\Zoò§\àŸø)\Ìs8dnŸ\Ý\åÀ\'<œC(\ÄPB‚‚…n5‹!E¤s\Úø^Q\ÓúE¤p™ƒj\r[VÕ±l[\Ú´X˜×ˆrüŸ\Ä\Zcs|`ò†™ùA ^\íO¬ƒ\n.„*T¢óÃ¡5\ÓC¦ixâŠŠþH\'\\4\ÜP\Ò(\0/v ¸ž8¡¸^-8\ãô\0\Âkæ¥€¢\Â37\Ç WWô5\Zd¡¤€¼\ç“\É8À¼\Ð\á4š•7\n[_P\ïR\ÐQ\ÓE…F&ø¸p…_ú”4‡\Ê0—\0©<xP¡E¦\è BÙ¤P\Ú(m<\Ê„×ƒl-¡t\Â\é.‘]2ºEtŠ\é\Ò[v\ß*T\çST\Ãð\Ô?£(²(kmÁ\ZÊšš\Æ=[u!WYEZ\Î\Ë\Å\0*·ƒ¸!QM}AE\çP^NX¤cJ›Š\"\ã’*mJ5>\Ð \ä\Ú\ÑahA€P€Td\0P9yph\îµ? žÍ´¸u~‘q9\Í\'¤¡CiBùB\ãCPÂhQ\Å\n=\0\Ô(<`q	ºƒ\åH[‚:\ÌþAøD“\æ¥À#«ôŽ¡9Å†\Ñx¤!C˜â†Ž#BŽ\é!\rB† [\æ\ïªT­\Äñg(¤\Òn4ŠEF€¡\Äk\n(.7žt•\Ôr\ê•\Õ]F­\í[‚‘’B\Üö®£WT.ªê•½\ÊxÂ“`F\Ó`\Æ¢’†Œ\\hTP\Ü}„©*J’¤©*}X¸Z3,…(#€c6\Â5?\éE€(¸\à\ÃA„\\Q\ÄB?\çF!`Á‹eX(o»üè ©\Â)8ŠWÿ\Ä\09\0	\0\0\0\0\0\0!\"1Q 02@A`aq‘#Bp¡3RbPr ’¢°±ÿ\Ú\0\0?ÿ\0›D–‰\é—*32^Nª­#jŸD\Í%&‹vb¬´C²\ÕO²±hY\Ä*­•\ZgU\à†}´GŸ¢o¢÷0\"!A\r\Ék>\Ñ\è›i±¶\ã™4Ž\Ùò‹\ÝyôR«§F~sLAË®ó\0¢d\ÑpôZ³;\Û&\ZOÁVyôb-0*¢¿ª\Ë\çV<ƒ,7\çûy9\Â\æ\ß\è\ì›XmF¶AÁYx*\à}Õ¦‘\è\ËYŠª\Ñ\0œÔ«bªˆP\"*µO\Ð\"\í»;ar×«\Â\Î\ëˆ8mQsA*Í’ª8Y=½\à÷×€7^Q9¤\ÆG[²\ÒV\Êòõ]\Ë\Ìy \Æy\ÝfÖ¿*\ë\Ð\Ä’\ÎgYƒT\íÈ•+\\³«W\ì(´\ì\ÝPNT0×ƒ°]\ãt]ñ\Ûp\Ö`;nƒx«F*054\\.\ÝX:Y1Q\×ñ+\Ë\ÞO ª´U\Z\Ìr\È\Çu\äU ¶©¢]UvŸF n9P\Û\è\Ìûe%3üùá‡£°h‰Q…þŽw|\ZªÐ³\Ý\ZöØ¼ã‚ª\Ñ\è¼{[\Ä\ÇÑ!n•HV* ‡´óQ¤x?‹T}š\ï9T¨”a6vC©ÁH˜l\Õ4Júnè¾›—\Ó+\é•ô\ÊúE}\'tSi\Û\Ý J•º-9•74)ÒŽŠt¿M\ËI\Ê÷u^n«\Í\Õyº¯7U\æ\ê 	U£_¶\Ó\Z\îaB@`3²iZ0\æ¦\æ…7ü-§\Ýh&7¢¸f­1§\ÙhC‘V):©²#¼²Z\æ­\Ò\ÉN³½Ô¨š¥¨F\çb á¬ù–«Zlñ\n,¶>T†ð¹õAØ´ksVZ-ZXŒsP\n.›¿óZsa=›¾\Öb` 5˜—\Ï\å®R7Ž\ïQðž¡,\Ü\nË¬o\×O\í¼))4a\Â;F£0¤V*y6nP2*;FW\ryü 7~4n–Ö›Š«¡IöNaY\í«\Û9…,¹¬»*em[TŠ‹³ðÒ¤\Ø\Ô\êG^\ã¼5i<Vq½xoŸ\Úo\ÕðQ\ÏC5ŠS96\\Wˆ\ßp¢\Ó\Ýg\0\ÚQgô¿\æ¢LI\Þ8ƒª\Óñ¸\í^\çö\íÔ›G÷gå›‹L\n\î\Þ-c˜¬÷Ž*\r\ï&\å\ZWÇ†\Íçˆ‘P¤ñ[\Æõ¾«¾\×jÀkt|òb\ã\ÅiW?Š…E\Æò«R<¸ñ\Þ\É>³~\×(RøN\ãr‹LFv“ž¶\Ï\Ü;\"ò\Z8«$\Ò\ÅB¢Œu*4.\ç¾1£¤-^-w%7\È+k¹\Óõ¶»\á4QŽ¥F‘\å\Ü÷\ÞJ\Í;ú«U\Ì+TØ©\Ñ<-ô^~Š\çôZR¡wU^¥Y?ÿ\Ä\0+\0\0\0\0\0\0 !01@APQqa`‘¡±Á\Ñð\áñÿ\Ú\0\0?!Ùœ§?Ž,±œ3Žyü˜\Ñåƒ”`\È†ñSS”¿w‹Å§8n9\"†\Å\Ýp£<f\Z/5\"*;‡`‰ñF\æ7˜Ñ©7Ž\ç`¨\Ì6š;\Ì9\'«•!\ã,ž¸Z7\Î:\ÍT6¨z°C9\Ýû¨\Ù\Í]¢„C\Ôólcø\Ù\n˜(ož Ø\Ä8Àf˜3\ÎA€\Ð\ÑC{Ž P\Ù=ƒ€\æp¡½^o6ˆo=3k,yŒ\"\ÄUl\ÍM\î\Ãq\Ì=\à\ì\ápyMl !3Vž\Äl…^A\È]˜±XZˆð\Ú\n1º\âˆ«\Ý2=ˆ\â\êJ±8…\çÅ‡×ˆ*c\Û§=–Š“9ã´Š‘†Ó’{A­ICc¢º;CQh\Ét6E	°ö:¿Á†¢ñ–(rOk¢º¶:¬:öÁøÒ§[ \'\Ôÿ\0\ï®\0’„\Æò‘>–\ruY«ð—x4©Ö ™$ƒ‚8÷0(ŸUˆ‡¸i@\Â\×\0D(=\æ	\Ã,M@¹°]à²†I´÷\à	:ƒþ\ëH‚& óð-\03\çöj4î†ƒdª{‘­Ú”žD2\ìlQ\ÇWG\î\Z—ˆY™\Ù\íB¦¢ók\Í=\é©ñ²q\ØA`‚9Ž8\ê!\Êgó?¯‹¨´õ£8\ìOv/\ä\ËSÿ\0o<…‚#\ê=\ÌD\Ïzá²†“Cø9 \ä‰††zF\r\Ã>Ñþ»T%–lž¸A\ã#%\Â^¿€8\r]\ç8þ-=PÚ¼\Ó}\èü\0dœ{ùø¼X(o9g¥¸,¿!\ÍA¤b>€B‡|T\à8M;Ôƒ\ëÜ Qdª±E\Ø!68\ã\Ë49¤\ÄD8ŒA¤a0|\ê @AÐˆˆƒÁŠ2Gb3ŠøøU\ÐX\èaÈ‘\Z\Þv\è1O\ç`ŒQm\ê\ã\Ð(¢3Ti0QÉ‚Ÿø\Ð\'h* k†ø=8ý&¦–°^v¢€ü¸(\â\ì!%ü\"oNrQ\ÙET!ˆE™Á‰\0?!OH¾\"<D‰->ô¼hŒŠ(j	¡T0\Ì <šŠ-²\ìø‰Hü§H0…\0™ƒ8>\ÜG10h\ê&­e\Z¢t\æÃ–¢‹p*QŽ8\ãŽÀ”6*+€¢£‡\Æš“ƒûg\Ê8\âƒ\ìøƒ\0(¢„¢9ª#’ \Ü|š0‡5t\Z1|a$\\xB$&|\n\\¡¡µEô¡\Ä\Ô\0,Zð!Z˜H\î|cXüMKC9Á5]ð°Í¾MZ‚Rõñ\ÄH‘\"DˆxŠ\ÆÀÀÁŽl\èeQEda‡¦4\Ì \\Ÿ\"`¤Q\nóp(68\ãŽ8ãµˆ\ÄH‘ix\Þv.<Hó…8D+E¬#Ž8ã‡…Ž†zŠ(³X¹\Ð\íVØ3L\âz³§ÿ\02#±Áa,d¨¢\Ú·i‡±QE¸\æòI\ßp1F\Å\Ì}B0­1­&\ÅÔ˜\ì{^zŠ.„\ÐƒrÜƒ’R\Ôü€°Çš¢‹£6»MÀC³X_­\çÂ‚×½%mqt\Ú\Ü\r	\Æ;€©\àU­B]€ô¨÷\Ê.«\\\Ð-#<X!\\P•Ch\0Qo\É{\æÀiª\ÕW»@qt\Æ\ÉP\ä¸\ãŽcq˜\Ìhô¤c£\Ö²\0{Á(t\"V\Èd½‹¡:\"údstd²D%\ß(ú-o\Ä+@p\Ñ1\Ð{ò*\Û¹d*(:1(lÅ†‹z7\â,\éÞ„½¨¡\Ø*>\Ôi\ØQw õ\Zwd­°\É[\ÑØ†&°\ÎH±f*lT4[€T¤9aDød þ&81\ã­,‘jŠ\ÅVŒƒ½\Òú\"r\Õh5.b\Æ?\Ãÿ\0f–kI‹ôŒW\ä/S\Öp°Zó†ô€\écBB\Â-c c¹\ÃÕ£\Õ¶Fƒ$TXl;Àwø¦0W\Í*À1/\êÿ\0UC`\Ä?¸5@|‘Ÿº“˜p\0\àu\ÂT\×8Xh6¡oA•#pI@@ýÂ 1Ä¶ô!o\Äoe¬ÐŸPOÙ€\Ú~ªý\Â\Ô!u¿“-¸•	{Sœªz6 /8šõ‚pRk^¡	þÈ˜?\Ä rR½PŸýE|\Õ\0>8Ò™%¨P?Èš@I0Q€–%\æ^µ\Ñ¿B›Šþ\Âss\ê5¯º9k\ÙsCP\0h¨\ãŽ8SYü\êG:?T\åú†c\Æö#dJ„¼\á@3…Ž:W@\È\"ˆ_b \Ã\ÎO\è\Îv|¤Ò§\É\0õa†a«Ž:‰)ñ?\Ìú,<\Õ-ý\ã?ªH\ê\ã¡\Çq\Ç\Ø\Â}c\Z—\ãø\ÈpB\Î%B]pŽ;DQ\\/q\Ñt`\Ú#À°•5b?œ€üI†a„\Çq\Çp¨L\å\î™A 2x‰F 8\ã°8\ãŽ8\ã€Á	`«?i˜J„½£Žƒ$e>\Z&¢€ \ÐD\"(¯\"„a0˜MÀq\Â²†ó‡ €\02c\ÑÄµ>#Ž8\ãŽ8\ãŽ8\ãŽ!`¨¢‹M1¼²V\é\ä\ÖH‡|\n‚)._ †\"W¨MªpŽ¡dq\Ô0Q¤a\Åzœ\Í> ¸q\ÇpA=D(¢±@ }\Ãú2@g¦!Ãš]Xš\Ñ2`ÂŠ(²t’bJš0H\Î\0\"‡(…b þ`\á0…Æ»£X @1\Çq\Çt&‘«QEQE\0€ASŒq\Çø2	P—¾¦\Ñ\Ój€ò $ù}\ZL˜0h(¢\É\Ò5„¦ #	\Ãû®7ª\'Xh)…D;œ_\Å\Úk(I\Ä<‚\á|\0€QEQET*Q\Æ\áAnŸ€^vg~!FÁ`ôcø¼ðê“&\r€¢‹ ‡l\08c—9†bñ<HBI2]q.¿\Ò\Ô\Ü\ä>¿\ïš\Óõo¼D;AU\ÄQE+\r[0½\"cú\ä\ìA\'Sq*\Ú,³¥–·\à¨4p4 \éþ”÷yõ@É“\rÀ+—\Z“>†BŠ(¢Š(GYFõ\Êcÿ\0 Q!€s( @JP\ä”rg¦ÿ\0\ÔjÀ\àWŸÁ–o‹\Î\Ô\ïÁP\0ˆA¡E }ÅŒ†™2`\ä\0(£ÿ\0n\Ûý`‘\"D\0’\01ð/ù|¸‡\Î\'yHKÛŒµAyÚž„T€\Ø•\ßcö˜<\' ±2d\ä\0Ý‚Eÿ\0‡5OsA(\è|	‡\î=ò¤ò\È$[r(rÀ¼\Ô\ì}±\ëJ\Ô^ûQPÿ\0´c¿\\\ZL›pc\Ü\ËÝˆ `E0ƒþO$!Û”TY¢“h¼õ@¨\Z\ÐDÈƒñ4ø<Ÿ\ãKýNV™\Æ`.¡úOŠg€ÿ\0I\Ã?\êsg¹|\Þ\ïFIB5V…†\Çx\ì\ÄóMŠÁ‚¨\Äf1Às‹\ÈBG=n\n\ãÜ8\ÞiX‘(„V!SQºZ\á–Nð\Z82@\Ì9F‡-E\ÐMãŽŽ%¶)lñ°U6¡zØ˜z\ç‹Þ±<g¦y‚£0\Ð\ÙÍ†ª.ÁÆ®±#\ÌD‹zÇ½ä€¨\È6\ãE{q\Çb6b‘’/5P\Ü(1y\Ëœ¢!üœl\Æy¨°P\Úh-?‘À³ÿ\Ú\0\0\0\0\0\0T¨ ®”\Ì;Mdû’2\ê\ÇÅ£\0\0{x\0\0	\0\0$€\0{\0À\0\0L.f\Î$\ì\Þ^«i4¯\ÂýŠ\0\r¬X\äHÄž‰³‰g\0sI\Â$€\à\0\0\0\0\0I$\0\0^~\0O„b;%\ÐSA’\ËZ3¢b<Åƒ\èƒ\Õó\Ë&\r\Æ\ÛÀj\à€@\0¼\0€\0\0\0@ €¼\0:€\Ú?wW\ÄÁCÀH6	\Û#\Û}‚\ËQ!Aò0m saø€!8ø \0\0\0\0\0\0\0%²À\rpÀIž\Ê¾\ÔM¶$„‰%&ðnm£1\Ï‘<ø`8\ëL˜@ øð$\0@$€­n\Ò GÀX0t\"Pø\"Š3ŽPhþR”°©g˜\é``Ý°\0X\Z{\Ã\Ê`\Èkˆ€\0\0@ i$\0 ‚\nÀ\0\àÀq‰C¢´ÀÎ ž£IC\ÉE´Û¿¢Ã¤¦šj“Ëµ¢@T\0\0\0\0\0\0€8I\0\0\0\0\0ƒ\Ð\0\0 \0Ip€úI2\äð\ÏÄ€x2X©1€\"½¯\åTQ\Ís@\0\0\0€\0 \0\0\0\00’\0\0\0‚\0 `€$@ \"m\0¸˜C€\Ç\ÅR€“î«…]´ª\'nI\Ø\'sT\'¨H\0\0 ’ \0\0‚\0$€\0„Š\0‚e€\0\0\0	 <@f0\0$º :I\Ã³m§ƒÂ¶£™·ƒÀ”“p€\0’\0\0\0\0¬€\0\0)&\á\0P\0\0\0d\Z´#B\"\×n\Ö\Òp\àq\0y›¼„NƒL{ mh$`\0\0\0$’\0\0\0\0\0\0	¤ˆ\0\0P\é\0\0\0\0\0B\Çù\0x\0c\ë$$€	`»(ž¶p\Ð\È‚L\0\0\0\0\0\0\0\0\0\0\0\0LÒ°\Z!À\0\0@\0\0\0\0\æ³\0\0\ÍÒ»	n„A%zy¡Ÿ´»L\ïrn\0\0\0\0\0\0\0\0\0\0\0\0€‚ ‰`€\0\0\0\0\0\0\0€\0\0ü\0>1?4\ÈL’Á84»‹\ÈÚ¶Ó’TO!A„\0\0\0\0\0\0\0\0\0\0\0\n’@\0!\0\0,“\0\0\0\0@\0\0\0 \0H—¡d7h2¹c/š­^\àl)–h¼\0.\à \0\0\0\0\0\0\0\0\0\0m@\0\0\0\0`\0\0\0\0\0\0\0€$`3A³[„¯D\r\Â«À³yµ\È]ÿ\0\0%€\0\0\0\0\0\0\0\0\0\0B\0\0\0\0\0\0D°\0\0\0\0\0\0\0\0\0\0C\n\Ð`/´\0d>1$Fƒ0Ë«.:ˆ2Ul\0\0\0\0@\0\0\0\0\0\0\0\0\0ö \0\0\0\0\0d€\0\0\0\0\0\0\0\0	’$›b\é\×.P\áT!k¬\ÊT@‚@\0\0\0\0\0\0\0\0\0\0\0\0P(\0\0\0\0\0I`\0\0\0\0\0\0\0\0\0\0\Çgúpó]ž„U\Ô“$ôf\Ð4\Ëˆ\0\0H\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ä„\0\0\0\0\0\0\0\0\0\0\0I.„±¶\Îd\Ëó¤•*\ÔS\r\\Žðd\0\0\0\0 \0\0\0\0\0\0\0\0\0\Ø\0\ØL¤\0]µ\0\0\0\0\0\0\0\0\0\0\0T >yi5+3#š±~XD«‚\Ä\0Y\0@\0\0\0\0\0\0\0\0\0\0\0À\àH\0J\0@\0\0\0\0\0 \0	.XŒSO>#0hW\Ã\ÍK€±ƒ€A\0\0\0\0\0\0\0\0\0\0\0\0\0`¢I\0h\00\0\0\0\0\0\0\0\0\0€aV\0lFû—3\Ìu‰{ù\Æ\á- k€‰$0`@\0\0\0\0\0\0\0\0\0\0lÀ\ZA À¤ˆ\0\0\0\0\0\0\0\0	\0\0\0MC(	©B\n§‘\Ô\äPi,\Óxû \0	\0\0\0\0\0\0\0\0\0\0\0aÀ€\í€\0\0\0\0\0\0\0\0\0@\0€\0Ï¤·¶6”B7§)>\n´¸\0I H\0\0\0\0\0\0\0\0\0\0€ \Ú@@\0\0\0\0\0\0\0\0\0 \0\0À³¡ œ\r\à\"S´Š‰]Ò¡¨	\0\0\0\0\0\0@\0\0\0\0\0\0\0\0\0\0tŒ\0$\0\Ð\0\0\0\0\0\0\0\0\0€\0\0@8±L9¸ý°)ƒ£4\0\0	\0’\0\0\0\0\0\0\0\0\0\0\0\0	À\0\0\0\é·\0\0\0\0\0\0\0\0\0$\0H\0\0ª‡^MY+l\\“8„ \0\0\0	\0\0 \0\0\0\0\0\0\0\0\0\0„‡\0\0B\0\0\0\0\0\0\0\0\0\0	\0\0›¡:\Äè¬¼Ä„ð\r ˆ\0\0\0\0€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0x\0‰\0\0\0\0\0\0\0\0\0’I\0\0\Ô\êdÝžL›\Í/ »§h¨@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0%\Ð\0­ \0\0\0\0\0\0\0\0\0\0	\0\01‘ ]Qð:\Þ\0ªÀ\í¥BJ\0 \0\0 \0\0€	\0\0\0\0\0\0\0¶ô\0O\Å\×i\0\0\0\0\0\0\0\0\0\0\0‚€OPZú“v€€‹SCfÛ€\0	\0H\0\0\0 \0€\0\0\0\0\0\0*@m¶Á.‡[m¤\0\0\0\0\0\0@2\0 \01I \0I&\Û-\å7j!…À\0\0\0\0€\0\0–$$\0\0\0\0\0\0\0-°\0\0\0\Ã\Òl@\0\0\0\0\0\0\0!…u²\0\0’I6\ÛxÞ¾|À€\0\0 –ôi\0B J”Óº\éžM¶\Ûhcv–Z@\0\0\0\0\0\0 \ry\ëh\0\0\0\0¤’M¶Ø›$6m¾\0#¼M´@\0’@\0€\0&\Â\0\0’If\nh’\ÊL¶üd†\ä\0\0\0\0\\Á.‘I$’\0\0\0\0\0+$’I6­H.F> \0m\0$\0\0\00€\0$’I$À‡h\\4¤’©/\ì&\è\r#’I$€\0\0@\éKŒš¨ˆ_…Ù‰\î@@\0\Ûd\0AŸöRI6[ 2|ŸB	E¬ \0\0\0\0\0NÌ’L\0\0\ä’I ^´I$’´W¦M¤ø\Ó$C\0\0\0\06\ÐÞ›IšI\0˜l\0\0\0@\0\0\0\0\0\0\0\0\0›³\0\0	\0$’«m$’I$t\Ã\äplE\ã\Ð\0\0\0\0w\É$„’&’H“(\0\0€\0\0\0\0\0\0\0\0\0\0	$Á6\Ñk»Æ‘-	 ’I$’H˜ñø`”ó`\0\0\0\0\í²I$†É¤’\0&P €\0`\0\0\0\0\0\0\0\0\0I$)¤\í°$\0\0I$’I$–P\Í\Æh$\0\0\0\0^r\Ûl’@I!²i$€\'\Ð\0\0\0€\06\0\0\0\0\0\0\0\0I	À€ú@\0\0\0I$’I ]b\Ú,\0\0\0¸\06\Û$HlšI \0€\0\0  \0\0\0\0\0\0\0’/€WO¶\Ð\0\0\0’I$’UÏ¢Ê´¶\ÕN\0\0\0E \0\0M¶\É$$’&’H\0\0D\0\0\0\0\0!€\0\0\0\0-¤\0\0Á\07m´\0\0\0$’I$”À\\\è …3T\0\08\ÒH\0\0m²I	$†É¤’\0\0 \0\0€\0`\0\0\0\0Id\0\00\0#¶\ÛI\0\0\0\0I$’I$\00ª2¸$\0\ÕI£Œl\Ï\Ûl’BI!²i$\0\0\0\0\0\0\0\0\0\0\0’“ \0\0\0m¶\Ú@\0\0\0I$’D ¬\Øa`\0,\×\0q3€›û$’HlšI$\0\0\0\0\0À\0\0À\0\0\0\0$’E€\0š\Ûm¶\0\0\0’I$ \0\0v \ÅJAVm@\0€~ m$d’‹&’I\0\0\0@\0\0\00\0\0\0\0	$’`\04¶\Ûi \0\0\0$’I.\0š—‡Áƒ~\Ðx\0B(°\0\é$¢\É$’@\0\0\0@\0\0\0\0\0\0\0\0’I$’³Im¶\ÚH\0\0\0\0I$’C€\'Î—õ‹\ÑGÄ\à=\ß(\0\0\0&I)’I$’\0\0\0\0\"\0\0\0\0\0\0\04’I$’\Ûm´\0\0\0\0I$’#9\ÈK\r¦\Ó0uy MµtD\0\0\0$’Bd’I$€\0\0\0\0\0\0\0\0H\0\0\0	$’Hi¥¶\Ûm$\0\0\0\0$’I*ð\Ë0b_“†N\n(\ÐI\é\0\0\0\0 4$’I$\0\0\0\0\0\0\0\02\0\0\0\É$’Km¶\Ûi\0\0\0\0	$’L~r§ºŽ›B•|Ž\0\0\0\0!I$’I$\0\0\0\0\0\0\0`\0\0\0\'\îI!$’\Ûm¶š\0\0\0\0I$Š\06ÿ\0‰ü6‡†|—{‹°OH\0\0\0\0	’I$’I$€\0\0\0\0\0X\0\0	a$€I$¶\Ûm´€\0\0\0’I\"\0	d­–ô\åˆ$N¬NQo»C\0\0-$’I$’I$’\0\0\0\0\0\0\0û.ŠI$’Im¶\Ûi\0\0\0\0	$’\\\àK‹\Å\Íp¦\Ø*¦+ªòò}\Ð\0{\Ä#p€)&’I$’I$’I$’``¡\0’I$’\Ûm¶š\0\0\0\0I$œt\0k´`\á<imøRñ]0\00Ç€\0\0i¤’I$’I$’I$¬Žº\n‡À4’I%¶\Ûm¤€\0\0\0’I|\0\0…`\ài e\0j\Å\Öb\0\0\0bÁ\0\0M$’I$’i6“m‘¬@\0\0\0A$³\åz\'\Í\0\0\0\0	$’ˆh_\éAnbR¥KŒ+C´ \0\0|@\0\0\Úm¤›i&<¿i,\ÈÅ€\0\0\0\È”	0ZD\0\0\0I%V\í¿H^þ\Ë>¨\Ï$†\0÷O€\0\0\ÒI$K\è„\n@$‚ \0\0\0\04\0$\0 v\0\0$’J\ÅÖ— ˜\ÒU¥\ïD—A×\ËÀ\0\0\ÖÀd€\0\0\0’C@\0\0	$’\0\0\0ðA\0\0$‘&’p\0I$‘Á~q>‡\ë—ñF2[Eáœ€Dk\0µ\Ì\0\0\0€\0 \0„’‰\0’P\0\0\0¬‚H$\0@\"A\0’I\0dMƒ¿\Ì\ØPl -\æš\Ý\ZFø†\Äf€$\0\0\0¯\0\0 H°‚\Ûm\0\0@\Ãd€!€H#	$’C2\0A‚ \é8j!ð3´\r\Ö#\âgø\í0\0\0\0\rõ\0@dH2\0\0\0\Â`\0’A&@\ÒI%\Û\Å)¢\n.\à\Ã\Û7\Í@.ò2Y\Å\n˜n\Øn\0A\0\0\0-µ’H&\0\"ÀDPH$oI%º@ ‚AT’M\Ä\0:x\Â$&š\ÈhŠ\'0/}³‘bDW&	\å0›\0\0\0\0/$\"@\"PL–Ý•\èÁ!£‹¿± ’)$ \âÀxE¨Ø»þ\ä\0o¼\0XÀˆùC\Ûp\0\0\0\0L$¢	@…eJ}\Õ&À`÷|À’I<óq5pJe=ßŠ»£t A…¹^2DŒ$˜€\0\0\0\0\0±0\"A	™2¡Xd3˜y‹bi$•ca,9\\\Ò@?$\\Š ±#ªH7@ Œ¸Z(˜\0\0\0\0\0ù‚Ô\0ƒfLDA–\æ\nbh\Ó¢I4aûR„’\Ö~V\á´hº!‡/„¡]`\ã\çQ\0\0\0@\0\0‚\ß¦@‘ “Ce†C9€˜·úI$§ˆ(÷ŠÁ[\Ï\ä\ÃÁ\ÝBR-\Ú{\Ñý\Z.Ð±Ì§3.@\0 \0\0‚	†\á	X\n+\"$\ÒNA”Gf&$’X€0A)¶\Ú0‘-»)\åÇ‘¯Áƒ4[Í‹\âa¶Ál—8\0\0 8\0 \àI\0I+_«›‰‰\Ý\É)%\0\0+¦jE&0Q1\ìOû¦’Ä€ a/Cm°ªAH\0\0\0\0À\0\à\0\0\0HF«\ÒwšyÈ“t \Çv›H&=Î @9<6“@h6¶%,ƒv€aI$ˆa@\0\00\0\0\ì\0\0\0’I$’I)\â\É\Ê@\0\0\ØDZ(ò¥µ<r›qÀ\Â \'•`0ŒH\è\ÙZ‡Xm0\0\0€]$‚\0\0\0’I$’I$’H6e\à`\0\0]O$-t€BG\âEö\Ê1¨y¶4x¥öð&\äŽU\ë\ÑN$ \0\0\0\0	3\Ý\á$\0!\Ýt€\0„$ û	º°h¥xÍ€\Îe\ÈGAB]i…·¢¼<v,$€\0\0\0\0\0\0\0H\0\0$\0\00@œI)¼<\Zh\éd!{0DÀ\ØZ\Öv3\ÂEj*òD\èXL\0\0\0	\0\0\0\0\0\0\0\0\0\0\0\0\0Y\0	\0\0ƒÀw\0ZIÓ ¸Í’Ž\Ù)‡$\Ô:\ç\Å&—4\0\0€H\0’@\0\0\0\0\0\0\0\0\0@\0\ÎJ@ =ŒAÊ†`ñ:*7kd„™\Òn¨xetS`û6Â¤\0 	 \0\0\0\0\0\0\0\0\0€\0°š€\0\0\0\0\ï$z\Ñ\Ì\Ó\Ê\Ø\à\Ìi\è1|#ÿ\Ä\0!\0\0\0\0\0\0\0\0 0@P!1`AQpÿ\Ú\0?‹§³\É\Ç3b\Ð|\ÜdÚŸ®C.8ö,G\ïC\Ð|aK€Ñ§\Ìx\ÇƒC#G’„xE;}\Ü>õ\ÜX§F8,G†1c\Æ2a\â,óÀŽŽ®>‚\ÇÁÛƒ*ž…>ƒƒõ±Ž8\ãŒyÆ…»|\Å\n}Á\âl\ä\Ç\Ù\à¨\í\Ó\Ã÷¿€:¸\ìr}Íœ8\ã¡ÀÒ‡Gìˆ9Ž.ò4rt6c³J…\rŸŒ|ô»\ZY0G_qn\n98q\ÑþûN\Üx˜04vNF£gn8r~¨ö.\Äq\ã÷À\ÅCF-š;0\àp?Ëˆm\Ç\Æ\ê20l\àÛ£GG¡øgkKc\à:‡w·ÀÚ‚\ÌSü\äô~0ð¿ˆ¢‡+Bß\ìÁ\Ì;\ìü#\Ìlü“\ÈAf8ùˆ¬\à[Žžœtt¾Y±\ãðpP£§txžg\æ	±ñÕœ\nldGÁ\ÃFÎœM=Ÿ˜lxO\Î:þ¬lu<_óM	ø\î\Ï!\æ=\ßð\'\â¸û¼(º*1\ÇK‹§óÏ\à|q\ÕEB>*\Ï1ƒôÍ(ú‚‡J\Ï\ÜQóU(¡±N•˜ ·F\Î\Ì8?dw?Hll\ìžF\î?”|G\é«Yp\ÒÁ‹J(¡Š\ã\Ér=\'ëŸ¼26\à<L=T?\Åž#±NŽ†U<›91\Ç÷O\Ý8øûÁb=N”4tl\ìÿ\0j22,Ù§“Gg\ë¸\ã\à\èô!ùôF„K\Z4hÑ˜\Ìf3Œ[9~¡\íûF\0`\Èb¾{ŽŽ?\01\Çb\Ö\r~\Ñ\ê¨ñFƒù\ØøN?P*\ìRŸ\æ‘\Çq\Ç\ã;q\Çq\Çßª(_\Ç\Ã†7~ó\á¨?ðÁ&§\äb\àû8ñù‹ä‚¸˜aÓ\Úý\ê(°	H[\n.8\ãŽ:}•E\0bD\"EQEP~#È†8\ãó¨¢ˆD\"\äÿ\09EQE”QE^5…l÷F(¢\âƒ¨Û†	ñ¨¢Š/ùª(¹Ž‚1E\î§g€·N:?ó	\'Â¢Š/:úŠ(¢À¢cŽ8\ÌüÚŠ(¢ò<8t`¡—	\ê(¼G™úcCá¾ŽŒ\'ª€E\å<\ÌQ}ƒ>\Ã\âi\Âz(½ø5`/s\àv,\Ñ<€‹\Öƒ¾ðž\Ü~š‹øF®\È³v\Ïwsýk\ÐÁ°\"Á\ä»Š?\Ð\Â<gõ`hó<œŠ?u|3ÁeEŒ€pg\àèŒS„8)Qÿ\0ÀO”X?\Ë#ôŽ-\rƒbÍ¯\ã\Ð†5ü\ÐÚŠ/Kùˆ\à`ƒüR‹\å\"\Õ(²¢‹Û‚\Zu¨\n\"1ò5	tÁ—‘\Äl\èCôÁ§\í0H`Á¿\ÎG\Í<\Î]»`Á‡\Îþ02_˜ÒžYƒñ?Z~ð ü£\'õ	ÿ\0¦þ\ÐÙ¡¡cg\í1Fa\Ø#ûJ\"\Î†	ä¹ŒJŠ(¢Š(¢µˆp%ø]— \ä\à`\Ã.\Î\ÉF^öONŽQdm\ÂiR\î<\ê/†>X·£CNÀ\ÉÀ\äù.§º‹\Âã·—\Í\Çq\Çò†\Ç!\Æ\×T^§ùðªq\Ñ1\Ç\ãt\àù£ \êx,¬¯Sð‘°v}ÏRƒ+bˆxcð(¼\Î$_„\áE\ädEÁ`eYø\ÂG…ˆ\ã\'?‘ýÀ_\ë1öt0:.Fª<QP\àº8ü¿œ8û8\ãŽ3\éúü¼®cŒ:Ñ¡”ügCûõÝ¸ð¸>\0Ã\Èp¢¡³gÀ\èÛ‚‡­\ÚË‰ýø_\Ì\\Ž\àRÈŠ…\Z4([Š,;6lq&\Í;4(Yö¬¸\à::=5\É\åQ\Ú\â©EgC#‰¥n<ˆG%£ðQ°\ãŽ¯ ýøAò\rªT,l˜ôx¯ø\Ç\n+V¢„Ež!þ\íøEÀŒ2-Z³\ìT¼\'Î¢ÂŠ\ÖQQp\Z>‚‡piÁ!U…C\'¢‡g\Òý„CDcjþ\0 (d\à\ÅB\Çc\È\àlCG\à¸ý\î8üoº·¥±cÙ£\0\ä¢\èb\Ñ÷¸\ãŽ>\î8ã¹\à2x‹@±À\à\äñ<Pÿ\0\Zü\Ø\æ`€\äÒ†#*6¡\ämÿ\0B3À`\Ù\æ4aÐ‚\Ô6ƒ>µ¡\ÈqvNM(t`£“C\'ø!ƒ\ÙeEc\'gˆ\Çÿ\Ä\0&\0\0\0\0\0 !01@AaQPq‘±Á\Ñÿ\Ú\0?[m\Ù8\r²G¸—bo¸x^®\æú™/«\Ó0\å·w9&|t\'\Æ\Ìüƒ\ä/¨aˆw„\à™\Úzvb ²\ãg†\É>\í½ò™ ·‚x)lEŽ@D“0¶fÞ¥\ïû¾ø&y-\Ù$²\Ïëƒ–\Û\Ë\ä|\çø%A\Ã\×\Ûy\Î\Þ€gº\î²{^ø\'ŸV\ä6òý¦É·%\äw\áœjz‡PoywŒ\ÂY‹c¿a\Îñ\ì²ež^\ÚÜ–yx|Gœ\êy9Þƒ‡\Ì1.6{Í±6\Ê\ÞNG\Ú\ì\á\ï/‹\Ú\Èl\ã½\Ø\ÄK\Ë&\É\Èr}Ë‡#\ÜDð:’¬œýÚ†fpx9&gƒ§m¶Yyx|{ð§\Ä3=lôœ1c«až-\á¶\Ø\à¢=\Ñ7†Í²A>\ì\àl\äpÍ°\É&\É»p\×=\ål<=I\È{Cl³w\à<\n^NT³Ñ“Ñ½o/A\Ëo€6=.„}‰~¤ÿ\0b	?©ö”‰\ìøA\Ë=cð÷Ê”6\Ät=JeÀ;,Ã„¾¦O{C\ÆÍ–\ßS0t¶L=\â-\îÈ˜^\ÖD\à÷s\Ëë†\Ùg£zw—\à™£;›z&x}\É\0\Æv^ü\'ÁÞ‚Þ‘—xx-»Á\È-½\Ù\Ã!\áz&ö\ËB\Þ3\á7¤Í¼Mœ$Ã\'\Ür}\Ä@7alŽ†\Û\Ãòž´XG\Û\ï\ÈñÚž\Ïgƒ|›oA<zž†\Ò\Ã\ÂL8\Þ\Üox——\ìpd\á\í0ö—d»\'\×\Ð\\†\Ò\Î\Ö\Ò]¾\â8\r÷Ã‡Œø¯À0ÿ\0\Ñoz7ýOÿ\0zƒƒ„ù=ºU\î\0Œ‚^V=\Ãl“6\Ì<·¶Ù‹Á\Æ\ÂygÔ¥\Ã\ÉpFd\Ï\Øe\í.üo\Å8|ù\ßH0\Ã\Èô)Y}rt¿\r\é8	\é{³/V\ÃÀxÙ‹Á±\Ã1\Èp8Ý¶d\è<vK[;L\Â\Ùì»™\ç¶lL!–b=[\ÓÏ–M½[\áxc‡\Ï\Þo@ø^À\çü†xy\Ûm†Ó‡d“†=I§µï‡¿\0[¼(&e—s\ÉFcë€‰\ä\r³;Û³\ZN–ô2÷›¿\ÄðqºO¶\È\Ã\à÷\ëß· ‘N‹\ë\ä;ÁÕ½\'%°\ä¶N\Ë\ÚÝ³““€ˆf\Î¢Y\ãm\ïÀd\àùn6’ö‡FÍ¶\Ä\Çü?ú>vý¥¬®¬“\×þñ4\èú½WbÝ•is\ß\Æûð\ïSó#Œ²öŽ2L\à{OyOAÁ\È\ï\È\Å\Ù\å8gó\ãƒ	õl\Í\áœm³\Æ\ÛÁ?\á°‡\×cûºv®teÿ\0\ÒUu\è`€¶\Û|ùG\ÃCc/&\ì\ÙfpKÀpGx!»¹\r¼¯swA#Às\Ép8mžv\Þv\áÿ\0_Ãø¥¯S\ëõo\Þ\í×Šó\Û\\ñ\ìyO	\ÔtŒ2„™—ƒH8x\Þ28C\Ã.ò\å¼l¥¶\Øe\Èa\áxo&\ç\á\èzw‡ü\Øm»Y\èó±$Km»O3~q\Èó\ì·x\"Ym·\à†-\å\é{K\ÃbXo¨\È\'—¹\àô>ü,‚;k?\\-\ãÿ\0òÎ“‚,²\Ï	\Ä\Î{\Ã\ê!—r9Át\àòS«m™[,´\à]‡½¤Œ–z#óv\×ò\Ûn\Ùð]Ä¶\Ø\èIŸ\à‘\ÐðO9\ÈxÍ°¶[a¶\ÙC(m\áb\Ò`Ã‚ó“Á,E°\Ûlòy^‡\æœM¶\Ëqüø+&\Ûlqÿ\0„K\r¼“Ñ‘ÁnÍ²cƒ‚%ˆ¶\É\Ë&Þ­›,\à–q½m³}[Õ¾\åù£>\ï‚}\í¶\Ø{ÿ\0‹±\Îóœ\ä0\ÌAg\'A\ë†Ø’I\ío«&<>¯¹;^º7¡\ê\Éÿ\0am±\î\ë\ÞvÞ¡\í¶\Ûa\éùgNs\'\'Y\Üd¶\Ã{³ “´¬›µ¶\ïd\í·x/–ÿ\0§\î9õ|Î«çœ“=\'gk2o»c½ÿ\0a<	”1,9=“e\é+oY6\Èõ\r\él¥\á³Õ½gù±Ð“ó†¹3¡n>yo‡\ÙdEšp%œ\É_seœok¶\Ñ\Â\Û\ÃÁ,‡\'¼dÁnKI‡\È™\Ü>\Ù\Þ6\Ûm‡üG¬p\Öp³\Þ\Î8:_pö·´û˜Oi\á ³—…\Þd\àõ=;m¼\ïøÿ\0W=\Ìm™\æ\ì\ã†õd1ÂˆK\ÆX\Â:G¹³ƒØ†z\Ù\Þ\Î	\É\ç|Ó¼\åŸ\â`\ìq¶N¬³«gb\Ûx\ÑÏ™–yw-oND³€\Û2O»9{3\Üä§‡\ßÀvf.\Ë\'~‡Ã¿ù»™\Ëi\Üñ†¹gF\rÿ\0zHƒ·	%\ãx;O\0Kx/\ÂL»\Ã6K\Þg\Ô\Äv–\Þ’\å³ðK\ÅX\íºt}Ç‹\í¼\í³Ÿ1\é<%¼nð-’H\áõ\Ëxo0\ÌÝŸ|¬\Çy\ì\à™m’b1xf|¯ùGO\Úx6yoK\æ¾b\Ý\à‚Ü•ú‡´¶\ä\ÈÀ·l—\"3f\Ë\×\r\áf%\í\'\r\ï\ãf\Þ>\æ~CþÓ§øõ¹\è@lº\ï\Ê\Ë8m\êÎ²9\r÷g,§½œ™a·œ‡½\ï»\'\×/¸e>\í¶\Þ2~Kþ\ÆBo9e¬‰Ñš\Ë,—\í\"ÿ\0\ròq\Þ\Ð<>\í¶9²õ\ËÐ³z“—\ã?3\ìe¾¹€,:rA÷,õÀðþ\Üe—õHz’ú³ül\é8x‰&·\0ƒŒ²\Â\ËòŸ\æD÷\Ö;p\ÞÖ°\å²\Ëg‡·Ï³\â~^\íl³£,²\Ë8\Ë \Ü%\Þ\ßÔ§Vdø§Ó¼\çX,/\Ô<?¶(þ®—\Çø—-“¡\à“Ã·o˜\Ëð¿+ò¿ñ¿Ž\Z\á\0\Îr\Ë,²\Ë,³®h?Ä‰ï«¸>\æ\Æ\ê\Û\íƒú‚ôY\ÆO…ñ¦É–\Ï\É$\ï2OiONø2\êü\âý\×#ø\Çó\ã~V\Ë9\Þw–ŸÓ©{6ÿ\0’eøœ…ùßý™ú™‡\èddþ¤ý’\Þ<a {Ž¼\ä‚\ßù=\å½Kú”{³Œ\ØcŸÐ‰?¶>\æ?”¢\Ï\á|rLs–Y\ÂA\á\àøFúˆ\Û\ÔIðX‡Q¯e‰@l<¹~üy,ÿ\0lÿ\0lÿ\0lÿ\0b\0ú\ã\Ù!;œS\Îÿ\0vY.#¿\í\ï;C¦œ¡ú‘k\êf„‡²Q\ìñ\ä7¢\ê3×£ú\ÆO Ce›Ø²Ï€ø_*m™-¶\ÉÈ›\è\Ç\ê\Z?¨€3\à™^\é\ßS\ëõ÷:ü\èemö\×ò^\é·y?ú°þÚ½`\ïsÏ»Lz^¡‡z¶ú¿ñŸ\ç~w\ç~w\ãaõõ`z“°…öÄ dV<\ç,Œø/FX\Ú\äÅ‹?—{²U•µmmmþ¡\åZ^3Ý!a2}Á:!Õ¶\Ûm­«V·{yG´O÷65Œ\ï(…¹\ÚXGn-/ø±ü\àý\ï\Þý¯\Ú\Óû û¿Y/¹/¹þóõ\ÏðKz½³*ûøÁ\ßy~û^™\ê|oÿ\0W.»Ô­ž|y0€\ë\\—X\ä{K¼lw›\Ñ\Æ^¹m\àð\rõ¬ñ–Yg•\ë\ì	\r‚RË¾²\Ý\Ã\æ$t·	o†`u®CÀ@=>ºúð\ãe…ž_V¼7d\á’\Äpf\Ã\ÛÁf\ÃüÎ¾¯-|3×¡ ²Ù·\Å¾v\Ì}t\ëj\ßØ»\Ê}Oe—\ÔŽý’pž\àûm\è&y´\íÀX÷l\ÇÝ¼\àƒf\Ü\à½\ã²]ñ\Z\î\Åzý;jK,¶«rc³;u.lÞ¥üœûðöŸ»6²”®\à;\Û\Ú~n.%·¼»q¶ð\Äpð\Úd¯gAû€>C\à;K\Ã\Ö=´Û§\é:¾\å\Ø\'\áw\ë\ï©–M\ê\Û\é\á‡h—;Xr+÷\ã\îe\Ëz\'‚È™™\Ü\ïŒ?«\å¾3Ì±\é~\Æi9‚lº\ïN\Ý\ß\\\í\ÙðvñŸgV\ÎþºM\ï/1\È=¢1:\è>I‘k\Æ\Ä[=C0Bx[d\× \í\á\åùo\Î2,zWÓ¯f¾ºC1\æ\rŸ\Ü\0a\ÂoiŸ\çV¦1žð‰·¥]z\ázž³\ä.m\Ûy&\Ùzˆ\ïz†ü.K°_RýÀ€|¦2u‰\äv\é:\'˜\é\é\0\ÆWß¥’-mþ/\ßõ\0Ã¬ù?CÁ¼g@S\É8f½J\ï\á~³ý¯\Òöý/\Úý¯\Úýl¾\â\Ï\è‡÷÷o\Ä|\Å\í:\ï\àu–\ë8§”w^ \ÌüZ÷žŒ<\È\Ë?³Õ¼òE\ê\Þ\r‡B‡»øÛ²[\ÖY= ôÁ{\á~þ\ç\0\ÆGÔ‹6xyCß¬2?Î´XA\Ý\íñ\Ï¬›tgŒo®†t¸õ=\Û8g¨\ç8z“\Ñ\â§ø&7´t¸@|#¸ùN\Æw\Û\×OüX\Î\ái\Ù\á\Î^°œ‹8YVM¼=G0§©ˆŸ?nñ3Œšûño&Iû\\zHûŸ!ò9\ï\ßË—®K²PA\Îmœ<mžó\ã_H^\Ï\Ï)\í>3¯\È}¾Oz\0õþ\Z­«e\à\è\Ë<)‚%˜M›\'9Yð±õ\Óü—¹=Ÿ\èw\ì\á\à\ã8\Î2NBYd\ï‚\ØorXp\Ë ,–zw†\ß2- \ì\È!¬µ\ß\îHÁù\'\Ç\'»½;ÀÙ¶Y6AK€\Þ6XÅ°ÁÀOk6fd½ì„[ð°\íþ¿\Å¬‹_\Z\Ät³w÷ñÏŒ€\Ö]ž²Cg~÷²K#\Øxö\à3Ý†Áeœ,²K>2À\Z†¸l\ë|hñþ-ŸŸfto@#µ»Yd\âÈŒK88P\Ûoõ>ø\r\æeøê´€…«‡s‚CðRGÑ»{v~<3;\ÐCm¯@’ô²	›a‚eÁõ,1\Ã\î[eÂ—K\ä\Ï\0\å§hrŸ\àb!Þ…\ß8\Ékü\é\ïó?³\Ý×‡¨\àxÜ‡yl±ô\àKÀ¾¡\à‡{f,‰8<ƒz_\ÆY\áC³ú\áùe²wX¼/ó‚K\êl}Ž\Òw{\è-\éŸü±œ\é\Ã\ß\ÄŠ¼‹^	ð<\r\\{\Þ\ì8\'\Ô	„8<ú\áøÁ\'‰h>Ye\Ú\íe…\Ú\ív»_dcÜ4°~ý¬€\ëw;ø\Ç‡Mðcû~·\í~—\é~\×\é÷õÁñL\ë;×§,³Œ\ä‹ \íivrÎ‘½¯¹;pvcº))›e˜\'ƒ\ÈðG—À\ë´œe–te–s¶$þø_¨±ü—ü¿.µWR\0À\á\Æ\Ï\Ù\'7\ï\ÊNöK\îC\Ñ+è–”û¿{_À^˜»ø¯¶‚cYž¼g8x\ÎN\0<–\Ìx-“c\Èoxû—G6X\ï\'“‚Í‘$ñO®\0£¤=^\È/²‘ôKú”ö\Úô+~\Õ\ê\ïy\Úõ\æ¬^y\ä\ÆzNVD86\Ì\Ôðe‘œ3´s„ƒ·œ†b\Î0„\ÄpxÞœ\ã —9lñ\í\Ù\é!À—)÷\á?\Ëzr\ÎŸ)‰Ö½J\Ûe\åà³€\í\Æ\Çg\r\Øl÷¡\é6\Û&\ØoH\éLð\í³Á&ys\ì\Ã\Æ\Þûóž·ü½Ç…iy\ÏL=\ÉZø‡œ\à\äà½¡\í2‡8+e\à‚H8}\Ç	dÄ¶8\"\ÌC2\Ë,‰\à\è\È8|\Ë\0i<}9\'ƒc\â?xÏ‡({´\í^\á\ém°\Ï{ ™™m°\ä<ˆLI=§½–L93¿a!\';g¶[/^xöŸ®D\ìõ¶xvÞ \Øs½—s\ã¯\ã\È`ðß&|Á\ÆL\Ë# \ïg\È,†ÁdlD\è\Î^ü°\àg\Ç9=¥\ÞDòK\"X“\àt„q÷ÁŸI\à/¾¬Àú·nzD½¢=ÚºüO´!š†ö\ÇFy~@0\ë´t\ë\ÒÁ%œ†\ÉÁ\'\Éd{\àpdC€²;\Ùe“gx²\Ë,³„„\ïxž8\ÛbY~\0\å·i\ß\'¸ð\å–td_sl\Z\ägò;o¶`Až¡\ãfÞ¾«#\âÀˆˆœ¡w\Ûñÿ\0ûvð|a½‹ï¡Ž¢{\ßñzN7¡“dAÛ†\æo¸¶8	2ƒ¸»¬„!g;F8gk8$\á7\' ‡´\Ï\à|‰\Øú„=\ç¸<™\Ððu\Þ^Œ\Þ(B‡ûû8b\"#\Ãi;øð\ØN„ö\ê{\Z\Ã\ê*º\Ù\ÒO$&xû‰\äŽ\ç½œ\ï	‚=\É–u\r\à3€›¼Av³„\å!f\ÌðpÏ‰ò³\íA÷3\Õ\ï<™\Ð3¨GDDDDDp#[ó§\×\0	\é¿C{ž	\àž6xvÞ“Á\äcHe;ng\Ç6{K\ÆöˆÕœ\ìË“l²½7\ßÀIœ>Éœ\"\Òõˆô“\Ûß“/OK‘\î\"\"8\Ã\æÿ\0ò\ÈÃ‚¸GcÁ\în\ÉÑœœ$‘\ÊG~2:“€Œˆx^\Ðor%¼’w\ä\í{³·ß‚ð­ˆ»l¦=*!$ø^¼\é:² iÏ°!úa\Ë=ž\'\Ù\Ðôˆˆˆˆˆˆˆ\àq\ÞŒH‡‡\Þ\Ë\ØK¼eõ\ÐLIg#ilð‘\È <}ô;³P\à±.[&\'²	•õ\ãb.K¼\çH\ÂO[9~½º,˜¯²W\Ôÿ\0ÿ\0N[o¶0Î‡@	DDG\Ðj?<>\êwh«\ï¨s„³Œ²#œ1\Æ\ÛlCÛ‡YwI\Ã \Þ(vHõnF\Ëg³†\É\Ãxa\Çr\êM\ã\'\ß!\Ã\Î\ÏFY\ÐùÞ„\ìa4ò7±Ÿ\á(ösö}²+—è€÷Rs´D=¢8=p7¨\ï\ã\â8xõ>Y–\Ï¹\'\Ü1\'%›0-nñ\'Exm–	Œ\Âbx&Lt$ó·¾r|DøE=Nvž‘ò€GnU%¼{B=¡o¨õ!OV>ï¸ˆˆˆ´/©Ÿ`\Å=‹\Æxƒl‚§ƒ\ê\Þ2\Î\à”^\×uœ3`‚KÛ\Úa¶\ïoÁ$\ÙÁr[3ÉÄ“ðB\\‡\r\à\'´\ÌL\ZEc<œe“ñ‡=@÷\Þü\è\ïëŒ³Œ²\Ë,ø^¶Wñ\r÷c\í¾\Ãfö9+«yöLK\î¥\ß!\ãg‘3\ÃmžöA}ÃŸg&Ù’\"NöDY%”\Ã2Jda–GIýYÁ\î-ž&<\'\'\r–fúˆ\à™ò6ù=Ü¿q\ë1òô$}²>‰OS\í3ðHa&o{a“´D¶M¶\Ä#†\Ä\Ò\É,±„\Ù\ËÔ·„\à[\ÃÁ\Þf\î\à!\ÂAÇ¸m‹º\É6c‰•²\ÌY\Þ/K`\Ø8>º¶\ß\æ\Ó÷aì††û‡û¿kO\í¶ž\r/\ÒG\îý8¿)D¬·Ü§\Ûð\é\\·\à¡\Ëx3¤»C\ÃpLÉ¼’i9¼#\Ë\ÞN>¸12ð\Ûl\Û\'œ\ÛIVC´\Ù¶Y\Ö-–\Å\Ö\Ö\×öý/\Òý/\Òý-mzÁ\Ã\Òu\ï$O/<</rA\È\'Œ\á–\ÌðK’\ï6\Û)G=“>¤½¯N³Â¶ð¡–·l\í\Ã{`²¯»´\Þôy8\í¿ó\ç\Äz\Î	<OQÑ\'fOIwo\Ùg\r÷ní›¼¬;\á\èx#¼d’ú\áŽ\Æ[\×@7\Ô\ßplD<8zŸ9\Ðü÷¬ˆ\á\'—\Ëõa$ðr \Þœ,C{˜\Ïs9\Ù\à.ðr“\Ãr}Kß¡lq\êg\ß‚^\Ý²xg«:ò\Èù\ï„äŸ‡\ÈO»9\í²;C\âRœ6b\ï\ÊLC€cÁL=\ïÿ\Ä\0*\0\0\0\0\0\0!1A 0Qaq@P‘¡±Á\Ñðñ\áÿ\Ú\0\0?Yr\î$t†\Z0t‹\r%\ÇxN\"@›ML\â$g˜˜\à¦\ZºV8wÉŽqxLV=¢$\"ýI\ÑrújmÁ’bB±³x8T¨b\âË—r£¤¼&	p„b@Ží¾sH²\å\Ë\×L8[.8©´Xk\Ð\Ä\È\ÇYX¬=<`\ÚT#‹Ã‡´}˜\Å`\"t™&é³‚Ü¸\â°\äÀ2õƒxrF(µ\Ã.¥é‹—˜¨Ë‹¤pM¡\Æ\î6B.N¬»\ÅQ0e\Ã\\QŽÙ¸3yQÃ€À\ËÀ\Ö/¼.³¢\ãõõ+¤z¤\ß*iƒ¬eÁŽ¹qÉ´¨`C;Á\Ö\ß6Æ·-EŽ\Ä\Ò2 FT\æbCxm1†Ma±3\Î¤E`ô‘\Þ9#\ÓxX¸2õŸd#“M`Á¼\"\ãxâ¨Žn\\!6Ah—†T¨ G\'@\è¸1Œ`@ƒ+^°t—xš`i`±„\ç‹=øc“.//¢ðõÑ¶PhøsÔž¤÷\áýÄ¸ˆ\î¥\'\â/Q›É¾\ròtp‹^X°uÂƒ, \Ö^:À\ÂN#7abƒƒh\Ê\ËXeËŠ-\\\ß,…B&˜¨@4uË‹,Í’þ¹\ê@x¿˜À\í:\Í0\æ\"!ß¸t˜%Ç¥\Í0—.^F-\Ã¼›\åXÝ•‘‡x\Zƒ\\5•¤Mg‹±—¬µaqAŒr°£¼6Ng*Íë—¢\âýˆ£˜5r\î÷¨Ù¹üõ½+\èÞ“¥\é:E„.’´\Å\âõ†\Ñ\Ë-¼L(:`p˜c¼·*3‰\ÌaÒºƒ/H\Ç.\Ù\ã¼!®-\Ö\n\ÃqöNnü}\êlöŒ\'\Ðñ\ÔC¥ƒ\Ð57B\Ãyr\âF;B,•Ë‹.\\c´wŒ1·\Ñk‡i*£Q\Þ(5.±t¾Šû%9\Ç?B0(<vG~ƒ‰·N\ÐÀe\Îò±pf\È1eË‹\Ô\íF^²\ìÃ’8t‹Xœ\Æ¨hK—¤\Ôà¸¥\\ T\"\ëƒH:K…#;º]þÇªòýó\Ú%ýG¨\Å\å\ÅË©rð:\ÃFŒJ›\à\Û.’\íÃ®\n†\Ðb\áJ‚$©¶\"\Üa\ÛL\åV°n$’ú\n~Ð£:P\Ý#³}„·6ô˜)O]x#\\¹rúŒ\\b¹Q0¬\í7•’2Ch\ÊÁƒH\êD—/\\.0\Ò(CizË‹ÒºŽ/¥iö:½j\ë\æ*¶Á\rF\Û_¸ ±³£y\ß\ÄÚš=`Q²n[›\æ\åI\åöÁ´¨M\Ðc*8#ôdk%Æ‘n8«•¥EŠ‰¢\\\Ñ8—^‘sr\ã.,~\Ä-2¨¥MúQé·ˆ§O\Þ-¶ô1$(œ‹~\ÉR£\ÓX„1—4K¼²Gk*uŒe\Ë\Çp³T¥@\ÒsR¢\ã¸\àŽ\Ý\Ç\ìWz3vó\Ä[m\ê\Ö8w–\êi\Ë×®þ™¸l>\Êô¹0¢ŽñŠvBq\ÓR±ZC\í^‹\Ò(²\åÁ‹	xZ\è.^jm+¤e\Ëû¯ž.iœõHÁ²\Éx\Z\Ú8\Åf\á´u—K—.\r\àe\Â\\%\Ã-\Ø.D¸2ô…0#‘=¼1Ûªþ\Ä,¸~…\ß\Ç&þ?c3Z\Ê\Ë\ÐC›b\ë.)r\ã8›%\ÃC#‚\ét†E¹r\å\Å.*‚J\"\Ü`‘zþ\Øoá• }\nÜ—.:‰ö3°À\Å\Â˜‘2¸²\à\âò2òo†$ºN°b¸8¸½E}¤\Òe\ã\Ç\Òû\ßcX8a¾¼2ak\Ìs¨Ã ¼\\°f¹eb\ã+YU*$¬\\eö¢þÓ¤\ç¢\Ô_Ø™mñ\ÄDi)ñ\Òv`g\í´ŸÌ´Ÿ*ÿ\0SQ,Q¹\äy>\Ò›—ƒ°KeÊ„¼Œaœ\â¢GLœD‰q9‰¦n,¼\×\ÛŸX¹¿–~f\Ä\Ý\×\Ñ›(‘I¯ôEÁ\Ï#¸ù\'kjü?\âkc5ª>™°\r¯0N\\\Ðü®\ÇóWø\ïü²\ïvþe\Í-9Õªjÿ\0¾sÍ—.\\\àýˆ:Mó\Ì:*aV\ZƒŠ\ÉV’£po$!.(°‹¦/Hº\Ëû’\Ü\È\Ù\Ê\ÓD/&\ß\á,X°ž\rÁ\ì‹\ßwŸ\Îð`Á—-%­We¿\è2k¡°úòi4\Ã\Ðg˜a+L;B\\0#.,a]#*1X0ŒXÍ\Ú\\\Û.X\Ë\Íiß¿±:\Â\ã©Y\Ö\ãQÁ7?$©Iú=>È±†.\\ aýxÌ¾Q¿·¬\n+¡k__¶G	‹À\Î\"B®’¦Ž…\ëUÊ¬^#L.LX‘*kLTZb\Ò9{a*W\ÚF\Ë\É\ç;ô!j¿ø²Z`Œ8P±m¼¯\Ë*ct¿g—\Ê\ä\ë}*ß±zŒ4•†ã¬¬V+-n’ôŽ,eD•+.7GlTc*=›—¾\Òø\ÎúD§4µ²Ý·¿W“­M>s&\nFš/“\ã‡ñz€\ã (\èT}¤!dD‹R t¸œ\ÇyX:`4À[*3yXIZ\ÊÂºNÿ\0v\ZzÎ¼Y ¢ŸðAÿ\0\Þ2\íªÿ\0¯\Ì\0vhª\Ã\Û\Ç\â#\"®ªó\Ð5¾•mxûI›©\ÌÙ’¥`.*¨\á\ß)f..\Â,¸1eÅ¹q\è~î´®„\éˆ\êm*U\ÝzMa¦GÚ‰Za @\Ò\ZE—¦M,ƒ/\Å¨µ°p\Îc8Žð\Þr™1tûÀ\Ó/.\'hsÒ­ûZ\åË¸o	xv†XCirò\Ò1wò±†±4•xIƒ†?y\\t§`/¥hûY\Ð	x\"Í \Z@¹´»•!‚ð˜r\ïE²$e\ëzß¼ô§^\ÝQ\×\ígBñX¼(\êJŒ\Ý*\rpbða‹®x\ÂFQ\Þ\\¾‡\ëB\á¤\×Í¾ViÔ—\Òt:E¿¶¨i°°Á\ÅM˜1Ne\à\Å0eW*¡IqÂ¨\Ã¥ú\×W©SQ»lW¯‚÷‹ürª–-Š_aÆ•ý\'$£Ä¤¤ ë¨¬;­D·YmÌ¿Ì¤\ã\íd\'Š{0xÊ†’Ä¼·™l¶[\ç+\Ü\Ö°0.UF^’\àÔ¸±\\c“¬n`€ÕƒE4\äùò\Í\ÍÀM8}Ê§¯ù \'kEŒV\ï¸\ÙÂ†«oôÿ\0ˆˆš#\ÇÐ‹et\×]KØ‹\Êö|@Bˆ\Î!‚m~\â\n]Žª‚Ÿ§Yn\'8\ï“\Ñ/iR¡%%\Ç\\vŽ	´rvúÊ”ø”øe¼2\Þo°ry9%aªMB„”¿ý‰½ j¾Iq[‰\äÁŠ\"I\Ë\Ãôm@»¥\Ý\Ýð\Îs¤ôp~°\Å<‘[Î…þªm¿P³\ã\é5<\Õ¸]þ|¶¨\rV\å\É|\Ü*«\å·]OFr\Êy•q(8\ÅýK	R¥i*1‰¤t‹û\Ôø–ñ//\æò˜½S\Ñ)\à”xšx\í\0€Cƒ‰\ížÉ¤\Þ|\å¼\Â5¨@ø\Ö[\Â#\Ãõ=õ\'¡=\×üÏŸ÷=Œ§—ü“\áˆñ(\áýC\Ïn \àMõ†º”ˆ¢\Ñ\Z`\éQóbOZ}\âe\å\'\Ð\êK[›p‘\á>ˆÀ\0Á´m»d –‚¾\Z~\Ù@è›­¹¥`À\Ôõí…›\'ø§\ÎS\Ë=Rž°˜	R§&ö)ñ/+\æRQ\â\'\Ð\Z7-»Ÿ³\Ìe\Ï#Whh<À°ß˜\ë»µ(ðJx•ñ)\îS\Ë>Lù2žYYCŒ Ý¨\"C¤ŸSPa,Š:7M‡–m£ƒ\Èsùb·Ó¢ž%\'\Î1Ð¹W§¹on!±V´CØº¹654]‚¼­\0<ûaGŸ\ZR·CeY	\nkR€ž&I\ä9ûA…—¤\ÞTp3FRTö€ñ\ÖtŸB\ëV«wJrNF\âË—5­<\Ìz\ímf¿\Ç1côŒPÝ¨Ÿ7ñ\î/\ÏC\0<¿\ÔtQ/þ\0/ò\Ãc.Á¿•È¶1\rË‚sûë§‰\êa>éžŸ\æzg¦z’ž	Av‡“\rS°\Ã6\ÐY†™óÈ¨¥Z\rŸ1\ß\é)ñ-->s\ç))\âT\â q‡£YZKe°`\Ü\â.N€Ê•(\è;‡rº¬ôÁ€‚…£\â\Õ}\é/Æƒ\Æ\Z‰´¹l´øOŒø\ÊJy”ó,ó,ó.Y\æ{	\î\'²{£\àc\âG‚ˆ¯)wô6aÉ¬} ž§± „¯ûf«Ã„‚G4C:+oqß¹R™i\í))(ñ\ØGH·‹†±P\ÓiÌ¹r\ê0û‹ƒ°w)–•*WY\Û4	xþ ‚¢Ë—Û»O¬\Zn\rƒ.\\¹}kR\à\Å\04\\\'¿\Êj—2kD#W—Áï®¥2\ØRPw\î»Ž’\\Ypa.¦\ÈÅ—.N\ïd\ë¦\ZJ\îK\í[¼X±eÅ¢²¨÷õ\Ô4\í\Ó}K¬!5\ÃrTMN„\0\Í\0Þ¤vÏš?®ºš	.¬SNñzb¥d¢WÒj¼òc´!2\å\Å\Ö–\ÇøvÎ0ó”8úhö\ïH±Â·,Û©Š\Û\êPŸ©¸®N\È| Þ°`\Â]d\×\Öñ’ô—¬1rð\à\è¨M˜]e\é±¶\Ñ<C\ÎS\é\r£Ý©k§ Q\Òôô¾®f>Ÿž¡¦\È4¾§IÅ‚\â`Á‡\ÖÔ¬ó\\Ypb\Ë\é•…\Òs[\í‚\ìC\Ê\0\ã\éÍ£\Þ@k\ZzT\Þ\r\í\Ñ^\â\Û\Óv®Ù»S\ènz\Å\Z›u\\õÒ¬_‡Eƒõ\Ô.6m\Å\àÃ†0@\Ê\é.;ö†ÀŸJô›G¾”‰OH¦\Ývj\í\ÒU}ô\æcÔ¹\ëªÂ \rf‰r¶\ÛÐ‹H)O\ëx¹{\×AÓ¿I¬\Ú-E\ì\ìC\Ê³\éÞ“hý	Q×µc\ÔÛ¥,{\Û=\Ä]#M‘m¶Zªô\é_„\0QöPõm€&]\ËyŠò\Ëye¼²ü™o,–{\ïg¶|\Þ \Û\Ù\ä\î=&\Ñú¦±b\Ä\n+­\Ñ{£UÉ”¢.\ÕÚ¿¨}‚§¾\Åõ’\å\Å\Í\ã¿O¦^Ž:+¨F\Ì:Á½A¾\Ã\Ðaú$˜‹¨-¢+°kºd˜‹\×X+D#W°­5½»†q—°\ï\ÓYzƒ)+ Ž6p€\ìöŒ?GBk)\ÔÛ Õ”=öwÐ ;	e2÷®•ø@\Z}‹\Òô\×A.\à\\—nŠC\Ô`#‡~‹\è\ÛhœÀ;9zL?K\Êgy\Ïkgp\Ø\ínS7\Æ\Ø´WW\ì1”ÀJ›A\ÍJ•a¬\r&’\Â*1\éz	\Ì%\Ç\\;ö…6€\ï8\ê#·Ó„S«\Û»‡w¹K¿\âmö;­eˆ\à\Îò¥v…Ê†,•+H’ è¨’¥J\Ç=\Ý]	§S·\Û\Íp\ãN:SX±]&B‰·@a*\âJÁ%e\é\ç/|Q²£¿K·\Ø\ÔÅ¶ûAs·\Ô÷9ƒ\Þ	ZJ•š*.òµ\ÈÀ„H\é+X\ÅT\æTNš†¡\àfûCØ”b«} €n\é\r¶4>\ÙWº+\í*³X\ë O‘•xT7•$2\Û\\\r¢Á¬	R£ªJÁ%t\×Hw\á4Ã¿\ÑW~\ëX­\ìS\âUb\Ä[@¸@/\Å\Z€´\Ø[Š•ö«4:¯øm„’µ‡ˆš\ÂÒ˜Tª†C.^\í!\åkÅ—\í‚=wEV@ù}Šæ»5ØDv­L«„•\è&\âÆŠvQKü\ÂÓˆ\Úü+h®z~† ­N\ß\Ûþ>\ÙIFý’¸=$›%BTp»„`Á\×\á8Œb\à‘j.+L;uœ`\ÞVS±n\Ø|º›\Ð Uu¼i0ô¡¾³¥ý¨­\î:¶\á\ì.2´ƒ“\Î \à‚\\r2a.,®8\ÃÛ¨\é/±NŽ\Ó®F¦7Vž .\Ú\Ã6Å\ÒPn¬7<\Ã@±)ZK Z`Ü¿\íŠt›¤\ÓPV;?©J\à\â’qA·À°Gf6b\Ø:Vµ\ç\í$uŠ«{fm—3d¸º\Íòo k„	Q0I\ÆG‡²KÁWe>D³\ëZµù–,#Û‘¢9\àŸ¶¹?¢>	h—O÷4\èø†tSnE”‹. P\Ð\Ò)Z«\ï´h\Ü¬Aøzl\ÝOüxŸÝŠÁöþ/÷\Û÷ÿ\0´ÿ\0\Ûÿ\0i¹~\Ì\Ù\ç\Ã©ü†Ó€¶\"·¢¢J‰]$0JÊµ\Ê\Ã%i\è\ÃT¢\Å^=k7›\Ó½‘- w— xGú…‹‡š\ÌþWõp+ÿ\0˜lJ\Ú?•ÿ\0$\ã\à?\Ì7\à f«ø?Ä¯ýõ(\åü?\Ôÿ\0—ÿ\00ÿ\0—ýOú?\ê?ùø”ù­~\ÄóE&\×\Çúˆ¤DM\Æpj\'`\ì\Þ\æ«|ù\îU\í|\ê\Æ\ê\ã\ÈEW\ã-P·¨þ\å7ñ\Ï\è‡\éó/ò”\Z7!Ÿ\Ã\à%\å\àá€Œ )ðÂ«\á\ØIrŸ\ÃR«õþYþ HüF¤ô\éô -ˆ­„¨À+A•`\n—-ô0Á¼+\È\ÍÑ“\Z±0¨\à\ÂJ\ì„\Í{cSe\Ï`Ë‡°o”?Ì |ò_\í©Bþ*~÷(®¬¿m\ÃÀ\'¿©¾øzAE‹…‹\0„·øs4Šðjž\î¤F¦\Ïõ@¦\ä³ûu†ˆ0aÒ¢ ƒ\"P†H\nÿ\0“gó(=ñ\Ï\â:\ßr—ó\ÞlEnN\Ø!9\ÓT5C|\\Z•PHJ\Òn\ÃL\Üa´­aIR¥DÁ†=‚V/)\Ü\ázD[µŠ\ÙðJô¯7Ÿ¢Vv\à¤®z\Ø\âŠ(°0\Í|ÏœK\Ìa‚OûÇ²s…i\Ãï´\Ý@5`û£SýŸx$\Ò|¦®aïœƒ\Ú\Ð\È\ë‚%JTG\Ø\Òj:šû\ÛóH”š\'pÏ¸ŠÜ‘p2\åô82\Zb\á¢0·°*H\Z\ÃBI‹¤¸¸\\r+)¯Y‹‹\'v½±ShVW¶ %F\à(Ê²Ó©Š\í<HN#N…^2\Éi%#+¥ÿ\0\á\ß}„ÌŠ™[Áÿ\0 BI\'\ç>y\É1’I%¢¸n3Z¯˜!	R B	¯a˜«Î¸\Õþ{{#x\Ú\Û\Ø:²t:K—¦\r\à\à2\ã‚t›°\ï$¨\ÂV	pb\àƒ\0•*T©Q+-—€\Ã\ÞXVY\Z¤‰\'ù¨\ÄX™VU+©\á8š‹þD³nž¢”„­M}\r‡\0£¾O™¿¢\ß\É\ÖBz:^p’I&&2I»\×*¼˜6…¾XAY¡z û\å\í,ÐŽ\Åô8%\àc©*TL\\5Ìf‚:±:n\åGB2¥`@‰+\\VR%e•V^ú)Hš#mUu\É\n»\ÝÀ%<OTõOD}c\ëf«¥Ç¨-+\ÝK\ä?u}X=·¼_xh€\Z¬SVˆ²þRŽ”\Ù\á…W£\'Qy}½N‰¤ŒHÃ¬H”oø„=!A/®[\Ä\äH´\Ùù\Ð_ó\Ø¬X2\Ã\Ôb¥J\é¸k*;b J\Ö\r JX	Z\ã™r°m…J\ÖQ9‚=5*£ð\Â0„L„¨÷\Å»\Ý°Žf°T1Nþ§\ãx\äõt\È0\Ë*•\Ò\ä\Ï\ã\"\î\ÏÃ´»<¦Ñ¨\ë’õ.¤)vÁ\âS\Ð^À\Ã\Ó\ÛÁ\ËUñ_–ZBûº\Û\Ì\Ìr\åÍ„>\Ø/\èV\rò—,¸º™PJ;reAAaX\Æj«n	~Ïƒùa³x\nú\ë3Hµm„\\°\Å\\­eJ\ÖT˜\"t’´†˜IP\"T7€À[€„¨\"BHm7‰Xv•¬\"@œÊ•„ƒ,#*$Xý\ri{›0+úAÿ\0/\ÃüBJRÿ\0ú“\ä²(\í=S\Õ=3\ÑHúG\Ò2¸¨XšK‡ \Ò÷7Fvõ&\0°Ö¼ÀShx¨¡K\à%¡/+”u¿ç¬Oj›k^~€{w4\n4!\Ñ[Ê³ð\ÊË¿”üGŸV§\É\Ä=!$‘\é–ODôK8ž¸w’Àµ–_ú+ûQ÷5½§•\ê¬oC7€ŽHJ\Å`4Žñ„0¨\æ\å`.%@\×7F\"J\Ç\á¥1P!¼­ J•Ð—MzN0²\åË\Ñ.\í£šXW¤\ÚSi¨\Îß—\îi™où9ý‘N34ña†aq›3_ð\Ï}”0Z\Î!‹*¤¥\ZŠV•ö\ç˜B„ ò.Wýpo \í\è^§¢›<M¥›ô\ãùŒ4,?Ž‡Ì§\\\ß\ê§\ç~§M\ç*\î\ä`Ž\ç˜G$) \Ö$L¼\àD7D*pp\ËÁ€”D•i*:D\Ê@JŒa1:Í¾¸\å\ÆÖŠô›@Ï£Z¥\ë—\æU‡Œ\Ý\é\ÙüGñ\Äô\ÏTô\áa†aôŒ>2þc[\ØO\Î\ïd†D!¾Bx¥+ó§ù‹(\âY\Äwr?\Öbûg¥t\Ï\ÛH:³Cÿ\0\0ý1B\Ç.Ÿ\Çã¬¶j\ÅÝ‚8¼Œp;dŒw\Å\ËÁ\r\à‘´0Œa¬ª†8—¦\åf\ã\\]\"\Ã.\áúq¦\ÈNŽQ|7«\ÔüB@-Zú\áù€šœŸ’z\ç®zg¢zc\éHúFHú\ÆR\ßþÑƒId†=EýH+iÌ¾--8þe;\Þ(ýšKò\Ú\0þGO\â%\\\×]ƒc±ºDô:+Hô$#‚\Åb²J\ÐTpB˜±t‚°A\èV‘ƒXFyZ`!X1e\Å6G\Ø!$¨ýK\Z;AÌ™òýS\åi<\ë¥þ¥¨MÊƒð²\nù\Ï\Öñ\rôù\"ø‹\â$a–\\m\ÈvŒ:HB!…,7A\Z¿\î™üŽ„TšÝ¿ðÛ³º1]´\é¬80\Â$¬šK\Ò^ÁZ`†Tp`t†¬H\í\"Ô¸2¢D¬¨\é²\ã]\Â\ï\r%\Ù:™¬TŒ~©4l\æ±\î\Å*ˆPÚ‡ô\Êò\Èý\ÒhþiO\î\áú\äO\ì\\ÿ\01_ô\Ü?ôWùŸÚ€Aÿ\0\Ñ‘Ñj\ç¡\è¸0O0„!\Ò`†aS}u\Ö7®†cŠ•ŠÀG¦\å\Ë\Öô\Å\ÃlV+¥@Á\Â\î&K¸A\rðºaw2ð“C\ç˜M\âJ›Fq+±r\ã„¨\ï\Ý{*h\ê@\Z=U+¨Ù“YoŒòwbSL \ÜJ%\á õÁS¬^\ç!]²TL=‚	D¬¹¹0„›K„¸B%‘€\ÅB=—HË—q‘ŒL\Z\Ç+\ç)\r0\ä\ìmò€\Ø÷)J¬©\Ä	½ð¦\ä±\Ñg\Ø\'œÁ-j&™]7g€Žñ\ÅJ\ì @‰6—LÔ¬=\'t\Õ*2¯Hï“´%\é9—.,\Ä\ÅFmH\àÂ¡¤#\r¡„v\ÈGH\Æ!;t¨šw»cQMõƒsPoo«\ÌÌ§’!\ÍüE;[[\Ê[±N{\ë\àŽ²\ãžzH0B2ða¼\"k*\ÚT¦\à„6Œp‘„‰*IQ\Ò¬À\ÒŒ&É³#  \éÇ©mzÐ¦\Ì}`›\é\Ùúš\Íû‰nÇˆXðmØ½d{ Ë‹•§EË„\r!.^°\Ñ/5*$\ZGyPŠðôœ\ZÄŒuP—$a¤`Ô¸\Ç¬\r!1•\ÕF=÷¼#f\Ì$$³\ÌöË¹%žIgž\×\æY\ä•rOnS`¯2×ž\Øaß¦±pa‹—( \ËÁÁ\Â\Ò5Œ`B&³J‰¸Y¾\ë*m8Ã˜‹¹q`Á„e\\¬0D–LT	P2¬kXK‹ök|\Ë|\Ë|\Ëye¼²\ÞYo,·–[\Ë-ó-úg±P‹.^H\ë+jUš„¨aœ\Ã¸`\ë.1EpÀJ‰„Žódbt\\¼†,\Z—+L*Žð2s•¤\Z\Ä\ÂF\åýô%vž\Í_@J†k¨‹L D\ÒT\Ö$\Ö\á´c¼¸\â\åÁŽ¸1‰“¼6›Ä‰8\ÃÁ\ÈgŽð!‚§8ISŽ\á÷#	¡#\Ò`%£ƒ*¨B2°°\Þ“x‘Œ#‰.,X±pcˆ‘••“´zð\Û|t\é\Ôc÷#´`Ž\Ñ\ï®Š•“yP#\Ð!«*mƒ,¸\à\Û)F5›!¼qÿ\Ù','Daniel','7771076799','Gonzalez','Ocampo',2,NULL);
/*!40000 ALTER TABLE `participante` ENABLE KEYS */;
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
INSERT INTO `users` VALUES ('administrador@gmail.com','$2a$10$p7xaMj.hnttJdFnf5E1cXejDeqvK2QaJIvpGn6VGvMWFYa25TX2Aa',1),('dannyo.gonzalez2502@gmail.com','$2a$10$97c5uJhR.L8.nm0HUTHwSOXSrHzgDQSP2sXSHiZX/3HNRMrTindfi',1),('enlace@gmail.com','$2a$10$z0OcOjCC2vewJW5M1G/AVOR05MI0f5umVvn7x6/wRQvB0a7yYlK3W',1),('enlace4@gmail.com','$2a$10$b8mprpee8NfnBFfJjd8YfuAmFBWd1MEwQTiCyKJMGcfSCzEidQPrq',1),('presidente@gmail.com','$2a$10$gLoVrgoHCbVrD8jvYdrKWONBD7TNp9rtMYY2bCsI8rAAcR15vlKr.',1);
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

-- Dump completed on 2022-04-15 12:40:24
