package model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the "SCHEDULE" database table.
 * 
 */
@Embeddable
public class SchedulePK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="DAY_OF_WEEK")
	private String dayOfWeek;

	@Column(name="EMPLOYEE_ID", insertable=false, updatable=false)
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
		SchedulePK castOther = (SchedulePK)other;
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