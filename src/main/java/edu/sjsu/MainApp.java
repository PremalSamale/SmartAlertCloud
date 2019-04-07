package edu.sjsu;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.boot.SpringApplication;

@SpringBootApplication
public class MainApp extends SpringBootServletInitializer {
	public static void main(String[] args) {
	    SpringApplication.run(MainApp.class, args);
	}
}