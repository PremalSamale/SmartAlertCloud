package edu.sjsu.smartalertcloud.model;


import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;


import org.hibernate.validator.constraints.Email;

@Entity
@Table(name="users")
public class User {
	@Id
	@Email
	@Column(name = "username", unique = true, nullable = false)
    private String emailAddress;
    @Column(name = "firstName")
    private String firstName;
    @Column(name = "lastName")
    private String lastName;
    @Column(name = "role")
    private String registrationRole;
    @Column(name = "password")
    private String password;
	private boolean enabled;
	@OneToMany(fetch = FetchType.EAGER, mappedBy="user")
	private Set<UserRole> userRole = new HashSet<UserRole>();
	@OneToOne(targetEntity = VerificationToken.class, fetch = FetchType.EAGER)
	private VerificationToken verificationToken;

    public User() {
    }

    public User(String emailAddress, String firstName, String lastName,String role, String password, boolean enabled) {
        this.emailAddress = emailAddress;
        this.firstName = firstName;
        this.lastName = lastName;
        this.registrationRole=role;
        this.password = password;
        this.enabled = enabled;
    }

 
    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

   
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	@Column(name = "enabled", nullable = false)
	public boolean isEnabled() {
		return this.enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<UserRole> getUserRole() {
		return this.userRole;
	}

	public void setUserRole(Set<UserRole> userRole) {
		this.userRole = userRole;
	}

	public String getRegistrationRole() {
		return registrationRole;
	}

	public void setRegistrationRole(String registrationRole) {
		this.registrationRole = registrationRole;
	}
	
}
