package edu.sjsu.smartalertcloud.controller;

import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.X509Certificate;
import java.util.Calendar;
import java.util.Locale;
import java.util.Set;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import edu.sjsu.smartalertcloud.event.OnRegistrationCompleteEvent;
import edu.sjsu.smartalertcloud.model.User;
import edu.sjsu.smartalertcloud.model.UserRole;
import edu.sjsu.smartalertcloud.model.VerificationToken;
import edu.sjsu.smartalertcloud.service.UserService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UserService userService;

	@Autowired
    private MessageSource messages;

	@Autowired
	ApplicationEventPublisher eventPublisher;

	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public ModelAndView showForm(ModelMap model) {
		return new ModelAndView("signup");
	}

	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public ModelAndView saveForm(
			ModelMap model,
			@RequestParam(value="username", required=false) String username,
			@RequestParam(value="firstName", required=false) String firstName,
			@RequestParam(value="lastName", required=false) String lastName,
			@RequestParam(value="role", required=true) String registrationRole,
			@RequestParam(value="password", required=false) String password,
			@RequestParam(value="password2", required=false) String password2,
			HttpSession session,
			WebRequest request
		) {
		userService.saveUserAndRole(username,firstName,lastName,registrationRole, password, false);
		User user = userService.getUser(username);
		String appUrl = request.getContextPath();
		eventPublisher.publishEvent(new OnRegistrationCompleteEvent
		          (user, request.getLocale(), appUrl));
		return new ModelAndView("pendingVerification");
	}

	@RequestMapping(value = "/registrationConfirm", method = RequestMethod.GET)
	public ModelAndView confirmRegistration(WebRequest request, Model model, @RequestParam("token") String token) {
		logger.info("token: " + token);
		Locale locale = request.getLocale();
		VerificationToken verificationToken = userService.getVerificationToken(token);
		if (verificationToken == null) {
			String message = messages.getMessage("auth.message.invalidToken", null, locale);
	        model.addAttribute("message", message);
	        ModelAndView mv = new ModelAndView("badUser");
	        mv.addObject("message", message);
	        return mv;
		}
		Calendar cal = Calendar.getInstance();
	    if ((verificationToken.getExpiryDate().getTime() - cal.getTime().getTime()) <= 0) {
	        String messageValue = messages.getMessage("auth.message.expired", null, locale);
	        model.addAttribute("message", messageValue);
	        ModelAndView mv = new ModelAndView("badUser");
	        return mv;
	    }

	    User user = verificationToken.getUser();
	    user.setEnabled(true); 
	    userService.saveRegisteredUser(user); 
	    ModelAndView mv = new ModelAndView("success");
        return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(Model model,
			@RequestParam(value="emailAddress", required=false) String emailAddress,
			@RequestParam(value="password", required=false) String password,
			HttpSession session, String error, String logout) {
		ModelAndView mv = new ModelAndView("login");
		if (error != null)
			model.addAttribute("errorMsg", "Your username and password are invalid.");

		if (logout != null)
			model.addAttribute("msg", "You have been logged out successfully.");

		return mv;
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView  user(HttpServletRequest request) {
		System.out.println("***********for /home inside user controller******** ");
		String emailAddress = request.getUserPrincipal().getName();
		User user = userService.getUser(emailAddress);
		Set<UserRole> userRoles = user.getUserRole();
		boolean isAdmin = false;
		boolean isUser = false;
	
		boolean isInfrastructure = false;
		for(UserRole userRole: userRoles) {
			if (userRole.getRole().equalsIgnoreCase("ROLE_ADMIN")) {
				isAdmin = true;
			}
			if (userRole.getRole().equalsIgnoreCase("ROLE_USER")) {
				isUser = true;
			}

			if (userRole.getRole().equalsIgnoreCase("ROLE_INFRASTRUCTURE_OFFICER")) {
				isInfrastructure = true;
			}
		}
		if (isAdmin) {
			System.out.println("***********for not adminn inside user controller******** ");
			return new ModelAndView("home");
		} else if (isUser){
			System.out.println("***********for admin inside user controller******** ");
			return new ModelAndView("homeUser");
		}else if(isInfrastructure) {
			System.out.println("***********for admin inside user controller******** ");
			return new ModelAndView("homeInfrastructure");
		}else {
			return new ModelAndView("home");
		}
	}

/*	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView doCustomer() {
		return new ModelAndView("home");
	}
*/
	
	
    @RequestMapping(value="/manageCluster",  method=RequestMethod.GET)
    protected ModelAndView manageCluster() {
        ModelAndView modelAndView = new ModelAndView("manageCluster");
        return modelAndView;
    }
    
    @RequestMapping(value="/addCluster",  method=RequestMethod.GET)
    protected ModelAndView addCluster() {
        ModelAndView modelAndView = new ModelAndView("addCluster");
        return modelAndView;
    }
    
    @RequestMapping(value="/editCluster",  method=RequestMethod.GET)
    protected ModelAndView editCluster() {
        ModelAndView modelAndView = new ModelAndView("editCluster");
        return modelAndView;
    }
    
    @RequestMapping("/manageNode")
    protected ModelAndView manageNode() {
        ModelAndView modelAndView = new ModelAndView("manageNode");
        return modelAndView;
    }
	
	@RequestMapping("/editNode")
    protected ModelAndView editNode() {
        ModelAndView modelAndView = new ModelAndView("editNode");
        // modelAndView.addObject("editNodeDivStyle", "visibility: hidden");
        return modelAndView;
	}
	
    @RequestMapping("/dashboard")
    protected ModelAndView dashboard() {
        ModelAndView modelAndView = new ModelAndView("dashboard");
        return modelAndView;
    }
    
    @RequestMapping("/sensorDataReport")
    protected ModelAndView map() {
        ModelAndView modelAndView = new ModelAndView("sensorDataReport");
        return modelAndView;
	}
	
	@RequestMapping(value="/addNode",  method=RequestMethod.GET)
    protected ModelAndView addNode() {
        ModelAndView modelAndView = new ModelAndView("addNode");
        return modelAndView;
    }
    
    @RequestMapping("/sensorData")
    protected ModelAndView sensorData() {
        ModelAndView modelAndView = new ModelAndView("sensorData");
        return modelAndView;
    }
    
    @RequestMapping("/clusterLocationView")
    protected ModelAndView clusterLocationView() {
        ModelAndView modelAndView = new ModelAndView("clusterLocationView");
        return modelAndView;
    }
    
    
    @RequestMapping("/sensorMapView")
    protected ModelAndView sensorMapView() {
        ModelAndView modelAndView = new ModelAndView("sensorMapView");
        return modelAndView;
    }
    
/*    @RequestMapping("/contactUs")
    protected ModelAndView mapView() {
        ModelAndView modelAndView = new ModelAndView("contactUs");
        return modelAndView;
    }*/
	/*@RequestMapping(value="/user/admin", method=RequestMethod.GET)
	public ModelAndView doAdmin() {
		return new ModelAndView("admin");
	}*/

	@RequestMapping("/manageSensor")
    protected ModelAndView manageSensor() {
        ModelAndView modelAndView = new ModelAndView("manageSensor");
        return modelAndView;
    }
	
	@RequestMapping("/editSensor")
    protected ModelAndView editSensor() {
        ModelAndView modelAndView = new ModelAndView("editSensor");
        // modelAndView.addObject("editNodeDivStyle", "visibility: hidden");
        return modelAndView;
	}
	@RequestMapping(value="/addSensor",  method=RequestMethod.GET)
    protected ModelAndView addSensor() {
        ModelAndView modelAndView = new ModelAndView("addSensor");
        return modelAndView;
    }
	
	@RequestMapping(value="/getRealDataSensor",  method=RequestMethod.GET)
    protected ModelAndView getSensorRealTimeData() throws Exception
    {
			
		 TrustManager[] trustAllCerts = new TrustManager[] {new X509TrustManager() {
             public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                 return null;
             }
             public void checkClientTrusted(X509Certificate[] certs, String authType) {
             }
             public void checkServerTrusted(X509Certificate[] certs, String authType) {
             }
         }
     };

     // Install the all-trusting trust manager
     SSLContext sc = SSLContext.getInstance("SSL");
     sc.init(null, trustAllCerts, new java.security.SecureRandom());
     HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

     // Create all-trusting host name verifier
     HostnameVerifier allHostsValid = new HostnameVerifier() {
         public boolean verify(String hostname, SSLSession session) {
             return true;
         }
     };

     // Install the all-trusting host verifier
     HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
       // final String uri = "https://mysensor-db-906737534.us-east-2.elb.amazonaws.com/api/v1/sensor";
     	final String uri="https://mysensor-db-906737534.us-east-2.elb.amazonaws.com/api/v1/sensor?sensor_type=HUMIDITY";
        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.getForObject(uri, String.class);
   // System.out.println(result);
        ModelAndView mv = new ModelAndView("sensorRealData");	
        mv.addObject("sensorData", result);
		return mv;
       
    }
	
	
	@RequestMapping(value="/getRealDataTempSensor",  method=RequestMethod.GET)
    protected ModelAndView getSensorRealTempData() throws Exception
    {
			
		 TrustManager[] trustAllCerts = new TrustManager[] {new X509TrustManager() {
             public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                 return null;
             }
             public void checkClientTrusted(X509Certificate[] certs, String authType) {
             }
             public void checkServerTrusted(X509Certificate[] certs, String authType) {
             }
         }
     };

     // Install the all-trusting trust manager
     SSLContext sc = SSLContext.getInstance("SSL");
     sc.init(null, trustAllCerts, new java.security.SecureRandom());
     HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

     // Create all-trusting host name verifier
     HostnameVerifier allHostsValid = new HostnameVerifier() {
         public boolean verify(String hostname, SSLSession session) {
             return true;
         }
     };

     // Install the all-trusting host verifier
     HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
       // final String uri = "https://mysensor-db-906737534.us-east-2.elb.amazonaws.com/api/v1/sensor";
     	final String uri="https://mysensor-db-906737534.us-east-2.elb.amazonaws.com/api/v1/sensor?sensor_type=THERMAL";
        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.getForObject(uri, String.class);
    // System.out.println(result);
        ModelAndView mv = new ModelAndView("tempSensorRealData");	
        mv.addObject("sensorData", result);
		return mv;
       
    }
	
	@RequestMapping(value="/getLast24hoursData",  method=RequestMethod.GET)
    protected ModelAndView getLast24hoursData() throws Exception
    {
			
		 TrustManager[] trustAllCerts = new TrustManager[] {new X509TrustManager() {
             public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                 return null;
             }
             public void checkClientTrusted(X509Certificate[] certs, String authType) {
             }
             public void checkServerTrusted(X509Certificate[] certs, String authType) {
             }
         }
     };

     // Install the all-trusting trust manager
     SSLContext sc = SSLContext.getInstance("SSL");
     sc.init(null, trustAllCerts, new java.security.SecureRandom());
     HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());

     // Create all-trusting host name verifier
     HostnameVerifier allHostsValid = new HostnameVerifier() {
         public boolean verify(String hostname, SSLSession session) {
             return true;
         }
     };

     // Install the all-trusting host verifier
     HttpsURLConnection.setDefaultHostnameVerifier(allHostsValid);
       // final String uri = "https://mysensor-db-906737534.us-east-2.elb.amazonaws.com/api/v1/sensor";
     	final String uri="https://mysensor-db-906737534.us-east-2.elb.amazonaws.com/api/v1/sensor/report/24";
        RestTemplate restTemplate = new RestTemplate();
        String result = restTemplate.getForObject(uri, String.class);
      /*  System.out.println(result);*/
        ModelAndView mv = new ModelAndView("lastDaySensorData");	
        mv.addObject("sensorData", result);
		return mv;
       
    }
}
