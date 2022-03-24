package mx.sicov.service.municipio;

import java.util.List;

import mx.sicov.entity.Municipio;

public interface MunicipioService {
    List<Municipio> listAll();
    Municipio findById(Long idmunicipio);
    boolean save(Municipio municipio);
    boolean update(Municipio municipio);
    boolean delete(long idmunicipio);
}
