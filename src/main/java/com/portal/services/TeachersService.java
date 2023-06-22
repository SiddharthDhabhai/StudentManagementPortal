package com.portal.services;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.portal.connection.GetDBConnection;
import com.portal.models.Teachers;

public class TeachersService {
	private SessionFactory sFactory = null;
	public TeachersService() {
		sFactory = GetDBConnection.getSessionFactory();
	}
	public void addTeacher(Teachers teachers) {
		Session session = sFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(teachers);
		transaction.commit();
	}
	public List<Teachers> showAllTeachers(){
		Session session = sFactory.openSession();
		TypedQuery qry = session.createQuery("from Teachers");
		List<Teachers> teachers = qry.getResultList();
		return teachers;
	}
}
