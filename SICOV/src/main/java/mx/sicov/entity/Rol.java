package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Rol {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idrol;

    @Column(nullable = false, length = 45)
    private String nombre;

}
