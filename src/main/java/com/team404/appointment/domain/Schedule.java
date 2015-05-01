package com.team404.appointment.domain;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "schedule")
public class Schedule {

    @EmbeddedId
    private SchedulePK id;

    @Column(name = "end_am_hour")
    private String endAmHour;

    @Column(name = "end_am_minute")
    private String endAmMinute;

    @Column(name = "end_pm_hour")
    private String endPmHour;

    @Column(name = "end_pm_minute")
    private String endPmMinute;

    @Column(name = "start_am_hour")
    private String startAmHour;

    @Column(name = "start_am_minute")
    private String startAmMinute;

    @Column(name = "start_pm_hour")
    private String startPmHour;

    @Column(name = "start_pm_minute")
    private String startPmMinute;

    public Schedule() {
    }

    public SchedulePK getId() {
        return this.id;
    }

    public void setId(SchedulePK id) {
        this.id = id;
    }

    public String getEndAmHour() {
        return this.endAmHour;
    }

    public void setEndAmHour(String endAmHour) {
        this.endAmHour = endAmHour;
    }

    public String getEndAmMinute() {
        return this.endAmMinute;
    }

    public void setEndAmMinute(String endAmMinute) {
        this.endAmMinute = endAmMinute;
    }

    public String getEndPmHour() {
        return this.endPmHour;
    }

    public void setEndPmHour(String endPmHour) {
        this.endPmHour = endPmHour;
    }

    public String getEndPmMinute() {
        return this.endPmMinute;
    }

    public void setEndPmMinute(String endPmMinute) {
        this.endPmMinute = endPmMinute;
    }

    public String getStartAmHour() {
        return this.startAmHour;
    }

    public void setStartAmHour(String startAmHour) {
        this.startAmHour = startAmHour;
    }

    public String getStartAmMinute() {
        return this.startAmMinute;
    }

    public void setStartAmMinute(String startAmMinute) {
        this.startAmMinute = startAmMinute;
    }

    public String getStartPmHour() {
        return this.startPmHour;
    }

    public void setStartPmHour(String startPmHour) {
        this.startPmHour = startPmHour;
    }

    public String getStartPmMinute() {
        return this.startPmMinute;
    }

    public void setStartPmMinute(String startPmMinute) {
        this.startPmMinute = startPmMinute;
    }


}