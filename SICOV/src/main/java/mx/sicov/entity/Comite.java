package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
@Entity
public class Comite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcomite;

    @Column(nullable = false, length = 80)
    @NotBlank(message = "El nombre es requerido")
    private String nombre;

    @ManyToOne
    @JoinColumn(name = "colonia_idcolonia", nullable = false)
    @NotNull(message = "La colonia es requerida")
    private Colonia colonia;

}
