package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Data
@Entity
public class Evidencia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idevidencia;

    @Lob
    @Column(nullable = false)
    private Byte[] evidencia;

    @ManyToOne
    @JoinColumn(name = "incidencia_idincidencia", nullable = false)
    @NotNull(message = "La incidencia es requerida")
    private Incidencia incidencia;

}
