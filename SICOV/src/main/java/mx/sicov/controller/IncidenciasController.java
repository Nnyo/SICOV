package mx.sicov.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"/incidencias"})
public class IncidenciasController {

    @GetMapping(value = {"", "/list"})
    public String listarIncidencias(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "incidencia/list";
    }

    @GetMapping("/comentario")
    public String verComentario(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "incidencia/verComentario";
    }

    @GetMapping("/detalles")
    public String verDetalles(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "incidencia/VerDetalles";
    }
    @GetMapping("/anexos")
    public String verAnexos(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "incidencia/verAnexos";
    }

}
