package mx.sicov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import mx.sicov.entity.Municipio;
import mx.sicov.service.municipio.MunicipioServiceImpl;

@Controller
@RequestMapping(value = {"/municipio"})
public class MunicipioController {
    
    @Autowired
    private MunicipioServiceImpl municipioServiceImpl;

    @GetMapping(value = {"", "/list"})
    @Secured("ROLE_ADMINISTRADOR")
    public String listarMunicipios(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
        return "municipio/listMunicipios";
    }

    @PostMapping("/save")
    @Secured("ROLE_ADMINISTRADOR")
    public String saveMunicipio(Authentication authentication, Municipio municipio, Model model){
        Long id = municipio.getIdmunicipio();
        if(municipioServiceImpl.save(municipio)){
            model.addAttribute("alert","success");
            if(id == null){
                model.addAttribute("message","Municipio registrado");
            }else{
                model.addAttribute("message","Municipio actualizado");
            }
        }else{
            model.addAttribute("alert","error");
            if(id == null){
                model.addAttribute("message","Error al registrar municipio");
            }else{
                model.addAttribute("message","Error al actualizar municipio");
            }
        }
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
        return "municipio/listMunicipios";
    }

    @GetMapping("/update/{idmunicipio}")
    @Secured("ROLE_ADMINISTRADOR")
    public String update(@PathVariable long idmunicipio, Model model, Authentication authentication){
        Municipio municipio = municipioServiceImpl.findById(idmunicipio);
        if(municipio != null){
            model.addAttribute("role",authentication.getAuthorities().toString());
            model.addAttribute("municipio", municipio);
            return "municipio/createMunicipio";
        }
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
        return "municipio/listMunicipios";
    }

    @GetMapping("/delete/{idmunicipio}")
    @Secured("ROLE_ADMINISTRADOR")
    public String deleteMunicipio(@PathVariable Long idmunicipio, Authentication authentication, Model model){
        if(municipioServiceImpl.delete(idmunicipio)){
            model.addAttribute("message","Municipio eliminado");
            model.addAttribute("alert","success");
        }else{
            model.addAttribute("message","Error al eliminar municipio");
            model.addAttribute("alert","error");
        }
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
        return "municipio/listMunicipios";
    }

    
}
