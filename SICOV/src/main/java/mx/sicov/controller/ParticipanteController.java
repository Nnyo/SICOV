package mx.sicov.controller;

import mx.sicov.entity.Ciudadano;
import mx.sicov.entity.ComiteVecinal;
import mx.sicov.entity.Participante;
import mx.sicov.service.ciudadano.CiudadanoServiceImpl;
import mx.sicov.service.comite.ComiteService;
import mx.sicov.service.comitevecinal.ComiteVecinalService;
import mx.sicov.service.municipio.MunicipioServiceImpl;
import mx.sicov.service.participante.ParticipanteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping(value = {"/participante"})
public class ParticipanteController {

    @Autowired
    private CiudadanoServiceImpl ciudadanoService;

    @Autowired
    ParticipanteService participanteService;

    @Autowired
    private ComiteService comiteService;

    @Autowired
    private ComiteVecinalService comiteVecinalService;

    @Autowired
    private MunicipioServiceImpl municipioServiceImpl;

    private String fotografiaBlanck(Model model, Authentication authentication){
        model.addAttribute("alert","error");
        model.addAttribute("message","La fotografía es requerida");
        return prepareCreateParticipante(model, authentication);
    }

    @PostMapping("/save")
    public String saveParticipante(Long idcomite, Authentication authentication, @Valid @ModelAttribute("participante") Participante participante, BindingResult result, Model model, @RequestParam("file") MultipartFile imagen) {
        model.addAttribute("idcomite", idcomite);
        model.addAttribute("participante", participante);
        Long id = participante.getIdparticipante();
        try{
            if(imagen.isEmpty()){
                return fotografiaBlanck(model, authentication);
            }else{
                participante.setFotografia(imagen.getBytes());
            }
        }catch (Exception e){
            return fotografiaBlanck(model, authentication);
        }
        if (result.hasErrors()) {
            String errors = "";
            for (ObjectError error : result.getAllErrors()) {
                errors = errors + error.getDefaultMessage() + "--";
            }
            model.addAttribute("errors", errors);
            return prepareCreateParticipante(model, authentication);
        }
        try{
            if(participanteService.save(participante)){
                if(id != null){
                    model.addAttribute("message2","Participante actualizado");
                }else{
                    model.addAttribute("message2","Participante registrado");
                    ComiteVecinal comiteVecinal = new ComiteVecinal();
                    comiteVecinal.setParticipante(participante);
                    comiteVecinal.setComite(comiteService.findById(idcomite));
                    comiteVecinalService.save(comiteVecinal);
                }
            }else{
                return returnException(participante, model);
            }
            return getStringToNewComite(idcomite,model,authentication);
        }catch (Exception e){
            return returnException(participante, model);
        }
    }

    private String returnException(Participante participante, Model model){
        model.addAttribute("alert","error");
        model.addAttribute("message","Hubo un error al crear el Participante.");
        model.addAttribute("participante", participante);
        return "/enlace/createParticipante";
    }

    @GetMapping("/nuevoParticipante/{idcomite}")
    public String nuevoParticipante(@PathVariable Long idcomite, Model model, Authentication authentication){
        model.addAttribute("participante", new Participante());
        model.addAttribute("idcomite", idcomite);
        return prepareCreateParticipante(model, authentication);
    }

    private String prepareCreateParticipante(Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("municipio",ciudadanoService.findObjCiudadanoByCorreoElectronico(authentication.getName()).getMunicipio());
        return "enlace/createParticipante";
    }

    private String registerComites(Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("municipio", municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getNombre());
        return "enlace/registerComites";
    }

    @PostMapping(value = {"/delete"})
    public String deletePresidente(Long idparticipante, Long idcomite, Model model, Authentication authentication){
        try{
            participanteService.delete(idparticipante);
            model.addAttribute("alert","success");
            model.addAttribute("message","El registro ha sido eliminado");
        }catch (Exception e){
            model.addAttribute("alert","error");
            model.addAttribute("message","El registro no se pudo eliminar");
        }
        return getStringToNewComite(idcomite, model, authentication);
    }

    public String getStringToNewComite(Long idcomite, Model model, Authentication authentication){
        List<Participante> listParticipante = null;
        try{
            listParticipante = participanteService.findParticipanteByIdComiteVecinal(idcomite);
            model.addAttribute("listParticipante", listParticipante);
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
                    model.addAttribute("nuevoPresidente",true);
                    model.addAttribute("listParticipante", listParticipante);
                }
            }catch (NullPointerException e){
                model.addAttribute("alert","info");
                model.addAttribute("message","Este comité aún no tiene Presidente");
                return registerComites(model, authentication);
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
            return registerComites(model, authentication);
        }
        model.addAttribute("idcomite", idcomite);
        model.addAttribute("listParticipante", listParticipante);
        return registerComites(model, authentication);
    }

}
