package mx.sicov.service.comite;

import mx.sicov.entity.Comite;
import mx.sicov.repository.ComiteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComiteService {

    @Autowired
    private ComiteRepository comiteRepository;

    public List<Comite> findComiteByIdMunicipio(Long idmunicipio){
        return comiteRepository.findComiteByIdMunicipio(idmunicipio);
    }

}
