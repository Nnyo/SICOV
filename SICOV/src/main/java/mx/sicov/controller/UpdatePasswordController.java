package mx.sicov.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"/cambioContrasenia"})
public class UpdatePasswordController {

    @GetMapping("/update")
    public String modificarPassword(){
        return "updatePassword";
    }
}
