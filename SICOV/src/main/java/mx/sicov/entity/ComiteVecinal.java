package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Data
@Entity
public class ComiteVecinal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcomiteVecinal;

    @Column(columnDefinition = "tinyint not null")
    @NotNull
    private Integer esPresidente;

    @ManyToOne
    @JoinColumn(name = "ciudadano_idciudadano", nullable = false)
    @NotNull(message = "El ciudadano es requerido")
    private Ciudadano ciudadano;

    @ManyToOne
    @JoinColumn(name = "comite_idcomite", nullable = false)
    @NotNull(message = "El comite es requerido")
    private Comite comite;

}
