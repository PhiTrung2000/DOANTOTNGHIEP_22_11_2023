package com.mycompany.spring_mvc_project_final.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DestinationController {
    @RequestMapping(value = {"/destination"}, method = RequestMethod.GET)
    public String roomHotel(Model model) {
        return "destination";
    }
    @RequestMapping(value = {"/hue"}, method = RequestMethod.GET)
    public String Hue(Model model) {
        return "hue";
    }
    @RequestMapping(value = {"/hoi_an"}, method = RequestMethod.GET)
    public String HoiAn(Model model) {
        return "hoi_an";
    }
    @RequestMapping(value = {"/da_nang"}, method = RequestMethod.GET)
    public String DaNang(Model model) {
        return "da_nang";
    }
}
