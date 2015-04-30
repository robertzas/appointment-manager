package com.team404.appointment.domain;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the EMPLOYEE database table.
 */
@Entity
@Table(name = "employee")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "allows_coupons")
    private BigDecimal allowsCoupons;

    @Column(name = "is_admin")
    private BigDecimal isAdmin;

    //bi-directional many-to-one association to Person
    @ManyToOne(fetch = FetchType.LAZY)
    private Person person;

    //bi-directional many-to-one association to EmployeeService
    @OneToMany(mappedBy = "employee")
    private List<EmployeeService> employeeServices;

    //bi-directional many-to-one association to Schedule
    @OneToMany(mappedBy = "employee")
    private List<Schedule> schedules;

    public Employee() {
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public BigDecimal getAllowsCoupons() {
        return this.allowsCoupons;
    }

    public void setAllowsCoupons(BigDecimal allowsCoupons) {
        this.allowsCoupons = allowsCoupons;
    }

    public BigDecimal getIsAdmin() {
        return this.isAdmin;
    }

    public void setIsAdmin(BigDecimal isAdmin) {
        this.isAdmin = isAdmin;
    }

    public Person getPerson() {
        return this.person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public List<EmployeeService> getEmployeeServices() {
        return this.employeeServices;
    }

    public void setEmployeeServices(List<EmployeeService> employeeServices) {
        this.employeeServices = employeeServices;
    }

    public EmployeeService addEmployeeService(EmployeeService employeeService) {
        getEmployeeServices().add(employeeService);
        employeeService.setEmployee(this);

        return employeeService;
    }

    public EmployeeService removeEmployeeService(EmployeeService employeeService) {
        getEmployeeServices().remove(employeeService);
        employeeService.setEmployee(null);

        return employeeService;
    }

    public List<Schedule> getSchedules() {
        return this.schedules;
    }

    public void setSchedules(List<Schedule> schedules) {
        this.schedules = schedules;
    }

    public Schedule addSchedule(Schedule schedule) {
        getSchedules().add(schedule);
        schedule.setEmployee(this);

        return schedule;
    }

    public Schedule removeSchedule(Schedule schedule) {
        getSchedules().remove(schedule);
        schedule.setEmployee(null);

        return schedule;
    }

}