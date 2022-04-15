package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@Entity
public class Ciudadano {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idciudadano;

    @Column(nullable = false, length = 120)
    @NotBlank(message = "El nombre es requerido")
    @Size(max = 120, message = "El nombre no puede tener más de 120 caracteres")
    private String nombre;

    @Column(nullable = false, length = 120)
    @NotBlank(message = "El primer apellido es requerido")
    @Size(max = 120, message = "El primer apellido no puede tener más de 120 caracteres")
    private String primerApellido;

    @Column(length = 120)
    private String segundoApellido;

    @Lob
    @Column(nullable = true)
    private byte[] fotografia;

    @Column(length = 10)
    @NotBlank(message = "El número telefónico es requerido")
    @Size(max = 10, message = "El número telefónico debe tener 10 digitos")
    private String numeroTelefonico;

    @Column(length = 100, name = "username")
    @NotBlank(message = "El correo electrónico es requerido")
    @Email(message = "El correo electrónico no es válido")
    @Size(max = 100, message = "El correo electrónico no deber ser mayor a 100 caracteres")
    private String correoElectronico;

    @Column(length = 30)
    @Size(max = 6, message = "El número del empleado no puede tener más de 6 caracteres")
    @Size(min = 4, message = "El número del empleado debe ser mayor a 4 caracteres")
    private String numeroEmpleado;

    @Column(columnDefinition = "tinyint not null", name = "enabled")
    private Integer estatus;

    @Column(name = "password", length = 250)
    @NotBlank(message = "La contraseña es requerida")
    private String password;

    @Column(name = "rol", length = 50)
    @NotBlank(message = "El rol es requerido")
    private String rol;

    @ManyToOne
    @JoinColumn(name = "municipio_idmunicipio", nullable = false)
    @NotNull(message = "El municipio es requerido")
    private Municipio municipio;

    public Ciudadano() {
    }

}
