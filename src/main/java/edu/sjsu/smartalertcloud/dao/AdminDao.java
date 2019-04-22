package edu.sjsu.smartalertcloud.dao;

import java.util.List;

import edu.sjsu.smartalertcloud.model.Cluster;


public interface AdminDao {
	
	public void addCluster(Cluster cluster);

	public void deleteCluster(Cluster cluster);

	public List<Cluster> getCluster();
	
	public List<Cluster> searchCluster();
	public Cluster getCluster(int clusterId);

}
