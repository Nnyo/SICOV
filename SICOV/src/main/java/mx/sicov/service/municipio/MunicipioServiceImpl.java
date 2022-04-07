package mx.sicov.service.municipio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mx.sicov.entity.Municipio;
import mx.sicov.repository.MunicipioRepository;

@Service
public class MunicipioServiceImpl implements MunicipioService{
    
    @Autowired
    private MunicipioRepository municipioRepository;

    @Override
    public List<Municipio> listAll(){
        return municipioRepository.findAll();
    }

    @Override
    public Municipio findById(Long idmunicipio){
        Optional<Municipio> optional = municipioRepository.findById(idmunicipio);
        if(optional.isPresent()){
            return optional.get();
        }
        return null;
    }

    @Override
    public boolean save(Municipio municipio){
        try {
            municipioRepository.saveAndFlush(municipio);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Municipio municipio){
        Optional<Municipio> optMunicipio = municipioRepository.findById(municipio.getIdmunicipio());
        if(!optMunicipio.isPresent()){
            return false;
        }
        Municipio update = optMunicipio.get();
        update = municipioRepository.saveAndFlush(update);
        return update != null ? true : false;
    }

    @Override
	public boolean delete(long idmunicipio) {
		boolean exist = municipioRepository.existsById(idmunicipio);
		if(exist){
			municipioRepository.deleteById(idmunicipio);
			return municipioRepository.existsById(idmunicipio);
		}
		return false;
	}
}
