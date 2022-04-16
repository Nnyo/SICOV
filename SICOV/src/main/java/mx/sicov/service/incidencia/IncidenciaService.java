package mx.sicov.service.incidencia;

import java.util.List;

import mx.sicov.entity.Incidencia;

public interface IncidenciaService {

    List<Incidencia> listAll();
    Incidencia findById(Long idincidencia);
    boolean save(Incidencia incidencia);
    boolean update(Incidencia incidencia);
    boolean delete(long idincidencia);
    
}
