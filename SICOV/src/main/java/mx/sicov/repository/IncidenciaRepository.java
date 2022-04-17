package mx.sicov.repository;

import mx.sicov.entity.Incidencia;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface IncidenciaRepository extends JpaRepository<Incidencia, Long> {
	
	 @Query(value = "SELECT i.idincidencia, i.costo, i.descripcion, i.esta_pagado, i.estado, i.fecha_registro, i.categoria_idcategoria, i.ciudadano_idciudadano, i.comite_idcomite FROM incidencia i INNER JOIN comite co ON co.idcomite = i.comite_idcomite INNER JOIN ciudadano c ON c.idciudadano = i.ciudadano_idciudadano INNER JOIN municipio m ON m.idmunicipio = c.municipio_idmunicipio WHERE m.idmunicipio =:municipio ORDER BY fecha_registro",nativeQuery = true)
	 		List<Incidencia> findIncidenciaByMunicipio(Long municipio);

}
