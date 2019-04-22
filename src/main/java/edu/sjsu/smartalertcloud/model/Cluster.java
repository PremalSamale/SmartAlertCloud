package edu.sjsu.smartalertcloud.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
public class Cluster {
	  @Id
	    private int clusterID;
	   /* @OneToMany(fetch = FetchType.EAGER, mappedBy="Cluster")
	    private Set<Node> node = new HashSet<>();*/
	    private float latitude;
	    private float longitude;
	    @Enumerated(EnumType.STRING)
	    private County county;
	    
		public Cluster() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Cluster(int clusterID, /*Set<Node> node, */float latitude, float longitude, County county) {
			super();
			this.clusterID = clusterID;
			/*this.node = node;*/
			this.latitude = latitude;
			this.longitude = longitude;
			this.county = county;
		}
		public int getClusterID() {
			return clusterID;
		}
		public void setClusterID(int clusterID) {
			this.clusterID = clusterID;
		}
	/*	public Set<Node> getNode() {
			return node;
		}
		public void setNode(Set<Node> node) {
			this.node = node;
		}*/
		public float getLatitude() {
			return latitude;
		}
		public void setLatitude(float latitude) {
			this.latitude = latitude;
		}
		public float getLongitude() {
			return longitude;
		}
		public void setLongitude(float longitude) {
			this.longitude = longitude;
		}
		public County getCounty() {
			return county;
		}
		public void setCounty(County county) {
			this.county = county;
		}
	

	
	    

}
