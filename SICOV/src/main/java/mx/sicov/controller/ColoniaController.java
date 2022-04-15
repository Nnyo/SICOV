package mx.sicov.controller;

import mx.sicov.service.ciudadano.CiudadanoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import mx.sicov.entity.Colonia;
import mx.sicov.service.colonia.ColoniaServiceImpl;
import mx.sicov.service.municipio.MunicipioServiceImpl;

import javax.validation.Valid;

@Controller
@RequestMapping(value = {"/colonia"})
public class ColoniaController {

    @Autowired
    private CiudadanoServiceImpl ciudadanoService;

    @Autowired
    private ColoniaServiceImpl coloniaServiceImpl;

    @Autowired
    private MunicipioServiceImpl municipioServiceImpl;

    @GetMapping(value = {"", "/list"})
    public String listarColonia(Model model, Authentication authentication){
        return getString(model, authentication);
    }

    @PostMapping("/save")
    public String saveColonia(@Valid @ModelAttribute("colonia") Colonia colonia, BindingResult result, Model model, Authentication authentication){
        if(result.hasErrors()){
            String errors = "";
            for (ObjectError error: result.getAllErrors()){
                errors = error.getDefaultMessage() + "--";
            }
            model.addAttribute("errors", errors);
            return getString(model, authentication);
        }
        colonia.setCiudadano(authentication.getName());
        Long id = colonia.getIdcolonia();
        if(coloniaServiceImpl.save(colonia)){
            model.addAttribute("alert","success");
            if(id == null){
                model.addAttribute("message","Colonia registrada");
            }else{
                model.addAttribute("message","Colonia actualizada");
            }
        }else{
            model.addAttribute("alert","error");
            if(id == null){
                model.addAttribute("message","Error al registrar colonia");
            }else{
                model.addAttribute("message","Error al actualizar colonia");
            }
        }
        return getString(model, authentication);
    }

    private String getString(Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listColonia", coloniaServiceImpl.findColoniasByCiudadano(authentication.getName()));
        model.addAttribute("listMunicipio", municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())));
        return "colonia/listColonias";
    }

    @PostMapping("/delete")
    public String deleteColonia(Long idcolonia, Model model, Authentication authentication){
        try{
            coloniaServiceImpl.delete(idcolonia);
            model.addAttribute("alert","success");
            model.addAttribute("message","Colonia eliminada");
        }catch (DataIntegrityViolationException e){
            model.addAttribute("alert","error");
            model.addAttribute("message","La colonia ya pertenece a un comité");
        }
        return getString(model, authentication);
    }

}
