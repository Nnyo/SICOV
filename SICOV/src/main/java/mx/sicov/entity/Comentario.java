package mx.sicov.entity;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
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
    @CreationTimestamp
    private Date fechaRegistro;

    @Lob
    @Column()
    private byte[] anexo;

    @ManyToOne
    @JoinColumn(name = "incidencia_idincidencia")
    private Incidencia incidencia;

    @ManyToOne
    @JoinColumn(name = "ciudadano_idciudadano")
    private Ciudadano ciudadano;

}
