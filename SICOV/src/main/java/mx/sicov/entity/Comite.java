package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Pattern;

@Data
@Entity
public class Comite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcomite;

    @Column(nullable = false, length = 80)
    @NotBlank(message = "El nombre es requerido")
    @Size(max = 80, message = "El nombre no debe tener más de 80 caracteres")
    @Pattern(regexp = "[a-zA-ZñÑáéíóúÁÉÍÓÚ\\s]+", message = "El nombre del comité no puede contener números y/o caracteres especiales")
    private String nombre;

    @ManyToOne
    @JoinColumn(name = "colonia_idcolonia", nullable = false)
    @NotNull(message = "La colonia es requerida")
    private Colonia colonia;

    public Comite() {
    }

}