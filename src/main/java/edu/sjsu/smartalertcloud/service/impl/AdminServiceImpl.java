package edu.sjsu.smartalertcloud.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.sjsu.smartalertcloud.dao.AdminDao;
import edu.sjsu.smartalertcloud.model.Cluster;
import edu.sjsu.smartalertcloud.service.AdminService;
import edu.sjsu.smartalertcloud.model.Node;
import edu.sjsu.smartalertcloud.model.Sensor;


@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public void addCluster(Cluster cluster) {
        System.out.println("inside adminservice impl" + cluster);
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
    public List<Cluster> searchCluster(String county) {
        List<Cluster> allClusters = adminDao.searchCluster();

        List<Cluster> filteredClustersForCounty = new ArrayList<Cluster>();
        if (county != null && !county.isEmpty()) {
            for (Cluster cluster : allClusters) {
                if (cluster.getCounty().equalsIgnoreCase(county)) {
                    filteredClustersForCounty.add(cluster);
                }
            }
        } else {
            filteredClustersForCounty.addAll(allClusters);
        }

        return filteredClustersForCounty;
    }

    @Override
    public Cluster getCluster(int clusterId) {
        // TODO Auto-generated method stub
        return adminDao.getCluster(clusterId);
    }

    @Override
    public void addNode(Node node) {
        System.out.println("inside adminservice impl" + node);
        adminDao.addNode(node);

    }

    @Override
    public List<Node> getNode(String city) {
        List<Node> allNodes = adminDao.getNode();

        List<Node> filteredNodeForCity = new ArrayList<Node>();
        if (city != null && !city.isEmpty()) {
            
                for (Node node : allNodes) {
                    if (city.equalsIgnoreCase(node.getCity())) {
                        filteredNodeForCity.add(node);
                    }
                }
            
        } else filteredNodeForCity.addAll(allNodes);

        return filteredNodeForCity;
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
        System.out.println("inside adminservice impl" + sensor);
        adminDao.addSensor(sensor);

    }
    @Override
    public List<Sensor> getSensorDetails(String[] types){
    	 List<Sensor> allSensors = adminDao.getSensor();

         List<Sensor> filteredSensorForType = new ArrayList<Sensor>();
         if (types != null ) {
             for (String type:types) {
                 for (Sensor sensor : allSensors) {
                     if (type.equals(sensor.getType())) {
                    	
                    	 filteredSensorForType.add(sensor);
                     }
                 }
             } 
         } else filteredSensorForType.addAll(allSensors);

         return filteredSensorForType;
    	
    }

    @Override
    public List<Sensor> getSensor(String zip) {
        // TODO Auto-generated method stub
    	 List<Sensor> allSensors = adminDao.getSensor();

         List<Sensor> filteredSensorForZip = new ArrayList<Sensor>();
         if (zip != null && !zip.isEmpty()) {
             
                 for (Sensor sensor : allSensors) {
                     if (zip.equals(sensor.getZip())) {
                    	 System.out.println("+++++++++zip++++++++++"+zip);
                    	 filteredSensorForZip.add(sensor);
                     }
                 }
             
         } else filteredSensorForZip.addAll(allSensors);

         return filteredSensorForZip;
        /*List<Sensor> sensors = adminDao.getSensor(zip);
        return sensors;*/
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