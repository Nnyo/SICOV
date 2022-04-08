package mx.sicov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;

import mx.sicov.entity.Colonia;
import mx.sicov.service.colonia.ColoniaServiceImpl;
import mx.sicov.service.municipio.MunicipioServiceImpl;

@Controller
@RequestMapping(value = {"/colonia"})
public class ColoniaController {
    
    @Autowired
    private ColoniaServiceImpl coloniaServiceImpl;

    @Autowired
    private MunicipioServiceImpl municipioServiceImpl;

    @GetMapping(value = {"", "/list"})
    public String listarMunicipios(Model model){
        model.addAttribute("listColonia", coloniaServiceImpl.listAll());
        model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
        return "colonia/listColonias";
    }

    @PostMapping("/save")
    public String saveColonia(Colonia colonia, Model model){
        coloniaServiceImpl.save(colonia);
        return "redirect:/colonia/list";
    }

    @GetMapping("/delete/{idcolonia}")
    public String deleteColonia(@PathVariable Long idcolonia){
        coloniaServiceImpl.delete(idcolonia);
        return "redirect:/colonia/list";
    }

}
