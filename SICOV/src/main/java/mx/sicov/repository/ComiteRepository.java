package mx.sicov.repository;

import mx.sicov.entity.Comite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComiteRepository extends JpaRepository<Comite, Long> {

    @Query(value = "SELECT c.idcomite, c.nombre, c.colonia_idcolonia FROM comite c INNER JOIN colonia co ON co.idcolonia = colonia_idcolonia INNER JOIN municipio m ON m.idmunicipio = co.municipio_idmunicipio WHERE m.idmunicipio =:idmunicipio",nativeQuery = true)
    List<Comite> findComiteByIdMunicipio(Long idmunicipio);

}
