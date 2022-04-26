package nnyo.mx.correosimple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.MessagingException;


@RestController
public class EmailController {

    @Autowired
    private EmailService emailService;

    @RequestMapping("/sendEmail/{correo}/{encabezado}/{mensaje}")
    public void persona(@PathVariable("correo") String correo, @PathVariable("encabezado") String encabezado, @PathVariable("mensaje") String mensaje) throws MessagingException {
        System.out.println("Enviando correo... " + correo + " Encabezado: " + encabezado + " Mensaje: " + mensaje);
        emailService.sendTemplateMail(correo,encabezado,mensaje);
        System.out.println("Correo enviado.\n");
    }

}
