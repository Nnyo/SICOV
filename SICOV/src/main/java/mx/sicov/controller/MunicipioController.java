package mx.sicov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import mx.sicov.entity.Municipio;
import mx.sicov.service.municipio.MunicipioServiceImpl;

@Controller
@RequestMapping(value = {"/municipio"})
public class MunicipioController {
    
    @Autowired
    MunicipioServiceImpl municipioServiceImpl;

    @GetMapping(value = {"", "/list"})
    public String listarMunicipios(Model model){
        model.addAttribute("listMunicipio", municipioServiceImpl.listAll());
        return "municipio/listMunicipios";
    }

    @GetMapping(value = "/create")
    public String createMunicipio(Municipio municipio, Model model){
        return "municipio/createMunicipio";
    }

    @PostMapping("/save")
    public String saveMunicipio(Municipio municipio, Model model){
        if(municipio.getIdmunicipio() == null){
            model.addAttribute("listMunicipio", municipioServiceImpl.save(municipio));
        }else{
            model.addAttribute("listMunicipio", municipioServiceImpl.save(municipio));
        }
        return "redirect:/municipio/list";
    }

    @GetMapping("/update/{idmunicipio}")
    public String update(@PathVariable long idmunicipio, Model model){
        Municipio municipio = municipioServiceImpl.findById(idmunicipio);
        if(municipio != null){
            model.addAttribute("municipio", municipio);
            return "municipio/createMunicipio";
        }
        return "redirect:/municipio/list";
    }

    @GetMapping("/delete/{idmunicipio}")
    public String deleteMunicipio(@PathVariable Long idmunicipio){
        municipioServiceImpl.delete(idmunicipio);
        return "redirect:/municipio/list";
    }

    @GetMapping("/pantallas")
    public String mostrarPantallas(){
        return "/municipio/listMunicipios";
    }
}
