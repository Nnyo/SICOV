package mx.sicov.controller;

import mx.sicov.entity.Comentario;
import mx.sicov.entity.Incidencia;
import mx.sicov.service.ciudadano.CiudadanoServiceImpl;
import mx.sicov.service.comentario.ComentarioService;
import mx.sicov.service.incidencia.IncidenciaServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Base64;
import java.util.List;

@Controller
@RequestMapping(value = {"/comentarios"})
public class ComentarioController {

    @Autowired
    CiudadanoServiceImpl ciudadanoService;

    @Autowired
    ComentarioService comentarioService;

    @Autowired
    IncidenciaServiceImpl incidenciaService;

    @GetMapping("/*")
    public String handle() {
        return "Error404";
    }

    @GetMapping("/ver/{idincidencia}")
    public String findComentarybyIdIncidencia(@PathVariable Long idincidencia, Model model, Authentication authentication){
        return getStringComentarioEnlace(idincidencia, model, authentication);
    }

    private String getStringComentarioEnlace(Long idincidencia, Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        Incidencia incidencia = incidenciaService.findById(idincidencia);
        List<Comentario> comentarios = comentarioService.findComentarioByIncidencia(incidencia);
        if(comentarios.size() == 0){
            model.addAttribute("alert","info");
            model.addAttribute("message","Este incidente aún no tiene comentarios. Sé el primero!");
        }
        model.addAttribute("listComentario", comentarios);
        model.addAttribute("idincidencia",idincidencia);
        return "comentario/verComentario";
    }

    @PostMapping("/save")
    public String saveComentary(Long idincidencia, Model model, Authentication authentication, String comentario, @RequestParam("file") MultipartFile file){
        Comentario comentarioObj = new Comentario();
        comentarioObj.setComentario(comentario);
        try{
            comentarioObj.setAnexo(file.getBytes());
        }catch (Exception e){
            model.addAttribute("alert","error");
            model.addAttribute("message","Error al procesar anexo, el comentario no se ha registrado");
            return getStringComentarioEnlace(idincidencia, model, authentication);
        }
        if(comentario.equals("")){
            String errors = "El comentario es requerido";
            model.addAttribute("errors", errors);
            return getStringComentarioEnlace(idincidencia, model, authentication);
        }
        comentarioObj.setCiudadano(ciudadanoService.findObjCiudadanoByCorreoElectronico(authentication.getName()));
        comentarioObj.setIncidencia(incidenciaService.findById(idincidencia));
        if(comentarioService.save(comentarioObj)){
            model.addAttribute("alert","success");
            model.addAttribute("message","Comentario registrado");
        }else{
            model.addAttribute("alert","error");
            model.addAttribute("message","El comentario no se ha podido registrar");
        }
        return getStringComentarioEnlace(idincidencia, model, authentication);
    }

    @GetMapping("/verAnexo/{idcomentario}/{idincidencia}")
    public String verAnexo(@PathVariable Long idcomentario, @PathVariable Long idincidencia, Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        model.addAttribute("idcomentario",idcomentario);
        model.addAttribute("idincidencia",idincidencia);
        Comentario comentario = comentarioService.findById(idcomentario);
        String base64 = Base64.getEncoder().encodeToString(comentario.getAnexo());
        if(!base64.substring(0,5).equals("JVBER")){
            base64 = "data:image/jpeg;base64," + base64;
        }else{
            base64 = "data:application/pdf;base64," + base64;
        }
        model.addAttribute("anexo", base64);
        return "comentario/verAnexo";
    }

    @GetMapping("/anexo/{idcomentario}/{idincidencia}")
    public String redAnexo(@PathVariable Long idcomentario, @PathVariable Long idincidencia, Model model, Authentication authentication){
        Comentario comentario = comentarioService.findById(idcomentario);
        try{
            if(comentario.getAnexo().toString().length() != 0){
                return "redirect:/comentarios/verAnexo/"+idcomentario+"/"+idincidencia;
            }
        }catch (NullPointerException e){
            model = comentarioSinAnexo(model);
        }
        return getStringComentarioEnlace(idincidencia, model, authentication);
    }

    private Model comentarioSinAnexo(Model model){
        model.addAttribute("alert","info");
        model.addAttribute("message","Este comentario no tiene ningún anexo");
        return model;
    }



}
