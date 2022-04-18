package mx.sicov.repository;

import mx.sicov.entity.Evidencia;
import mx.sicov.entity.Incidencia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EvidenciaRepository extends JpaRepository<Evidencia, Long> {

    List<Evidencia> findEvidenciaByIncidencia(Incidencia incidencia);

}
