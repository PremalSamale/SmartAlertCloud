package edu.sjsu.smartalertcloud.service.impl;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.sjsu.smartalertcloud.dao.UserDao;
import edu.sjsu.smartalertcloud.model.UserRole;

@Service("userDetailsService")
public class MyUserDetailsService implements UserDetailsService {

	@Autowired
	private UserDao userDao;

	@Transactional(readOnly=true)
	@Override
	public UserDetails loadUserByUsername(String emailAddress) throws UsernameNotFoundException {
		edu.sjsu.smartalertcloud.model.User user = userDao.getUser(emailAddress);
		List<GrantedAuthority> authorities = 
                buildUserAuthority(user.getUserRole());
		return buildUserForAuthentication(user, authorities);
	}

	private User buildUserForAuthentication(edu.sjsu.smartalertcloud.model.User user, List<GrantedAuthority> authorities) {
		return new User(user.getEmailAddress(), user.getPassword(),
				user.isEnabled(), true, true, true, authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(Set<UserRole> userRoles) {
		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
		for (UserRole userRole : userRoles) {
			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
		}
		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);
		return Result;
	}

}
