package mx.sicov.controller;

import mx.sicov.entity.Ciudadano;
import mx.sicov.entity.Comite;
import mx.sicov.entity.ComiteVecinal;
import mx.sicov.entity.Participante;
import mx.sicov.service.ciudadano.CiudadanoServiceImpl;
import mx.sicov.service.colonia.ColoniaServiceImpl;
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
import java.io.IOException;
import java.net.*;
import java.util.List;

@Controller
@RequestMapping(value = {"/comite"})
public class ComiteController {

    @Autowired
    private CiudadanoServiceImpl ciudadanoService;

    @Autowired
    private MunicipioServiceImpl municipioServiceImpl;

    @Autowired
    private ComiteService comiteService;

    @Autowired
    private ColoniaServiceImpl coloniaService;

    @Autowired
    private ComiteVecinalService comiteVecinalService;

    @Autowired
    private ParticipanteService participanteService;

    @GetMapping("/*")
    public String handle() {
        return "Error404";
    }

    @GetMapping(value = {"", "/list"})
    public String listarComite(Model model, Authentication authentication){
        return getString(model, authentication);
    }

    @PostMapping("/save")
    public String saveComite(@Valid @ModelAttribute("comite") Comite comite, BindingResult result, Model model, Authentication authentication){
        if(result.hasErrors()){
            String errors = "";
            for (ObjectError error: result.getAllErrors()){
                errors = error.getDefaultMessage() + "--";
            }
            model.addAttribute("errors", errors);
            return getString(model, authentication);
        }
        Long id = comite.getIdcomite();
        if(comiteService.save(comite)){
            model.addAttribute("alert","success");
            if(id == null){
                model.addAttribute("message","Comit?? registrado");
            }else{
                model.addAttribute("message","Comit?? actualizado");
            }
        }else{
            model.addAttribute("alert","error");
            if(id == null){
                model.addAttribute("message","Error al registrar comit??");
            }else{
                model.addAttribute("message","Error al actualizar comit??");
            }
        }
        return getString(model, authentication);
    }

    @PostMapping("/delete")
    public String deleteComite(Long idcomite, Model model, Authentication authentication){
        try{
            comiteService.delete(idcomite);
            model.addAttribute("alert","success");
            model.addAttribute("message","Comite eliminado");
        }catch (Exception e){
            model.addAttribute("alert","error");
            model.addAttribute("message","Primero debes de eliminar a los miembros de este comit??");
        }
        return getString(model, authentication);
    }

    @GetMapping("/nuevoPresidente/{idcomite}")
    public String nuevoPresidente(@PathVariable Long idcomite, Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("idcomite",idcomite);
        model.addAttribute("ciudadano", new Ciudadano());
        Ciudadano ciudadano = ciudadanoService.findObjCiudadanoByCorreoElectronico(authentication.getName());
        model.addAttribute("municipio",ciudadano.getMunicipio());
        return "enlace/createPresidente";
    }

    @GetMapping("/editar/{idcomite}")
    public String nuevoComite(@PathVariable Long idcomite, Model model, Authentication authentication){
        return getStringToNewComite(idcomite,model,authentication);
    }

    @PostMapping(value = {"/savePresidente"})
    public String savePresidente(Long idcomite, Authentication authentication, @Valid @ModelAttribute("ciudadano") Ciudadano ciudadano, BindingResult result, Model model, @RequestParam("file") MultipartFile imagen) {
        String password = ciudadano.getPassword();
        model.addAttribute("idcomite", idcomite);
        Long id = ciudadano.getIdciudadano();
        ciudadano.setIdciudadano(id);
        model.addAttribute("ciudadano", ciudadano);
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("municipio",ciudadanoService.findObjCiudadanoByCorreoElectronico(authentication.getName()).getMunicipio());
        try{
            if(imagen.isEmpty()){
                return fotografiaBlanck(model, id);
            }else{
                ciudadano.setFotografia(imagen.getBytes());
            }
        }catch (Exception e){
            return fotografiaBlanck(model, id);
        }
        if(result.hasErrors()){
            String errors = "";
            for (ObjectError error: result.getAllErrors()){
                errors = errors + error.getDefaultMessage() + "--";
            }
            model.addAttribute("errors", errors);
            if(id == null){
                return "/enlace/createPresidente";
            }else{
                return "/enlace/updatePresidente";
            }
        }
        if(id != null)
            ciudadano.setRol(ciudadano.getRol().split(",")[0]);
        try{
            if(ciudadanoService.save(ciudadano)){
                if(id != null){
                    model.addAttribute("message2","Presidente actualizado");
                }else{
                    try{
                        String uri = "http://localhost:3443/sendEmail/" + ciudadano.getCorreoElectronico() + "/Bienvenido/Has sido registrado exitosamente al sistema SICOV. Tu usuario es: " + ciudadano.getCorreoElectronico() + " y tu password es : " + password;
                        uri = uri.replace(" ","%20");
                        URL url = new URL(uri);
                        HttpURLConnection con = (HttpURLConnection) url.openConnection();
                        con.setConnectTimeout(200);
                        con.setReadTimeout(200);
                        con.setRequestMethod("GET");
                        con.getResponseCode();
                        con.disconnect();
                    }catch (SocketTimeoutException | MalformedURLException e){
                        e.printStackTrace();
                    } catch (ProtocolException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    model.addAttribute("message2","Presidente registrado");
                    ComiteVecinal comiteVecinal = new ComiteVecinal();
                    comiteVecinal.setCiudadano(ciudadano);
                    comiteVecinal.setComite(comiteService.findById(idcomite));
                    comiteVecinalService.save(comiteVecinal);
                }
            }else{
                return returnException(ciudadano, model, id);
            }
            return getStringToNewComite(idcomite,model,authentication);
        }catch (Exception e){
            return returnException(ciudadano, model, id);
        }
    }

    @PostMapping(value = {"/deletePresidente"})
    public String deletePresidente(Long idpresidente, Long idcomite, Model model, Authentication authentication){
        try{
            Ciudadano ciudadano = ciudadanoService.findById(idpresidente);
            if(ciudadano.getRol().equals("ROLE_PRESIDENTE")){
                if(ciudadanoService.delete(idpresidente)){
                    model.addAttribute("alert","success");
                    model.addAttribute("message","El Presidente ha sido eliminado");
                    try{
                        String uri = "http://localhost:3443/sendEmail/" + ciudadano.getCorreoElectronico() + "/Usuario eliminado/Tu usuario ha sido elimimando por el Enlace.";
                        uri = uri.replace(" ","%20");
                        URL url = new URL(uri);
                        HttpURLConnection con = (HttpURLConnection) url.openConnection();
                        con.setConnectTimeout(200);
                        con.setReadTimeout(200);
                        con.setRequestMethod("GET");
                        con.getResponseCode();
                        con.disconnect();
                    }catch (SocketTimeoutException | MalformedURLException e){
                        e.printStackTrace();
                    } catch (ProtocolException e) {
                        e.printStackTrace();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }else{
                    model = errorToDeletePresidente(model);
                }
            }else{
                return "Error403";
            }
        }catch (Exception e){
            model = errorToDeletePresidente(model);
        }
        return getStringToNewComite(idcomite, model, authentication);
    }

    @GetMapping(value = {"/updatePresidente/{idpresidente}/{idcomite}"})
    public String updateCiudadano(@PathVariable Long idpresidente, @PathVariable Long idcomite, Authentication authentication,Model model){
        Ciudadano ciudadano = ciudadanoService.findById(idpresidente);
        if (ciudadano != null) {
            model.addAttribute("ciudadano", ciudadano);
            model.addAttribute("idcomite", idcomite);
            model.addAttribute("municipio", ciudadanoService.findObjCiudadanoByCorreoElectronico(authentication.getName()).getMunicipio());
            model.addAttribute("role",authentication.getAuthorities().toString());
            return "enlace/updatePresidente";
        }
        return getStringToNewComite(idcomite, model, authentication);
    }

    private Model errorToDeletePresidente(Model model){
        model.addAttribute("alert","error");
        model.addAttribute("message","No se ha podido eliminar al Presidente");
        return model;
    }

    private String returnException(Ciudadano ciudadano, Model model, Long id){
        model.addAttribute("alert","error");
        model.addAttribute("message","El correo electr??nico ya est?? registrado en otro usuario");
        model.addAttribute("ciudadano",ciudadano);
        if(id == null){
            return "/enlace/createPresidente";
        }else{
            return "/enlace/updatePresidente";
        }
    }

    public String getString(Model model, Authentication authentication) {
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("municipio", municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getNombre());
        model.addAttribute("listComite",comiteService.findComiteByIdMunicipio(municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getIdmunicipio()));
        model.addAttribute("listColonia", coloniaService.findColoniasByCiudadano(authentication.getName()));
        return "enlace/listComite";
    }

    private String registerComites(Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("municipio", municipioServiceImpl.findById(ciudadanoService.findCiudadanoByCorreoElectronico(authentication.getName())).getNombre());
        return "enlace/registerComites";
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
                    participanteTemp.setIdparticipante(ciudadano.getIdciudadano());
                    participanteTemp.setEsPresidente("PRESIDENTE");
                    listParticipante.add(participanteTemp);
                    model.addAttribute("nuevoPresidente",true);
                    model.addAttribute("listParticipante", listParticipante);
                }
            }catch (NullPointerException e){
                model.addAttribute("alert","info");
                model.addAttribute("message","Este comit?? a??n no tiene Presidente");
                return registerComites(model, authentication);
            }
            if(listParticipante.size()<3){
                model.addAttribute("alert","info");
                model.addAttribute("message","Los comit??s deben de tener m??s de 3 integrantes");
            }else if(listParticipante.size() > 6){
                model.addAttribute("alert","error");
                model.addAttribute("message","Los comit??s deben de tener m??ximo 6 integrantes");
            }
        }catch (NullPointerException e){
            model.addAttribute("alert","info");
            model.addAttribute("message","Este comit?? a??n no tiene integrantes");
            return registerComites(model, authentication);
        }
        model.addAttribute("idcomite", idcomite);
        return registerComites(model, authentication);
    }

    private String fotografiaBlanck(Model model, Long id){
        model.addAttribute("alert","error");
        model.addAttribute("message","La fotograf??a es requerida");
        if(id == null){
            return "/enlace/createPresidente";
        }else{
            return "/enlace/updatePresidente";
        }
    }

}
