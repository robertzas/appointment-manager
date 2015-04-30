package model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the EMPLOYEE_SERVICE database table.
 * 
 */
@Embeddable
public class EmployeeServicePK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="EMPLOYEE_ID", insertable=false, updatable=false)
	private long employeeId;

	@Column(name="SERVICE_ID", insertable=false, updatable=false)
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
		EmployeeServicePK castOther = (EmployeeServicePK)other;
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