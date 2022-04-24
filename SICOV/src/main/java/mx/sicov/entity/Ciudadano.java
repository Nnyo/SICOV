package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Pattern;

@Data
@Entity
public class Ciudadano {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idciudadano;

    @Column(nullable = false, length = 120)
    @NotBlank(message = "El nombre es requerido")
    @Size(max = 120, message = "El nombre no puede tener más de 120 caracteres")
    @Size(min = 2, message = "El nombre no puede ser menor de 2 caracteres")
    @Pattern(regexp = "[a-zA-ZñÑáéíóúÁÉÍÓÚ\\s]+", message = "El nombre no puede contener números y/o caracteres especiales")
    private String nombre;

    @Column(nullable = false, length = 120)
    @NotBlank(message = "El primer apellido es requerido")
    @Size(max = 120, message = "El primer apellido no puede tener más de 120 caracteres")
    @Size(min = 2, message = "El nombre no puede ser menor de 2 caracteres")
    @Pattern(regexp = "[a-zA-ZñÑáéíóúÁÉÍÓÚ\\s]+", message = "El primer apellido no puede contener números y/o caracteres especiales")
    private String primerApellido;

    @Column(length = 120)
    private String segundoApellido;

    @Lob
    @Column(nullable = true)
    private byte[] fotografia;

    @Column(length = 10)
    @NotBlank(message = "El número telefónico es requerido")
    @Size(max = 10, message = "El número telefónico debe tener 10 digitos")
    @Pattern(regexp = "[0-9]+", message = "El número telefónico no puede contener letras")
    private String numeroTelefonico;

    @Column(length = 100, name = "username", unique = true)
    @NotBlank(message = "El correo electrónico es requerido")
    @Email(message = "El correo electrónico no es válido")
    @Size(max = 100, message = "El correo electrónico no deber ser mayor a 100 caracteres")
    private String correoElectronico;

    @Column(length = 30, unique = true)
    @Size(max = 6, message = "El número del empleado no puede tener más de 6 caracteres")
    @Size(min = 4, message = "El número del empleado debe ser mayor a 4 caracteres")
    @Pattern(regexp = "[0-9]+", message = "El número del empleado no puede contener letras")
    private String numeroEmpleado;

    @Column(columnDefinition = "tinyint not null", name = "enabled")
    private Integer estatus;

    @Column(name = "password", length = 250)
    @NotBlank(message = "La contraseña es requerida")
    @Pattern(regexp = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$", message = "La contraseña debe contener al menos una mayúscula, una minúscula, un número y un caracter especial")
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
