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
	private Long sensor_id;

	// @ManyToOne(cascade = CascadeType.MERGE)
	// @JoinColumn(name = "node_id", referencedColumnName = "node_id")
	// private Node node;	
	
	
	private String zip;
	 
    private float latitude;
    private float longitude;
    
    private String type;
	private String status; 
	private String name;
	private String description;
    @Temporal(TemporalType.DATE)
    @Column(nullable = true)
    private Date lastDateOfMaintainnance;
    
    @Temporal(TemporalType.DATE)
    @Column(nullable = true)
    private Date dateOfDeployment;

	@Override
	public String toString() {
		return "Sensor [sensor_id=" + sensor_id + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", type=" + type + ", status=" + status + ", lastDateOfMaintainnance="
				+ lastDateOfMaintainnance + ", dateOfDeployment=" + dateOfDeployment + "]";
	}

	public Sensor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Sensor(String name, String description, String status, String type, Float latitude, Float longitude, String zip) {
		super();
		/*this.node = node;*/
		this.name = name;
		this.description = description;
		this.status = status;
		this.zip = zip;
		this.type = type;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	
	public Long getSensorId() {
		return sensor_id;
	}

	public void setSensorId(Long sensor_id) {
		this.sensor_id = sensor_id;
	}

	// public Node getNode() {
	// 	return node;
	// }

	// public void setNode(Node node) {
	// 	this.node = node;
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

	public Date getLastDateOfMaintainnance() {
		return lastDateOfMaintainnance;
	}

	public void setLastDateOfMaintainnance(Date lastDateOfMaintainnance) {
		this.lastDateOfMaintainnance = lastDateOfMaintainnance;
	}

	public Date getDateOfDeployment() {
		return dateOfDeployment;
	}

	public void setDateOfDeployment(Date dateOfDeployment) {
		this.dateOfDeployment = dateOfDeployment;
	}
	
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
    
    
}
