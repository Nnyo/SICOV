package mx.sicov.service.comite;

import mx.sicov.entity.Comite;
import mx.sicov.repository.ComiteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ComiteService {

    @Autowired
    private ComiteRepository comiteRepository;

    public List<Comite> findComiteByIdMunicipio(Long idmunicipio){
        return comiteRepository.findComiteByIdMunicipio(idmunicipio);
    }

    public boolean save(Comite comite){
        try {
            comiteRepository.saveAndFlush(comite);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void delete(long idcomite) {
        comiteRepository.deleteById(idcomite);
    }

    public Comite findById(Long idcomite){
        Optional<Comite> optional = comiteRepository.findById(idcomite);
        if(optional.isPresent()){
            return optional.get();
        }
        return null;
    }

}
