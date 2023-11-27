package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailsEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.repository.BookingDetailsRepository;
import com.mycompany.spring_mvc_project_final.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.List;
@Service
@Transactional
public class BookingService {
    @Autowired
    private BookingRepository bookingRepository;
    @Autowired
    private BookingDetailsRepository bookingDetailsRepository;
    private EntityManager entityManager;

    public List<BookingEntity> getBookingHistory() {
        return bookingRepository.findAll();
    }

    public List<BookingEntity> getBookingHistoryByAccountId(Long accountId) {
// Get list of BookingEntity by accountId
        List<BookingEntity> bookingList = bookingRepository.findByAccount_Id(accountId);

        // For each BookingEntity, fetch the related BookingDetailsEntity
        for (BookingEntity booking : bookingList) {
            List<BookingDetailsEntity> detailsList = bookingDetailsRepository.findByBooking_Id(booking.getId());
            booking.setBookingDetailsEntityList(detailsList);
        }

        return bookingList;
    }
}
