package mx.sicov.service.categoria;

import java.util.List;

import mx.sicov.entity.Categoria;

public interface CategoriaService {

    List<Categoria> listAll();
    Categoria findById(Long idcategoria);
    boolean save(Categoria categoria);
    boolean update(Categoria categoria);
    boolean delete(long idcategoria);
    
}
