package edu.sjsu.smartalertcloud.service.impl;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.sjsu.smartalertcloud.dao.AdminDao;
import edu.sjsu.smartalertcloud.model.Cluster;
import edu.sjsu.smartalertcloud.model.County;
import edu.sjsu.smartalertcloud.service.AdminService;

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
	public List<Cluster> searchCluster(String[] counties, String clusterID) {
		// TODO Auto-generated method stub
		List<Cluster> allClusters = adminDao.searchCluster();
	
		clusterID = clusterID.replaceAll("  ", " ").trim();
		int clusterIDInt = 0;
		if ( clusterID != null && !clusterID.equals("")) clusterIDInt = Integer.parseInt(clusterID);
		
		List<Cluster> filteredClustersForClusterID = null;
		if (clusterIDInt != 0) {
			filteredClustersForClusterID = new ArrayList<Cluster>();
			for (Cluster cluster: allClusters) {
				if (cluster.getClusterID() == clusterIDInt) {
					filteredClustersForClusterID.add(cluster);
				}
			}
		}
		
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
		if (!(filteredClustersForClusterID == null && filteredClustersForCounty == null)) {
			
			if (filteredClustersForClusterID != null) filteredClusters.retainAll(filteredClustersForClusterID);
			if (filteredClustersForCounty != null) filteredClusters.retainAll(filteredClustersForCounty);
			
		}
//		for(Movie movie: allMovies) {
//			if (movie.getTitle().toLowerCase().contains(keywords.toLowerCase())) {
//				filteredMovies.add(movie);
//			}
//		}

		
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
			Cluster cInfo=new Cluster(id,longitude,latitude,county);
			clusterInfo.add(cInfo);
		}

		return clusterInfo;
	}

	@Override
	public Cluster getCluster(int clusterId) {
		// TODO Auto-generated method stub
		return adminDao.getCluster(clusterId);
	}



}
