package edu.sjsu.smartalertcloud.model;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class VerificationToken {
	private static final int EXPIRATION = 60 * 24;
	 
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
     
    private String token;

	@OneToOne(targetEntity = User.class, fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name = "user_id")
    private User user;

	private Date expiryDate;

	public VerificationToken() {}

	public VerificationToken(String token, User user) {
		this.token = token;
		this.user = user;
		this.expiryDate = calculateExpiryDate();
	}

	private Date calculateExpiryDate() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Timestamp(cal.getTime().getTime()));
        cal.add(Calendar.MINUTE, EXPIRATION);
        return new Date(cal.getTime().getTime());
    }
   
    public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
    
    public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
}
