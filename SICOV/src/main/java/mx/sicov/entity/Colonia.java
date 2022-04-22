package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import javax.validation.constraints.Pattern;

@Data
@Entity
public class Colonia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcolonia;

    @Column(nullable = false, length = 100, unique = true)
    @NotBlank(message = "El nombre de la colonia es requerido")
    @Size(max = 100, message = "El nombre de la colonia no puede tener más de 100 caracteres")
    @Size(min = 3, message = "El nombre de la colonia no puede ser menor de 3 caracteres")
    @Pattern(regexp = "[a-zA-ZñÑáéíóúÁÉÍÓÚ\\s]+", message = "El nombre de la colonia no puede contener números y/o caracteres especiales")
    private String nombre;

    @Column(nullable = false, length = 10)
    @NotBlank(message = "El código postal es requerido")
    @Size(min = 5, max = 5, message = "El código postal debe tener 5 dígitos")
    @Pattern(regexp = "[0-9]+", message = "El código postal debe contener solo números")
    private String codigoPostal;

    @ManyToOne
    @JoinColumn(name = "municipio_idmunicipio", nullable = false)
    private Municipio municipio;

    @Column(length = 100, name = "ciudadano")
    private String ciudadano;

    public Colonia() {
    }

}