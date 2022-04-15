package mx.sicov.service.ciudadano;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mx.sicov.configuration.WebSecurityService;
import mx.sicov.entity.Ciudadano;
import mx.sicov.repository.CiudadanoRepository;

@Service
public class CiudadanoServiceImpl implements CiudadanoService {

    @Autowired
    private CiudadanoRepository ciudadanoRepository;

    @Autowired
    private WebSecurityService config;

    @Override
    public List<Ciudadano> listAll(){
        return ciudadanoRepository.findAll();
    }

    @Override
    public List<Ciudadano> findCiudadanoByRolContains(){
        return ciudadanoRepository.findCiudadanoByRolContains("ROLE_ENLACE");
    }

    @Override
    public Ciudadano findById(Long idciudadano){
        Optional<Ciudadano> optional = ciudadanoRepository.findById(idciudadano);
        if(optional.isPresent()){
            return optional.get();
        }
        return null;
    }

    @Override
    public Ciudadano findCiudadanoByIdComiteVecinal(Long idcomite_vecinal){
        return ciudadanoRepository.findCiudadanoByIdComiteVecinal(idcomite_vecinal);
    }

    @Override
    public boolean save(Ciudadano ciudadano){
        String password = config.passwordEncoder().encode(ciudadano.getPassword());
        ciudadano.setPassword(password);
        ciudadano.setEstatus(1);
        try {
            ciudadanoRepository.saveAndFlush(ciudadano);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Long findCiudadanoByCorreoElectronico(String username){
        return ciudadanoRepository.findCiudadanoByCorreoElectronico(username).getMunicipio().getIdmunicipio();
    }

    @Override
    public boolean update(Ciudadano ciudadano){
        Optional<Ciudadano> optCiudadano = ciudadanoRepository.findById(ciudadano.getIdciudadano());
        if(!optCiudadano.isPresent()){
            return false;
        }
        Ciudadano update = optCiudadano.get();
        update = ciudadanoRepository.saveAndFlush(update);
        return update != null ? true : false;
    }

    @Override
	public boolean delete(long idciudadano) {
		boolean exist = ciudadanoRepository.existsById(idciudadano);
		if(exist){
			ciudadanoRepository.deleteById(idciudadano);
			return ciudadanoRepository.existsById(idciudadano);
		}
		return false;
	}
    
    @Override
	public Ciudadano mostrar(long idciudadano){
		Optional<Ciudadano> obj = ciudadanoRepository.findById(idciudadano);
        if(obj.isPresent()){
            return obj.get();
        }
            return null;
        
	}

}
