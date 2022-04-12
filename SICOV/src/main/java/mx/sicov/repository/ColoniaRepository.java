package mx.sicov.repository;

import mx.sicov.entity.Colonia;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ColoniaRepository extends JpaRepository<Colonia, Long> {

    List<Colonia> findColoniasByCiudadano(String ciudadano);

}
