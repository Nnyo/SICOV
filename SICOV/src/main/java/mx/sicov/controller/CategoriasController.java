package mx.sicov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import mx.sicov.entity.Categoria;
import mx.sicov.service.categoria.CategoriaServiceImpl;

@Controller
@RequestMapping(value = {"/categoria"})
public class CategoriasController {

    @Autowired
    private CategoriaServiceImpl categoriaServiceImpl;

    @GetMapping(value = {"", "/list"})
    @Secured("ROLE_ADMINISTRADOR")
    public String listarServicios(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listCategoria", categoriaServiceImpl.listAll());
        return "categoria/listCategorias";
    }

    @PostMapping("/save")
    @Secured("ROLE_ADMINISTRADOR")
    public String saveCategoria(Authentication authentication, Categoria categoria, Model model){
        Long id = categoria.getIdcategoria();
        if(categoriaServiceImpl.save(categoria)){
            model.addAttribute("alert","success");
            if(id == null){
                model.addAttribute("message","Servicio público registrado");
            }else{
                model.addAttribute("message","Servicio público actualizado");
            }
        }else{
            model.addAttribute("alert","error");
            if(id == null){
                model.addAttribute("message","Error al registrar el Servicio público");
            }else{
                model.addAttribute("message","Error al actualizar el Servicio público");
            }
        }
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listCategoria", categoriaServiceImpl.listAll());
        return "categoria/listCategorias";
    }

    @GetMapping("/update/{idcategoria}")
    @Secured("ROLE_ADMINISTRADOR")
    public String update(@PathVariable long idcategoria, Model model, Authentication authentication){
        Categoria categoria = categoriaServiceImpl.findById(idcategoria);
        if(categoria != null){
            model.addAttribute("role",authentication.getAuthorities().toString());
            model.addAttribute("categoria", categoria);
            return "categoria/listCategorias";
        }
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listCategoria", categoriaServiceImpl.listAll());
        return "categoria/listCategorias";
    }

    @PostMapping("/delete")
    @Secured("ROLE_ADMINISTRADOR")
    public String deleteCategoria(Long idcategoria, Authentication authentication, Model model){
        if(categoriaServiceImpl.delete(idcategoria)){
            model.addAttribute("message","Servicio Público eliminado");
            model.addAttribute("alert","success");
        }else{
            model.addAttribute("message","Error al eliminar el Servicio Público");
            model.addAttribute("alert","error");
        }
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listCategoria", categoriaServiceImpl.listAll());
        return "categoria/listCategorias";
    }

}
