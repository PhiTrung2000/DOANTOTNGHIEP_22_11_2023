package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.SendMailEntity;
import com.mycompany.spring_mvc_project_final.repository.SendMailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

@Controller
public class ContactController {
    @Autowired
    SendMailRepository sendMailRepository;
    @Autowired
    JavaMailSender javaMailSender;
    @RequestMapping(value = {"/contact"}, method = RequestMethod.GET)
    public String contactHotel(Model model, HttpSession session) {
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            String username = principal.toString();

            if (principal instanceof UserDetails) {
                username = ((UserDetails) principal).getUsername();
                session.setAttribute("username", username);

            }
        return "contact";
    }
    @RequestMapping(value = {"/contact"}, method = RequestMethod.POST)
    public String sendMail(Model model,  SendMailEntity sendMailEntity ){
        sendMailRepository.save(sendMailEntity);
        model.addAttribute("mailSent", true);
        return "contact";
    }

}
