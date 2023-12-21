package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface RoomRepository extends JpaRepository<RoomEntity, Integer> {
    @Query("SELECT r FROM RoomEntity r WHERE r.category.name = :categoryName")
    List<RoomEntity> findAvailableRoomsByCategory(@Param("categoryName") String categoryName);

    @Query("SELECT r FROM RoomEntity r WHERE r.name = :roomName")
    RoomEntity findRoomByName(@Param("roomName") String roomName);
    // Bạn có thể thêm các phương thức truy vấn cụ thể tại đây nếu cần.

    @Query("SELECT r FROM RoomEntity r LEFT JOIN BookingDetailsEntity bd " +
            "ON r.id = bd.category.id " +
            "AND :checkinDate BETWEEN bd.checkinDate AND bd.checkoutDate " +
            "AND :checkoutDate BETWEEN bd.checkinDate AND bd.checkoutDate " +
            "WHERE (bd.id IS NULL OR r.status = 'Available') AND r.category.name = :categoryName " +
            "ORDER BY RAND()")
    List<RoomEntity> findAvailableRoomsForCategory(
            @Param("checkinDate") Date checkinDate,
            @Param("checkoutDate") Date checkoutDate,
            @Param("categoryName") String categoryName);
    long count();
    List<RoomEntity> findByNameContaining(String searchRoom);
}


