package mx.sicov.service.participante;

import mx.sicov.entity.Participante;
import mx.sicov.repository.ParticipanteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParticipanteService {

    @Autowired
    ParticipanteRepository participanteRepository;

    public List<Participante> findParticipanteByIdComiteVecinal(Long idcomite_vecinal){
        return participanteRepository.findParticipanteByIdComiteVecinal(idcomite_vecinal);
    }


}
