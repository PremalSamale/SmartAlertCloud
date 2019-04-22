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
	

}
