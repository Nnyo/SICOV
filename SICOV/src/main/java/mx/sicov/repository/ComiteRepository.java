package mx.sicov.repository;

import mx.sicov.entity.Comite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ComiteRepository extends JpaRepository<Comite, Long> {

}
