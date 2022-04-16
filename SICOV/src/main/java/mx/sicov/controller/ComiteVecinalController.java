package mx.sicov.controller;

import mx.sicov.service.comitevecinal.ComiteVecinalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comitevecinal")
public class ComiteVecinalController {

    @Autowired
    ComiteVecinalService comiteVecinalService;



}
