package com.team404.appointment.domain;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * The primary key class for the EMPLOYEE_SERVICE database table.
 */
@Embeddable
public class EmployeeServicePK {

    @Column(name = "employee_id", insertable = false, updatable = false)
    private long employeeId;

    @Column(name = "service_id", insertable = false, updatable = false)
    private long serviceId;

    public EmployeeServicePK() {
    }

    public long getEmployeeId() {
        return this.employeeId;
    }

    public void setEmployeeId(long employeeId) {
        this.employeeId = employeeId;
    }

    public long getServiceId() {
        return this.serviceId;
    }

    public void setServiceId(long serviceId) {
        this.serviceId = serviceId;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof EmployeeServicePK)) {
            return false;
        }
        EmployeeServicePK castOther = (EmployeeServicePK) other;
        return
                (this.employeeId == castOther.employeeId)
                        && (this.serviceId == castOther.serviceId);
    }

    public int hashCode() {
        final int prime = 31;
        int hash = 17;
        hash = hash * prime + ((int) (this.employeeId ^ (this.employeeId >>> 32)));
        hash = hash * prime + ((int) (this.serviceId ^ (this.serviceId >>> 32)));

        return hash;
    }
}