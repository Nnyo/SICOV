package mx.sicov.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(
        securedEnabled = true,
        prePostEnabled = true,
        jsr250Enabled = true
)
public class WebSecurityService extends WebSecurityConfigurerAdapter{

    @Autowired
    private DataSource dataSource;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
            .antMatchers("/css/**", "/login", "/js/**", "/images/**","/cambioContrasenia/recuperar").permitAll()
            .antMatchers("/colonia/**").hasRole("ENLACE")
            .antMatchers("/comite/**").hasRole("ENLACE")
            .antMatchers("/participante/**").hasRole("ENLACE")
            .antMatchers("/municipio/**").hasRole("ADMINISTRADOR")
            .antMatchers("/servicios_publicos/**").hasRole("ADMINISTRADOR")
            .antMatchers("/ciudadano/**").hasRole("ADMINISTRADOR")
            .antMatchers("/categoria/**").hasRole("ADMINISTRADOR")
            .anyRequest().authenticated()
            .and().formLogin().loginPage("/login").permitAll()
                .defaultSuccessUrl("/home")
                .usernameParameter("username")
                .passwordParameter("password")
            .and()
                .logout()
                .permitAll()
            .and()
                .exceptionHandling().accessDeniedPage("/Error403");
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(dataSource);
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

}