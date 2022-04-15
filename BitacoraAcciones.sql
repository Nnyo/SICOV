--
-- Table BItacora
--

DROP TABLE IF EXISTS `bitacoraacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacoraacciones` (
  `idBitacoraAcciones` int NOT NULL AUTO_INCREMENT,
  `operacion` varchar(10) DEFAULT NULL,
  `usuario` varchar(40) DEFAULT NULL,
  `host` varchar(30) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `tabla` varchar(40) NOT NULL,
  PRIMARY KEY (`idBitacoraAcciones`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Triggers BItacora: Categoria
--

DROP TRIGGER IF EXISTS `bitacoraCategoriaIns`;
DELIMITER //
  CREATE TRIGGER `bitacoraCategoriaIns` AFTER INSERT ON `categoria`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'CATEGORIA');
    END
//

DROP TRIGGER IF EXISTS `bitacoraCategoriaUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraCategoriaUpd` AFTER UPDATE ON `categoria`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'CATEGORIA');
    END
//

DROP TRIGGER IF EXISTS `bitacoraCategoriaDel`;
DELIMITER //
  CREATE TRIGGER `bitacoraCategoriaDel` AFTER DELETE ON `categoria`
  FOR EACH ROW INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla) VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), 'ELIMINAR', NOW(), 'CATEGORIA')
//

--
-- Triggers BItacora: Ciudadano
--

DROP TRIGGER IF EXISTS `bitacoraCiudadanoIns`;
DELIMITER //
  CREATE TRIGGER `bitacoraCiudadanoIns` AFTER INSERT ON `ciudadano`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'CIUDADANO');
    END
//

DROP TRIGGER IF EXISTS `bitacoraCiudadanoUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraCiudadanoUpd` AFTER UPDATE ON `ciudadano`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'CIUDADANO');
    END
//

DROP TRIGGER IF EXISTS `bitacoraCiudadanoDel`;
DELIMITER //
  CREATE TRIGGER `bitacoraCiudadanoDel` AFTER DELETE ON `ciudadano`
  FOR EACH ROW INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla) VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), 'ELIMINAR', NOW(), 'CIUDADANO')
//

--
-- Triggers BItacora: Colonia
--

DROP TRIGGER IF EXISTS `bitacoraColoniaIns`;
DELIMITER //
  CREATE TRIGGER `bitacoraColoniaIns` AFTER INSERT ON `colonia`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'COLONIA');
    END
//

DROP TRIGGER IF EXISTS `bitacoraColoniaUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraColoniaUpd` AFTER UPDATE ON `colonia`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'COLONIA');
    END
//

DROP TRIGGER IF EXISTS `bitacoraColoniaDel`;
DELIMITER //
  CREATE TRIGGER `bitacoraColoniaDel` AFTER DELETE ON `colonia`
  FOR EACH ROW INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla) VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), 'ELIMINAR', NOW(), 'COLONIA')
//

--
-- Triggers BItacora: Comentario
--

DROP TRIGGER IF EXISTS `bitacoraComentarioIns`;
DELIMITER //
  CREATE TRIGGER `bitacoraComentarioIns` AFTER INSERT ON `comentario`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'COMENTARIO');
    END
//

DROP TRIGGER IF EXISTS `bitacoraComentarioUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraComentarioUpd` AFTER UPDATE ON `comentario`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'COMENTARIO');
    END
//

DROP TRIGGER IF EXISTS `bitacoraComentarioDel`;
DELIMITER //
  CREATE TRIGGER `bitacoraComentarioDel` AFTER DELETE ON `comentario`
  FOR EACH ROW INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla) VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), 'ELIMINAR', NOW(), 'COMENTARIO')
//

--
-- Triggers BItacora: Comite
--

DROP TRIGGER IF EXISTS `bitacoraComiteIns`;
DELIMITER //
  CREATE TRIGGER `bitacoraComiteIns` AFTER INSERT ON `comite`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'COMITE');
    END
//

DROP TRIGGER IF EXISTS `bitacoraComiteUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraComiteUpd` AFTER UPDATE ON `comite`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'COMITE');
    END
//

DROP TRIGGER IF EXISTS `bitacoraComiteDel`;
DELIMITER //
  CREATE TRIGGER `bitacoraComiteDel` AFTER DELETE ON `comite`
  FOR EACH ROW INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla) VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), 'ELIMINAR', NOW(), 'COMITE')
//

--
-- Triggers BItacora: Comite_Vecinal
--

DROP TRIGGER IF EXISTS `bitacoraComiteVecinalIns`;
DELIMITER //
  CREATE TRIGGER `bitacoraComiteVecinalIns` AFTER INSERT ON `comite_vecinal`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'COMITE_VECINAL');
    END
//

DROP TRIGGER IF EXISTS `bitacoraComiteVecinalUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraComiteVecinalUpd` AFTER UPDATE ON `comite_vecinal`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'COMITE_VECINAL');
    END
//

DROP TRIGGER IF EXISTS `bitacoraComiteVecinalDel`;
DELIMITER //
  CREATE TRIGGER `bitacoraComiteVecinalDel` AFTER DELETE ON `comite_vecinal`
  FOR EACH ROW INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla) VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), 'ELIMINAR', NOW(), 'COMITE_VECINAL')
//

--
-- Triggers BItacora: Evidencia
--

DROP TRIGGER IF EXISTS `bitacoraEvidenciaIns`;
DELIMITER //
  CREATE TRIGGER `bitacoraEvidenciaIns` AFTER INSERT ON `evidencia`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'EVIDENCIA');
    END
//

DROP TRIGGER IF EXISTS `bitacoraEvidenciaUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraEvidenciaUpd` AFTER UPDATE ON `evidencia`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'EVIDENCIA');
    END
//

DROP TRIGGER IF EXISTS `bitacoraEvidenciaDel`;
DELIMITER //
  CREATE TRIGGER `bitacoraEvidenciaDel` AFTER DELETE ON `evidencia`
  FOR EACH ROW INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla) VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), 'ELIMINAR', NOW(), 'EVIDENCIA')
//

--
-- Triggers BItacora: Incidencia
--

DROP TRIGGER IF EXISTS `bitacoraIncidenciaIns`;
DELIMITER //
  CREATE TRIGGER `bitacoraIncidenciaIns` AFTER INSERT ON `incidencia`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'INCIDENCIA');
    END
//

DROP TRIGGER IF EXISTS `bitacoraIncidenciaUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraIncidenciaUpd` AFTER UPDATE ON `incidencia`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'INCIDENCIA');
    END
//

DROP TRIGGER IF EXISTS `bitacoraIncidenciaDel`;
DELIMITER //
  CREATE TRIGGER `bitacoraIncidenciaDel` AFTER DELETE ON `incidencia`
  FOR EACH ROW INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla) VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), 'ELIMINAR', NOW(), 'INCIDENCIA')
//

--
-- Triggers BItacora: Municipio
--

DROP TRIGGER IF EXISTS `bitacoraMunicipioIns`;
DELIMITER //
  CREATE TRIGGER `bitacoraMunicipioIns` AFTER INSERT ON `municipio`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'MUNICIPIO');
    END
//

DROP TRIGGER IF EXISTS `bitacoraMunicipioUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraMunicipioUpd` AFTER UPDATE ON `municipio`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'MUNICIPIO');
    END
//

DROP TRIGGER IF EXISTS `bitacoraMunicipioDel`;
DELIMITER //
  CREATE TRIGGER `bitacoraMunicipioDel` AFTER DELETE ON `municipio`
  FOR EACH ROW INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla) VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), 'ELIMINAR', NOW(), 'MUNICIPIO')
//

--
-- Triggers BItacora: Participante
--

DROP TRIGGER IF EXISTS `bitacoraParticipanteIns`;
DELIMITER //
  CREATE TRIGGER `bitacoraParticipanteIns` AFTER INSERT ON `participante`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'PARTICIPANTE');
    END
//

DROP TRIGGER IF EXISTS `bitacoraParticipanteUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraParticipanteUpd` AFTER UPDATE ON `participante`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'PARTICIPANTE');
    END
//

DROP TRIGGER IF EXISTS `bitacoraParticipanteDel`;
DELIMITER //
  CREATE TRIGGER `bitacoraParticipanteDel` AFTER DELETE ON `participante`
  FOR EACH ROW INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla) VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), 'ELIMINAR', NOW(), 'PARTICIPANTE')
//
