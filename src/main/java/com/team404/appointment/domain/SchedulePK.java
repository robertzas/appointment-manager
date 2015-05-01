package com.team404.appointment.domain;

import javax.persistence.*;

/**
 * The primary key class for the "SCHEDULE" database table.
 */
@Embeddable
public class SchedulePK {

    @Column(name = "day_of_week")
    private String dayOfWeek;

    @ManyToOne(fetch = FetchType.LAZY, targetEntity = Employee.class, cascade = CascadeType.REMOVE)
    private Employee employee;

    public String getDayOfWeek() {
        return this.dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof SchedulePK)) {
            return false;
        }
        SchedulePK castOther = (SchedulePK) other;
        return
                this.dayOfWeek.equals(castOther.dayOfWeek)
                        && (this.employee.getId() == castOther.employee.getId());
    }

    public int hashCode() {
        final int prime = 31;
        int hash = 17;
        hash = hash * prime + this.dayOfWeek.hashCode();
        hash = hash * prime + ((int) (this.employee.getId() ^ (this.employee.getId() >>> 32)));

        return hash;
    }
}