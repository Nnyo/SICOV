package mx.sicov.service.comitevecinal;

import mx.sicov.entity.Ciudadano;
import mx.sicov.entity.ComiteVecinal;
import mx.sicov.repository.ComiteVecinalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ComiteVecinalService {

    @Autowired
    private ComiteVecinalRepository comiteVecinalRepository;

    public boolean save(ComiteVecinal comitevecinal){
        try {
            comiteVecinalRepository.saveAndFlush(comitevecinal);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void delete(long idcomitevecinal) {
        comiteVecinalRepository.deleteById(idcomitevecinal);
    }

    public ComiteVecinal findById(Long idcomitevecinal){
        Optional<ComiteVecinal> optional = comiteVecinalRepository.findById(idcomitevecinal);
        if(optional.isPresent()){
            return optional.get();
        }
        return null;
    }

    public List<ComiteVecinal> findComiteVecinalByCiudadano(Ciudadano ciudadano){
        return comiteVecinalRepository.findComiteVecinalByCiudadano(ciudadano);
    }

}
