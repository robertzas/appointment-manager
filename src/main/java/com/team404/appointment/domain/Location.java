package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the LOCATION database table.
 * 
 */
@Entity
@NamedQuery(name="Location.findAll", query="SELECT l FROM Location l")
public class Location implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;

	@Column(name="ADDRESS_LINE1")
	private String addressLine1;

	@Column(name="ADDRESS_LINE2")
	private String addressLine2;

	private String city;

	@Column(name="GEOLOCATION_DMS")
	private String geolocationDms;

	private String name;

	@Column(name="STATE_CODE")
	private String stateCode;

	@Column(name="ZIP_CODE")
	private String zipCode;

	//bi-directional many-to-one association to Person
	@OneToMany(mappedBy="location")
	private List<Person> persons;

	//bi-directional many-to-one association to Reservation
	@OneToMany(mappedBy="location")
	private List<Reservation> reservations;

	public Location() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getAddressLine1() {
		return this.addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return this.addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGeolocationDms() {
		return this.geolocationDms;
	}

	public void setGeolocationDms(String geolocationDms) {
		this.geolocationDms = geolocationDms;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStateCode() {
		return this.stateCode;
	}

	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	public String getZipCode() {
		return this.zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public List<Person> getPersons() {
		return this.persons;
	}

	public void setPersons(List<Person> persons) {
		this.persons = persons;
	}

	public Person addPerson(Person person) {
		getPersons().add(person);
		person.setLocation(this);

		return person;
	}

	public Person removePerson(Person person) {
		getPersons().remove(person);
		person.setLocation(null);

		return person;
	}

	public List<Reservation> getReservations() {
		return this.reservations;
	}

	public void setReservations(List<Reservation> reservations) {
		this.reservations = reservations;
	}

	public Reservation addReservation(Reservation reservation) {
		getReservations().add(reservation);
		reservation.setLocation(this);

		return reservation;
	}

	public Reservation removeReservation(Reservation reservation) {
		getReservations().remove(reservation);
		reservation.setLocation(null);

		return reservation;
	}

}