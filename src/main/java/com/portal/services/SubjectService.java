package com.portal.services;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.portal.connection.GetDBConnection;
import com.portal.models.Subjects;

import java.util.List;

import javax.persistence.TypedQuery;

public class SubjectService {
    private SessionFactory sFactory = null;

    public SubjectService() {
        sFactory = GetDBConnection.getSessionFactory();
    }

    public void addSubject(Subjects subject) {
        Session session = sFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(subject);
        transaction.commit();
        session.close();
    }

    public List<Subjects> showAllSubjects() {
        Session session = sFactory.openSession();
        TypedQuery qryQuery = session.createQuery("from Subjects");
        List<Subjects> subjects = qryQuery.getResultList();
        
        return subjects;
    }

    public Subjects searchSubject(int subid) {
        Session session = sFactory.openSession();
        Subjects subject = session.createQuery("FROM Subjects WHERE sub_id = :subid", Subjects.class)
                .setParameter("subid", subid)
                .uniqueResult();
        session.close();
        return subject;
    }
}
