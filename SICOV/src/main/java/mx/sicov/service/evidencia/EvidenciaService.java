package mx.sicov.service.evidencia;

import mx.sicov.entity.Evidencia;
import mx.sicov.entity.Incidencia;
import mx.sicov.repository.EvidenciaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EvidenciaService {

    @Autowired
    EvidenciaRepository evidenciaRepository;

    public boolean save(Evidencia evidencia){
        try {
            evidenciaRepository.saveAndFlush(evidencia);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void delete(long idevidencia) {
        evidenciaRepository.deleteById(idevidencia);
    }

    public Evidencia findById(Long idevidencia){
        Optional<Evidencia> optional = evidenciaRepository.findById(idevidencia);
        if(optional.isPresent()){
            return optional.get();
        }
        return null;
    }

    public List<Evidencia> findEvidenciaByIncidencia(Incidencia incidencia){
        return evidenciaRepository.findEvidenciaByIncidencia(incidencia);
    }

}
