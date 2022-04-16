package mx.sicov.configuration;

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

}
