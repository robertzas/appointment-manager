package com.team404.appointment.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "SCHEDULE")
public class Schedule implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "DAY_OF_WEEK")
    private String dayOfWeek;

    @Column(name = "END_AM_HOUR")
    private String endAmHour;

    @Column(name = "END_AM_MINUTE")
    private String endAmMinute;

    @Column(name = "END_PM_HOUR")
    private String endPmHour;

    @Column(name = "END_PM_MINUTE")
    private String endPmMinute;

    @Column(name = "START_AM_HOUR")
    private String startAmHour;

    @Column(name = "START_AM_MINUTE")
    private String startAmMinute;

    @Column(name = "START_PM_HOUR")
    private String startPmHour;

    @Column(name = "START_PM_MINUTE")
    private String startPmMinute;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    private Employee employee;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public String getEndAmHour() {
        return endAmHour;
    }

    public void setEndAmHour(String endAmHour) {
        this.endAmHour = endAmHour;
    }

    public String getEndAmMinute() {
        return endAmMinute;
    }

    public void setEndAmMinute(String endAmMinute) {
        this.endAmMinute = endAmMinute;
    }

    public String getEndPmHour() {
        return endPmHour;
    }

    public void setEndPmHour(String endPmHour) {
        this.endPmHour = endPmHour;
    }

    public String getEndPmMinute() {
        return endPmMinute;
    }

    public void setEndPmMinute(String endPmMinute) {
        this.endPmMinute = endPmMinute;
    }

    public String getStartAmHour() {
        return startAmHour;
    }

    public void setStartAmHour(String startAmHour) {
        this.startAmHour = startAmHour;
    }

    public String getStartAmMinute() {
        return startAmMinute;
    }

    public void setStartAmMinute(String startAmMinute) {
        this.startAmMinute = startAmMinute;
    }

    public String getStartPmHour() {
        return startPmHour;
    }

    public void setStartPmHour(String startPmHour) {
        this.startPmHour = startPmHour;
    }

    public String getStartPmMinute() {
        return startPmMinute;
    }

    public void setStartPmMinute(String startPmMinute) {
        this.startPmMinute = startPmMinute;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}