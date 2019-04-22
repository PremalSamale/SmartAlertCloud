package edu.sjsu.smartalertcloud.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.springframework.stereotype.Repository;

import edu.sjsu.smartalertcloud.dao.VerificationTokenRepository;
import edu.sjsu.smartalertcloud.model.User;
import edu.sjsu.smartalertcloud.model.UserRole;
import edu.sjsu.smartalertcloud.model.VerificationToken;

@Repository
public class VerificationTokenRepositoryImpl implements VerificationTokenRepository {

	@Override
	public VerificationToken findByToken(String token) {
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(VerificationToken.class)
				.addAnnotatedClass(User.class)
				.addAnnotatedClass(UserRole.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		List<VerificationToken> tokens = session.createCriteria(VerificationToken.class).list();
		session.close();
		VerificationToken result = null;
		for (VerificationToken vt: tokens) {
			if (token.equals(vt.getToken())) {
				result = vt;
			}
		}
		return result;
	}

	@Override
	public VerificationToken findByUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void save(VerificationToken myToken) {
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(VerificationToken.class)
				.addAnnotatedClass(User.class)
				.addAnnotatedClass(UserRole.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(myToken);
		tx.commit();
		session.close();
	}
}
