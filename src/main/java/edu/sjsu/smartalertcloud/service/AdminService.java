package edu.sjsu.smartalertcloud.service;

import java.util.List;

import edu.sjsu.smartalertcloud.model.Cluster;



public interface AdminService {
	public void addCluster(Cluster cluster);

	public void deleteCluster(Cluster cluster);
	
	public List<Cluster> getCluster();
	
	public List<Cluster> searchCluster(String[] counties, String clusterID);
	public Cluster getCluster(int clusterId);

}
