package mx.sicov.repository;

import mx.sicov.entity.Incidencia;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface IncidenciaRepository extends JpaRepository<Incidencia, Long> {
	
	 @Query(value = "SELECT i.idincidencia, i.costo, i.descripcion, i.esta_pagado, i.estado, i.fecha_registro, i.categoria_idcategoria, i.comite_vecinal_idcomite_vecinal"
	 		+ "FROM incidencia i"
	 		+ "INNER JOIN comite_vecinal cv ON cv.idcomite_vecinal = i.comite_vecinal_idcomite_vecinal"
	 		+ "INNER JOIN ciudadano c ON c.idciudadano = cv.ciudadano_idciudadano"
	 		+ "INNER JOIN municipio m ON m.idmunicipio = c.municipio_idmunicipio"
	 		+ "WHERE m.nombre =:municipio ORDER BY fecha_registro",nativeQuery = true)
	 		List<Incidencia> findIncidenciaByMunicipio(String municipio);

}
