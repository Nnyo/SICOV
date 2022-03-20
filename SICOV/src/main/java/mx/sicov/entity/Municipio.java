package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Municipio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idmunicipio;

    @Column(nullable = false, length = 80)
    private String nombre;

}
