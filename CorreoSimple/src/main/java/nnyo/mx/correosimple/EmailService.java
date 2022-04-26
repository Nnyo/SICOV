package nnyo.mx.correosimple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

@Service
public class EmailService {

    @Autowired
    private SpringTemplateEngine templateEngine;

    @Autowired
    private JavaMailSender mailSender;

    public void sendTemplateMail(String email, String encabezado, String mensaje) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper =
                new MimeMessageHelper(message,MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
                        StandardCharsets.UTF_8.name());
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("correo",mensaje); //Mensaje, contenido (correo) Variables
        map.put("mensaje",encabezado); //Encabezado del correo  Variables
        Context context = new Context();
        context.setVariables(map);
        String html = templateEngine.process("correo",context); //Nombre del archivo HTML con el formato del Correo
        helper.setTo(email); //A quien va dirigido el correo
        helper.setText(html,true);
        helper.setSubject(encabezado);//Encabezado del correo
        mailSender.send(message);
    }

    public void sendSimpleMail(String email, String encabezado, String mensaje){
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("sicov001@gmail.com");
        message.setTo(email);
        message.setSubject(encabezado);
        message.setText(mensaje);
        mailSender.send(message);
    }
}