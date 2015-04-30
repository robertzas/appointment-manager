package model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Timestamp;


/**
 * The persistent class for the RESERVATION database table.
 * 
 */
@Entity
@NamedQuery(name="Reservation.findAll", query="SELECT r FROM Reservation r")
public class Reservation implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;

	@Column(name="AMOUNT_PAID")
	private BigDecimal amountPaid;

	@Column(name="COUPON_CODE")
	private String couponCode;

	@Column(name="CUSTOMER_COMMENTS")
	private String customerComments;

	@Column(name="END_TIMESTAMP")
	private Timestamp endTimestamp;

	@Column(name="PRICE_QUOTED")
	private BigDecimal priceQuoted;

	@Column(name="START_TIMESTAMP")
	private Timestamp startTimestamp;

	private BigDecimal tip;

	//bi-directional one-to-one association to Cancellation
	@OneToOne(mappedBy="reservation", fetch=FetchType.LAZY)
	private Cancellation cancellation;

	//bi-directional many-to-one association to Location
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="LOCATION_FK")
	private Location location;

	//bi-directional many-to-one association to Person
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="PERSON_FK")
	private Person person;

	//bi-directional many-to-one association to EmployeeService
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumns({
		@JoinColumn(name="EMPLOYEE_SERVICE_EMPLOYEE_FK", referencedColumnName="EMPLOYEE_ID"),
		@JoinColumn(name="EMPLOYEE_SERVICE_SERVICE_FK", referencedColumnName="SERVICE_ID")
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