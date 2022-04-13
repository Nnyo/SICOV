package mx.sicov.service.categoria;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mx.sicov.entity.Categoria;
import mx.sicov.repository.CategoriaRepository;

@Service
public class CategoriaServiceImpl implements CategoriaService{

    @Autowired
    private CategoriaRepository categoriaRepository;

    @Override
    public List<Categoria> listAll(){
        return categoriaRepository.findAll();
    }

    @Override
    public Categoria findById(Long idcategoria){
        Optional<Categoria> optional = categoriaRepository.findById(idcategoria);
        if(optional.isPresent()){
            return optional.get();
        }
        return null;
    }

    @Override
    public boolean save(Categoria categoria){
        try {
            categoriaRepository.saveAndFlush(categoria);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean update(Categoria categoria){
        Optional<Categoria> optCategoria = categoriaRepository.findById(categoria.getIdcategoria());
        if(!optCategoria.isPresent()){
            return false;
        }
        Categoria update = optCategoria.get();
        update = categoriaRepository.saveAndFlush(update);
        return update != null ? true : false;
    }

    @Override
	public boolean delete(long idcategoria) {
		boolean exist = categoriaRepository.existsById(idcategoria);
		if(exist){
			categoriaRepository.deleteById(idcategoria);
			return true;
		}
		return false;
	}
    
}
