package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class ComiteVecinal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcomiteVecinal;

    @Column(columnDefinition = "tinyint not null")
    private Integer esPresidente;

    @ManyToOne
    @JoinColumn(name = "ciudadano_idciudadano", nullable = false)
    private Ciudadano ciudadano;

    @ManyToOne
    @JoinColumn(name = "comite_idcomite", nullable = false)
    private Comite comite;

}
