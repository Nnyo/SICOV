package mx.sicov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import mx.sicov.entity.Ciudadano;
import mx.sicov.service.ciudadano.CiudadanoServiceImpl;
import mx.sicov.service.municipio.MunicipioServiceImpl;

import javax.validation.ConstraintViolationException;
import javax.validation.Valid;
import java.util.Base64;

@Controller
@RequestMapping(value = {"/ciudadano"})
public class CiudadanoController {
    
    @Autowired
    private CiudadanoServiceImpl ciudadanoServiceImpl;

    @Autowired
    private MunicipioServiceImpl municipioServiceImpl;

    @GetMapping("/*")
    public String handle() {
        return "Error404";
    }

    @GetMapping(value = {"", "/list"})
    public String listarCiudadanos(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return getString(model);
    }

    private String getString(Model model){
        model.addAttribute("listCiudadanos", ciudadanoServiceImpl.findCiudadanoByRolContains());
        return "administrador/listEnlaces";
    }

    @GetMapping(value = {"/create"})
    public String crearCiudadano(Authentication authentication, Model model) {
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
        model.addAttribute("ciudadano", new Ciudadano());
        return "/administrador/createEnlace";
    }

    @PostMapping(value = {"/save"})
    public String saveCiudadano(Authentication authentication, @Valid @ModelAttribute("ciudadano") Ciudadano ciudadano, BindingResult result, Model model, @RequestParam("file") MultipartFile imagen) {
        Long id = ciudadano.getIdciudadano();
        model.addAttribute("role",authentication.getAuthorities().toString());
        try{
            ciudadano.setFotografia(imagen.getBytes());
        }catch (Exception e){
            e.printStackTrace();
        }
        if(result.hasErrors()){
            String errors = "";
            for (ObjectError error: result.getAllErrors()){
                errors = errors + error.getDefaultMessage() + "--";
            }
            model.addAttribute("errors", errors);
            model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
            model.addAttribute("ciudadano", ciudadano);
            return id == null? "/administrador/createEnlace":"/administrador/editEnlace";
        }
        if(id != null)
            ciudadano.setRol(ciudadano.getRol().split(",")[0]);
        try{
            if(ciudadanoServiceImpl.save(ciudadano)){
                model.addAttribute("alert","success");
                if(id == null){
                    model.addAttribute("message","Ciudadano registrado");
                }else{
                    model.addAttribute("message","Ciudadano actualizado");
                }
            }else{
                model.addAttribute("alert","error");
                if(id == null){
                    model.addAttribute("message","Error al registrar ciudadano");
                }else{
                    model.addAttribute("message","Error al actualizar ciudadano");
                }
            }
            return getString(model);
        }catch (ConstraintViolationException e){
            model.addAttribute("alert","error");
            model.addAttribute("message","El correo electrónico ya está registrado en otro usuario");
        }
        return getString(model);
    }

    @PostMapping("/delete")
    public String deleteCiudadano(Long idciudadano, Authentication authentication, Model model){
        if(ciudadanoServiceImpl.delete(idciudadano)){
            model.addAttribute("message","Ciudadano eliminado");
            model.addAttribute("alert","success");
        }else{
            model.addAttribute("message","Error al eliminar el Ciudadano");
            model.addAttribute("alert","error");
        }
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listCiudadanos", ciudadanoServiceImpl.findCiudadanoByRolContains());
        return "administrador/listEnlaces";
    }

    @GetMapping(value = {"/update/{idciudadano}"})
	public String updateCiudadano(@PathVariable long idciudadano,Authentication authentication,Model model){
		Ciudadano ciudadano = ciudadanoServiceImpl.findById(idciudadano);
		if (ciudadano != null) {
			model.addAttribute("ciudadano", ciudadano);
            model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
            model.addAttribute("role",authentication.getAuthorities().toString());
			return "administrador/editEnlace";
		}
        return getString(model);
	}
    
    @GetMapping("/mostrar/{idciudadano}")
	public String mostrarCiudadano(@PathVariable long idciudadano, Model model, Authentication authentication) {
    	Ciudadano ciudadano = ciudadanoServiceImpl.mostrar(idciudadano);
		if (!ciudadano.equals(null)) {
			model.addAttribute("ciudadano", ciudadano);
            model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
            model.addAttribute("role",authentication.getAuthorities().toString());
            model.addAttribute("imagen",Base64.getEncoder().encodeToString(ciudadano.getFotografia()));
			return "administrador/detailEnlace";
		}
        return getString(model);
	}

}
