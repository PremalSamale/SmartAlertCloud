package edu.sjsu.smartalertcloud.controller;

import java.io.*;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.byteowls.jopencage.JOpenCageGeocoder;
import com.byteowls.jopencage.model.JOpenCageComponents;
import com.byteowls.jopencage.model.JOpenCageForwardRequest;
import com.byteowls.jopencage.model.JOpenCageLatLng;
import com.byteowls.jopencage.model.JOpenCageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.sjsu.smartalertcloud.model.Cluster;
import edu.sjsu.smartalertcloud.service.AdminService;

import edu.sjsu.smartalertcloud.model.Node;
import edu.sjsu.smartalertcloud.model.Sensor;



@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/addCluster", method={RequestMethod.POST})
	public ModelAndView addCluster(HttpServletRequest request) throws ParseException {
		//int clusterID = Integer.parseInt(request.getParameter("clusterID"));
	//	System.out.println("********************clusterID"+clusterID);
	//	Genre genre = Genre.valueOf(request.getParameter("genre"));
		/*SimpleDateFormat formatter=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");  
		formatter.setTimeZone(TimeZone.getTimeZone("GMT"));
		Date lastDateOfMaintainnance = formatter.parse(request.getParameter("lastDateOfMaintainnance"));
		Date dateOfDeployment = formatter.parse(request.getParameter("dateOfDeployment"));*/
		double latitude =Double.parseDouble( request.getParameter("latitude"));
		double longitude = Double.parseDouble(request.getParameter("longitude"));
		String county = request.getParameter("county");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		System.out.println("********************latitude"+latitude);
		System.out.println("********************longitude"+longitude);
	    Cluster cluster =new Cluster(latitude, longitude, county, name, address);
	    System.out.println("**************custer"+cluster);
		adminService.addCluster(cluster);
		ModelAndView mv = new ModelAndView("addCluster");
		mv.addObject("addClusterMsg", "Cluster added successfully");
		return mv;
	}

	@PostMapping("/getLatitudeLongitudeCounty")
	public ModelAndView getLatitudeAndLongitude(HttpServletRequest request) throws IOException {
		JOpenCageGeocoder jOpenCageGeocoder = new JOpenCageGeocoder("7a3efd33126344a7bd1de9187ab102bc");
		JOpenCageForwardRequest jOpenCageForwardRequest = new JOpenCageForwardRequest(request.getParameter("address"));
		jOpenCageForwardRequest.setRestrictToCountryCode("us");
		JOpenCageResponse response = jOpenCageGeocoder.forward(jOpenCageForwardRequest);
		JOpenCageLatLng firstResultLatLng = response.getFirstPosition(); // get the coordinate pair of the first result
		JOpenCageComponents jOpenCageComponents = response.getFirstComponents();
		String county = jOpenCageComponents.getCounty();
		double latitude = firstResultLatLng.getLat();
		double longitude = firstResultLatLng.getLng();
		ModelAndView mv = new ModelAndView("addCluster");
		mv.addObject("latitude", latitude);
		mv.addObject("longitude", longitude);
		mv.addObject("county", county);
		mv.addObject("address", request.getParameter("address"));
		return mv;
	}
	
	@PostMapping("/getLatitudeLongitudeNode")
	public ModelAndView getLatitudeAndLongitudeNode(HttpServletRequest request) throws IOException {
		JOpenCageGeocoder jOpenCageGeocoder = new JOpenCageGeocoder("7a3efd33126344a7bd1de9187ab102bc");
		JOpenCageForwardRequest jOpenCageForwardRequest = new JOpenCageForwardRequest(request.getParameter("address"));
		jOpenCageForwardRequest.setRestrictToCountryCode("us");
		JOpenCageResponse response = jOpenCageGeocoder.forward(jOpenCageForwardRequest);
		JOpenCageLatLng firstResultLatLng = response.getFirstPosition(); // get the coordinate pair of the first result
		JOpenCageComponents jOpenCageComponents = response.getFirstComponents();
		String city = jOpenCageComponents.getCity();
		double latitude = firstResultLatLng.getLat();
		double longitude = firstResultLatLng.getLng();
		ModelAndView mv = new ModelAndView("addNode");
		mv.addObject("latitude", latitude);
		mv.addObject("longitude", longitude);
		mv.addObject("city", city);
		mv.addObject("address", request.getParameter("address"));
		return mv;
	}
	
	
	@PostMapping("/getLatitudeLongitudeSensor")
	public ModelAndView getLatitudeAndLongitudeSensor(HttpServletRequest request) throws IOException {
		JOpenCageGeocoder jOpenCageGeocoder = new JOpenCageGeocoder("7a3efd33126344a7bd1de9187ab102bc");
		JOpenCageForwardRequest jOpenCageForwardRequest = new JOpenCageForwardRequest(request.getParameter("address"));
		jOpenCageForwardRequest.setRestrictToCountryCode("us");
		JOpenCageResponse response = jOpenCageGeocoder.forward(jOpenCageForwardRequest);
		JOpenCageLatLng firstResultLatLng = response.getFirstPosition(); // get the coordinate pair of the first result
		JOpenCageComponents jOpenCageComponents = response.getFirstComponents();
		String zip = jOpenCageComponents.getPostcode();
		double latitude = firstResultLatLng.getLat();
		double longitude = firstResultLatLng.getLng();
		ModelAndView mv = new ModelAndView("addSensor");
		mv.addObject("latitude", latitude);
		mv.addObject("longitude", longitude);
		mv.addObject("zip", zip);
		mv.addObject("address", request.getParameter("address"));
		return mv;
	}

	@RequestMapping(value="/searchClusterForAdmin", method={RequestMethod.POST})
	public ModelAndView searchCluster(HttpServletRequest request) throws ParseException {	
		String county =request.getParameter("county");
	    System.out.println("******************county"+county);
		ModelAndView mv = new ModelAndView("manageCluster");		
		List<Cluster> clusters = adminService.searchCluster(county);
		System.out.println("######################");
		for (Cluster cluster:clusters) {
			int id =cluster.getClusterID();
			String countyString=cluster.getCounty();
			double latitude=cluster.getLatitude();
			double longitude=cluster.getLongitude();
			System.out.println("*******inside admin Controller ID"+id);
			System.out.println("*******inside admin Controller COUNTY"+countyString);
			System.out.println("*******inside admin Controller LATITUDE"+latitude);
			System.out.println("*******inside admin Controller LONGITUDE"+longitude);
		}
		System.out.println("######################");
		mv.addObject("county", county);
		mv.addObject("ClusterList", clusters);
		return mv;
		
	}
	
	@RequestMapping(value="/searchClusterForEdit", method={RequestMethod.POST})
	public ModelAndView searchClusterForEdit(HttpServletRequest request) throws ParseException {
		//String clusterID = request.getParameter("clusterID");
	//	System.out.println("********************clusterID"+clusterID);

		String county =request.getParameter("county");

		ModelAndView mv = new ModelAndView("editCluster");		
		List<Cluster> clusters = adminService.searchCluster(county);
		mv.addObject("county", county);
		mv.addObject("ClusterList", clusters);
		return mv;
		
	}
	

	
	@RequestMapping(value="/chooseClusterToEditOrDelete", method={RequestMethod.POST})
	public ModelAndView chooseClusterToEdit(HttpServletRequest request) {
		String clusterId = request.getParameter("clusterID");
		Cluster cluster = null;
		if(clusterId !=null && !clusterId.equals("")) {
			int clusterID = Integer.parseInt(clusterId);
			cluster = adminService.getCluster(clusterID);
		}
		System.out.println("***********inside chooseClusterToEditOrDelete clusterID"+clusterId);
		
		ModelAndView mv = new ModelAndView("editCluster");
		if (request.getParameter("action").equals("Update")) {
			cluster.setCounty(request.getParameter("county"));
			cluster.setLatitude(Double.valueOf(request.getParameter("latitude")));
			cluster.setLongitude(Double.valueOf(request.getParameter("longitude")));
			cluster.setName(request.getParameter("name"));
			cluster.setAddress(request.getParameter("address"));
			adminService.addCluster(cluster);
			mv.addObject("clusterID", cluster.getClusterID());
			mv.addObject("county",cluster.getCounty());
			mv.addObject("latitude", cluster.getLatitude());
			mv.addObject("longitude",cluster.getLongitude());
			mv.addObject("submitEditedClusterMsg", "Cluster edited successfully");
			return mv;
		} else {
			adminService.deleteCluster(cluster);
			mv.addObject("submitEditedClusterMsg", "Cluster deleted successfully");
			return mv;
		}
	}

	@RequestMapping(value="/addNode", method={RequestMethod.POST})
	public ModelAndView addNode(HttpServletRequest request) throws ParseException {
		// int clusterID = Integer.parseInt(request.getParameter("clusterID"));
		// System.out.println("********************clusterID"+clusterID);
	//	Genre genre = Genre.valueOf(request.getParameter("genre"));
		/*SimpleDateFormat formatter=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");  
		formatter.setTimeZone(TimeZone.getTimeZone("GMT"));
		Date lastDateOfMaintainnance = formatter.parse(request.getParameter("lastDateOfMaintainnance"));
		Date dateOfDeployment = formatter.parse(request.getParameter("dateOfDeployment"));*/
		String name = request.getParameter("name");
		System.out.println("********************name"+name);
		double latitude =Double.parseDouble( request.getParameter("latitude"));
		double longitude = Double.parseDouble(request.getParameter("longitude"));
		String description = request.getParameter("description");
		String status = request.getParameter("status");
		String city = request.getParameter("city");
		String address = request.getParameter("address");
		System.out.println("********************name"+name);
		System.out.println("********************description"+description);
		
	    Node node =new Node(name,latitude,longitude, description, status, city,address);
	    System.out.println("**************custer"+node);
		adminService.addNode(node);
		ModelAndView mv = new ModelAndView("addNode");
		mv.addObject("addNodeMsg", "Node added successfully");
		return mv;
		
	}

	@RequestMapping(value="/getNode", method={RequestMethod.POST})
	public ModelAndView getNode(HttpServletRequest request) throws ParseException {
		// String clusterID = request.getParameter("clusterID");
		// System.out.println("********************clusterID"+clusterID);
	//	Genre genre = Genre.valueOf(request.getParameter("genre"));
		/*SimpleDateFormat formatter=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");  
		formatter.setTimeZone(TimeZone.getTimeZone("GMT"));
		Date lastDateOfMaintainnance = formatter.parse(request.getParameter("lastDateOfMaintainnance"));
		Date dateOfDeployment = formatter.parse(request.getParameter("dateOfDeployment"));*/
		System.out.println("###################### In Search Node");
		String city =request.getParameter("city");
	    System.out.println("******************city"+city);
		ModelAndView mv = new ModelAndView("manageNode");		
		List<Node> nodes = adminService.getNode(city);
		System.out.println("######################");
		for (Node node:nodes) {
			System.out.println("*******inside admin Controller ID"+node.getNodeId());
			System.out.println("*******inside admin Controller Name"+node.getName());
			System.out.println("*******inside admin Controller Description"+node.getDescription());
			System.out.println("*******inside admin Controller Status"+node.getStatus());
		}
		System.out.println("######################");
		mv.addObject("city", city);
		mv.addObject("NodeList", nodes);
		return mv;
		
	}

	@RequestMapping(value="/getNodeByFilter", method={RequestMethod.GET})
	public ModelAndView getNodeByFilter(HttpServletRequest request) throws ParseException {
		System.out.println("###################### In Search Node");
		String city =request.getParameter("city");
	    System.out.println("******************city"+city);
		ModelAndView mv = new ModelAndView("editNode");		
		List<Node> nodes = adminService.getNode(city);
		System.out.println("######################");
		for (Node node:nodes) {
			System.out.println("*******inside admin Controller ID"+node.getNodeId());
			System.out.println("*******inside admin Controller Name"+node.getName());
			System.out.println("*******inside admin Controller Description"+node.getDescription());
			System.out.println("*******inside admin Controller Status"+node.getStatus());
		}
		System.out.println("######################");
		System.out.println("######################");
		mv.addObject("city", city);
		mv.addObject("NodeList", nodes);
		return mv;
		
	}

	@RequestMapping(value="/editNode", method={RequestMethod.POST})
	public ModelAndView editNode(HttpServletRequest request) throws ParseException {
		System.out.println("*********** In Select node");
		int nodeID = Integer.parseInt(request.getParameter("nodeID"));
		Node node = null;
		node = adminService.getNode(nodeID);
		
		ModelAndView mv = new ModelAndView("editNode");
		if (request.getParameter("action").equals("Update")) {
			node.setName(request.getParameter("name"));
			node.setDescription(request.getParameter("description"));
			node.setStatus(request.getParameter("status"));
			adminService.addNode(node);
			mv.addObject("editNodeResponse", "Node updated successfully");
			return mv;
		} else {
			adminService.deleteNode(node);
			mv.addObject("editNodeResponse", "Node deleted successfully");
			return mv;
		}
		
	}
	

	@RequestMapping(value="/addSensor", method={RequestMethod.POST})
	public ModelAndView addSensor(HttpServletRequest request) throws ParseException {
		// int clusterID = Integer.parseInt(request.getParameter("clusterID"));
		// System.out.println("********************clusterID"+clusterID);
	//	Genre genre = Genre.valueOf(request.getParameter("genre"));
		/*SimpleDateFormat formatter=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");  
		formatter.setTimeZone(TimeZone.getTimeZone("GMT"));
		Date lastDateOfMaintainnance = formatter.parse(request.getParameter("lastDateOfMaintainnance"));
		Date dateOfDeployment = formatter.parse(request.getParameter("dateOfDeployment"));*/
		String name = request.getParameter("name");
		System.out.println("********************name"+name);
		String description = request.getParameter("description");
		String status = request.getParameter("status");
		String type = request.getParameter("type");
		Double latitude = Double.parseDouble(request.getParameter("latitude"));
		Double longitude = Double.parseDouble(request.getParameter("longitude"));
		String zip = request.getParameter("zip");
		String address = request.getParameter("address");
		System.out.println("********************name"+name);
		System.out.println("********************description"+description);
	    Sensor sensor =new Sensor(name,description,status,type,latitude,longitude,zip,address);
	    System.out.println("**************sensor"+sensor);
		adminService.addSensor(sensor);
		ModelAndView mv = new ModelAndView("addSensor");
		mv.addObject("addSensorMsg", "Sensor added successfully");
		return mv;
		
	}

	@RequestMapping(value="/getSensor", method={RequestMethod.GET})
	public ModelAndView getSensor(HttpServletRequest request) throws ParseException {
		// String clusterID = request.getParameter("clusterID");
		// System.out.println("********************clusterID"+clusterID);
	//	Genre genre = Genre.valueOf(request.getParameter("genre"));
		/*SimpleDateFormat formatter=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");  
		formatter.setTimeZone(TimeZone.getTimeZone("GMT"));
		Date lastDateOfMaintainnance = formatter.parse(request.getParameter("lastDateOfMaintainnance"));
		Date dateOfDeployment = formatter.parse(request.getParameter("dateOfDeployment"));*/
		System.out.println("###################### In Search Sensor");
		String[] type =request.getParameterValues("type");
	  
		ModelAndView mv = new ModelAndView("manageSensor");		
		List<Sensor> sensors = adminService.getSensorDetails(type);
		System.out.println("######################");
		for (Sensor sensor:sensors) {
			System.out.println("*******inside admin Controller ID"+sensor.getSensorId());
			System.out.println("*******inside admin Controller Name"+sensor.getName());
			System.out.println("*******inside admin Controller Description"+sensor.getDescription());
			System.out.println("*******inside admin Controller Status"+sensor.getStatus());
		}
		System.out.println("######################");
		mv.addObject("type", type);
		mv.addObject("SensorList", sensors);
		return mv;
		
	}

	@RequestMapping(value="/getSensorByFilter", method={RequestMethod.GET})
	public ModelAndView getSensorByFilter(HttpServletRequest request) throws ParseException {
		System.out.println("###################### In Search Sensor");
		String[] type =request.getParameterValues("type");
	
		ModelAndView mv = new ModelAndView("editSensor");		
		List<Sensor> sensors = adminService.getSensorDetails(type);
		System.out.println("######################");
		for (Sensor sensor:sensors) {
			System.out.println("*******inside admin Controller ID"+sensor.getSensorId());
			System.out.println("*******inside admin Controller Name"+sensor.getName());
			System.out.println("*******inside admin Controller Description"+sensor.getDescription());
			System.out.println("*******inside admin Controller Status"+sensor.getStatus());
		}
		System.out.println("######################");
		mv.addObject("type", type);
		mv.addObject("SensorList", sensors);
		return mv;
		
	}

	@RequestMapping(value="/editSensor", method={RequestMethod.POST})
	public ModelAndView editSensor(HttpServletRequest request) throws ParseException {
		System.out.println("*********** In Select node");
		String sensorID = request.getParameter("sensorID");
		Sensor sensor = null;
		
		if(sensorID !=null && !sensorID.equals("")) {
			int sensorId = Integer.parseInt(sensorID);
			sensor = adminService.getSensor(sensorId);
		}
		
		
		ModelAndView mv = new ModelAndView("editSensor");
		if (request.getParameter("action").equals("Update")) {
			sensor.setName(request.getParameter("name"));
			sensor.setDescription(request.getParameter("description"));
			sensor.setStatus(request.getParameter("status"));
		/*	sensor.setAddress(request.getParameter("address"));
			sensor.setLatitude(Double.parseDouble(request.getParameter("latitude")));
			sensor.setLongitude(Double.parseDouble(request.getParameter("longitude")));
			sensor.setZip(request.getParameter("zip"));*/
			
			adminService.addSensor(sensor);
			mv.addObject("sensorID",sensor.getSensorId());
			mv.addObject("zip",sensor.getZip());
			mv.addObject("latitude", sensor.getLatitude());
			mv.addObject("longitude", sensor.getLongitude());
			mv.addObject("editSensorResponse", "Sensor updated successfully");
			return mv;
		} else {
			adminService.deleteSensor(sensor);
			mv.addObject("editSensorResponse", "Sensor deleted successfully");
			return mv;
		}
		
		
	}
	
	
	
	
}
