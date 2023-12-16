package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.AccountEntity;
import com.mycompany.spring_mvc_project_final.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.security.SecureRandom;

@Controller
public class UserController {
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @RequestMapping(value = {"/forgotPassword"}, method = RequestMethod.GET)
    public String forgot(Model model, HttpSession session) {

        return "user/forgotpassword";
    }

    @RequestMapping(value = {"/forgotPassword"}, method = RequestMethod.POST)
    public String forgotcheck(@RequestParam(name = "username") String email
            ,Model model, HttpSession session) {
        AccountEntity accountEntity = accountRepository.findByEmail(email);
        if (accountEntity != null) {
            session.setAttribute("email", email);
            return "redirect:/confirmEmail";
        }
        else {
            String fail = "Email không chính xác hoặc chưa đăng ký";
            model.addAttribute("fail",fail);
        }
        return "user/forgotpassword";
    }

    @RequestMapping(value = {"/confirmEmail"}, method = RequestMethod.GET)
    public String confirmmail(Model model, HttpSession session) {
        String username = (String) session.getAttribute("email");
        // Độ dài của mã số
        int length = 5;

        // Tạo secureRandom
        SecureRandom secureRandom = new SecureRandom();

        // RamDom number
        StringBuilder randomNumber = new StringBuilder();
        for (int i = 0; i < length; i++) {
            int randomDigit = secureRandom.nextInt(10);
            randomNumber.append(randomDigit);
        }

        // Lưu mã
        String emailCode = randomNumber.toString();
        session.setAttribute("emailCode",emailCode);

        //Gửi mail đi
        AccountEntity accountEntity = accountRepository.findByEmail(username);
        String email = accountEntity.getEmail();
        String emailContent = "<p>Chào <strong>[NameKH]</strong>,</p>" +
                "<p>Dưới đây là mã xác thực của bạn:</p>" +
                "<p>MÃ XÁC THỰC: <strong>[emailCode]</strong></p>" +
                "<p>Vui lòng nhập mã xác thực trên theo yêu cầu để đặt lại mật khẩu của bạn</p>" +
                "<p>Lưu ý: Quý khách không chia sẻ mã xác thực trên cho bất kỳ ai. Xin cảm ơn</p>" +
                "<p>Trân trọng,<br>Sogo Hotel</p>";

        // Thực hiện thay thế
        emailContent = emailContent.replace("[NameKH]", accountEntity.getName());
        emailContent = emailContent.replace("[emailCode]", emailCode);
        sendEmail(email, "Yêu cầu đặt lại mật khẩu tại Sogo Hotel", emailContent);

        return "user/confirmEmail";
    }

    @RequestMapping(value = {"/confirmEmail"}, method = RequestMethod.POST)
    public String checkCode(@RequestParam(name = "code") String code,
                            Model model, HttpSession session) {
        String emailCode = (String) session.getAttribute("emailCode");

        if (code.equals(emailCode)) {
            return "redirect:/resetPassword";
        }
        else {
            String errorCode = "Mã xác thực không chính xác";
            model.addAttribute("errorCode", errorCode);
        }
        return "user/confirmEmail";
    }

    @RequestMapping(value = {"/resetPassword"}, method = RequestMethod.GET)
    public String resetpass(Model model, HttpSession session) {

        return "user/resetPassword";
    }

    @RequestMapping(value = {"/resetPassword"}, method = RequestMethod.POST)
    public String processpass(@RequestParam(name = "passwordOne") String passwordOne,
                              @RequestParam(name = "passwordTwo") String passwordTwo,
                              Model model, HttpSession session) {
        String username = (String) session.getAttribute("email");
        if (passwordOne.equals(passwordTwo)) {
            AccountEntity accountEntity = accountRepository.findByEmail(username);
            //Mã hóa mật khẩu
            String encryptedPassword = bCryptPasswordEncoder.encode(passwordOne);
            accountEntity.setPassword(encryptedPassword);
            accountRepository.save(accountEntity);
            return "user/successpassword";
        }
        else {
            String errorPassword = "Mật khẩu không khớp. Vui lòng nhập lại";
            model.addAttribute("errorPassword",errorPassword);
        }
        return "user/resetPassword";
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
