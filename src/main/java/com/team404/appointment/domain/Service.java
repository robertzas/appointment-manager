package model;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the "SERVICE" database table.
 * 
 */
@Entity
@Table(name="\"SERVICE\"")
@NamedQuery(name="Service.findAll", query="SELECT s FROM Service s")
public class Service implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;

	@Column(name="IS_ACTIVE")
	private BigDecimal isActive;

	@Column(name="\"SERVICE\"")
	private String service;

	//bi-directional many-to-one association to EmployeeService
	@OneToMany(mappedBy="service")
	private List<EmployeeService> employeeServices;

	public Service() {
	}

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public BigDecimal getIsActive() {
		return this.isActive;
	}

	public void setIsActive(BigDecimal isActive) {
		this.isActive = isActive;
	}

	public String getService() {
		return this.service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public List<EmployeeService> getEmployeeServices() {
		return this.employeeServices;
	}

	public void setEmployeeServices(List<EmployeeService> employeeServices) {
		this.employeeServices = employeeServices;
	}

	public EmployeeService addEmployeeService(EmployeeService employeeService) {
		getEmployeeServices().add(employeeService);
		employeeService.setService(this);

		return employeeService;
	}

	public EmployeeService removeEmployeeService(EmployeeService employeeService) {
		getEmployeeServices().remove(employeeService);
		employeeService.setService(null);

		return employeeService;
	}

}