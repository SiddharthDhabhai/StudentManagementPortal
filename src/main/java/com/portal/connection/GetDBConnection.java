package com.portal.connection;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.portal.models.Classes;
import com.portal.models.Students;
import com.portal.models.Subjects;
import com.portal.models.Teachers;
import com.portal.models.User;



public class GetDBConnection {
private static SessionFactory sessionFactory;
	
	public static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			try
			{
				Configuration  cfg = new Configuration();
				Properties settings = new Properties();
				
				settings.put(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
				settings.put(Environment.URL, "jdbc:mysql://localhost:3306/dhabhai?useSSL=false");
				settings.put(Environment.USER, "root");
				settings.put(Environment.PASS, "Harshvardhan@30");
				settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL5Dialect");
				settings.put(Environment.SHOW_SQL, "true");
				settings.put(Environment.HBM2DDL_AUTO, "update");
				
				cfg.setProperties(settings);
				//settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");

				cfg.addAnnotatedClass(User.class);
				cfg.addAnnotatedClass(Subjects.class);
				cfg.addAnnotatedClass(Teachers.class);
				cfg.addAnnotatedClass(Classes.class);
				cfg.addAnnotatedClass(Students.class);
			
				
				
				
				ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
						.applySettings(cfg.getProperties()).build();
				
				System.out.println("Hibernate Java Config serviceRegistry created");
				sessionFactory = cfg.buildSessionFactory(serviceRegistry);
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
		}
		return sessionFactory;
	}
}
