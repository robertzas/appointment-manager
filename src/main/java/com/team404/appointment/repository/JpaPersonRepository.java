package com.team404.appointment.repository;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class JpaPersonRepository implements PersonRepository {

    @PersistenceContext
    private EntityManager entityManager;

}
