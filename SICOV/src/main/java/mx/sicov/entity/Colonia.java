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
    @Size(min = 2, max = 120, message = "El nombre no puede tener mas de 80 caracteres")
    private String nombre;

    @Column(nullable = false, length = 10)
    @NotNull(message = "El codigo postal es requerido")
    @Size(min = 5, max = 5, message = "El codigo postal debe tener 5 digitos")
    private String codigoPostal;

    @ManyToOne
    @JoinColumn(name = "municipio_idmunicipio", nullable = false)
    @NotNull(message = "El municipio es requerido")
    private Municipio municipio;

}
