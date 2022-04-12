package mx.sicov.service.colonia;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mx.sicov.entity.Colonia;
import mx.sicov.repository.ColoniaRepository;

@Service
public class ColoniaServiceImpl implements ColoniaService {

    @Autowired
    private ColoniaRepository coloniaRepository;

    @Override
    public List<Colonia> listAll(){
        return coloniaRepository.findAll();
    }

    @Override
    public List<Colonia> findColoniasByCiudadano(String ciudadano){
        return coloniaRepository.findColoniasByCiudadano(ciudadano);
    }

    @Override
    public Colonia findById(Long idcolonia){
        Optional<Colonia> optional = coloniaRepository.findById(idcolonia);
        if(optional.isPresent()){
            return optional.get();
        }
        return null;
    }

    @Override
    public boolean save(Colonia colonia){
        try {
            coloniaRepository.saveAndFlush(colonia);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Colonia colonia){
        Optional<Colonia> optColonia = coloniaRepository.findById(colonia.getIdcolonia());
        if(!optColonia.isPresent()){
            return false;
        }
        Colonia update = optColonia.get();
        update = coloniaRepository.saveAndFlush(update);
        return update != null ? true : false;
    }

    @Override
	public boolean delete(long idcolonia) {
		boolean exist = coloniaRepository.existsById(idcolonia);
		if(exist){
			coloniaRepository.deleteById(idcolonia);
			return coloniaRepository.existsById(idcolonia);
		}
		return false;
	}
    
}
