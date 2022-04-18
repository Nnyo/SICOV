package mx.sicov.entity;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

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

    @Column(columnDefinition = "tinyint")
    private Integer estado;

    @Column
    @CreationTimestamp
    @Temporal(TemporalType.DATE)
    private Date fechaRegistro;

    @Column
    private Double costo;

    @Column(columnDefinition = "tinyint")
    private Integer estaPagado;

    @ManyToOne
    @JoinColumn(name = "categoria_idcategoria", nullable = false)
    @NotNull(message = "La categoría es requerida")
    private Categoria categoria;

    @ManyToOne
    @JoinColumn(name = "comite_idcomite")
    private Comite comite;

    @ManyToOne
    @JoinColumn(name = "ciudadano_idciudadano")
    private Ciudadano ciudadano;

    public Incidencia() {
    }

    

    

}
