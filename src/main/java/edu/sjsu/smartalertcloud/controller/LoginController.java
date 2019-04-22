package edu.sjsu.smartalertcloud.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class LoginController {
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ModelAndView loginPost() {
		ModelAndView mv = new ModelAndView("home");
		return mv;
	}

}
