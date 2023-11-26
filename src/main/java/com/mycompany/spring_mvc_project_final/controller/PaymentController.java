package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.AccountBankingEntity;
import com.mycompany.spring_mvc_project_final.entities.CategoryEntity;
import com.mycompany.spring_mvc_project_final.entities.DiscountEntity;
import com.mycompany.spring_mvc_project_final.service.AccountBankingService;
import com.mycompany.spring_mvc_project_final.service.CategoryService;
import com.mycompany.spring_mvc_project_final.service.DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
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

@Controller
public class PaymentController {

    @Autowired
    private AccountBankingService accountBankingService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private DiscountService discountService;

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

        // Retrieve accountBanking information by accountId
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
}

