package com.portal.services;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.portal.connection.GetDBConnection;
import com.portal.models.Students;

public class StudentsService {
	private SessionFactory sFactory = null;
	public StudentsService() {
		sFactory = GetDBConnection.getSessionFactory();
	}
	public void addStudents(Students students) {
		Session session = sFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(students);
		transaction.commit();
	}
	public List<Students> showAllStudents(){
		Session session = sFactory.openSession();
		TypedQuery qry = session.createQuery("from Students");
		List<Students> students = qry.getResultList();
		return students;
	}
}
