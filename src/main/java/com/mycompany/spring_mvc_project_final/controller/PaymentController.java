package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.*;
import com.mycompany.spring_mvc_project_final.repository.*;
import com.mycompany.spring_mvc_project_final.service.AccountBankingService;
import com.mycompany.spring_mvc_project_final.service.CategoryService;
import com.mycompany.spring_mvc_project_final.service.DiscountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.Principal;
import java.text.DecimalFormat;
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
    @Autowired
    private JavaMailSender javaMailSender;

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
            // Lưu session cần thiết
            session.setAttribute("accountEntity", accountEntity);
            session.setAttribute("bookingDetailsEntity", bookingDetailsEntity);
            session.setAttribute("categoryName", category);
            session.setAttribute("amountPayment", amountPayment);
            String success = "Thanh toán thành công";
            model.addAttribute("success",success);
            return "redirect:/user/mail";
        } else {
            String fail = "Thanh toán thất bại: Số dư không đủ";
            model.addAttribute("fail",fail);
        }
        return "payment";
    }

    @RequestMapping(value = {"/user/mail"}, method = RequestMethod.GET)
    public ModelAndView testSendMail(ModelAndView model, HttpSession session) throws IOException {
        // Send mail
        AccountEntity accountEntity = (AccountEntity) session.getAttribute("accountEntity");
        BookingDetailsEntity bookingDetailsEntity = (BookingDetailsEntity) session.getAttribute("bookingDetailsEntity");
        CategoryEntity categoryEntity = (CategoryEntity) session.getAttribute("categoryName");
        double amountPayment = (double) session.getAttribute("amountPayment");
        String NameKH = accountEntity.getName();
        String EmailKH = accountEntity.getEmail();
        int SDTKH = accountEntity.getPhone();
        Date Checkin = bookingDetailsEntity.getCheckinDate();
        Date Checkout = bookingDetailsEntity.getCheckoutDate();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        String DateCheckIn = dateFormat.format(Checkin);
        String DateCheckOut = dateFormat.format(Checkout);
        int numberAdult =(int) bookingDetailsEntity.getNumOfAdult();
        int numberChildren = (int) bookingDetailsEntity.getNumOfChild();
        String categoryName = categoryEntity.getName();
        double price = categoryEntity.getPrice() * 23000;
        double priceAmount = price - amountPayment;
        double priceAmountPay = amountPayment;
        DecimalFormat decimalFormat = new DecimalFormat("###,###,### VNĐ");
        String formattedPrice = decimalFormat.format(price);
        String formattedPriceAmount = decimalFormat.format(priceAmount);
        String formattedPriceAmountPay = decimalFormat.format(priceAmountPay);

        String email = "hungnguyen987x@gmail.com";
        String emailContent = "<p>Chào <strong>[NameKH]</strong>,</p>" +
                "<p>Chúc mừng! Đặt phòng của bạn tại Sogo Hotel đã được xác nhận thành công.</p>" +
                "<p>Dưới đây là chi tiết đặt phòng của bạn:</p>" +
                "<ul>" +
                "   <li>Email: <strong>[Email]</strong></li>" +
                "   <li>Số điện thoại: <strong>[Phone]</strong></li>" +
                "   <li>Ngày nhận phòng: <strong>[Checkin]</strong></li>" +
                "   <li>Ngày trả phòng: <strong>[Checkout]</strong></li>" +
                "   <li>Số người lớn: <strong>[adult]</strong></li>" +
                "   <li>Số trẻ em: <strong>[children]</strong></li>" +
                "   <li>Loại phòng: <strong>[categoryName]</strong></li>" +
                "   <li>Giá: <strong>[priceRoom]</strong></li>" +
                "   <li>Khuyến mãi: <strong>[promo]</strong></li>" +
                "   <li>Số tiền đã thanh toán: <strong>[priceKH]</strong></li>" +
                "</ul>" +
                "<p>Vui lòng kiểm tra lại các thông tin trên. Nếu có bất kỳ sai sót hoặc thắc mắc, hãy liên hệ với chúng tôi ngay lập tức.</p>" +
                "<p>Chúng tôi mong đợi sự chờ đón bạn tại Sogo Hotel. Nếu bạn có bất kỳ yêu cầu đặc biệt nào khác, hãy thông báo trước để chúng tôi có thể phục vụ bạn tốt nhất.</p>" +
                "<p>Cảm ơn bạn đã chọn Sogo Hotel. Chúng tôi rất mong đợi chờ đón bạn và hy vọng bạn có một kỳ nghỉ tuyệt vời!</p>" +
                "<p>Trân trọng,<br>Sogo Hotel</p>";

// Thực hiện thay thế
        emailContent = emailContent.replace("[NameKH]", NameKH);
        emailContent = emailContent.replace("[Email]", EmailKH);
        emailContent = emailContent.replace("[Phone]", String.valueOf(SDTKH));
        emailContent = emailContent.replace("[Checkin]", DateCheckIn);
        emailContent = emailContent.replace("[Checkout]", DateCheckOut);
        emailContent = emailContent.replace("[adult]", String.valueOf(numberAdult));
        emailContent = emailContent.replace("[children]", String.valueOf(numberChildren));
        emailContent = emailContent.replace("[categoryName]", categoryName);
        emailContent = emailContent.replace("[priceRoom]", formattedPrice);
        emailContent = emailContent.replace("[promo]", formattedPriceAmount);
        emailContent = emailContent.replace("[priceKH]", formattedPriceAmountPay);

        sendEmail(email, "Xác nhận Đặt phòng thành công tại Sogo Hotel", emailContent);

        model.addObject("msg", email);
        return new ModelAndView("success");
    }
    public void sendEmail(String recipient, String subject, String body) {
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setTo(recipient);
            helper.setSubject(subject);
            helper.setText(body, true);
            javaMailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}

