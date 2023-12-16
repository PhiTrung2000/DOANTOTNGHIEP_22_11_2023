//package com.mycompany.spring_mvc_project_final.controller;
//
//import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
//import com.mycompany.spring_mvc_project_final.repository.PaymentRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.format.annotation.DateTimeFormat;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import java.util.Date;
//import java.util.List;
//
//@Controller
//public class TotalPayment {
//    @Autowired
//    private PaymentRepository paymentRepository;
//
//    @RequestMapping(value = {"/admin/totalpayment"}, method = RequestMethod.GET)
//    public String getAllPayments(Model model) {
////        List<PaymentEntity> payments = paymentRepository.findAll();
////        double totalRevenue = calculateTotalRevenue(payments);
////
////        model.addAttribute("payments", payments);
////        model.addAttribute("totalRevenue", totalRevenue);
//        return "totalpayment";
//    }
//
//    @RequestMapping(value = {"/admin/totalpaymentfilters"}, method = RequestMethod.POST)
//    public String filterPayments(Model model,
//                                 @RequestParam(name = "startDate", required = false)
//                                 @DateTimeFormat(pattern = "dd-MM-yyyy") Date startDate,
//                                 @RequestParam(name = "endDate", required = false)
//                                 @DateTimeFormat(pattern = "dd-MM-yyyy") Date endDate,
//                                 RedirectAttributes redirectAttributes) {
//
//        List<PaymentEntity> filteredPayments;
//
//        if (startDate != null && endDate != null) {
//            filteredPayments = paymentRepository.findByDateBetween(startDate, endDate);
//        } else {
//            filteredPayments = paymentRepository.findAll();
//        }
//
//        double totalRevenue = calculateTotalRevenue(filteredPayments);
//
//        redirectAttributes.addFlashAttribute("filteredPayments", filteredPayments);
//        redirectAttributes.addFlashAttribute("totalRevenue", totalRevenue);
//
//        return "redirect:/admin/totalpayment";
//    }
//
//    private double calculateTotalRevenue(List<PaymentEntity> payments) {
//        return payments.stream().mapToDouble(PaymentEntity::getPaymentAmount).sum();
//    }
//}
