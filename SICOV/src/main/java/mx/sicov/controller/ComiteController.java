package mx.sicov.controller;

import mx.sicov.entity.Comite;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"/comite"})
public class ComiteController {

    @GetMapping(value = {"", "/list"})
    public String listarComite(Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "enlace/listComites";
    }

    @PostMapping("/save")
    public String saveComite(Comite comite, Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "redirect:/comite/list";
    }

    @GetMapping("/delete/{idcolonia}")
    public String deleteComite(@PathVariable Long idcomite, Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "redirect:/comite/list";
    }

}
