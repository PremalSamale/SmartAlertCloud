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
	
	//@Enumerated(EnumType.STRING)
	private String city;
	
	// @ManyToOne
    // @JoinColumn
    // private Cluster cluster;
    // @OneToMany(fetch = FetchType.EAGER, mappedBy="Node")
	//     private Set<Sensor> node = new HashSet<>();
	
    private double latitude;
	private double longitude;
	private String name;
	private String description;
	private String status;
	private String address;


	public Node() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Node(/*Set<Node> node, */String name,double latitude, double longitude, String description, String status, String city, String address) {
		super();
		/*this.node = node;*/
		this.name = name;
		this.latitude=latitude;
		this.longitude=longitude;
		this.description = description;
		this.status = status;
		this.city = city;
		this.address=address;
	}
	

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
		return "Node [node_id=" + node_id + ", city=" + city + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", name=" + name + ", description=" + description + ", status=" + status + ", address=" + address
				+ "]";
	}


    
    
    
}
