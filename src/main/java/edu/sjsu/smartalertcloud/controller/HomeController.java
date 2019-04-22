/*package edu.sjsu.smartalertcloud.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HomeController {
    @RequestMapping("/")
    public String sayHi() {
        return "Hi";
    }
	
    @GetMapping("/")
    protected ModelAndView handleRequest() {
        ModelAndView modelAndView = new ModelAndView("home");
        return modelAndView;
    }
    
	
    @GetMapping("/login")
    protected ModelAndView handleLogin() {
        ModelAndView modelAndView = new ModelAndView("login");
        return modelAndView;
    }
    
    @GetMapping("/signup")
    protected ModelAndView handleSignup() {
        ModelAndView modelAndView = new ModelAndView("signUp");
        return modelAndView;
    }
    @GetMapping("/manageSensor")
    protected ModelAndView manageSensor() {
        ModelAndView modelAndView = new ModelAndView("manageSensor");
        return modelAndView;
    }
    @GetMapping("/manageCluster")
    protected ModelAndView manageCluster() {
        ModelAndView modelAndView = new ModelAndView("manageCluster");
        return modelAndView;
    }
    @GetMapping("/manageNode")
    protected ModelAndView manageNode() {
        ModelAndView modelAndView = new ModelAndView("manageNode");
        return modelAndView;
    }
    
    @GetMapping("/dashboard")
    protected ModelAndView dashboard() {
        ModelAndView modelAndView = new ModelAndView("dashboard");
        return modelAndView;
    }
    
    @GetMapping("/map")
    protected ModelAndView map() {
        ModelAndView modelAndView = new ModelAndView("map");
        return modelAndView;
    }
}*/