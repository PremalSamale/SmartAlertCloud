package edu.sjsu.smartalertcloud.dao;

import java.util.Date;


import edu.sjsu.smartalertcloud.model.User;
import edu.sjsu.smartalertcloud.model.UserRole;

public interface UserDao {	
	public User getUser(String emailAddress);
	public void saveUser(User user);
	public void saveUserAndRole(UserRole userRole, User user);
	
}
