package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.AccountEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.service.AccountService;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HistoryBookingController {
    @Autowired
    private BookingService bookingService;
    @Autowired
    private AccountService accountService;

    @RequestMapping(value = {"/user/history"}, method = RequestMethod.GET)
    public String detailsuite(Model model, HttpSession session) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();

        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
            session.setAttribute("username", username);

        }
        String email = (String) session.getAttribute("username");
        AccountEntity account = accountService.findByEmail(email);
        Long accountId = account.getId();
        List<BookingEntity> bookingList = bookingService.getBookingHistoryByAccountId(accountId);
        for (BookingEntity booking : bookingList) {
            booking.getBookingDetailsEntityList().size(); // Nạp bookingDetailsEntityList
        }

        // Đưa danh sách vào model để sử dụng trong JSP
        model.addAttribute("bookingList", bookingList);

        return "historybooking";
    }
}
