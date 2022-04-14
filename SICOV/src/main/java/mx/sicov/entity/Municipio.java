package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
@Entity
@Table(name = "municipio")
public class Municipio {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idmunicipio;

    @Column(nullable = false, length = 120)
    @NotBlank(message = "El nombre del municipio es obligatorio")
    @Size(max = 120, message = "El nombre del municipio no puede tener más de 120 caracteres")
    @Size(min = 5, message = "El nombre del municipio no puede ser menor de 5 caracteres")
    private String nombre;

    public Municipio() {
    }

    public Municipio(Long idmunicipio,
            @NotBlank(message = "El nombre del municipio es obligatorio") @Size(max = 120, message = "El nombre del municipio no puede tener más de 120 caracteres") @Size(min = 5, message = "El nombre del municipio no puede ser menor de 5 caracteres") String nombre) {
        this.idmunicipio = idmunicipio;
        this.nombre = nombre;
    }

    public Long getIdmunicipio() {
        return idmunicipio;
    }

    public void setIdmunicipio(Long idmunicipio) {
        this.idmunicipio = idmunicipio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return "Municipio [idmunicipio=" + idmunicipio + ", nombre=" + nombre + "]";
    }

    

}
