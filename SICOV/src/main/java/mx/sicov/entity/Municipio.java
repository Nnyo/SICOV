package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
@Entity
@Table(name = "municipio")
public class Municipio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idmunicipio;

    @Column(nullable = false, length = 50, unique = true)
    @NotBlank(message = "El nombre del municipio es obligatorio")
    @Size(max = 50, message = "El nombre del municipio no puede tener más de 50 caracteres")
    @Size(min = 5, message = "El nombre del municipio no puede ser menor de 5 caracteres")
    @Pattern(regexp = "[a-zA-ZñÑáéíóúÁÉÍÓÚ\\s]+", message = "El nombre del municipio no puede contener números y/o caracteres especiales")
    private String nombre;

    public Municipio() {
    }

}