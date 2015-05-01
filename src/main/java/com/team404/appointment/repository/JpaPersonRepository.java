package com.team404.appointment.repository;

import com.team404.appointment.domain.Person;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class JpaPersonRepository implements PersonRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public void bla() {
        entityManager.createNamedQuery("proc", Person.class);
    }

}
