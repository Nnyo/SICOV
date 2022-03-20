package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Comite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcomite;

    @Column(nullable = false, length = 80)
    private String nombre;

    @ManyToOne
    @JoinColumn(name = "colonia_idcolonia", nullable = false)
    private Colonia colonia;

}
