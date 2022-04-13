package mx.sicov.controller;

import mx.sicov.service.ciudadano.CiudadanoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;

import mx.sicov.entity.Colonia;
import mx.sicov.service.colonia.ColoniaServiceImpl;
import mx.sicov.service.municipio.MunicipioServiceImpl;

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
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listColonia", coloniaServiceImpl.findColoniasByCiudadano(authentication.getName()));
        model.addAttribute("listMunicipio", municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())));
        return "colonia/listColonias";
    }

    @PostMapping("/save")
    public String saveColonia(Colonia colonia, Model model, Authentication authentication){
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
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listColonia", coloniaServiceImpl.findColoniasByCiudadano(authentication.getName()));
        model.addAttribute("listMunicipio", municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())));
        return "colonia/listColonias";
    }

    @GetMapping("/delete/{idcolonia}")
    public String deleteColonia(@PathVariable Long idcolonia, Model model, Authentication authentication){
        try{
            coloniaServiceImpl.delete(idcolonia);
            model.addAttribute("alert","success");
            model.addAttribute("message","Colonia eliminada");
        }catch (DataIntegrityViolationException e){
            model.addAttribute("alert","error");
            model.addAttribute("message","La colonia ya pertenece a un comité");
        }
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listColonia", coloniaServiceImpl.findColoniasByCiudadano(authentication.getName()));
        model.addAttribute("listMunicipio", municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())));
        return "colonia/listColonias";
    }

}
