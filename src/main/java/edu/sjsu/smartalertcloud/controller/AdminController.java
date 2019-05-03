package edu.sjsu.smartalertcloud.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.sjsu.smartalertcloud.model.Cluster;
import edu.sjsu.smartalertcloud.model.County;
import edu.sjsu.smartalertcloud.service.AdminService;

import edu.sjsu.smartalertcloud.model.Node;
import edu.sjsu.smartalertcloud.model.Sensor;



@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/addCluster", method={RequestMethod.POST})
	public ModelAndView addCluster(HttpServletRequest request) throws ParseException {
		int clusterID = Integer.parseInt(request.getParameter("clusterID"));
		System.out.println("********************clusterID"+clusterID);
	//	Genre genre = Genre.valueOf(request.getParameter("genre"));
		/*SimpleDateFormat formatter=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");  
		formatter.setTimeZone(TimeZone.getTimeZone("GMT"));
		Date lastDateOfMaintainnance = formatter.parse(request.getParameter("lastDateOfMaintainnance"));
		Date dateOfDeployment = formatter.parse(request.getParameter("dateOfDeployment"));*/
		float latitude =Float.parseFloat( request.getParameter("latitude"));
		float longitude = Float.parseFloat(request.getParameter("longitude"));
		County county = County.valueOf(request.getParameter("county"));
		System.out.println("********************latitude"+latitude);
		System.out.println("********************longitude"+longitude);
	    Cluster cluster =new Cluster(clusterID, latitude, longitude, county);
	    System.out.println("**************custer"+cluster);
		adminService.addCluster(cluster);
		ModelAndView mv = new ModelAndView("addCluster");
		mv.addObject("addClusterMsg", "Cluster added successfully");
		return mv;
		
	}
	
	
	@RequestMapping(value="/searchClusterForAdmin", method={RequestMethod.POST})
	public ModelAndView searchCluster(HttpServletRequest request) throws ParseException {
		String clusterID = request.getParameter("clusterID");
		System.out.println("********************clusterID"+clusterID);
	//	Genre genre = Genre.valueOf(request.getParameter("genre"));
		/*SimpleDateFormat formatter=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");  
		formatter.setTimeZone(TimeZone.getTimeZone("GMT"));
		Date lastDateOfMaintainnance = formatter.parse(request.getParameter("lastDateOfMaintainnance"));
		Date dateOfDeployment = formatter.parse(request.getParameter("dateOfDeployment"));*/
		
		String[] counties =request.getParameterValues("county");
	    System.out.println("******************county"+counties);
		ModelAndView mv = new ModelAndView("manageCluster");		
		List<Cluster> clusters = adminService.searchCluster(counties, clusterID);
		System.out.println("######################");
		for (Cluster cluster:clusters) {
			int id =cluster.getClusterID();
			County county=cluster.getCounty();
			float latitude=cluster.getLatitude();
			float longitude=cluster.getLongitude();
			System.out.println("*******inside admin Controller ID"+id);
			System.out.println("*******inside admin Controller COUNTY"+county);
			System.out.println("*******inside admin Controller LATITUDE"+latitude);
			System.out.println("*******inside admin Controller LONGITUDE"+longitude);
		}
		System.out.println("######################");
		mv.addObject("ClusterList", clusters);
		return mv;
		
	}
	
	@RequestMapping(value="/searchClusterForEdit", method={RequestMethod.POST})
	public ModelAndView searchClusterForEdit(HttpServletRequest request) throws ParseException {
		String clusterID = request.getParameter("clusterID");
		System.out.println("********************clusterID"+clusterID);

		String[] county =request.getParameterValues("county");

		ModelAndView mv = new ModelAndView("editCluster");		
		List<Cluster> clusters = adminService.searchCluster(county, clusterID);
		mv.addObject("ClusterList", clusters);
		mv.addObject("editClusterDivStyle", "visibility: hidden");
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
		if (request.getParameter("action").equals("Edit")) {
			mv.addObject("clusterID", cluster.getClusterID());
			mv.addObject("county",cluster.getCounty());
			mv.addObject("latitude", cluster.getLatitude());
			mv.addObject("longitude",cluster.getLongitude());
			mv.addObject("editClusterDivStyle", "");
			return mv;
		} else {
			adminService.deleteCluster(cluster);
			mv.addObject("submitEditedClusterMsg", "Cluster deleted successfully");
			mv.addObject("editClusterDivStyle", "visibility: hidden");
			return mv;
		}
	}

	@RequestMapping(value="/submitEditedCluster", method={RequestMethod.POST})
	public ModelAndView submitEditedCluster(HttpServletRequest request) {
		String clusterId = request.getParameter("clusterID");
		Cluster cluster = null;
		if(clusterId !=null && !clusterId.equals("")) {
			int clusterID = Integer.parseInt(clusterId);
			cluster = adminService.getCluster(clusterID);
		}
		cluster.setClusterID(Integer.parseInt(request.getParameter("clusterID")));	
		cluster.setCounty(County.valueOf(request.getParameter("county")));
		cluster.setLatitude(Float.parseFloat(request.getParameter("latitude")));
		cluster.setLongitude(Float.parseFloat(request.getParameter("longitude")));
		adminService.addCluster(cluster);
		ModelAndView mv = new ModelAndView("editCluster");
		mv.addObject("submitEditedClusterMsg", "Cluster edited successfully");
		mv.addObject("editClusterDivStyle", "visibility: hidden");
		return mv;
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
		String description = request.getParameter("description");
		String status = request.getParameter("status");
		String city = request.getParameter("city");
		System.out.println("********************name"+name);
		System.out.println("********************description"+description);
	    Node node =new Node(name, description, status, city);
	    System.out.println("**************custer"+node);
		adminService.addNode(node);
		ModelAndView mv = new ModelAndView("addNode");
		mv.addObject("addNodeMsg", "Cluster added successfully");
		return mv;
		
	}

	@RequestMapping(value="/getNode", method={RequestMethod.GET})
	public ModelAndView getNode(HttpServletRequest request) throws ParseException {
		// String clusterID = request.getParameter("clusterID");
		// System.out.println("********************clusterID"+clusterID);
	//	Genre genre = Genre.valueOf(request.getParameter("genre"));
		/*SimpleDateFormat formatter=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");  
		formatter.setTimeZone(TimeZone.getTimeZone("GMT"));
		Date lastDateOfMaintainnance = formatter.parse(request.getParameter("lastDateOfMaintainnance"));
		Date dateOfDeployment = formatter.parse(request.getParameter("dateOfDeployment"));*/
		System.out.println("###################### In Search Node");
		String[] city =request.getParameterValues("city");
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
		mv.addObject("NodeList", nodes);
		return mv;
		
	}

	@RequestMapping(value="/getNodeByFilter", method={RequestMethod.GET})
	public ModelAndView getNodeByFilter(HttpServletRequest request) throws ParseException {
		System.out.println("###################### In Search Node");
		String[] city =request.getParameterValues("city");
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
		if (request.getParameter("action").equals("Edit")) {
			node.setName(request.getParameter("name"));
			node.setDescription(request.getParameter("description"));
			node.setStatus(request.getParameter("status"));
			adminService.addNode(node);
			mv.addObject("editNodeResponse", "Node update successfull");
			return mv;
		} else {
			adminService.deleteNode(node);
			mv.addObject("editNodeResponse", "Node deletion successfull");
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
		Float latitude = Float.parseFloat(request.getParameter("lat"));
		Float longitude = Float.parseFloat(request.getParameter("long"));
		String zip = request.getParameter("zip");
		System.out.println("********************name"+name);
		System.out.println("********************description"+description);
	    Sensor sensor =new Sensor(name, description, status,type, latitude, longitude, zip);
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
		String[] zip =request.getParameterValues("zip");
	    System.out.println("******************zip"+zip);
		ModelAndView mv = new ModelAndView("manageSensor");		
		List<Sensor> sensors = adminService.getSensor(zip);
		System.out.println("######################");
		for (Sensor sensor:sensors) {
			System.out.println("*******inside admin Controller ID"+sensor.getSensorId());
			System.out.println("*******inside admin Controller Name"+sensor.getName());
			System.out.println("*******inside admin Controller Description"+sensor.getDescription());
			System.out.println("*******inside admin Controller Status"+sensor.getStatus());
		}
		System.out.println("######################");
		mv.addObject("SensorList", sensors);
		return mv;
		
	}

	@RequestMapping(value="/getSensorByFilter", method={RequestMethod.GET})
	public ModelAndView getSensorByFilter(HttpServletRequest request) throws ParseException {
		System.out.println("###################### In Search Sensor");
		String[] zip =request.getParameterValues("zip");
	    System.out.println("******************zip"+zip);
		ModelAndView mv = new ModelAndView("editSensor");		
		List<Sensor> sensors = adminService.getSensor(zip);
		System.out.println("######################");
		for (Sensor sensor:sensors) {
			System.out.println("*******inside admin Controller ID"+sensor.getSensorId());
			System.out.println("*******inside admin Controller Name"+sensor.getName());
			System.out.println("*******inside admin Controller Description"+sensor.getDescription());
			System.out.println("*******inside admin Controller Status"+sensor.getStatus());
		}
		System.out.println("######################");
		mv.addObject("SensorList", sensors);
		return mv;
		
	}

	@RequestMapping(value="/editSensor", method={RequestMethod.POST})
	public ModelAndView editSensor(HttpServletRequest request) throws ParseException {
		// System.out.println("*********** In Select node");
		// int sensorID = Integer.parseInt(request.getParameter("sensorID"));
		// Sensor sensor = null;
		// sensor = adminService.getSensor(sensorID);
		// ModelAndView mv = new ModelAndView("editSensor");
		
		// if (request.getParameter("action").equals("Edit")) {
		// 	sensor.setName(request.getParameter("name"));
		// 	sensor.setDescription(request.getParameter("description"));
		// 	sensor.setStatus(request.getParameter("status"));
		// 	adminService.addSensor(sensor);
		// 	mv.addObject("editSensorResponse", "Sensor update successfull");
		// 	return mv;
		// } else {
		// 	adminService.deleteSensor(sensor);
		// 	mv.addObject("editSensorResponse", "Sensor deletion successfull");
		// 	return mv;
		// }

		ModelAndView mv = new ModelAndView("editSensor");
			return mv;
		
	}
	

}
