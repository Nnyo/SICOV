package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Colonia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcolonia;

    @Column(nullable = false, length = 80)
    private String nombre;

    @Column(nullable = false, length = 10)
    private String codigoPostal;

    @ManyToOne
    @JoinColumn(name = "municipio_idmunicipio", nullable = false)
    private Municipio municipio;

}
