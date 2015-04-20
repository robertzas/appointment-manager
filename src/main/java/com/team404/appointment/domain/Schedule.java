package com.team404.appointment.domain;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
    @Column(name = "start_am")
    private Date startAm;
    @Column(name = "end_am")
    private Date endAm;
    @Column(name = "start_pm")
    private Date startPm;
    @Column(name = "end_pm")
    private Date endPm;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    @JoinColumn(name = "employee_fk")
    private Employee employee;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getStartAm() {
        return startAm;
    }

    public void setStartAm(Date startAm) {
        this.startAm = startAm;
    }

    public Date getEndAm() {
        return endAm;
    }

    public void setEndAm(Date endAm) {
        this.endAm = endAm;
    }

    public Date getStartPm() {
        return startPm;
    }

    public void setStartPm(Date startPm) {
        this.startPm = startPm;
    }

    public Date getEndPm() {
        return endPm;
    }

    public void setEndPm(Date endPm) {
        this.endPm = endPm;
    }
}
