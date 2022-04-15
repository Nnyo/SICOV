package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@Entity
public class Colonia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcolonia;

    @Column(nullable = false, length = 120)
    @NotBlank(message = "El nombre es requerido")
    @Size(max = 80, message = "El nombre no puede tener más de 80 caracteres")
    private String nombre;

    @Column(nullable = false, length = 10)
    @NotBlank(message = "El código postal es requerido")
    @Size(min = 5, max = 5, message = "El código postal debe tener 5 digitos")
    private String codigoPostal;

    @ManyToOne
    @JoinColumn(name = "municipio_idmunicipio", nullable = false)
    private Municipio municipio;

    @Column(length = 100, name = "ciudadano")
    private String ciudadano;

    public Colonia() {
    }

}