package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@Entity
public class Participante {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idparticipante;

    @Column(length = 10, nullable = false)
    @NotBlank(message = "El número telefónico es requerido")
    @Size(max = 10, message = "El número telefónico debe tener 10 digitos")
    private String numeroTelefonico;

    @Lob
    @Column
    private byte[] fotografia;

    @Column(nullable = false, length = 120)
    @NotBlank(message = "El nombre es requerido")
    @Size(max = 120, message = "El nombre no puede tener mas de 120 caracteres")
    private String nombre;

    @Column(nullable = false, length = 120)
    @NotBlank(message = "El primer apellido es requerido")
    @Size(max = 120, message = "El primer apellido no puede tener mas de 120 caracteres")
    private String primerApellido;

    @Column(length = 120)
    private String segundoApellido;

    @Column(length = 100)
    private String esPresidente;

    @ManyToOne
    @JoinColumn(name = "municipio_idmunicipio", nullable = false)
    @NotNull(message = "El municipio es requerido")
    private Municipio municipio;

    public Participante() {
    }

}