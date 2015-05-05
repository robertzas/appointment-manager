package com.team404.appointment.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "EMPLOYEE_SERVICE")
public class EmployeeService implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private BigDecimal cost;

    @Column(name = "IS_ACTIVE")
    private BigDecimal isActive;

    @Column(name = "TIME_REQUIRED")
    private BigDecimal timeRequired;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    private Employee employee;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    private Service service;

    @JsonIgnore
    @OneToMany(mappedBy = "employeeService")
    private List<Reservation> reservations;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    public BigDecimal getIsActive() {
        return isActive;
    }

    public void setIsActive(BigDecimal isActive) {
        this.isActive = isActive;
    }

    public BigDecimal getTimeRequired() {
        return timeRequired;
    }

    public void setTimeRequired(BigDecimal timeRequired) {
        this.timeRequired = timeRequired;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public List<Reservation> getReservations() {
        return reservations;
    }

    public void setReservations(List<Reservation> reservations) {
        this.reservations = reservations;
    }
}