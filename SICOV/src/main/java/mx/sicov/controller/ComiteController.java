package mx.sicov.controller;

import mx.sicov.entity.Ciudadano;
import mx.sicov.entity.Comite;
import mx.sicov.entity.Participante;
import mx.sicov.service.ciudadano.CiudadanoServiceImpl;
import mx.sicov.service.colonia.ColoniaServiceImpl;
import mx.sicov.service.comite.ComiteService;
import mx.sicov.service.municipio.MunicipioServiceImpl;
import mx.sicov.service.participante.ParticipanteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.constraints.Null;
import java.util.List;

@Controller
@RequestMapping(value = {"/comite"})
public class ComiteController {

    @Autowired
    private CiudadanoServiceImpl ciudadanoService;

    @Autowired
    private ParticipanteService participanteService;

    @Autowired
    private MunicipioServiceImpl municipioServiceImpl;

    @Autowired
    private ComiteService comiteService;

    @Autowired
    private ColoniaServiceImpl coloniaService;

    @GetMapping(value = {"", "/list"})
    public String listarComite(Model model, Authentication authentication){
        return getString(model, authentication);
    }

    @PostMapping("/save")
    public String saveComite(Comite comite, Model model, Authentication authentication){
        Long id = comite.getIdcomite();
        if(comiteService.save(comite)){
            model.addAttribute("alert","success");
            if(id == null){
                model.addAttribute("message","Comité registrado");
            }else{
                model.addAttribute("message","Comité actualizado");
            }
        }else{
            model.addAttribute("alert","error");
            if(id == null){
                model.addAttribute("message","Error al registrar comité");
            }else{
                model.addAttribute("message","Error al actualizar comité");
            }
        }
        return getString(model, authentication);
    }

    private String getString(Model model, Authentication authentication) {
        model.addAttribute("municipio", municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getNombre());
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("listComite",comiteService.findComiteByIdMunicipio(municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getIdmunicipio()));
        model.addAttribute("listColonia", coloniaService.findColoniasByCiudadano(authentication.getName()));
        return "enlace/listComite";
    }

    @GetMapping("/delete/{idcomite}")
    public String deleteComite(@PathVariable Long idcomite, Model model, Authentication authentication){
        try{
            comiteService.delete(idcomite);
            model.addAttribute("alert","success");
            model.addAttribute("message","Comite eliminado");
        }catch (Exception e){
            model.addAttribute("alert","error");
            model.addAttribute("message","Error al eliminar el comité");
        }
        return getString(model, authentication);
    }

    @GetMapping("/solicitudes")
    public String listarSolicitudes(Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("municipio", municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getNombre());
        return "enlace/requestsComites";
    }

    @GetMapping("/editar/{idcomite}")
    public String nuevoComite(@PathVariable Long idcomite, Model model, Authentication authentication){
        List<Participante> listParticipante = null;
        try{
            listParticipante = participanteService.findParticipanteByIdComiteVecinal(idcomite);
            Ciudadano ciudadano = ciudadanoService.findCiudadanoByIdComiteVecinal(idcomite);
            try{
                if(ciudadano.getRol().equals("ROLE_PRESIDENTE")){
                    Participante participanteTemp = new Participante();
                    participanteTemp.setMunicipio(ciudadano.getMunicipio());
                    participanteTemp.setNombre(ciudadano.getNombre());
                    participanteTemp.setPrimerApellido(ciudadano.getPrimerApellido());
                    participanteTemp.setSegundoApellido(ciudadano.getSegundoApellido());
                    participanteTemp.setNumeroTelefonico(ciudadano.getNumeroTelefonico());
                    participanteTemp.setEsPresidente("PRESIDENTE");
                    listParticipante.add(participanteTemp);
                }
            }catch (NullPointerException e){
                model.addAttribute("alert","info");
                model.addAttribute("message","Este comité aún no tiene Presidente");
            }
            if(listParticipante.size()<3){
                model.addAttribute("alert","info");
                model.addAttribute("message","Los comités deben de tener más de 3 integrantes");
            }else if(listParticipante.size() > 6){
                model.addAttribute("alert","error");
                model.addAttribute("message","Los comités deben de tener máximo 6 integrantes");
            }
        }catch (NullPointerException e){
            model.addAttribute("alert","info");
            model.addAttribute("message","Este comité aún no tiene integrantes");
        }
        model.addAttribute("listParticipante", listParticipante);
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("municipio", municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getNombre());
        return "enlace/registerComites";
    }


}
