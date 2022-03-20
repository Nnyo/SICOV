package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Ciudadano {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idciudadano;

    @Column(nullable = false, length = 45)
    private String nombre;

    @Column(nullable = false, length = 45)
    private String primerApellido;

    @Column(length = 45)
    private String segundoApellido;

    @Lob
    @Column(nullable = false)
    private Byte[] fotografia;

    @Column(length = 10)
    private String numeroTelefonico;

    @Column(length = 100)
    private String correoElectronico;

    @Column(length = 30)
    private String numeroEmpleado;

    @Column(columnDefinition = "tinyint not null")
    private Integer estatus;

    @ManyToOne
    @JoinColumn(name = "rol_idrol", nullable = false)
    private Rol rol;

    @ManyToOne
    @JoinColumn(name = "municipio_idmunicipio", nullable = false)
    private Municipio municipio;

}
