package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailsEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import com.mycompany.spring_mvc_project_final.repository.BookingDetailsRepository;
import com.mycompany.spring_mvc_project_final.repository.CategoryRepository;
import com.mycompany.spring_mvc_project_final.repository.RoomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class RoomService {

    @Autowired
    private RoomRepository roomRepository; // Giả sử bạn có một repository cho RoomEntity
    @Autowired
    private BookingDetailsRepository bookingDetailsRepository;
    @Autowired
    private CategoryRepository categoryRepository;

    public List<RoomEntity> getAllRooms() {
        return roomRepository.findAll();
    }

    public RoomEntity getRoomById(int roomId) {
        return roomRepository.findById(roomId).orElse(null);
    }

    public List<RoomEntity> findAvailableRoomsByCategory(String categoryName) {
        return roomRepository.findAvailableRoomsByCategory(categoryName);
    }

    // Các phương thức khác cần thiết cho việc kiểm tra phòng trống, đặt phòng, v.v.
//    public List<RoomEntity> findAvailableRooms(Date checkinDate, Date checkoutDate, String categoryName) {
//        return roomRepository.findAvailableRoomsForCategory(checkinDate, checkoutDate, categoryName);
//    }
    public List<RoomEntity> findAvailableRooms(String categoryName, Date checkinDate, Date checkoutDate) {
        // Lấy categoryId từ categoryName
        Integer categoryId = Math.toIntExact(categoryRepository.findCategoryIdByName(categoryName));
        System.out.println("Category ID: " + categoryId);
        // Lọc danh sách booking details không trống cho một category và khoảng thời gian cụ thể
        List<BookingDetailsEntity> occupiedBookingDetails = bookingDetailsRepository.findOccupiedBookingDetails(
                categoryId, checkinDate, checkoutDate);

        // Đếm số lượng phòng trống
        int availableRoomCount = bookingDetailsRepository.countAvailableRooms(categoryId, checkinDate,checkoutDate);
        System.out.println("Available Room Count: " + availableRoomCount);
        System.out.println("Checkin Date: " + checkinDate);
        System.out.println("Checkin Out: " + checkoutDate);


        // Lấy danh sách tất cả các phòng có sẵn
        List<RoomEntity> allAvailableRooms = roomRepository.findAvailableRoomsForCategory(
                checkinDate, checkoutDate, categoryName);

        // Ngẫu nhiên chọn số lượng phòng trống từ danh sách có sẵn
        List<RoomEntity> selectedAvailableRooms = allAvailableRooms.stream()
                .limit(availableRoomCount)
                .collect(Collectors.toList());

        return selectedAvailableRooms;
    }
}

