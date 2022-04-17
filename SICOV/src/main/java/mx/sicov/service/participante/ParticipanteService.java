package mx.sicov.service.participante;

import mx.sicov.entity.Participante;
import mx.sicov.repository.ParticipanteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ParticipanteService {

    @Autowired
    ParticipanteRepository participanteRepository;

    public List<Participante> findParticipanteByIdComiteVecinal(Long idcomite_vecinal){
        return participanteRepository.findParticipanteByIdComiteVecinal(idcomite_vecinal);
    }

    public boolean save(Participante participante){
        try {
            participanteRepository.saveAndFlush(participante);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public Participante findById(Long idparticipante){
        Optional<Participante> optional = participanteRepository.findById(idparticipante);
        if(optional.isPresent()){
            return optional.get();
        }
        return null;
    }

    public void delete(long participante) {
        participanteRepository.deleteById(participante);
    }

}
