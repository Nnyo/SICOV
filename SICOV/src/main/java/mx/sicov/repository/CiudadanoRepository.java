package mx.sicov.repository;

import mx.sicov.entity.Ciudadano;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CiudadanoRepository extends JpaRepository<Ciudadano, Long> {

    Ciudadano findCiudadanoByCorreoElectronico(String username);

    List<Ciudadano> findCiudadanoByRolContains(String role);


}
