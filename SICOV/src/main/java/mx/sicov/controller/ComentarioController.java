package mx.sicov.controller;

import mx.sicov.entity.Categoria;
import mx.sicov.entity.Comentario;
import mx.sicov.entity.Incidencia;
import mx.sicov.service.comentario.ComentarioService;
import mx.sicov.service.incidencia.IncidenciaServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = {"/comentarios"})
public class ComentarioController {

    @Autowired
    ComentarioService comentarioService;

    @Autowired
    IncidenciaServiceImpl incidenciaService;

    @GetMapping("/ver/{idincidencia}")
    public String findComentarybyIdIncidencia(@PathVariable Long idincidencia, Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        Incidencia incidencia = incidenciaService.findById(idincidencia);
        model.addAttribute("listComentario", comentarioService.findComentarioByIncidencia(incidencia));
        return "comentario/verComentario";
    }

    @GetMapping("")
    public String verComentario(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "comentario/verComentario";
    }



}
