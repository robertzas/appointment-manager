package com.team404.appointment.repository;

import com.team404.appointment.domain.Schedule;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class JpaScheduleRepository implements ScheduleRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Schedule> findAll() {
        Session session = (Session) entityManager.getDelegate();
        Criteria crit = session.createCriteria(Schedule.class);
        return crit.list();
    }
}
