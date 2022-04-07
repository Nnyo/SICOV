package mx.sicov.service.colonia;

import java.util.List;

import mx.sicov.entity.Colonia;

public interface ColoniaService {

    List<Colonia> listAll();
    Colonia findById(Long idcolonia);
    boolean save(Colonia idcolonia);
    boolean update(Colonia idcolonia);
    boolean delete(long idcolonia);
    
}
