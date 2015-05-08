package com.team404.appointment.repository;

import com.team404.appointment.domain.Person;
import com.team404.appointment.domain.Reservation;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;
import java.util.Date;
import java.util.List;

@Repository
public class JpaReservationRepository implements ReservationRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Reservation> getHistoryByCustomerId(long customerId) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Reservation> criteria = builder.createQuery(Reservation.class);
        Root<Reservation> eventRoot = criteria.from(Reservation.class);
        criteria = criteria.select(eventRoot);

        Join<Reservation, Person> personJoin = eventRoot.join("person");

        criteria.where(builder.equal(personJoin.get("id"), customerId));

        return entityManager.createQuery(criteria).getResultList();
    }

    @Override
    public List<Reservation> getHistoryByCustomerIdToFromDate(long customerId, Date fromDateTime, Date toDateTime) {
        Session session = (Session) entityManager.getDelegate();
        Query query = session.getNamedQuery(
                "GETCUSTOMERHISTORY")
                .setParameter("fromdatetime", fromDateTime)
                .setParameter("todatetime", toDateTime)
                .setParameter("customerid", customerId);
        return query.list();
    }
}
