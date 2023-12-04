package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.*;
import com.mycompany.spring_mvc_project_final.repository.AccountBankingRepository;
import com.mycompany.spring_mvc_project_final.repository.BookingDetailsRepository;
import com.mycompany.spring_mvc_project_final.repository.BookingRepository;
import com.mycompany.spring_mvc_project_final.repository.PaymentRepository;
import com.mycompany.spring_mvc_project_final.service.AccountService;
import com.mycompany.spring_mvc_project_final.service.BookingDetailsService;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HistoryBookingController {
    @Autowired
    private BookingService bookingService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private BookingDetailsService bookingDetailsService;
    @Autowired
    private BookingDetailsRepository bookingDetailsRepository;
    @Autowired
    private BookingRepository bookingRepository;
    @Autowired
    private PaymentRepository paymentRepository;
    @Autowired
    private AccountBankingRepository accountBankingRepository;

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

    @RequestMapping(value = {"/user/cancel/{bookingId}"}, method = RequestMethod.POST)
    public String cancelroom(@PathVariable int bookingId, Model model, HttpSession session) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();

        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
            session.setAttribute("username", username);

        }
        String email = (String) session.getAttribute("username");
        // Hủy phòng
        BookingEntity bookingEntity = bookingRepository.findById(bookingId);
        bookingEntity.setStatus("Cancel");
        bookingRepository.save(bookingEntity);
        // Tính hoàn tiền 80% cho khách
        PaymentEntity paymentEntity = paymentRepository.findByBookingId(bookingId);
        double refundAmount = (80.0 / 100.0) * paymentEntity.getPaymentAmount();
        // Hoàn tiền vào tài khoản khách
        AccountBankingEntity accountBanking = accountBankingRepository.findByAccountId(bookingEntity.getAccount().getId());
        accountBanking.setBalance(accountBanking.getBalance() + refundAmount);
        accountBankingRepository.save(accountBanking);
        // Hoàn tiền 20% khách sạn
        paymentEntity.setPaymentAmount(paymentEntity.getPaymentAmount() - refundAmount);
        paymentRepository.save(paymentEntity);
        return "redirect:/user/history";
    }

}
