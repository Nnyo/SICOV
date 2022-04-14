package mx.sicov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import mx.sicov.entity.Municipio;
import mx.sicov.service.municipio.MunicipioServiceImpl;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

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
    public String saveMunicipio(Authentication authentication, @Valid @ModelAttribute("municipio") Municipio municipio, BindingResult result, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        if(result.hasErrors()){
            String errors = "";
            for (ObjectError error: result.getAllErrors()){
                errors = error.getDefaultMessage() + "--";
            }
            model.addAttribute("errors", errors);
            model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
            return "municipio/listMunicipios";
        }
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

    @PostMapping("/delete")
    @Secured("ROLE_ADMINISTRADOR")
    public String deleteMunicipio(Long idmunicipio, Authentication authentication, Model model){
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
