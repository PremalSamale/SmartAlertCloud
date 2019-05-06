package edu.sjsu.smartalertcloud.dao.impl;

import java.util.List;


import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.springframework.stereotype.Repository;

import edu.sjsu.smartalertcloud.dao.AdminDao;

import edu.sjsu.smartalertcloud.model.Cluster;
import edu.sjsu.smartalertcloud.model.Node;
import edu.sjsu.smartalertcloud.model.Sensor;


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

	@Override
	public void addNode(Node node) {
		Configuration con = new Configuration().configure().
				addAnnotatedClass(Node.class).addAnnotatedClass(Cluster.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(node);
		tx.commit();
		session.close();
		
	}

	@Override
	public List<Node> getNode(String[] cities) {
		// TODO Auto-generated method stub
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(Node.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		Criteria cr = session.createCriteria(Node.class);
	
		cr.add(Restrictions.in("city",cities));
		List<Node> nodes = cr.list();
	
		for(Node node:nodes) {
			System.out.println("***************NodeID"+node.getName());
			// System.out.println("***************latitude"+cluster.getLatitude());
			// System.out.println("***************latitude"+cluster.getLongitude());
			// System.out.println("*********************county"+cluster.getCounty());
		}
	
		session.close();
		return nodes;
	}

	@Override
	public Node getNode(int nodeId) {
		// TODO Auto-generated method stub
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(Node.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		Node node = (Node) session.get(Node.class, Long.valueOf(nodeId));
		System.out.println("***********inside getNode nodeId"+node.getNodeId());
		session.close();
		return node;
	}

	@Override
	public void deleteNode(Node node) {
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(Node.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(node);
		tx.commit();
		session.close();
	}

	@Override
	public List<Node> getNode() {
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(Node.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		List<Node> nodes = session.createCriteria(Node.class).list();
		for(Node node:nodes) {
			System.out.println("***************city"+node.getCity());
			System.out.println("***************description"+node.getDescription());
			System.out.println("***************name"+node.getName());
			System.out.println("*********************status"+node.getStatus());
		}
		session.close();
		return nodes;
	}
	
	@Override
	public void addSensor(Sensor sensor) {
		Configuration con = new Configuration().configure().
				addAnnotatedClass(Node.class).addAnnotatedClass(Sensor.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(sensor);
		tx.commit();
		session.close();
		
	}

	@Override
	public List<Sensor> getSensor(String[] zip) {
		// TODO Auto-generated method stub
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(Sensor.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		Criteria cr = session.createCriteria(Sensor.class);
	
		cr.add(Restrictions.in("zip",zip));
		List<Sensor> sensors = cr.list();
	
		for(Sensor sensor:sensors) {
			System.out.println("***************NodeID"+sensor.getName());
			// System.out.println("***************latitude"+cluster.getLatitude());
			// System.out.println("***************latitude"+cluster.getLongitude());
			// System.out.println("*********************county"+cluster.getCounty());
		}
	
		session.close();
		return sensors;
	}

	@Override
	public Sensor getSensor(int sensorId) {
		// TODO Auto-generated method stub
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(Sensor.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		Sensor sensor = (Sensor) session.get(Sensor.class, Long.valueOf(sensorId));
		System.out.println("***********inside getNode nodeId"+sensor.getSensorId());
		session.close();
		return sensor;
	}

	@Override
	public void deleteSensor(Sensor sensor) {
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(Sensor.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(sensor);
		tx.commit();
		session.close();
	}

	@Override
	public List<Sensor> getSensor() {
		Configuration con = new Configuration().configure()
				.addAnnotatedClass(Sensor.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
		SessionFactory sf = con.buildSessionFactory(reg);
		Session session = sf.openSession();
		List<Sensor> sensors = session.createCriteria(Sensor.class).list();
		session.close();
		return sensors;
	}
}
