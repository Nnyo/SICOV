package mx.sicov.configuration;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.thymeleaf.exceptions.TemplateInputException;

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

    @ExceptionHandler(NumberFormatException.class)
    public String numberFormatException(){
        return "Error500";
    }

    @ExceptionHandler(TemplateInputException.class)
    public String templateInputException(){
        return "Error500";
    }

    @ExceptionHandler(AccessDeniedException.class)
    public String accessDeniedException(){
        return "Error403";
    }

    @ExceptionHandler(HttpClientErrorException.BadRequest.class)
    public String badRequest(){
        return "Error404";
    }

    @ExceptionHandler(IllegalStateException.class)
    public String illegalStateException(){
        return "Error500";
    }

    @ExceptionHandler(StringIndexOutOfBoundsException.class)
    public String stringIndexOutOfBoundsException(){
        return "Error500";
    }

    @ExceptionHandler(IndexOutOfBoundsException.class)
    public String indexOutOfBoundsException(){
        return "Error500";
    }

}
