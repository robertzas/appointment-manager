package com.team404.appointment.repository;

import com.team404.appointment.domain.Employee;
import com.team404.appointment.domain.Schedule;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;
import java.util.List;

@Repository
public class JpaScheduleRepository implements ScheduleRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Schedule> findByEmployeeId(long employeeId) {
        CriteriaBuilder builder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Schedule> criteria = builder.createQuery(Schedule.class);
        Root<Schedule> eventRoot = criteria.from(Schedule.class);
        criteria = criteria.select(eventRoot);

        Join<Schedule, Employee> employeeJoin = eventRoot.join("employee");

        criteria.where(builder.equal(employeeJoin.get("id"), employeeId));

        return entityManager.createQuery(criteria).getResultList();
    }
}
