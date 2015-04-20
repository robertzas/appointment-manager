package com.team404.appointment.web.controller;

import com.team404.appointment.repository.LocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @Autowired
    private LocationRepository locationRepository;

    @RequestMapping("/")
    public String index() {
        return "redirect:/index.html";
    }
}
