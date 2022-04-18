package mx.sicov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import mx.sicov.entity.Municipio;
import mx.sicov.service.municipio.MunicipioServiceImpl;

import javax.validation.Valid;

@Controller
@RequestMapping(value = {"/municipio"})
public class MunicipioController {
    
    @Autowired
    private MunicipioServiceImpl municipioServiceImpl;

    @GetMapping("/*")
    public String handle() {
        return "Error404";
    }

    private String getListMunicipio(Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
        return "municipio/listMunicipios";
    }

    @GetMapping(value = {"", "/list"})
    public String listarMunicipios(Authentication authentication, Model model){
        return getListMunicipio(model, authentication);
    }

    @PostMapping("/save")
    public String saveMunicipio(Authentication authentication, @Valid @ModelAttribute("municipio") Municipio municipio, BindingResult result, Model model){
        if(result.hasErrors()){
            String errors = "";
            for (ObjectError error: result.getAllErrors()){
                errors = error.getDefaultMessage() + "--";
            }
            model.addAttribute("errors", errors);
            return getListMunicipio(model, authentication);
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
        return getListMunicipio(model, authentication);
    }

    @GetMapping("/update/{idmunicipio}")
    public String update(@PathVariable long idmunicipio, Model model, Authentication authentication){
        Municipio municipio = municipioServiceImpl.findById(idmunicipio);
        if(municipio != null){
            model.addAttribute("role",authentication.getAuthorities().toString());
            model.addAttribute("municipio", municipio);
            return "municipio/createMunicipio";
        }
        return getListMunicipio(model, authentication);
    }

    @PostMapping("/delete")
    public String deleteMunicipio(Long idmunicipio, Authentication authentication, Model model){
        try{
            if(municipioServiceImpl.delete(idmunicipio)){
                model.addAttribute("message","Municipio eliminado");
                model.addAttribute("alert","success");
            }else{
                model.addAttribute("message","Error al eliminar municipio");
                model.addAttribute("alert","error");
            }
        }catch (DataIntegrityViolationException e){
            model.addAttribute("alert","error");
            model.addAttribute("message","El municipio ya tiene asignado un Ciudadano");
        }
        return getListMunicipio(model, authentication);
    }

}
