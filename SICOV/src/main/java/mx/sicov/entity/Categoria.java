package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
@Entity
public class Categoria {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcategoria;

    @Column(nullable = false, length = 45)
    @NotBlank(message = "El nombre es requerido")
    @Size(min = 2, max = 120, message = "El nombre no puede tener mas de 120 caracteres")
    private String nombre;

}
