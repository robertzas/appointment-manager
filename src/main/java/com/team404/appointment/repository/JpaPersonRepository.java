package com.team404.appointment.repository;

import com.team404.appointment.domain.Person;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class JpaPersonRepository implements PersonRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Person findById(long id) {
        Session session = (Session) entityManager.getDelegate();
        Criteria crit = session.createCriteria(Person.class);
        crit.add(Restrictions.eq("id", id));
        return (Person) crit.uniqueResult();
    }

    @Override
    public List<Person> findAll() {
        Session session = (Session) entityManager.getDelegate();
        Criteria crit = session.createCriteria(Person.class);
        return crit.list();
    }
}
