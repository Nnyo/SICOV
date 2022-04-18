package mx.sicov.repository;

import mx.sicov.entity.Comentario;
import mx.sicov.entity.Incidencia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComentarioRepository extends JpaRepository<Comentario, Long> {

    List<Comentario> findComentarioByIncidenciaOrderByFechaRegistro(Incidencia incidencia);

}
