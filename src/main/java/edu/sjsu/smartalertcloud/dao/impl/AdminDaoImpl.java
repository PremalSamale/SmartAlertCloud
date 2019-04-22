package edu.sjsu.smartalertcloud.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.springframework.stereotype.Repository;

import ch.qos.logback.core.pattern.parser.Node;
import edu.sjsu.smartalertcloud.dao.AdminDao;
import edu.sjsu.smartalertcloud.model.Cluster;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Override
	public void addCluster(Cluster cluster) {
		Configuration con = new Configuration().configure().
				addAnnotatedClass(Node.class).addAnnotatedClass(Cluster.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(cluster);
		tx.commit();
		session.close();
		
	}

	@Override
	public void deleteCluster(Cluster cluster) {
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(Cluster.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(cluster);
		tx.commit();
		session.close();
		
	}

	@Override
	public List<Cluster> getCluster() {
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(Cluster.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		List<Cluster> clusters = session.createCriteria(Cluster.class).list();
		session.close();
		return clusters;
	}

	@Override
	public List<Cluster> searchCluster() {
		// TODO Auto-generated method stub
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(Cluster.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		List<Cluster> clusters = session.createCriteria(Cluster.class).list();
		for(Cluster cluster:clusters) {
			System.out.println("***************ClusterID"+cluster.getClusterID());
			System.out.println("***************latitude"+cluster.getLatitude());
			System.out.println("***************latitude"+cluster.getLongitude());
			System.out.println("*********************county"+cluster.getCounty());
		}
	
		session.close();
		return clusters;
	}

	@Override
	public Cluster getCluster(int clusterId) {
		// TODO Auto-generated method stub
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(Cluster.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		Cluster cluster = (Cluster) session.get(Cluster.class, clusterId);
		System.out.println("***********inside chooseClusterToEditOrDelete clusterID"+cluster.getCounty());
		session.close();
		return cluster;
	}



}
