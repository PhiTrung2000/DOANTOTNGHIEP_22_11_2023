package com.mycompany.spring_mvc_project_final.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RestaurantController {
    @RequestMapping(value = {"/restaurant"}, method = RequestMethod.GET)
        public String RestaurantHotel(Model model) {
            return "restaurant";
        }
}
