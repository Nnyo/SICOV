package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Data
@Entity
public class Comentario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcomentario;

    @Column(nullable = false)
    @NotBlank(message = "El comentario es requerido")
    private String comentario;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaRegistro;

    @Lob
    @Column()
    private byte[] anexo;

    @ManyToOne
    @JoinColumn(name = "incidencia_idincidencia", nullable = false)
    @NotNull(message = "La incidencia es requerida")
    private Incidencia incidencia;

    @ManyToOne
    @JoinColumn(name = "ciudadano_idciudadano", nullable = false)
    @NotNull(message = "El ciudadano es requerido")
    private Ciudadano ciudadano;

}
