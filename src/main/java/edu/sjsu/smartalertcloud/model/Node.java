package edu.sjsu.smartalertcloud.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Node {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int nodeID;
	
	@ManyToOne
	private Cluster cluster;
    
    @OneToMany(fetch = FetchType.EAGER, mappedBy="Node")
	    private Set<Sensor> node = new HashSet<>();
    
    private float latitude;
    private float longitude;
    
    @Temporal(TemporalType.DATE)
    @Column(nullable = true)
    private Date lastDateOfMaintenance;
    
    @Temporal(TemporalType.DATE)
    @Column(nullable = true)
    private Date dateOfDeployment;
    
    

	public Node() {
		
		// TODO Auto-generated constructor stub
	}

	public int getNodeID() {
		return nodeID;
	}

	public void setNodeID(int nodeID) {
		this.nodeID = nodeID;
	}

	public Cluster getCluster() {
		return cluster;
	}

	public void setCluster(Cluster cluster) {
		this.cluster = cluster;
	}

	public Set<Sensor> getNode() {
		return node;
	}

	public void setNode(Set<Sensor> node) {
		this.node = node;
	}

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

	public Date getLastDateOfMaintenance() {
		return lastDateOfMaintenance;
	}

	public void setLastDateOfMaintenance(Date lastDateOfMaintenance) {
		this.lastDateOfMaintenance = lastDateOfMaintenance;
	}

	public Date getDateOfDeployment() {
		return dateOfDeployment;
	}

	public void setDateOfDeployment(Date dateOfDeployment) {
		this.dateOfDeployment = dateOfDeployment;
	}

	@Override
	public String toString() {
		return "Node [nodeID=" + nodeID + ", cluster=" + cluster + ", node=" + node + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", lastDateOfMaintainnance=" + lastDateOfMaintenance
				+ ", dateOfDeployment=" + dateOfDeployment + "]";
	}
    
    
    
}
