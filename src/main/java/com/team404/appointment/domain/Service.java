package com.team404.appointment.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;


@Entity
@Table(name = "SERVICE")
public class Service implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "IS_ACTIVE")
    private BigDecimal isActive;

    @Column(name = "SERVICE")
    private String service;

    @JsonIgnore
    @OneToMany(mappedBy = "service")
    private List<EmployeeService> employeeServices;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public BigDecimal getIsActive() {
        return isActive;
    }

    public void setIsActive(BigDecimal isActive) {
        this.isActive = isActive;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public List<EmployeeService> getEmployeeServices() {
        return employeeServices;
    }

    public void setEmployeeServices(List<EmployeeService> employeeServices) {
        this.employeeServices = employeeServices;
    }
}