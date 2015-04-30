package com.team404.appointment.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * The primary key class for the "SCHEDULE" database table.
 */
@Embeddable
public class SchedulePK {

    @Column(name = "day_of_week")
    private String dayOfWeek;

    @Column(name = "employee_id", insertable = false, updatable = false)
    private long employeeId;

    public SchedulePK() {
    }

    public String getDayOfWeek() {
        return this.dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public long getEmployeeId() {
        return this.employeeId;
    }

    public void setEmployeeId(long employeeId) {
        this.employeeId = employeeId;
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
                        && (this.employeeId == castOther.employeeId);
    }

    public int hashCode() {
        final int prime = 31;
        int hash = 17;
        hash = hash * prime + this.dayOfWeek.hashCode();
        hash = hash * prime + ((int) (this.employeeId ^ (this.employeeId >>> 32)));

        return hash;
    }
}