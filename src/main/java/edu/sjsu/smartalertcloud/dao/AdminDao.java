package edu.sjsu.smartalertcloud.dao;

import java.util.List;

import edu.sjsu.smartalertcloud.model.Cluster;
import edu.sjsu.smartalertcloud.model.Node;
import edu.sjsu.smartalertcloud.model.Sensor;;

public interface AdminDao {
	
	public void addCluster(Cluster cluster);

	public void deleteCluster(Cluster cluster);

	public List<Cluster> getCluster();
	
	public List<Cluster> searchCluster();
	public Cluster getCluster(int clusterId);

	public void addNode(Node node);
	public List<Node> getNode(String[] cities);
	public Node getNode(int nodeId);
	public void deleteNode(Node node);
	public List<Node> getNode();

	public void addSensor(Sensor sensor);
	public List<Sensor> getSensor(String[] zip);
	public Sensor getSensor(int sensorId);
	public void deleteSensor(Sensor sensor);
	public List<Sensor> getSensor();

}
