package edu.sjsu.smartalertcloud.controller;

import java.util.Calendar;
import java.util.Locale;
import java.util.Set;

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
			@RequestParam(value="password", required=false) String password,
			@RequestParam(value="password2", required=false) String password2,
			HttpSession session,
			WebRequest request
		) {
		userService.saveUserAndRole(username,firstName,lastName, password, false);
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

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView  user(HttpServletRequest request) {
		String emailAddress = request.getUserPrincipal().getName();
		User user = userService.getUser(emailAddress);
		Set<UserRole> userRoles = user.getUserRole();
		boolean isAdmin = false;
		for(UserRole userRole: userRoles) {
			if (userRole.getRole().equalsIgnoreCase("ROLE_ADMIN")) {
				isAdmin = true;
			}
		}
		if (!isAdmin) {
			return new ModelAndView("redirect:/");
		} else {
			return new ModelAndView("redirect:/");
		}
	}

	@RequestMapping(value="/home", method=RequestMethod.GET)
	public ModelAndView doCustomer() {
		return new ModelAndView("home");
	}

	
	
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
}
