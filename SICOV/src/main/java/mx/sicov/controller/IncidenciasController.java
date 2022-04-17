package mx.sicov.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.validation.Valid;

import mx.sicov.service.ciudadano.CiudadanoServiceImpl;
import mx.sicov.service.comitevecinal.ComiteVecinalService;
import mx.sicov.service.municipio.MunicipioServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import mx.sicov.service.incidencia.IncidenciaServiceImpl;
import mx.sicov.entity.Incidencia;

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

    @GetMapping("/solicitudes")
    public String listarSolicitudes(Model model, Authentication authentication) {
        model.addAttribute("role",authentication.getAuthorities().toString());
        Long idmunicipio = ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName());
        model.addAttribute("municipio", municipioServiceImpl.findById(idmunicipio).getNombre());
        model.addAttribute("listSolicitudes",incidenciaServiceImpl.findIncidenciaByMunicipio(idmunicipio));
        return "enlace/requestsComites";
    }

    private String getListIncidencia(Model model, Authentication authentication) {
        model.addAttribute("municipio", municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getNombre());
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listComiteVecinal",comiteVecinalService.findById(municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getIdmunicipio()));
        //model.addAttribute("listIncidencias",incidenciaServiceImpl.findIncidenciaByMunicipio(municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getNombre(),1L));
        model.addAttribute("listCiudadano", ciudadanoService.findObjCiudadanoByCorreoElectronico(authentication.getName()));
        return "enlace/listComite";
    }

    @GetMapping(value = {"", "/list"})
    public String listarIncidencias(Authentication authentication, Model model){
        return getListIncidencia(model, authentication);
    }

    @PostMapping("/save")
    public String saveIncidencia(Authentication authentication, @Valid @ModelAttribute("incidencia") Incidencia incidencia, BindingResult result, Model model) throws ParseException{
        if(result.hasErrors()){
            String errors = "";
            for (ObjectError error: result.getAllErrors()){
                errors = error.getDefaultMessage() + "--";
            }
            model.addAttribute("errors", errors);
            return getListIncidencia(model, authentication);
        }
        Long id = incidencia.getIdincidencia();
        SimpleDateFormat d = new SimpleDateFormat("dd-MM-yyyy");
        if(incidenciaServiceImpl.save(incidencia)){
            model.addAttribute("alert","success");
            if(id == null){
                LocalDateTime ldt = LocalDateTime.now();
			    DateTimeFormatter formmat1 = DateTimeFormatter.ofPattern("dd-MM-yyyy");
			    Date date = d.parse(formmat1.format(ldt));
			    incidencia.setFechaRegistro(date);
                incidencia.setCosto(0.0);
                incidencia.setEstado(2);
                incidencia.setEstaPagado(0);
                model.addAttribute("message","Incidencia registrada");
            }else{
                model.addAttribute("message","Incidencia actualizado");
            }
        }else{
            model.addAttribute("alert","error");
            if(id == null){
                model.addAttribute("message","Error al registrar la incidencia");
            }else{
                model.addAttribute("message","Error al actualizar la incidencia");
            }
        }
        return getListIncidencia(model, authentication);
    }

    @GetMapping("/update/{idincidencia}")
    public String update(@PathVariable long idincidencia, Model model, Authentication authentication){
        Incidencia incidencia = incidenciaServiceImpl.findById(idincidencia);
        if(incidencia != null){
            model.addAttribute("role",authentication.getAuthorities().toString());
            model.addAttribute("incidencia", incidencia);
            return "incidencia/list";
        }
        return getListIncidencia(model, authentication);
    }

    @GetMapping("/detalles")
    public String verDetalles(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "incidencia/VerDetalles";
    }
    @GetMapping("/anexos")
    public String verAnexos(Authentication authentication, Model model){
        model.addAttribute("role",authentication.getAuthorities().toString());
        return "incidencia/verAnexos";
    }

}
