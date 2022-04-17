package mx.sicov.configuration;

import com.sun.xml.internal.ws.handler.HandlerException;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.authentication.Http403ForbiddenEntryPoint;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class Handler {

    @ExceptionHandler(NoHandlerFoundException.class)
    public String handlerNoHandlerFoundException(){
        return "Error404";
    }

    @ExceptionHandler(HttpServerErrorException.InternalServerError.class)
    public String internalServerError(){
        return "Error500";
    }

    @ExceptionHandler(AccessDeniedException.class)
    public String accessDeniedException(){
        return "Error403";
    }

}
