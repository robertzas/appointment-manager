package com.team404.appointment.repository;

import com.team404.appointment.domain.Employee;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class JpaEmployeeRepository implements EmployeeRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Employee> findAll() {
        Session session = (Session) entityManager.getDelegate();
        Criteria crit = session.createCriteria(Employee.class);
        return crit.list();
    }
}
