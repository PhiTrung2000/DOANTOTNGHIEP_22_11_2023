package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.mycompany.spring_mvc_project_final.entities.CategoryEntity;
import java.util.List;

@Controller
public class SearchRoomController {

    @Autowired
    private CategoryService categoryService;

    @PostMapping("/checkAvailability")
    public String checkRoomAvailability(@RequestParam("adults") double numOfAdults,
                                        @RequestParam("children") double numOfChildren,
                                        Model model,
                                        RedirectAttributes redirectAttributes) {
        // Lấy danh sách các loại phòng phù hợp từ Service
        List<CategoryEntity> availableCategories = categoryService.getAvailableCategories(numOfAdults, numOfChildren);

        // Chuyển danh sách loại phòng qua trang kết quả
        model.addAttribute("category", availableCategories);

        return "rooms";
    }
}


