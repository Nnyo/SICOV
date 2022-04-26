package mx.sicov.service.bitacora;

import mx.sicov.entity.Bitacora;
import mx.sicov.repository.BitacoraRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BitacoraService {

    @Autowired
    BitacoraRepository bitacoraRepository;

    public List<Bitacora> findAll(){
        return bitacoraRepository.findAll();
    }

}
