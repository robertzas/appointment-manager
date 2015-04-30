package com.team404.appointment.domain;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;


/**
 * The persistent class for the RESERVATION database table.
 */
@Entity
@Table(name = "reservation")
public class Reservation {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "amount_paid")
    private BigDecimal amountPaid;

    @Column(name = "coupon_code")
    private String couponCode;

    @Column(name = "customer_comments")
    private String customerComments;

    @Column(name = "end_timestamp")
    private Timestamp endTimestamp;

    @Column(name = "price_quoted")
    private BigDecimal priceQuoted;

    @Column(name = "start_timestamp")
    private Timestamp startTimestamp;

    private BigDecimal tip;

    //bi-directional one-to-one association to Cancellation
    @OneToOne(mappedBy = "reservation", fetch = FetchType.LAZY)
    private Cancellation cancellation;

    //bi-directional many-to-one association to Location
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "location_fk")
    private Location location;

    //bi-directional many-to-one association to Person
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "person_fk")
    private Person person;

    //bi-directional many-to-one association to EmployeeService
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
            @JoinColumn(name = "employee_service_employee_fk", referencedColumnName = "employee_id"),
            @JoinColumn(name = "EMPLOYEE_SERVICE_SERVICE_FK", referencedColumnName = "service_id")
    })
    private EmployeeService employeeService;

    public Reservation() {
    }

    public long getId() {
        return this.id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public BigDecimal getAmountPaid() {
        return this.amountPaid;
    }

    public void setAmountPaid(BigDecimal amountPaid) {
        this.amountPaid = amountPaid;
    }

    public String getCouponCode() {
        return this.couponCode;
    }

    public void setCouponCode(String couponCode) {
        this.couponCode = couponCode;
    }

    public String getCustomerComments() {
        return this.customerComments;
    }

    public void setCustomerComments(String customerComments) {
        this.customerComments = customerComments;
    }

    public Timestamp getEndTimestamp() {
        return this.endTimestamp;
    }

    public void setEndTimestamp(Timestamp endTimestamp) {
        this.endTimestamp = endTimestamp;
    }

    public BigDecimal getPriceQuoted() {
        return this.priceQuoted;
    }

    public void setPriceQuoted(BigDecimal priceQuoted) {
        this.priceQuoted = priceQuoted;
    }

    public Timestamp getStartTimestamp() {
        return this.startTimestamp;
    }

    public void setStartTimestamp(Timestamp startTimestamp) {
        this.startTimestamp = startTimestamp;
    }

    public BigDecimal getTip() {
        return this.tip;
    }

    public void setTip(BigDecimal tip) {
        this.tip = tip;
    }

    public Cancellation getCancellation() {
        return this.cancellation;
    }

    public void setCancellation(Cancellation cancellation) {
        this.cancellation = cancellation;
    }

    public Location getLocation() {
        return this.location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public Person getPerson() {
        return this.person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public EmployeeService getEmployeeService() {
        return this.employeeService;
    }

    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

}