package mx.sicov.configuration;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class Handler {

    @ExceptionHandler(NoHandlerFoundException.class)
    public String handlerNoHandlerFoundException(){
        return "Error404";
    }

    @ExceptionHandler(NumberFormatException.class)
    public String numberFormatException(){
        return "Error500";
    }

    @ExceptionHandler(NullPointerException.class)
    public String nullPointerException(){
        return "Error500";
    }


}
