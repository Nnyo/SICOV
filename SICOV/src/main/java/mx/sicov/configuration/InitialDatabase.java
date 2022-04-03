package mx.sicov.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class InitialDatabase implements CommandLineRunner {

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {
        String myPass = "4c791dd2a9";
        String encode = passwordEncoder.encode(myPass);
        System.out.println("Mi password es: " + encode);
    }

}
