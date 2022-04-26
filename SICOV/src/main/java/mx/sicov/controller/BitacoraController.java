package mx.sicov.controller;

import mx.sicov.entity.Bitacora;
import mx.sicov.service.bitacora.BitacoraService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = {"/bitacora"})
public class BitacoraController {

    @Autowired
    BitacoraService bitacoraService;

    @GetMapping("/*")
    public String handle() {
        return "Error404";
    }

    @GetMapping(value = {"", "/list"})
    public String listarBitacora(Authentication authentication, Model model) {
        model.addAttribute("role", authentication.getAuthorities().toString());
        List<Bitacora> list = bitacoraService.findAll();
        model.addAttribute("listBitacora", list);
        return "bitacora/bitacora";
    }

}
