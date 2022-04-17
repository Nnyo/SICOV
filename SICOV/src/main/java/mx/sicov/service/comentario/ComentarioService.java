package mx.sicov.service.comentario;

import mx.sicov.entity.Comentario;
import mx.sicov.entity.Incidencia;
import mx.sicov.repository.ComentarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ComentarioService {

    @Autowired
    ComentarioRepository comentarioRepository;

    public boolean save(Comentario comentario){
        try {
            comentarioRepository.saveAndFlush(comentario);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Comentario> findComentarioByIncidencia(Incidencia incidencia){
        return comentarioRepository.findComentarioByIncidencia(incidencia);
    }

    public void delete(long idcomentario) {
        comentarioRepository.deleteById(idcomentario);
    }

    public Comentario findById(Long idcomentario){
        Optional<Comentario> optional = comentarioRepository.findById(idcomentario);
        if(optional.isPresent()){
            return optional.get();
        }
        return null;
    }

}
