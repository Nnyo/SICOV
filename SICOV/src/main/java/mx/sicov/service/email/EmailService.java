package mx.sicov.service.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;
   
    public void sendSimpleMail(String email, String encabezado, String mensaje){
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("sicov001@gmail.com");
            message.setTo(email);
            message.setSubject(encabezado);
            message.setText(mensaje);
            mailSender.send(message);
            
            System.out.println("Mail sent successfully...");
        }
}
