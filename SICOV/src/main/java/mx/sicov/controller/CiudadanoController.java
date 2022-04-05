package mx.sicov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mx.sicov.entity.Ciudadano;
import mx.sicov.service.ciudadano.CiudadanoServiceImpl;
import mx.sicov.service.municipio.MunicipioServiceImpl;

@Controller
@RequestMapping(value = {"/ciudadano"})
public class CiudadanoController {
    
    @Autowired
    private CiudadanoServiceImpl ciudadanoServiceImpl;

    @Autowired
    private MunicipioServiceImpl municipioServiceImpl;

    @GetMapping(value = {"", "/list"})
    public String listarCiudadanos(Model model){
        model.addAttribute("listCiudadanos", ciudadanoServiceImpl.listAll());
        return "administrador/listEnlaces";
    }

    @GetMapping(value = {"/create"})
    public String crearCiudadano(Ciudadano ciudadano, Model model) {
        model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
        return "/administrador/createEnlace";
    }

    @PostMapping(value = {"/save"})
    public String save(Ciudadano ciudadano) {
        ciudadanoServiceImpl.save(ciudadano);
        return "redirect:/ciudadano/list";
    }

    @GetMapping(value = {"/delete/{idciudadano}"})
	public String deleteCiudadano(@PathVariable long idciudadano, RedirectAttributes redirectAttributes){
		boolean respuesta = ciudadanoServiceImpl.delete(idciudadano);
		if(respuesta){
			redirectAttributes.addFlashAttribute("msg_success", "Eliminacion exitosa");
		}else{
			redirectAttributes.addFlashAttribute("msg_error", "Eliminacion fallida");
		}
		return "redirect:/ciudadano/list";
	}

    @GetMapping(value = {"/update/{idciudadano}"})
	public String updateCiudadano(@PathVariable long idciudadano,Model model, RedirectAttributes redirectAttributes){
		Ciudadano ciudadano = ciudadanoServiceImpl.findById(idciudadano);
		if (ciudadano != null) {
			model.addAttribute("ciudadano", ciudadano);
            model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
			return "administrador/editEnlace";
		}
		redirectAttributes.addFlashAttribute("msg_error", "Registro no encontrado.");
		return "redirect:/ciudadano/list";
	}
}
