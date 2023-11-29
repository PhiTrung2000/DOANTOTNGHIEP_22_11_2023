package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.*;
import com.mycompany.spring_mvc_project_final.repository.*;
import com.mycompany.spring_mvc_project_final.service.AccountBankingService;
import com.mycompany.spring_mvc_project_final.service.CategoryService;
import com.mycompany.spring_mvc_project_final.service.DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class PaymentController {

    @Autowired
    private AccountBankingService accountBankingService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private DiscountService discountService;
    @Autowired
    private BookingRepository bookingRepository;
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private BookingDetailsRepository bookingDetailsRepository;
    @Autowired
    private PaymentRepository paymentRepository;

    @RequestMapping(value = {"/user/payment"}, method = RequestMethod.GET)
    public String showPaymentForm(Model model, HttpSession session) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();

        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
            session.setAttribute("username", username);

        }
        String categoryName = (String) session.getAttribute("categoryName");
        CategoryEntity category = categoryService.findByName(categoryName);
        model.addAttribute("price",category.getPrice()*23000);

        // Kiểm tra username login thuộc id nào
//        String email = (String) session.getAttribute("username");
//        Long accountId = accountBankingService.getAccountIdByUsername(email);

        // Kiểm tra thông tin thanh toán cho accountId
//        AccountBankingEntity accountBanking = accountBankingService.getAccountBankingByAccountId(accountId);
//        if (accountBanking != null) {
//            model.addAttribute("accountBanking", accountBanking);
//            model.addAttribute("paymentType", accountBanking.getPaymentType());
//            model.addAttribute("bank",accountBanking.getBank());
//            model.addAttribute("numberCard",accountBanking.getNumberCard());
//            model.addAttribute("name",accountBanking.getName());
//            return "payment";
//        } else {
//            // Trả về thông báo lỗi nếu không tìm thấy thông tin thanh toán
//            model.addAttribute("error", "Không tìm thấy thông tin thanh toán cho tài khoản này");
//            return "payment";
//        }
        return "payment";
    }

    @RequestMapping(value = {"/user/payment"}, method = RequestMethod.POST)
    public String processPayment(
            @RequestParam("paymentType") String paymentType,
            @RequestParam("bank") String bank,
            @RequestParam("numberCard") String numberCard,
            @RequestParam("code") String code,
            Model model, HttpSession session
    ) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();

        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
            session.setAttribute("username", username);

        }
        String email = (String) session.getAttribute("username");
        Long accountId = accountBankingService.getAccountIdByUsername(email);

        // Lấy thông tin bank theo accountId
        AccountBankingEntity accountBanking = accountBankingService.getAccountBankingByAccountId(accountId);
        //Lấy mã giảm giá
        DiscountEntity discountEntity = discountService.getDiscountByCode(code);

        try {
            int number = Integer.parseInt(numberCard);
            if (
                    paymentType.equals(accountBanking.getPaymentType()) &&
                    bank.equals(accountBanking.getBank()) &&
                    number == accountBanking.getNumberCard()) {

                // Xử lí nếu kiểm tra thông tin
                String categoryName = (String) session.getAttribute("categoryName");
                // Lấy giá phòng(áp dụng giảm giá nếu có)
                CategoryEntity category = categoryService.findByName(categoryName);
                double discountAmount = (discountEntity != null) ? discountEntity.getDiscountAmount() : 0;
                System.out.println("Giảm giá: " + discountAmount);
                model.addAttribute("price",(category.getPrice()*23000) * ((100 - discountAmount))/100);
                String name = accountBanking.getName();
                System.out.println("NameNganHang: " + name);
                model.addAttribute("name", name);
                model.addAttribute("paymentType", accountBanking.getPaymentType());
                model.addAttribute("bank", accountBanking.getBank());
                model.addAttribute("numberCard", accountBanking.getNumberCard());
                model.addAttribute("code", code);
            } else {
                String categoryName = (String) session.getAttribute("categoryName");
                CategoryEntity category = categoryService.findByName(categoryName);
                model.addAttribute("price",category.getPrice()*23000);
                String errorMessage = "Thông tin thanh toán không chính xác. Vui lòng kiểm tra lại!";
                model.addAttribute("errorMessage", errorMessage);
            }

        } catch (NumberFormatException e) {
            String categoryName = (String) session.getAttribute("categoryName");
            CategoryEntity category = categoryService.findByName(categoryName);
            model.addAttribute("price",category.getPrice()*23000);
            String errorMessage = "Thông tin thanh toán không chính xác. Vui lòng kiểm tra lại!";
            model.addAttribute("errorMessage", errorMessage);
        }
        return "payment";
    }

    @RequestMapping(value = {"/user/processPayment"}, method = RequestMethod.POST)
    public String paymentsuccess(@RequestParam("code") String code,
                                 @RequestParam(name = "checkinDate") @DateTimeFormat(pattern = "dd-MM-yyyy") Date checkinDate,
                                 @RequestParam(name = "checkoutDate") @DateTimeFormat(pattern = "dd-MM-yyyy") Date checkoutDate,
                                 @RequestParam("adults") double numOfAdults,
                                 @RequestParam("children") double numOfChildren,
                                 Model model, HttpSession session) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();

        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
            session.setAttribute("username", username);

        }
        String email = (String) session.getAttribute("username");
        Long accountId = accountBankingService.getAccountIdByUsername(email);
        // Lấy thông tin bank theo accountId
        AccountBankingEntity accountBanking = accountBankingService.getAccountBankingByAccountId(accountId);
        //Lấy mã giảm giá
        DiscountEntity discountEntity = discountService.getDiscountByCode(code);
        //Lấy category
        // Xử lí nếu kiểm tra thông tin
        String categoryName = (String) session.getAttribute("categoryName");
        CategoryEntity category = categoryService.findByName(categoryName);
        // Lấy giá cần thanh toán
        double discountAmount = (discountEntity != null) ? discountEntity.getDiscountAmount() : 0;
        double amountPayment = (category.getPrice()*23000) * ((100 - discountAmount))/100;
        double amount = accountBanking.getBalance();
        double amountFinish = amount - amountPayment;
        boolean paymentSuccess = accountBankingService.processPayment(accountBanking, amountPayment);
        if (paymentSuccess) {
            // Lưu booking
            BookingEntity bookingEntity = new BookingEntity();
            bookingEntity.setDescription("Booking " + categoryName);
            bookingEntity.setStatus("Booked");
            AccountEntity accountEntity = accountRepository.findByEmail(email);
            bookingEntity.setAccount(accountEntity);
            bookingEntity.setBookingdate(new Date());
            bookingRepository.save(bookingEntity);
            System.out.println("Giá trị ID vừa tạo là: " + bookingEntity.getId());
            // Lưu booking details
            BookingDetailsEntity bookingDetailsEntity = new BookingDetailsEntity();
            bookingDetailsEntity.setCheckinDate(checkinDate);
            bookingDetailsEntity.setCheckoutDate(checkoutDate);
            bookingDetailsEntity.setNumOfAdult(numOfAdults);
            bookingDetailsEntity.setNumOfChild(numOfChildren);
            bookingDetailsEntity.setNumOfPeople((int) (numOfAdults + numOfChildren));
            bookingDetailsEntity.setBooking(bookingEntity);
            CategoryEntity categoryEntity = categoryRepository.findByName(categoryName);
            bookingDetailsEntity.setCategory(categoryEntity);
            bookingDetailsRepository.save(bookingDetailsEntity);
            // Lưu payment
            PaymentEntity paymentEntity = new PaymentEntity();
            paymentEntity.setDate(new Date());
            paymentEntity.setName(accountBanking.getName());
            paymentEntity.setPaymentAmount(amountPayment);
            paymentEntity.setBooking(bookingEntity);
            paymentRepository.save(paymentEntity);

            String success = "Thanh toán thành công";
            model.addAttribute("success",success);
            return "success";
        } else {
            String fail = "Thanh toán thất bại: Số dư không đủ";
            model.addAttribute("fail",fail);
        }
        return "payment";
    }
}

