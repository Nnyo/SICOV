package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Comentario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcomentario;

    @Column(nullable = false)
    private String comentario;

    @Lob
    @Column(nullable = false)
    private Byte[] anexo;

    @ManyToOne
    @JoinColumn(name = "incidencia_idincidencia", nullable = false)
    private Incidencia incidencia;

    @ManyToOne
    @JoinColumn(name = "ciudadano_idciudadano", nullable = false)
    private Ciudadano ciudadano;

}
