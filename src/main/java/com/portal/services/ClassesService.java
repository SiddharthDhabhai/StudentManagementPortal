package com.portal.services;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.portal.connection.GetDBConnection;
import com.portal.models.Classes;

import java.util.List;

import javax.persistence.TypedQuery;

public class ClassesService {
    private SessionFactory sFactory = null;

    public ClassesService() {
        sFactory = GetDBConnection.getSessionFactory();
    }

    public void addClasses(Classes classes) {
        Session session = sFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(classes);
        transaction.commit();
        session.close();
    }

    public List<Classes> showAllClasses(){
    	Session session = sFactory.openSession();
    	TypedQuery qr = session.createQuery("from Classes");
    	List<Classes> calList = qr.getResultList();
    	return calList;
    	
    }
    public Classes searchClasses(int cid) {
    	Session session = sFactory.openSession();
    	TypedQuery qr = session.createQuery("from Classes where class_id=:cid");
    	qr.setParameter("cid",cid);
    	List<Classes> calList = qr.getResultList();
    	return calList.get(0);
    }
}
