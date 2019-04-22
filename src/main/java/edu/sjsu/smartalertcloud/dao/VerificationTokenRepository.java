package edu.sjsu.smartalertcloud.dao;

import edu.sjsu.smartalertcloud.model.User;
import edu.sjsu.smartalertcloud.model.VerificationToken;

public interface VerificationTokenRepository {
	VerificationToken findByToken(String token);
    VerificationToken findByUser(User user);
	void save(VerificationToken myToken);
}
