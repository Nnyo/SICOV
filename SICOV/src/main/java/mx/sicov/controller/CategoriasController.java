package mx.sicov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import mx.sicov.entity.Categoria;
import mx.sicov.service.categoria.CategoriaServiceImpl;

import javax.validation.Valid;

@Controller
@RequestMapping(value = {"/categoria"})
public class CategoriasController {

    @Autowired
    private CategoriaServiceImpl categoriaServiceImpl;

    @GetMapping("/*")
    public String handle() {
        return "Error404";
    }

    @GetMapping(value = {"", "/list"})
    public String listarServicios(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listCategoria", categoriaServiceImpl.listAll());
        return "categoria/listCategorias";
    }

    @PostMapping("/save")
    public String saveCategoria(Authentication authentication, @Valid @ModelAttribute("categoria") Categoria categoria, BindingResult result, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        if(result.hasErrors()){
            String errors = "";
            for (ObjectError error: result.getAllErrors()){
                errors = error.getDefaultMessage() + "--";
            }
            model.addAttribute("errors", errors);
            model.addAttribute("listCategoria", categoriaServiceImpl.listAll());
            return "categoria/listCategorias";
        }
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
        model.addAttribute("listCategoria", categoriaServiceImpl.listAll());
        return "categoria/listCategorias";
    }

    @GetMapping("/update/{idcategoria}")
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
