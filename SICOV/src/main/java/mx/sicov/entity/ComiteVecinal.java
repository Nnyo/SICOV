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

    @ManyToOne
    @JoinColumn(name = "ciudadano_idciudadano", nullable = true)
    private Ciudadano ciudadano;

    @ManyToOne
    @JoinColumn(name = "comite_idcomite", nullable = false)
    @NotNull(message = "El comité es requerido")
    private Comite comite;

    @ManyToOne
    @JoinColumn(name = "participante_idparticipante", nullable = true)
    private Participante participante;

    public ComiteVecinal() {
    }

}