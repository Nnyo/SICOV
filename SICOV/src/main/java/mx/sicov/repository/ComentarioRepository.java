package mx.sicov.repository;

import mx.sicov.entity.Comentario;
import mx.sicov.entity.Incidencia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComentarioRepository extends JpaRepository<Comentario, Long> {

    List<Comentario> findComentarioByIncidenciaOrderByFechaRegistro(Incidencia incidencia);

    @Query(value = "SELECT c.* FROM comentario c INNER JOIN Ciudadano ci ON ci.idciudadano = c.ciudadano_idciudadano WHERE ci.municipio_idmunicipio = :municipio AND c.incidencia_idincidencia = :incidencia", nativeQuery = true)
    List<Comentario> findComentarioByMunicipio(Long municipio, Long incidencia);

}
