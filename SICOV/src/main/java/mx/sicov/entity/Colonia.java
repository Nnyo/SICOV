package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@Entity
public class Colonia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcolonia;

    @Column(nullable = false, length = 120)
    @NotBlank(message = "El nombre es requerido")
    @Size(min = 2, max = 120, message = "El nombre no puede tener mas de 80 caracteres")
    private String nombre;

    @Column(nullable = false, length = 10)
    @NotNull(message = "El codigo postal es requerido")
    @Size(min = 5, max = 5, message = "El codigo postal debe tener 5 digitos")
    private String codigoPostal;

    @ManyToOne
    @JoinColumn(name = "municipio_idmunicipio", nullable = false)
    @NotNull(message = "El municipio es requerido")
    private Municipio municipio;

    @Column(length = 100, name = "ciudadano")
    private String ciudadano;

    public Colonia() {
    }

    public Colonia(Long idcolonia,
            @NotBlank(message = "El nombre es requerido") @Size(min = 2, max = 120, message = "El nombre no puede tener mas de 80 caracteres") String nombre,
            @NotNull(message = "El codigo postal es requerido") @Size(min = 5, max = 5, message = "El codigo postal debe tener 5 digitos") String codigoPostal,
            @NotNull(message = "El municipio es requerido") Municipio municipio, String ciudadano) {
        this.idcolonia = idcolonia;
        this.nombre = nombre;
        this.codigoPostal = codigoPostal;
        this.municipio = municipio;
        this.ciudadano = ciudadano;
    }

    public Long getIdcolonia() {
        return idcolonia;
    }

    public void setIdcolonia(Long idcolonia) {
        this.idcolonia = idcolonia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public Municipio getMunicipio() {
        return municipio;
    }

    public void setMunicipio(Municipio municipio) {
        this.municipio = municipio;
    }

    public String getCiudadano() {
        return ciudadano;
    }

    public void setCiudadano(String ciudadano) {
        this.ciudadano = ciudadano;
    }

    @Override
    public String toString() {
        return "Colonia [ciudadano=" + ciudadano + ", codigoPostal=" + codigoPostal + ", idcolonia=" + idcolonia
                + ", municipio=" + municipio + ", nombre=" + nombre + "]";
    }


}
