package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "bitacoraacciones")
public class Bitacora {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_bitacora_acciones;

    @Column(length = 10)
    private String operacion;

    @Column(length = 40)
    private String usuario;

    @Column(length = 30)
    private String host;

    @Column
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;

    @Column(length = 40)
    private String tabla;

    @Column(length = 4000)
    private String datos;

}
