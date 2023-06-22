package com.portal.services;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.portal.connection.GetDBConnection;
import com.portal.models.User;

public class UserService {
 private SessionFactory sFactory = null;
 public UserService() {
	 sFactory=GetDBConnection.getSessionFactory();
 }
 public void addUser(User u) {
	 Session session = sFactory.openSession();
	 Transaction transaction = session.beginTransaction();
	 session.save(u);
	 transaction.commit();
 }
 public User checkLoginDetails(String email,String password) {
	 
	 Session session=sFactory.openSession();
	 TypedQuery qryQuery = session.createQuery("from User where username =:email and password=:password");
	 qryQuery.setParameter("email", email);
	 qryQuery.setParameter("password", password);
	 List<User> li= qryQuery.getResultList();
	 if(li.isEmpty()) {
		 return null;
	 }
	 User user = li.get(0);
	 return user;
 }
}
