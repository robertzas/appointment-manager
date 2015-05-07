package com.team404.appointment.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@Entity
public class Employee implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "ALLOWS_COUPONS")
    private BigDecimal allowsCoupons;

    @Column(name = "IS_ADMIN")
    private BigDecimal isAdmin;

    @JsonIgnore
    @OneToMany(mappedBy = "employee")
    private List<Cancellation> cancellations;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    private Person person;

    @JsonIgnore
    @OneToMany(mappedBy = "employee")
    private List<EmployeeService> employeeServices;

    @JsonIgnore
    @OneToMany(mappedBy = "employee")
    private List<Schedule> schedules;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public BigDecimal getAllowsCoupons() {
        return allowsCoupons;
    }

    public void setAllowsCoupons(BigDecimal allowsCoupons) {
        this.allowsCoupons = allowsCoupons;
    }

    public BigDecimal getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(BigDecimal isAdmin) {
        this.isAdmin = isAdmin;
    }

    public List<Cancellation> getCancellations() {
        return cancellations;
    }

    public void setCancellations(List<Cancellation> cancellations) {
        this.cancellations = cancellations;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public List<EmployeeService> getEmployeeServices() {
        return employeeServices;
    }

    public void setEmployeeServices(List<EmployeeService> employeeServices) {
        this.employeeServices = employeeServices;
    }

    public List<Schedule> getSchedules() {
        return schedules;
    }

    public void setSchedules(List<Schedule> schedules) {
        this.schedules = schedules;
    }
}