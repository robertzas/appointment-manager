package com.team404.appointment.repository;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class JpaReservationRepository implements ReservationRepository {

    @PersistenceContext
    private EntityManager entityManager;

}
