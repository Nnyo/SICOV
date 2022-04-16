package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
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
    @NotBlank(message = "La descripción es requerida")
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
    @DecimalMax("10000.0")
    @DecimalMin("0.0") 
    private Double costo;

    @Column(columnDefinition = "tinyint not null")
    @NotNull
    private Integer estaPagado;

    @ManyToOne
    @JoinColumn(name = "categoria_idcategoria", nullable = false)
    @NotNull(message = "La categoría es requerida")
    private Categoria categoria;

    @ManyToOne
    @JoinColumn(name = "comiteVecinal_idcomiteVecinal", nullable = false)
    @NotNull(message = "El comité vecinal es requerido")
    private ComiteVecinal comiteVecinal;

    public Incidencia() {
    }

    

    

}
