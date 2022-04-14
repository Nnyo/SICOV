package mx.sicov.entity;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
@Entity
public class Categoria {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idcategoria;

    @Column(nullable = false, length = 120)
    @NotBlank(message = "El nombre es requerido")
    @Size(max = 120, message = "El nombre no puede tener más de 120 caracteres")
    @Size(min = 3, message = "El nombre no puede ser menor de 3 caracteres")
    private String nombre;

    public Categoria() {
    }

    public Categoria(Long idcategoria,
            @NotBlank(message = "El nombre es requerido") @Size(max = 120, message = "El nombre no puede tener más de 120 caracteres") @Size(min = 3, message = "El nombre no puede ser menor de 3 caracteres") String nombre) {
        this.idcategoria = idcategoria;
        this.nombre = nombre;
    }

    public Long getIdcategoria() {
        return idcategoria;
    }

    public void setIdcategoria(Long idcategoria) {
        this.idcategoria = idcategoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        return "Categoria [idcategoria=" + idcategoria + ", nombre=" + nombre + "]";
    }

    

}
