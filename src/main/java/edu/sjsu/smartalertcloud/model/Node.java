package edu.sjsu.smartalertcloud.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
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
import javax.persistence.Enumerated;
import javax.persistence.EnumType;
import javax.persistence.JoinColumn;

@Entity
public class Node {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long node_id;
	
	@Enumerated(EnumType.STRING)
	private String city;
	
	// @ManyToOne
    // @JoinColumn
    // private Cluster cluster;
    // @OneToMany(fetch = FetchType.EAGER, mappedBy="Node")
	//     private Set<Sensor> node = new HashSet<>();
	
    private float latitude;
	private float longitude;
	private String name;
	private String description;
	private String status;
    
    @Temporal(TemporalType.DATE)
    @Column(nullable = true)
    private Date lastDateOfMaintenance;
    
    @Temporal(TemporalType.DATE)
    @Column(nullable = true)
    private Date dateOfDeployment;
    
    

	public Node() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Node(/*Set<Node> node, */String name, String description, String status, String city) {
		super();
		/*this.node = node;*/
		this.name = name;
		this.description = description;
		this.status = status;
		this.city = city;
	}
	

	// public Cluster getCluster() {
	// 	return cluster;
	// }

	// public void setCluster(Cluster cluster) {
	// 	this.cluster = cluster;
	// }


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

	public Long getNodeId() {
		return node_id;
	}
	public void setNodeId(Long node_id) {
		this.node_id = node_id;
	}
/*	public Set<Node> getNode() {
		return node;
	}
	public void setNode(Set<Node> node) {
		this.node = node;
	}*/
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Node [node_id=" + node_id + "," + "name=" + name
				+ ", description=" + description + ", status=" + status +", lastDateOfMaintainnance=" + lastDateOfMaintenance
				+ ", dateOfDeployment=" + dateOfDeployment + "]";
	}
    
    
    
}
