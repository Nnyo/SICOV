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
  `datos` varchar(4000) DEFAULT NULL,
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
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla, datos)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'CATEGORIA',
		CONCAT('Dato insertado: ',' [nombre: ',new.nombre,']'));
    END
//

DROP TRIGGER IF EXISTS `bitacoraCategoriaUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraCategoriaUpd` AFTER UPDATE ON `categoria`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla, datos)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'CATEGORIA',
		CONCAT('Dato viejo: ',' [nombre: ',old.nombre,'] ','-', ' Dato nuevo: ','[nombre: ',new.nombre,']'));
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
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla, datos)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'CIUDADANO',
		CONCAT('Datos insertados: ',' [username: ',new.username,'] ', '[enabled: ',new.enabled,'] ','[nombre: ',new.nombre,'] '
			,'[numero_empleado: ',new.numero_empleado,'] ','[numero_telefonico: ',new.numero_telefonico,'] '
            ,'[primer_apellido: ',new.primer_apellido,'] ','[segundo_apellido: ',new.segundo_apellido,'] ','[rol: ',new.rol,'] '
            ,'[municipio_idmunicipio: ',new.municipio_idmunicipio,']'));
    END
//

DROP TRIGGER IF EXISTS `bitacoraCiudadanoUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraCiudadanoUpd` AFTER UPDATE ON `ciudadano`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla,datos)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'CIUDADANO',
		CONCAT('Datos viejos: ',' [username: ',old.username,'] ', '[enabled: ',old.enabled,'] ','[nombre: ',old.nombre,'] '
			,'[numero_empleado: ',old.numero_empleado,'] ','[numero_telefonico: ',old.numero_telefonico,'] '
            ,'[primer_apellido: ',old.primer_apellido,'] ','[segundo_apellido: ',old.segundo_apellido,'] ','[rol: ',old.rol,'] '
            ,'[municipio_idmunicipio: ',old.municipio_idmunicipio,']', ' - ' 
			,'Datos nuevos: ',' [username: ',new.username,'] ', '[enabled: ',new.enabled,'] ','[nombre: ',new.nombre,'] '
			,'[numero_empleado: ',new.numero_empleado,'] ','[numero_telefonico: ',new.numero_telefonico,'] '
            ,'[primer_apellido: ',new.primer_apellido,'] ','[segundo_apellido: ',new.segundo_apellido,'] ','[rol: ',new.rol,'] '
            ,'[municipio_idmunicipio: ',new.municipio_idmunicipio,'] '));
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
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla, datos)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'COLONIA',
		CONCAT('Datos insertados: ',' [codigo_postal: ',new.codigo_postal,']',' [nombre: ',new.nombre,']'));
    END
//

DROP TRIGGER IF EXISTS `bitacoraColoniaUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraColoniaUpd` AFTER UPDATE ON `colonia`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla, datos)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'COLONIA',
		CONCAT('Datos viejos: ',' [nombre: ',old.nombre,'] ',' [codigo_postal: ',old.codigo_postal,'] ','-', ' Datos nuevos: ','[nombre: ',new.nombre,'] ','[codigo_postal: ',new.codigo_postal,']'));
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
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla, datos)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'COMENTARIO',
		CONCAT('Datos insertados: ',' [comentario: ',new.comentario,']',' [fecha_registro: ',new.fecha_registro,']'));
    END
//

DROP TRIGGER IF EXISTS `bitacoraComentarioUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraComentarioUpd` AFTER UPDATE ON `comentario`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla, datos)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'COMENTARIO',
		CONCAT('Datos viejos: ',' [comentario: ',old.comentario,'] ',' [fecha_registro: ',old.fecha_registro,'] ','-', ' Datos nuevos: ','[comentario: ',new.comentario,'] ','[fecha_registro: ',new.fecha_registro,']'));
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
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla, datos)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'COMITE',
		CONCAT('Datos insertados: ',' [nombre: ',new.nombre,']',' [colonia: ',new.colonia_idcolonia,']'));
    END
//

DROP TRIGGER IF EXISTS `bitacoraComiteUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraComiteUpd` AFTER UPDATE ON `comite`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla, datos)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'COMITE',
		CONCAT('Datos viejos: ',' [nombre: ',old.nombre,'] ',' [colonia: ',old.colonia_idcolonia,'] ','-', ' Datos nuevos: ','[nombre: ',new.nombre,'] ','[colonia: ',new.colonia_idcolonia,']'));
    END
//

DROP TRIGGER IF EXISTS `bitacoraComiteDel`;
DELIMITER //
  CREATE TRIGGER `bitacoraComiteDel` AFTER DELETE ON `comite`
  FOR EACH ROW INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla) VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), 'ELIMINAR', NOW(), 'COMITE')
//

--
-- Triggers BItacora: Municipio
--

DROP TRIGGER IF EXISTS `bitacoraMunicipioIns`;
DELIMITER //
  CREATE TRIGGER `bitacoraMunicipioIns` AFTER INSERT ON `municipio`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla, datos)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'MUNICIPIO',
		CONCAT('Datos insertados: ',' [nombre: ',new.nombre,']'));
    END
//

DROP TRIGGER IF EXISTS `bitacoraMunicipioUpd`;
DELIMITER //
  CREATE TRIGGER `bitacoraMunicipioUpd` AFTER UPDATE ON `municipio`
  FOR EACH ROW BEGIN
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla, datos)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "MODIFICAR", NOW(), 'MUNICIPIO',
		CONCAT('Datos viejos: ',' [nombre: ',old.nombre,'] ','-', ' Datos nuevos: ','[nombre: ',new.nombre,']'));
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
    INSERT INTO bitacoraacciones(host, usuario, operacion, fecha, tabla, datos)
    VALUES (SUBSTRING(USER(), (INSTR(USER(),'@')+1)), SUBSTRING(USER(),1,(instr(user(),'@')-1)), "INSERTAR", NOW(), 'PARTICIPANTE',
		CONCAT('Datos insertados: ',' [nombre: ',new.nombre,'] ', '[numero_telefonico: ',new.numero_telefonico,'] ','[primer_apellido: ',new.primer_apellido,'] '
			,'[segundo_apellido: ',new.segundo_apellido,']'));
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
