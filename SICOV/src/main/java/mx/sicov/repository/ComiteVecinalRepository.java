package mx.sicov.repository;

import mx.sicov.entity.Ciudadano;
import mx.sicov.entity.ComiteVecinal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface ComiteVecinalRepository extends JpaRepository<ComiteVecinal, Long> {

    List<ComiteVecinal> findComiteVecinalByCiudadano(Ciudadano ciudadano);

}
