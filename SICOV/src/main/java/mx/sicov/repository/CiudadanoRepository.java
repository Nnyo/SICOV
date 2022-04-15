package mx.sicov.repository;

import mx.sicov.entity.Ciudadano;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CiudadanoRepository extends JpaRepository<Ciudadano, Long> {

    Ciudadano findCiudadanoByCorreoElectronico(String username);

    List<Ciudadano> findCiudadanoByRolContains(String role);

    @Query(value = "SELECT c.idciudadano, c.fotografia, c.numero_empleado, c.password, c.enabled, c.username, c.nombre, c.numero_telefonico, c.primer_apellido, c.segundo_apellido, c.municipio_idmunicipio, c.rol FROM comite_vecinal cv INNER JOIN ciudadano c ON cv.ciudadano_idciudadano = c.idciudadano WHERE cv.comite_idcomite =:idcomite_vecinal", nativeQuery = true)
    Ciudadano findCiudadanoByIdComiteVecinal (Long idcomite_vecinal);

}
