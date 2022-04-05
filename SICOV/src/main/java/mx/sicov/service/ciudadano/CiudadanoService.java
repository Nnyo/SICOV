package mx.sicov.service.ciudadano;

import java.util.List;

import mx.sicov.entity.Ciudadano;

public interface CiudadanoService {

    List<Ciudadano> listAll();
    Ciudadano findById(Long idciudadano);
    boolean save(Ciudadano ciudadano);
    boolean update(Ciudadano ciudadano);
    boolean delete(long idciudadano);
    
}
