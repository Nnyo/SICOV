package mx.sicov.controller;

import mx.sicov.entity.Ciudadano;
import mx.sicov.entity.Evidencia;
import mx.sicov.entity.Incidencia;
import mx.sicov.service.categoria.CategoriaServiceImpl;
import mx.sicov.service.ciudadano.CiudadanoServiceImpl;
import mx.sicov.service.comitevecinal.ComiteVecinalService;
import mx.sicov.service.evidencia.EvidenciaService;
import mx.sicov.service.incidencia.IncidenciaServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Controller
@RequestMapping(value = {"/anexo"})
public class EvidenciaController {

    @Autowired
    EvidenciaService evidenciaService;

    @Autowired
    IncidenciaServiceImpl incidenciaService;

    @Autowired
    private IncidenciaServiceImpl incidenciaServiceImpl;

    @Autowired
    private CiudadanoServiceImpl ciudadanoService;

    @Autowired
    ComiteVecinalService comiteVecinalService;

    @Autowired
    private CategoriaServiceImpl categoriaService;

    @GetMapping("/*")
    public String handle() {
        return "Error404";
    }

    @Secured(value = {"ROLE_ENLACE","ROLE_PRESIDENTE"})
    @GetMapping("/ver/{idincidencia}")
    public String verAnexo(@PathVariable long idincidencia, Model model, Authentication authentication){
        return getStringVerAnexo(idincidencia, model, authentication);
    }

    public String getStringVerAnexo(long idincidencia, Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        Incidencia incidencia = incidenciaService.findById(idincidencia);
        List<Evidencia> evidencia = evidenciaService.findEvidenciaByIncidencia(incidencia);
        List<String> listEvidencia = new ArrayList<String>();
        for (int i = 0; i != evidencia.size(); i++){
            String base64 = Base64.getEncoder().encodeToString(evidencia.get(i).getEvidencia());
            if(!base64.substring(0,5).equals("JVBER")){
                base64 = "data:image/jpeg;base64," + base64;
            }else{
                base64 = "data:application/pdf;base64," + base64;
            }
            listEvidencia.add(base64);
        }
        model.addAttribute("listEvidencia", listEvidencia);
        return "evidencia/verAnexos";
    }

    @Secured("ROLE_PRESIDENTE")
    @PostMapping("/save")
    public String saveComentary(Long idincidencia, Model model, Authentication authentication, @RequestParam("file") MultipartFile file){
        Evidencia evidencia = new Evidencia();
        evidencia.setIncidencia(incidenciaService.findById(idincidencia));
        try{
            if(!file.isEmpty()){
                evidencia.setEvidencia(file.getBytes());
            }
        }catch (Exception e){
            model.addAttribute("alert","error");
            model.addAttribute("message","Error al procesar anexo");
            return getStringVerAnexo(idincidencia, model, authentication);
        }
        if(evidenciaService.save(evidencia)){
            model.addAttribute("alert","success");
            model.addAttribute("message","Evidencia registrada");
        }else{
            model.addAttribute("alert","error");
            model.addAttribute("message","La evidencia no se ha podido registrar");
        }
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
