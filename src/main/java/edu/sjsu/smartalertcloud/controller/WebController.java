package edu.sjsu.smartalertcloud.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.sjsu.smartalertcloud.model.Sensor;
import edu.sjsu.smartalertcloud.service.AdminService;


@RestController
public class WebController {
    @Autowired
    private AdminService adminService;
    
    @RequestMapping("/getSensorData")
    public List<Sensor> getSensorData() {
        System.out.println("###################### In get Sensor data");		
		List<Sensor> sensors = adminService.getSensor();
		return sensors;
    }
    

	
}