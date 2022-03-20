package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;

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
    private Incidencia incidencia;

}
