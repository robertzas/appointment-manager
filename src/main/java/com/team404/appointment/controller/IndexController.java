package com.team404.appointment.controller;

import com.team404.appointment.domain.Schedule;
import com.team404.appointment.repository.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class IndexController {

    @Autowired
    ScheduleRepository scheduleRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "redirect:/index.html";
    }

    @RequestMapping(value = "/schedule", method = RequestMethod.GET)
    public
    @ResponseBody
    List<Schedule> getSchedules() {
        List<Schedule> scheduleList = scheduleRepository.findAll();
        return scheduleList;
    }
}