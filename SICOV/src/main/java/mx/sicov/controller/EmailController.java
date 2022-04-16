package mx.sicov.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;

import mx.sicov.service.email.EmailService;

@SpringBootApplication
public class EmailController {

	@Autowired
	private EmailService emailService;
	
	public static void main(String[] args) {
		SpringApplication.run(EmailController.class, args);
		
	}
	@EventListener(ApplicationReadyEvent.class)
	public void sendMail() {
		emailService.sendSimpleMail("20193tn138@utez.edu.mx",
				"Este es el título",
				"Este es el cuerpo del mensaje");
	}
	
}
