package com.team404.appointment.repository;

import com.team404.appointment.domain.Employee;

import java.util.List;

public interface EmployeeRepository {
    List<Employee> findAll();
}
