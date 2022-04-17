package mx.sicov.service.incidencia;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mx.sicov.entity.Incidencia;
import mx.sicov.repository.IncidenciaRepository;

@Service
public class IncidenciaServiceImpl implements IncidenciaService{

    @Autowired
    private IncidenciaRepository incidenciaRepository;

    @Override
    public List<Incidencia> findIncidenciaByMunicipio(Long municipio){
        return incidenciaRepository.findIncidenciaByMunicipio(municipio);
    }

    @Override
    public List<Incidencia> listAll() {
        return null;
    }

    @Override
    public Incidencia findById(Long idincidencia){
        Optional<Incidencia> optional = incidenciaRepository.findById(idincidencia);
        if(optional.isPresent()){
            return optional.get();
        }
        return null;
    }

    @Override
    public boolean save(Incidencia incidencia){
        try {
            
            incidenciaRepository.saveAndFlush(incidencia);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Incidencia incidencia){
        Optional<Incidencia> optIncidencia = incidenciaRepository.findById(incidencia.getIdincidencia());
        if(!optIncidencia.isPresent()){
            return false;
        }
        Incidencia update = optIncidencia.get();
        incidenciaRepository.saveAndFlush(update);
        return true;
    }

    @Override
	public boolean delete(long idincidencia) {
		boolean exist = incidenciaRepository.existsById(idincidencia);
		if(exist){
			incidenciaRepository.deleteById(idincidencia);
			return true;
		}
		return false;
	}
    
}
