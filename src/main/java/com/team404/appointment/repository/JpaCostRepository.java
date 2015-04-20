package com.team404.appointment.repository;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class JpaCostRepository implements CostRepository {

    @PersistenceContext
    private EntityManager entityManager;

}
