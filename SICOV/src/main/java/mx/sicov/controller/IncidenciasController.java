package mx.sicov.controller;


import javax.validation.Valid;

import mx.sicov.entity.*;
import mx.sicov.service.categoria.CategoriaServiceImpl;
import mx.sicov.service.ciudadano.CiudadanoServiceImpl;
import mx.sicov.service.comite.ComiteService;
import mx.sicov.service.comitevecinal.ComiteVecinalService;
import mx.sicov.service.municipio.MunicipioServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import mx.sicov.service.incidencia.IncidenciaServiceImpl;

@Controller
@RequestMapping(value = {"/incidencias"})
public class IncidenciasController {

    @Autowired
    private IncidenciaServiceImpl incidenciaServiceImpl;
    
    @Autowired
    private CiudadanoServiceImpl ciudadanoService;

    @Autowired
    private MunicipioServiceImpl municipioServiceImpl;

    @Autowired
    private ComiteVecinalService comiteVecinalService;

    @Autowired
    private CategoriaServiceImpl categoriaService;

    @Autowired
    private ComiteService comiteService;

    @GetMapping("/*")
    public String handle() {
        return "Error404";
    }

    @Secured("ROLE_ENLACE")
    @GetMapping("/solicitudes")
    public String listarSolicitudes(Model model, Authentication authentication) {
        return listar(model, authentication);
    }

    private String listar(Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        Long idmunicipio = ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName());
        model.addAttribute("municipio", municipioServiceImpl.findById(idmunicipio).getNombre());
        model.addAttribute("listSolicitudes",incidenciaServiceImpl.findIncidenciaByMunicipio(idmunicipio));
        return "enlace/requestsComites";
    }

    @Secured("ROLE_ENLACE")
    @PostMapping("/updateSolicitud")
    public String updateIncidencia(Long idincidencia, Double costo, Integer estadoActualizar, Model model, Authentication authentication){
        try{
            Incidencia incidencia = incidenciaServiceImpl.findById(idincidencia);
            incidencia.setCosto(costo);
            incidencia.setEstado(estadoActualizar);
            if(incidenciaServiceImpl.update(incidencia)){
                model.addAttribute("alert","success");
                model.addAttribute("message","Solicitud actualizada");
            }else{
                model = updateError(model);
            }
        }catch (Exception e){
            model = updateError(model);
        }
        return listar(model, authentication);
    }

    private Model updateError(Model model){
        model.addAttribute("alert","error");
        model.addAttribute("message","La solicitud no se ha podido actualizar");
        return model;
    }

    //APARTIR DE AQUÍ ES EL ROL DEL PRESIDENTE

    @GetMapping("/list")
    public String listIncidenciasByPresidente(Authentication authentication, Model model){
        return listarPresidente(authentication, model);
    }

    @Secured("ROLE_PRESIDENTE")
    @PostMapping("/save")
    public String saveIncidencia(@Valid @ModelAttribute("incidencia") Incidencia incidencia, BindingResult result, Long idcomite, Model model, Authentication authentication){
        Comite comite = comiteService.findById(idcomite);
        incidencia.setEstado(0);
        incidencia.setEstaPagado(0);
        incidencia.setCosto(0D);
        incidencia.setCiudadano(ciudadanoService.findObjCiudadanoByCorreoElectronico(authentication.getName()));
        incidencia.setComite(comite);
        if(result.hasErrors()){
            String errors = "";
            for (ObjectError error: result.getAllErrors()){
                errors = errors + error.getDefaultMessage() + "--";
            }
            model.addAttribute("errors", errors);
            return listarPresidente(authentication, model);
        }
        try{
            if(incidenciaServiceImpl.save(incidencia)){
                model.addAttribute("alert","success");
                model.addAttribute("message","Incidencia registrada");
            }else{
                model = getErrorPresidenteSave(model);
            }
        }catch (Exception e){
            model = getErrorPresidenteSave(model);
        }
        return listarPresidente(authentication, model);
    }

    @Secured("ROLE_PRESIDENTE")
    @PostMapping("/updateIncidencia")
    public String updateIncidencia(Long idincidencia, String descripcion, Long categoria, Model model, Authentication authentication){
        try{
            Incidencia incidencia = incidenciaServiceImpl.findById(idincidencia);
            incidencia.setDescripcion(descripcion);
            incidencia.setCategoria(categoriaService.findById(categoria));
            if(incidenciaServiceImpl.update(incidencia)){
                model.addAttribute("alert","success");
                model.addAttribute("message","Incidencia actualizada");
            }else{
                model = getErrorPresidente(model);
            }
        }catch (Exception e){
            model = getErrorPresidente(model);
        }
        return listarPresidente(authentication, model);
    }

    private Model getErrorPresidente(Model model){
        model.addAttribute("alert","error");
        model.addAttribute("message","La incidencia no se ha podido actualizar");
        return model;
    }

    private Model getErrorPresidenteSave(Model model){
        model.addAttribute("alert","error");
        model.addAttribute("message","La incidencia no se ha podido registrar");
        return model;
    }

    private String listarPresidente(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        Ciudadano ciudadano = ciudadanoService.findObjCiudadanoByCorreoElectronico(authentication.getName());
        model.addAttribute("municipio", ciudadano.getMunicipio());
        model.addAttribute("listSolicitudes",incidenciaServiceImpl.findIncidenciaByMunicipio(ciudadano.getMunicipio().getIdmunicipio()));
        model.addAttribute("idcomite", comiteVecinalService.findComiteVecinalByCiudadano(ciudadano).get(0).getComite().getIdcomite());
        model.addAttribute("listCategorias",categoriaService.listAll());
        model.addAttribute("incidencia", new Incidencia());
        return "incidencia/list";
    }


}
