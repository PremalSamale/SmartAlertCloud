package edu.sjsu.smartalertcloud.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;



@Entity
public class Cluster {
		@Id
		@Column
		@GeneratedValue(strategy = GenerationType.AUTO)
	    private int clusterID;
	   /* @OneToMany(fetch = FetchType.EAGER, mappedBy="Cluster")
	    private Set<Node> node = new HashSet<>();*/
	    private double latitude;
	    private double longitude;
	    private String county;
	    private String name;
		private String address;
			
			// @OneToMany(mappedBy = "Node", cascade = CascadeType.ALL)
			// private Set<Node> nodes;
	    
		public Cluster() {
			
			// TODO Auto-generated constructor stub
		}
		public Cluster(double latitude, double longitude, String county, String name, String address) {
			
			/*this.node = node;*/
			this.latitude = latitude;
			this.longitude = longitude;
			this.county = county;
			this.name = name;
			this.address = address;
		}
		public int getClusterID() {
			return clusterID;
		}
	/*	public void setClusterID(int clusterID) {
			this.clusterID = clusterID;
		}*/
		// public Set<Node> getNodes() {
		// 	return nodes;
		// }
		// public void setNodes(Set<Node> nodes) {
		// 		nodes.forEach(x -> x.setCluster(this));
		// }
		public double getLatitude() {
			return latitude;
		}
		public void setLatitude(double latitude) {
			this.latitude = latitude;
		}
		public double getLongitude() {
			return longitude;
		}
		public void setLongitude(double longitude) {
			this.longitude = longitude;
		}
		public String getCounty() {
			return county;
		}
		public void setCounty(String county) {
			this.county = county;
		}
		public String getName() {
		return name;
	}
		public void setName(String name) {
			this.name = name;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		@Override
		public String toString() {
			return "Cluster [clusterID=" + clusterID + ", latitude=" + latitude + ", longitude=" + longitude
					+ ", county=" + county + ", name=" + name + ", address=" + address + "]";
		}
	

	
	    

}
