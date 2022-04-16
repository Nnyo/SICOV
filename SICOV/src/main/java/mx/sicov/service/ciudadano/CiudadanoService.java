package mx.sicov.service.ciudadano;

import java.util.List;

import mx.sicov.entity.Ciudadano;

public interface CiudadanoService {

    List<Ciudadano> listAll();
    List<Ciudadano> findCiudadanoByRolContains();
    Ciudadano findCiudadanoByIdComiteVecinal(Long idcomite_vecinal);
    Ciudadano findById(Long idciudadano);
    boolean save(Ciudadano ciudadano);
    boolean update(Ciudadano ciudadano);
    boolean delete(long idciudadano);
    Long findCiudadanoByCorreoElectronico(String username);
    Ciudadano findObjCiudadanoByCorreoElectronico(String username);
    Ciudadano mostrar(long idciudadano);
    
}
