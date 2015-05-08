package com.team404.appointment.controller;

import com.team404.appointment.domain.Employee;
import com.team404.appointment.domain.Person;
import com.team404.appointment.domain.Reservation;
import com.team404.appointment.domain.Schedule;
import com.team404.appointment.repository.EmployeeRepository;
import com.team404.appointment.repository.PersonRepository;
import com.team404.appointment.repository.ReservationRepository;
import com.team404.appointment.repository.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    ScheduleRepository scheduleRepository;
    @Autowired
    EmployeeRepository employeeRepository;
    @Autowired
    ReservationRepository reservationRepository;
    @Autowired
    PersonRepository personRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "redirect:/index.html";
    }

    @RequestMapping(value = "/employees", method = RequestMethod.GET)
    public
    @ResponseBody
    List<EmployeeResource> getEmployees() {
        List<Employee> employees = employeeRepository.findAll();
        List<EmployeeResource> employeeResources = new ArrayList<EmployeeResource>();
        for (Employee employee : employees) {
            Person person = personRepository.findById(employee.getPerson().getId());

            EmployeeResource employeeResource = new EmployeeResource();
            employeeResource.setId(employee.getId());
            employeeResource.setFirstName(person.getFirstName());
            employeeResource.setLastName(person.getLastName());

            employeeResources.add(employeeResource);
        }
        return employeeResources;
    }

    @RequestMapping(value = "/schedules/{employeeId}", method = RequestMethod.GET)
    public
    @ResponseBody
    List<Schedule> getSchedules(
            @PathVariable("employeeId") final long employeeId) {
        return scheduleRepository.findByEmployeeId(employeeId);
    }

    @RequestMapping(value = "/history/{customerId}", method = RequestMethod.GET)
    public
    @ResponseBody
    List<Reservation> getAllHistoryByCustomerId(
            @PathVariable("customerId") final long customerId) {
        return reservationRepository.getHistoryByCustomerId(customerId);
    }

    @RequestMapping(value = "/people", method = RequestMethod.GET)
    public
    @ResponseBody
    List<Person> getPeople() {
        return personRepository.findAll();
    }

    @RequestMapping(value = "/reservation/{customerId}", method = RequestMethod.GET)
    public
    @ResponseBody
    List<Reservation> getReservations(
            @PathVariable("customerId") final long customerId) {
        return reservationRepository.getHistoryByCustomerId(customerId);
    }
}