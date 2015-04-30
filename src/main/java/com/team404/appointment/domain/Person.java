package com.team404.appointment.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the PERSON database table.
 */
@Entity
@Table(name = "person")
public class Person implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "date_joined")
    private Timestamp dateJoined;

    @Column(name = "email_address")
    private String emailAddress;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    private String password;

    @Column(name = "phone_number")
    private String phoneNumber;

    private String username;

    //bi-directional many-to-one association to Cancellation
    @OneToMany(mappedBy = "person")
    private List<Cancellation> cancellations;

    //bi-directional many-to-one association to Employee
    @OneToMany(mappedBy = "person")
    private List<Employee> employees;

    //bi-directional many-to-one association to Location
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PREFERRED_LOCATION_ID")
    private Location location;

    //bi-directional many-to-one association to Reservation
    @OneToMany(mappedBy = "person")
    private List<Reservation> reservations;

    public Person() {
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Timestamp getDateJoined() {
        return this.dateJoined;
    }

    public void setDateJoined(Timestamp dateJoined) {
        this.dateJoined = dateJoined;
    }

    public String getEmailAddress() {
        return this.emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getFirstName() {
        return this.firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return this.lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return this.phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<Cancellation> getCancellations() {
        return this.cancellations;
    }

    public void setCancellations(List<Cancellation> cancellations) {
        this.cancellations = cancellations;
    }

    public Cancellation addCancellation(Cancellation cancellation) {
        getCancellations().add(cancellation);
        cancellation.setPerson(this);

        return cancellation;
    }

    public Cancellation removeCancellation(Cancellation cancellation) {
        getCancellations().remove(cancellation);
        cancellation.setPerson(null);

        return cancellation;
    }

    public List<Employee> getEmployees() {
        return this.employees;
    }

    public void setEmployees(List<Employee> employees) {
        this.employees = employees;
    }

    public Employee addEmployee(Employee employee) {
        getEmployees().add(employee);
        employee.setPerson(this);

        return employee;
    }

    public Employee removeEmployee(Employee employee) {
        getEmployees().remove(employee);
        employee.setPerson(null);

        return employee;
    }

    public Location getLocation() {
        return this.location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public List<Reservation> getReservations() {
        return this.reservations;
    }

    public void setReservations(List<Reservation> reservations) {
        this.reservations = reservations;
    }

    public Reservation addReservation(Reservation reservation) {
        getReservations().add(reservation);
        reservation.setPerson(this);

        return reservation;
    }

    public Reservation removeReservation(Reservation reservation) {
        getReservations().remove(reservation);
        reservation.setPerson(null);

        return reservation;
    }

}