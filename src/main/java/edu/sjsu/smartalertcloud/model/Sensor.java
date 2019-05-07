package edu.sjsu.smartalertcloud.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.JoinColumn;
import javax.persistence.Enumerated;
import javax.persistence.EnumType;
import javax.persistence.JoinColumn;
import javax.persistence.CascadeType;

@Entity
public class Sensor {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sensor_id;

	// @ManyToOne(cascade = CascadeType.MERGE)
	// @JoinColumn(name = "node_id", referencedColumnName = "node_id")
	// private Node node;	
	
	
	private String zip;
	 
    private double latitude;
    private double longitude;
    
    private String type;
	private String status; 
	private String name;
	private String description;
	private String address;


	@Override
	public String toString() {
		return "Sensor [sensor_id=" + sensor_id + ", zip=" + zip + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", type=" + type + ", status=" + status + ", name=" + name + ", description=" + description
				+ ", address=" + address + "]";
	}

	public Sensor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Sensor(String name, String description, String status, String type, Double latitude, Double longitude, String zip, String address) {
		super();
		/*this.node = node;*/
		this.name = name;
		this.description = description;
		this.status = status;
		this.zip = zip;
		this.type = type;
		this.latitude = latitude;
		this.longitude = longitude;
		this.address = address;
	}
	
	public int getSensorId() {
		return sensor_id;
	}

/*	public void setSensorId(Long sensor_id) {
		this.sensor_id = sensor_id;
	}*/

	// public Node getNode() {
	// 	return node;
	// }

	// public void setNode(Node node) {
	// 	this.node = node;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

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

	
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
    
    
}
