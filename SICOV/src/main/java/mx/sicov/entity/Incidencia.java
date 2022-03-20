package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
public class Incidencia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idincidencia;

    @Column(nullable = false)
    private String descripcion;

    @Column(columnDefinition = "tinyint not null")
    private Integer estado;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaRegistro;

    @Column
    private Double costo;

    @Column(columnDefinition = "tinyint not null")
    private Integer estaPagado;

    @ManyToOne
    @JoinColumn(name = "categoria_idcategoria", nullable = false)
    private Categoria categoria;

    @ManyToOne
    @JoinColumn(name = "comiteVecinal_idcomiteVecinal", nullable = false)
    private ComiteVecinal comiteVecinal;

}
