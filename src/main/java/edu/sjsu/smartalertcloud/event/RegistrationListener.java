package edu.sjsu.smartalertcloud.event;

import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.MessageSource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import edu.sjsu.smartalertcloud.model.User;
import edu.sjsu.smartalertcloud.service.UserService;

@Component
public class RegistrationListener implements ApplicationListener<OnRegistrationCompleteEvent> {
	@Autowired
	private UserService service;

	@Autowired
    private MessageSource messages;

	@Autowired
    private JavaMailSender mailSender;

	@Override
	public void onApplicationEvent(OnRegistrationCompleteEvent event) {
		try {
			this.confirmRegistration(event);
		} catch (MalformedURLException | URISyntaxException e) {
			e.printStackTrace();
		}
	}

	private void confirmRegistration(OnRegistrationCompleteEvent event) throws MalformedURLException, URISyntaxException {
		User user = event.getUser();
        String token = UUID.randomUUID().toString();
        service.createVerificationToken(user, token);
         
        String recipientAddress = user.getEmailAddress();
        String subject = "Registration Confirmation";
        String confirmationUrl 
          = event.getAppUrl() + "/registrationConfirm?token=" + token;
        String message = messages.getMessage("message.regSucc", null, event.getLocale());
         
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setSubject(subject);
        String url = getURL();
        email.setText(message + " " + url + confirmationUrl);
        mailSender.send(email);
    }

	private static String getURL() throws MalformedURLException, URISyntaxException {
		HttpServletRequest currentRequest = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes() ).getRequest();
		URL url = new URL(currentRequest.getRequestURL().toString());
		String host  = url.getHost();
	    String userInfo = url.getUserInfo();
	    String scheme = url.getProtocol();
	    int port = url.getPort();
	    String path = (String) currentRequest.getAttribute("javax.servlet.forward.request_uri");
	    String query = (String) currentRequest.getAttribute("javax.servlet.forward.query_string");
	    URI uri = new URI(scheme,userInfo,host,port,path,query,null);
	    return uri.toString();
	}
}
