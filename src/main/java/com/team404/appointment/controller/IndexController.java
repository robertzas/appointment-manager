package com.team404.appointment.controller;

import com.team404.appointment.domain.Schedule;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "redirect:/index.html";
    }

    @RequestMapping(value = "/schedule", method = RequestMethod.GET)
    public
    @ResponseBody
    Schedule getSchedule() {
        Schedule schedule = new Schedule();
        return schedule;
    }
}