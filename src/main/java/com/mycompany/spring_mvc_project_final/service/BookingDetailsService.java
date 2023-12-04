package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.repository.BookingDetailsRepository;
import com.mycompany.spring_mvc_project_final.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class BookingDetailsService {
    @Autowired
    private BookingDetailsRepository bookingDetailsRepository;

}
