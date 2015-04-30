package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the "SCHEDULE" database table.
 * 
 */
@Entity
@Table(name="\"SCHEDULE\"")
@NamedQuery(name="Schedule.findAll", query="SELECT s FROM Schedule s")
public class Schedule implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private SchedulePK id;

	@Column(name="END_AM_HOUR")
	private String endAmHour;

	@Column(name="END_AM_MINUTE")
	private String endAmMinute;

	@Column(name="END_PM_HOUR")
	private String endPmHour;

	@Column(name="END_PM_MINUTE")
	private String endPmMinute;

	@Column(name="START_AM_HOUR")
	private String startAmHour;

	@Column(name="START_AM_MINUTE")
	private String startAmMinute;

	@Column(name="START_PM_HOUR")
	private String startPmHour;

	@Column(name="START_PM_MINUTE")
	private String startPmMinute;

	//bi-directional many-to-one association to Employee
	@ManyToOne(fetch=FetchType.LAZY)
	private Employee employee;

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

	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

}