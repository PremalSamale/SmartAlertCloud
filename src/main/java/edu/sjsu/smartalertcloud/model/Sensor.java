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

@Entity
public class Sensor {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sensorID; 
	
	@ManyToOne
	private Node node;	 
    private float latitude;
    private float longitude;
    
    private String sensorType;
    private String sensorStatus; 
    @Temporal(TemporalType.DATE)
    @Column(nullable = true)
    private Date lastDateOfMaintainnance;
    
    @Temporal(TemporalType.DATE)
    @Column(nullable = true)
    private Date dateOfDeployment;

	@Override
	public String toString() {
		return "Sensor [sensorID=" + sensorID + ", node=" + node + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", sensorType=" + sensorType + ", sensorStatus=" + sensorStatus + ", lastDateOfMaintainnance="
				+ lastDateOfMaintainnance + ", dateOfDeployment=" + dateOfDeployment + "]";
	}

	public Sensor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getSensorID() {
		return sensorID;
	}

	public void setSensorID(int sensorID) {
		this.sensorID = sensorID;
	}

	public Node getNode() {
		return node;
	}

	public void setNode(Node node) {
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

	public String getSensorType() {
		return sensorType;
	}

	public void setSensorType(String sensorType) {
		this.sensorType = sensorType;
	}

	public String getSensorStatus() {
		return sensorStatus;
	}

	public void setSensorStatus(String sensorStatus) {
		this.sensorStatus = sensorStatus;
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
    
    
    
}
