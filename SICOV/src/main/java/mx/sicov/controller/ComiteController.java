package mx.sicov.controller;

import mx.sicov.entity.Comite;
import mx.sicov.service.ciudadano.CiudadanoServiceImpl;
import mx.sicov.service.comite.ComiteService;
import mx.sicov.service.municipio.MunicipioServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = {"/comite"})
public class ComiteController {

    @Autowired
    private CiudadanoServiceImpl ciudadanoService;

    @Autowired
    private MunicipioServiceImpl municipioServiceImpl;

    @Autowired
    private ComiteService comiteService;

    @GetMapping(value = {"", "/list"})
    public String listarComite(Model model, Authentication authentication){
        model.addAttribute("municipio", municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getNombre());
        model.addAttribute("role",authentication.getAuthorities().toString());
        List<Comite> list = comiteService.findComiteByIdMunicipio(municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getIdmunicipio());
        model.addAttribute("listComite",list);
        return "enlace/listComite";
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

    @GetMapping("/solicitudes")
    public String listarSolicitudes(Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("municipio", municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getNombre());
        return "enlace/requestsComites";
    }

    @GetMapping("/nuevo")
    public String nuevoComite(Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "enlace/registerComites";
    }


}
