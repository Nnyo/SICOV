package mx.sicov.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequestMapping(value = {"/"})
public class LoginController {

    @GetMapping("/login")
    public String login(@RequestParam(value = "error", required = false) String error, Principal principal,
                        @RequestParam(value = "logout", required = false) String logout, Model model){
        model.addAttribute("message","");
        model.addAttribute("alert","");
        if (error != null){
            model.addAttribute("message","Error al iniciar sesión");
            model.addAttribute("alert","error");
        }
        if(logout != null){
            model.addAttribute("message","Sesión cerrada");
            model.addAttribute("alert","success");
        }
        if (principal != null){
            model.addAttribute("message","Ya tienes una sesión iniciada");
            model.addAttribute("alert","warning");
        }
        return "login";
    }

    @GetMapping("/*")
    public String handle() {
        return "Error404";
    }

    @GetMapping(value = {"","/home"})
    public String home(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "home";
    }

}
