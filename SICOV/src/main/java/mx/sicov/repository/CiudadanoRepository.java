package mx.sicov.repository;

import mx.sicov.entity.Ciudadano;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CiudadanoRepository extends JpaRepository<Ciudadano, Long> {

    Ciudadano findCiudadanoByCorreoElectronico(String username);

}
