package com.team404.appointment.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Entity
public class Reservation implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "AMOUNT_PAID")
    private BigDecimal amountPaid;

    @Column(name = "COUPON_CODE")
    private String couponCode;

    @Column(name = "CUSTOMER_COMMENTS")
    private String customerComments;

    @Column(name = "END_TIMESTAMP")
    private Date endTimestamp;

    @Column(name = "IS_CANCELLED")
    private BigDecimal isCancelled;

    @Column(name = "PRICE_QUOTED")
    private BigDecimal priceQuoted;

    @Column(name = "START_TIMESTAMP")
    private Date startTimestamp;

    private BigDecimal tip;

    @JsonIgnore
    @OneToMany(mappedBy = "reservation")
    private List<Cancellation> cancellations;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EMPLOYEE_SERVICE_ID")
    private EmployeeService employeeService;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "LOCATION_FK")
    private Location location;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "PERSON_FK")
    private Person person;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public BigDecimal getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(BigDecimal amountPaid) {
        this.amountPaid = amountPaid;
    }

    public String getCouponCode() {
        return couponCode;
    }

    public void setCouponCode(String couponCode) {
        this.couponCode = couponCode;
    }

    public String getCustomerComments() {
        return customerComments;
    }

    public void setCustomerComments(String customerComments) {
        this.customerComments = customerComments;
    }

    public Date getEndTimestamp() {
        return endTimestamp;
    }

    public void setEndTimestamp(Date endTimestamp) {
        this.endTimestamp = endTimestamp;
    }

    public BigDecimal getIsCancelled() {
        return isCancelled;
    }

    public void setIsCancelled(BigDecimal isCancelled) {
        this.isCancelled = isCancelled;
    }

    public BigDecimal getPriceQuoted() {
        return priceQuoted;
    }

    public void setPriceQuoted(BigDecimal priceQuoted) {
        this.priceQuoted = priceQuoted;
    }

    public Date getStartTimestamp() {
        return startTimestamp;
    }

    public void setStartTimestamp(Date startTimestamp) {
        this.startTimestamp = startTimestamp;
    }

    public BigDecimal getTip() {
        return tip;
    }

    public void setTip(BigDecimal tip) {
        this.tip = tip;
    }

    public List<Cancellation> getCancellations() {
        return cancellations;
    }

    public void setCancellations(List<Cancellation> cancellations) {
        this.cancellations = cancellations;
    }

    public EmployeeService getEmployeeService() {
        return employeeService;
    }

    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }
}