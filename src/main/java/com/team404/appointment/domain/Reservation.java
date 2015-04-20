package com.team404.appointment.domain;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Reservation {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "reservation_id")
    private long id;
    @Column(name = "start_timestamp")
    private Date startDate;
    @Column(name = "end_timestamp")
    private Date endDate;
    @Column(name = "price_quoted")
    private Long priceQuoted;
    @Column(name = "customer_comments")
    private String comments;
    @Column(name = "amount_paid")
    private Long amountPaid;
    @Column(name = "coupon_code")
    private String couponCode;
    private String tip;

    @OneToOne
    private Location location;

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Long getPriceQuoted() {
        return priceQuoted;
    }

    public void setPriceQuoted(Long priceQuoted) {
        this.priceQuoted = priceQuoted;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Long getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(Long amountPaid) {
        this.amountPaid = amountPaid;
    }

    public String getCouponCode() {
        return couponCode;
    }

    public void setCouponCode(String couponCode) {
        this.couponCode = couponCode;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }
}
