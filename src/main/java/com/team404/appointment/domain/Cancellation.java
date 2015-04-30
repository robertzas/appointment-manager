package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the CANCELLATION database table.
 * 
 */
@Entity
@NamedQuery(name="Cancellation.findAll", query="SELECT c FROM Cancellation c")
public class Cancellation implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="RESERVATION_ID")
	private long reservationId;

	private String reason;

	//bi-directional many-to-one association to Person
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="CANCELLED_BY_ID")
	private Person person;

	//bi-directional one-to-one association to Reservation
	@OneToOne(fetch=FetchType.LAZY)
	private Reservation reservation;

	public Cancellation() {
	}

	public long getReservationId() {
		return this.reservationId;
	}

	public void setReservationId(long reservationId) {
		this.reservationId = reservationId;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Person getPerson() {
		return this.person;
	}

	public void setPerson(Person person) {
		this.person = person;
	}

	public Reservation getReservation() {
		return this.reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

}