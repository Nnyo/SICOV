package mx.sicov.entity;

import lombok.Data;

import java.util.Arrays;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
@Entity
public class Ciudadano {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idciudadano;

    @Column(nullable = false, length = 120)
    @NotBlank(message = "El nombre es requerido")
    @Size(min = 2, max = 120, message = "El nombre no puede tener mas de 120 caracteres")
    private String nombre;

    @Column(nullable = false, length = 120)
    @NotBlank(message = "El primer apellido es requerido")
    @Size(min = 2, max = 120, message = "El primer apellido no puede tener mas de 120 caracteres")
    private String primerApellido;

    @Column(length = 120)
    @NotBlank(message = "El segundo apellido es requerido")
    @Size(min = 2, max = 120, message = "El segundo apellido no puede tener mas de 120 caracteres")
    private String segundoApellido;

    @Lob
    @Column(nullable = true)
    private Byte[] fotografia;

    @Column(length = 10)
    @NotNull(message = "El Numero telefonico es requerido")
    @Pattern(regexp="[0-9]")
    @Size(min = 10, max = 15, message = "El numero telefonico debe tener 10 digitos")
    private String numeroTelefonico;

    @Column(length = 100, name = "username")
    @Email(message = "El correo electronico no es valido")
    private String correoElectronico;

    @Column(length = 30)
    @Size(min = 4, max = 4, message = "El número del empleado no puede tener mas de 4 caracteres")
    private String numeroEmpleado;

    @Column(columnDefinition = "tinyint not null", name = "enabled")
    private Integer estatus;

    @Column(name = "password", length = 250)
    private String password;

    @ManyToOne
    @JoinColumn(name = "municipio_idmunicipio", nullable = false)
    @NotNull(message = "El municipio es requerido")
    private Municipio municipio;

    public Ciudadano() {
    }

    public Ciudadano(Long idciudadano, String nombre, String primerApellido, String segundoApellido, Byte[] fotografia,
            String numeroTelefonico, String correoElectronico, String numeroEmpleado, Integer estatus, String password,
            Municipio municipio) {
        this.idciudadano = idciudadano;
        this.nombre = nombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.fotografia = fotografia;
        this.numeroTelefonico = numeroTelefonico;
        this.correoElectronico = correoElectronico;
        this.numeroEmpleado = numeroEmpleado;
        this.estatus = estatus;
        this.password = password;
        this.municipio = municipio;
    }

    public Long getIdciudadano() {
        return idciudadano;
    }

    public void setIdciudadano(Long idciudadano) {
        this.idciudadano = idciudadano;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public Byte[] getFotografia() {
        return fotografia;
    }

    public void setFotografia(Byte[] fotografia) {
        this.fotografia = fotografia;
    }

    public String getNumeroTelefonico() {
        return numeroTelefonico;
    }

    public void setNumeroTelefonico(String numeroTelefonico) {
        this.numeroTelefonico = numeroTelefonico;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getNumeroEmpleado() {
        return numeroEmpleado;
    }

    public void setNumeroEmpleado(String numeroEmpleado) {
        this.numeroEmpleado = numeroEmpleado;
    }

    public Integer getEstatus() {
        return estatus;
    }

    public void setEstatus(Integer estatus) {
        this.estatus = estatus;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Municipio getMunicipio() {
        return municipio;
    }

    public void setMunicipio(Municipio municipio) {
        this.municipio = municipio;
    }

    @Override
    public String toString() {
        return "Ciudadano [correoElectronico=" + correoElectronico + ", estatus=" + estatus + ", fotografia="
                + Arrays.toString(fotografia) + ", idciudadano=" + idciudadano + ", municipio=" + municipio
                + ", nombre=" + nombre + ", numeroEmpleado=" + numeroEmpleado + ", numeroTelefonico=" + numeroTelefonico
                + ", password=" + password + ", primerApellido=" + primerApellido + ", segundoApellido="
                + segundoApellido + "]";
    }

}
