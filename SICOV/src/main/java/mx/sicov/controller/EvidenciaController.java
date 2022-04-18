package mx.sicov.controller;

import mx.sicov.entity.Evidencia;
import mx.sicov.entity.Incidencia;
import mx.sicov.service.evidencia.EvidenciaService;
import mx.sicov.service.incidencia.IncidenciaServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @GetMapping("/ver/{idincidencia}")
    public String update(@PathVariable long idincidencia, Model model, Authentication authentication){
        model.addAttribute("role",authentication.getAuthorities().toString());
        Incidencia incidencia = incidenciaService.findById(idincidencia);
        List<Evidencia> evidencia = evidenciaService.findEvidenciaByIncidencia(incidencia);
        List<String> listEvidencia = new ArrayList<String>();
        for (int i = 0; i != evidencia.size(); i++){
            String base64 = Base64.getEncoder().encodeToString(evidencia.get(i).getEvidencia());
            if(base64.charAt(0) == '/'){
                base64 = "data:image/jpeg;base64," + base64;
            }else{
                base64 = "data:application/pdf;base64," + base64;
            }
            listEvidencia.add(base64);
        }
        model.addAttribute("listEvidencia", listEvidencia);
        return "evidencia/verAnexos";
    }

}
