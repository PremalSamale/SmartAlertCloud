package edu.sjsu.smartalertcloud.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.sjsu.smartalertcloud.dao.UserDao;
import edu.sjsu.smartalertcloud.dao.VerificationTokenRepository;

import edu.sjsu.smartalertcloud.model.User;
import edu.sjsu.smartalertcloud.model.UserRole;
import edu.sjsu.smartalertcloud.model.VerificationToken;
import edu.sjsu.smartalertcloud.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Autowired
    private VerificationTokenRepository tokenRepository;

	@Transactional
	public void saveUserAndRole(String emailAddress, String firstName, String lastName,String role, String password, boolean enabled) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
		User user = new User(emailAddress, firstName, lastName, role,hashedPassword, enabled);

		UserRole userRole = new UserRole();
		if (role.equalsIgnoreCase("admin")) {
			userRole.setRole("ROLE_ADMIN");
			userRole.setUser(user);
		} else if  (role.equalsIgnoreCase("guest")){
			userRole.setRole("ROLE_GUEST");
			userRole.setUser(user);
		}else if  (role.equalsIgnoreCase("city_officer")||role.equalsIgnoreCase("IOT_Officer")){
			userRole.setRole("ROLE_USER");
			userRole.setUser(user);
		}else if  (role.equalsIgnoreCase("infrastructure_officer")){
			userRole.setRole("ROLE_INFRASTRUCTURE_OFFICER");
			userRole.setUser(user);
		}
		userDao.saveUserAndRole(userRole, user);
	}

	@Transactional
	public User getUser(String emailAddress) {
		return userDao.getUser(emailAddress);
	}



	@Transactional
	public void saveUser(String emailAddress, String firstName, String lastName, String role,  String password) {
		// TODO Auto-generated method stub
		User user= new User();
		user.setEmailAddress(emailAddress);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setRegistrationRole(role);
		user.setPassword(password);
		userDao.saveUser(user);
	}

	@Override
	public void createVerificationToken(User user, String token) {
		VerificationToken myToken = new VerificationToken(token, user);
        tokenRepository.save(myToken);
	}

	@Override
	public void saveRegisteredUser(User user) {
		userDao.saveUser(user);
	}

	@Override
	public VerificationToken getVerificationToken(String token) {
		return tokenRepository.findByToken(token);
	}


}
