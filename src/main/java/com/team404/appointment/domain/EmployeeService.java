package com.team404.appointment.domain;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "employee_service")
public class EmployeeService {

    @EmbeddedId
    private EmployeeServicePK id;

    private BigDecimal cost;

    @Column(name = "time_required")
    private BigDecimal timeRequired;

    //bi-directional many-to-one association to Employee
    @ManyToOne(fetch = FetchType.LAZY)
    private Employee employee;

    //bi-directional many-to-one association to Service
    @ManyToOne(fetch = FetchType.LAZY)
    private Service service;

    //bi-directional many-to-one association to Reservation
    @OneToMany(mappedBy = "employeeService")
    private List<Reservation> reservations;

    public EmployeeService() {
    }

    public EmployeeServicePK getId() {
        return this.id;
    }

    public void setId(EmployeeServicePK id) {
        this.id = id;
    }

    public BigDecimal getCost() {
        return this.cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    public BigDecimal getTimeRequired() {
        return this.timeRequired;
    }

    public void setTimeRequired(BigDecimal timeRequired) {
        this.timeRequired = timeRequired;
    }

    public Employee getEmployee() {
        return this.employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Service getService() {
        return this.service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public List<Reservation> getReservations() {
        return this.reservations;
    }

    public void setReservations(List<Reservation> reservations) {
        this.reservations = reservations;
    }

    public Reservation addReservation(Reservation reservation) {
        getReservations().add(reservation);
        reservation.setEmployeeService(this);

        return reservation;
    }

    public Reservation removeReservation(Reservation reservation) {
        getReservations().remove(reservation);
        reservation.setEmployeeService(null);

        return reservation;
    }

}