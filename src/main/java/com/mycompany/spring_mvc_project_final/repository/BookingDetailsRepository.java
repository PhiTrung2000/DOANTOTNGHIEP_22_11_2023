package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

public interface BookingDetailsRepository extends JpaRepository<BookingDetailsEntity, Long> {
    List<BookingDetailsEntity> findByBooking_Id(int bookingId);

    @Query("SELECT bd FROM BookingDetailsEntity bd " +
            "WHERE bd.category.id = :categoryId " +
            "AND NOT EXISTS (" +
            "    SELECT 1 FROM RoomEntity r " +
            "    WHERE r.category.id = bd.category.id " +
            "    AND :checkoutDate >= bd.checkinDate AND :checkinDate <= bd.checkoutDate)")
    List<BookingDetailsEntity> findOccupiedBookingDetails(
            @Param("categoryId") Integer categoryId,
            @Param("checkinDate") Date checkinDate,
            @Param("checkoutDate") Date checkoutDate);

    @Query("SELECT COUNT(*) " +
            "FROM BookingDetailsEntity bd " +
            "WHERE bd.category.id = :categoryId " +
            "AND NOT EXISTS (" +
            "    SELECT 1 FROM RoomEntity r " +
            "    WHERE r.category.id = bd.category.id " +
            "    AND :checkoutDate >= bd.checkinDate AND :checkinDate <= bd.checkoutDate)")
    int countAvailableRooms(
            @Param("categoryId") Integer categoryId,
            @Param("checkinDate") Date checkinDate,
            @Param("checkoutDate") Date checkoutDate);
}

