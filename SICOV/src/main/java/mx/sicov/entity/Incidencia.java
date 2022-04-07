package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import java.util.Date;

@Data
@Entity
public class Incidencia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idincidencia;

    @Column(nullable = false)
    @NotBlank(message = "La descripción es requerido")
    private String descripcion;

    @Column(columnDefinition = "tinyint not null")
    @NotNull
    private Integer estado;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    @NotNull(message = "La fecha es requerida")
    private Date fechaRegistro;

    @Column
    @NotNull(message = "El costo es requerida")
    @Size(min = 1, max = 10, message = "El costo no puede tener mas de 10 caracteres")
    private Double costo;

    @Column(columnDefinition = "tinyint not null")
    @NotNull
    private Integer estaPagado;

    @ManyToOne
    @JoinColumn(name = "categoria_idcategoria", nullable = false)
    @NotNull(message = "La categoria es requerida")
    private Categoria categoria;

    @ManyToOne
    @JoinColumn(name = "comiteVecinal_idcomiteVecinal", nullable = false)
    @NotNull(message = "El comite vecinal es requerido")
    private ComiteVecinal comiteVecinal;

}
