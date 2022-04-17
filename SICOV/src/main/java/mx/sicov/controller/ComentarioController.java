package mx.sicov.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"/comentarios"})
public class ComentarioController {

    @GetMapping("")
    public String verComentario(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "incidencia/verComentario";
    }

}
