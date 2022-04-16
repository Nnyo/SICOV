package mx.sicov.controller;

import mx.sicov.entity.Ciudadano;
import mx.sicov.service.ciudadano.CiudadanoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"/cambioContrasenia"})
public class UpdatePasswordController {

    @Autowired
    CiudadanoServiceImpl ciudadanoService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @GetMapping("/update")
    public String modificarPassword(Authentication authentication, Model model){
        return getString(model, authentication);
    }

    @PostMapping("/save")
    public String savePassword(String password, Authentication authentication, Model model){
        String passwordEncode = passwordEncoder.encode(password);
        Ciudadano ciudadano = ciudadanoService.findObjCiudadanoByCorreoElectronico(authentication.getName());
        ciudadano.setPassword(passwordEncode);
        try{
            if(ciudadanoService.update(ciudadano)){
                model.addAttribute("alert","success");
                model.addAttribute("message","Contraseña actualizada");
            }else{
                model = errorModel(model);
            }
        }catch (Exception e){
            model = errorModel(model);
        }
        return getString(model, authentication);
    }

    private String getString(Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "updatePassword";
    }

    private Model errorModel(Model model){
        model.addAttribute("alert","error");
        model.addAttribute("message","No se ha podido actualizar la contraseña");
        return model;
    }

}
