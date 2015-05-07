package com.team404.appointment.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class Location implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "ADDRESS_LINE1")
    private String addressLine1;

    @Column(name = "ADDRESS_LINE2")
    private String addressLine2;

    private String city;

    @Column(name = "GEOLOCATION_DMS")
    private String geolocationDms;

    private String name;

    @Column(name = "STATE_CODE")
    private String stateCode;

    @Column(name = "ZIP_CODE")
    private String zipCode;

    @JsonIgnore
    @OneToMany(mappedBy = "location")
    private List<Person> persons;

    @JsonIgnore
    @OneToMany(mappedBy = "location")
    private List<Reservation> reservations;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getAddressLine1() {
        return addressLine1;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    public String getAddressLine2() {
        return addressLine2;
    }

    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getGeolocationDms() {
        return geolocationDms;
    }

    public void setGeolocationDms(String geolocationDms) {
        this.geolocationDms = geolocationDms;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStateCode() {
        return stateCode;
    }

    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public List<Person> getPersons() {
        return persons;
    }

    public void setPersons(List<Person> persons) {
        this.persons = persons;
    }

    public List<Reservation> getReservations() {
        return reservations;
    }

    public void setReservations(List<Reservation> reservations) {
        this.reservations = reservations;
    }
}