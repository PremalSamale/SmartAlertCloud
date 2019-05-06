package edu.sjsu.smartalertcloud.service.impl;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.sjsu.smartalertcloud.dao.AdminDao;
import edu.sjsu.smartalertcloud.model.City;
import edu.sjsu.smartalertcloud.model.Cluster;
import edu.sjsu.smartalertcloud.model.County;
import edu.sjsu.smartalertcloud.service.AdminService;
import edu.sjsu.smartalertcloud.model.Node;
import edu.sjsu.smartalertcloud.model.Sensor;


@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;

	@Override
	public void addCluster(Cluster cluster) {
		System.out.println("inside adminservice impl"+cluster);
		adminDao.addCluster(cluster);
		
	}

	@Override
	public void deleteCluster(Cluster cluster) {
		// TODO Auto-generated method stub
		adminDao.deleteCluster(cluster);
		
	}

	@Override
	public List<Cluster> getCluster() {
		// TODO Auto-generated method stub
		return adminDao.getCluster();
	}

	@Override
	public List<Cluster> searchCluster(String[] counties) {
		// TODO Auto-generated method stub
		List<Cluster> allClusters = adminDao.searchCluster();

		List<Cluster> filteredClustersForCounty= null;
		if (counties != null ) {
			filteredClustersForCounty = new ArrayList<Cluster>();
			for (String county: counties) {
				County con = County.valueOf(county.toUpperCase());
				for (Cluster cluster:allClusters)
				if (cluster.getCounty()==con) {
					filteredClustersForCounty.add(cluster);
				}
			}
		}

		List<Cluster> filteredClusters = new ArrayList<Cluster>();
		filteredClusters.addAll(allClusters);
		if (!(filteredClustersForCounty == null)) {
			
			/*if (filteredClustersForClusterID != null) filteredClusters.retainAll(filteredClustersForClusterID);*/
			if (filteredClustersForCounty != null) filteredClusters.retainAll(filteredClustersForCounty);
			
		}
	
		List<Cluster> clusterInfo= new ArrayList <Cluster>();
		for (Cluster c:filteredClusters) {
			int id =c.getClusterID();
			County county=c.getCounty();
			float latitude=c.getLatitude();
			float longitude=c.getLongitude();
			System.out.println("*******inside adminserviceImpl ID"+id);
			System.out.println("*******inside adminserviceImpl COUNTY"+county);
			System.out.println("*******inside adminserviceImpl LATITUDE"+latitude);
			System.out.println("*******inside adminserviceImpl LONGITUDE"+longitude);

			clusterInfo.add(c);
		}

		return clusterInfo;
	}

	@Override
	public Cluster getCluster(int clusterId) {
		// TODO Auto-generated method stub
		return adminDao.getCluster(clusterId);
	}

	@Override
	public void addNode(Node node) {
		System.out.println("inside adminservice impl"+node);
		adminDao.addNode(node);
		
	}

	@Override
	public List<Node> getNode(String[] cities) {
		// TODO Auto-generated method stub
		List<Node> allNodes = adminDao.getNode();
		
		List<Node> filteredNodeForCity= null;
		if (cities != null ) {
			filteredNodeForCity = new ArrayList<Node>();
			for (String eachCity: cities) {
				//City city = City.valueOf(eachCity.toUpperCase());
				for (Node node:allNodes) {
					System.out.println("adminserviceimpl city"+node.getCity());
					System.out.println("adminserviceimpl cities"+eachCity.toUpperCase());
				if (node.getCity()==eachCity) {
					filteredNodeForCity.add(node);
				}
				}
			}
		}

		List<Node> filteredNodes = new ArrayList<Node>();
		filteredNodes.addAll(allNodes);
		if (!(filteredNodeForCity == null)) {
			
			/*if (filteredClustersForClusterID != null) filteredClusters.retainAll(filteredClustersForClusterID);*/
			if (filteredNodeForCity != null) filteredNodes.retainAll(filteredNodeForCity);
			
		}
	
		List<Node> nodeInfo= new ArrayList <Node>();
		for (Node n:filteredNodes) {
			System.out.println("*******inside adminserviceImpl Node city"+n.getCity());
			System.out.println("*******inside adminserviceImpl description"+n.getDescription());
			System.out.println("*******inside adminserviceImpl LATITUDE"+n.getLatitude());
			System.out.println("*******inside adminserviceImpl LONGITUDE"+n.getLongitude());
			System.out.println("*******inside adminserviceImpl Status"+n.getStatus());
			nodeInfo.add(n);
		}

		return nodeInfo;
	}

	/*	List<Node> nodes = adminDao.getNode(city);
		return nodes;
	}*/

	@Override
	public Node getNode(int nodeId) {
		// TODO Auto-generated method stub
		return adminDao.getNode(nodeId);
	}

	@Override
	public void deleteNode(Node node) {
		// TODO Auto-generated method stub
		adminDao.deleteNode(node);
		
	}

	@Override
	public void addSensor(Sensor sensor) {
		System.out.println("inside adminservice impl"+sensor);
		adminDao.addSensor(sensor);
		
	}

	@Override
	public List<Sensor> getSensor(String[] zip) {
		// TODO Auto-generated method stub
		List<Sensor> sensors = adminDao.getSensor(zip);
		return sensors;
	}

	@Override
	public Sensor getSensor(int sensorId) {
		// TODO Auto-generated method stub
		return adminDao.getSensor(sensorId);
	}

	@Override
	public void deleteSensor(Sensor sensor) {
		// TODO Auto-generated method stub
		adminDao.deleteSensor(sensor);
		
	}

	@Override
	public List<Sensor> getSensor() {
		// TODO Auto-generated method stub
		List<Sensor> sensors = adminDao.getSensor();
		return sensors;
	}

}
