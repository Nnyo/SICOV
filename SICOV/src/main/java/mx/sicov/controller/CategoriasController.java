package mx.sicov.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"/servicios_publicos"})
public class CategoriasController {

    @GetMapping(value = {"", "/list"})
    public String listarServicios(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "categoria/listCategorias";
    }

}
