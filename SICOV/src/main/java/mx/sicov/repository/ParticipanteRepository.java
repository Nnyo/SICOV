package mx.sicov.repository;

import mx.sicov.entity.Participante;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ParticipanteRepository extends JpaRepository<Participante, Long> {

    @Query(value = "SELECT p.idparticipante, p.fotografia, p.nombre, p.numero_telefonico, p.primer_apellido, p.segundo_apellido, p.municipio_idmunicipio, p.es_presidente FROM comite_vecinal cv INNER JOIN participante p ON cv.participante_idparticipante = p.idparticipante WHERE cv.comite_idcomite =:idcomite_vecinal", nativeQuery = true)
    List<Participante> findParticipanteByIdComiteVecinal (Long idcomite_vecinal);

}
