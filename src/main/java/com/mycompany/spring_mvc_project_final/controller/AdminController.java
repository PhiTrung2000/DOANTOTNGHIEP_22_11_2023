package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.*;
import com.mycompany.spring_mvc_project_final.repository.*;
import com.mycompany.spring_mvc_project_final.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class AdminController {

    @Autowired
    private CategoryRepository categoryRepository;
    @Autowired
    private RoomRepository roomRepository;
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private DiscountRepository discountRepository;
    @Autowired
    private BookingDetailsRepository bookingDetailsRepository;
    @Autowired
    private BookingRepository bookingRepository;
    @Autowired
    private PaymentRepository paymentRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private RoleRepository roleRepository;
    // Loại phòng
    @RequestMapping(value = "/admin/searchCate", method = POST)
    public String searchCate (@RequestParam("searchCate") String searchCate, Model model){
        List<CategoryEntity> resultCate;
        if (searchCate.isEmpty()){
            resultCate = (List<CategoryEntity>) categoryRepository.findAll();
        }else {
            resultCate = categoryRepository.findByNameContaining(searchCate);
        }
        model.addAttribute("listRoom", resultCate);
        return "admin/pages/room-manage/inforRoom";
    }
    @RequestMapping(value = {"/admin/addCateRoom"}, method = GET)
    public String cateRoom(Model model) {
//        List<CategoryEntity> listCate  = (List<CategoryEntity>)categoryRepository.findAll();
//        model.addAttribute("listCateRoom", listCate);
        return "admin/pages/room-manage/addCateRoom";
    }
    @RequestMapping(value = {"/admin/inforRoom"}, method = GET)
    public String inforRoom(Model model) {
        List<CategoryEntity> allRooms = (List<CategoryEntity>) categoryRepository.findAll();
        model.addAttribute("listRoom", allRooms);
        return "admin/pages/room-manage/inforRoom";
    }
    @RequestMapping(value = {"admin/addCateRoom"}, method = RequestMethod.POST)
    public String addCateRoom(Model model, CategoryEntity categoryEntity) {
        categoryRepository.save(categoryEntity);
        model.addAttribute("addCateRoom", true);
        return "admin/pages/room-manage/addCateRoom";
    }
    @RequestMapping(value = "/admin/update/{id}", method = GET)
    public String updateCate(Model model,CategoryEntity categoryEntity, @PathVariable("id") int id) {
        CategoryEntity category = categoryRepository.findById(id).get();
        categoryEntity.setId(id);
        model.addAttribute("category", category);
        model.addAttribute("id", id);
        model.addAttribute("action","/admin/update");
        return "admin/pages/room-manage/updateCateRoom";
    }
    @RequestMapping(value = "/admin/update", method = RequestMethod.POST)
    public String updateCategory(@ModelAttribute CategoryEntity categoryEntity) {
        categoryRepository.save(categoryEntity);
        return "redirect:/admin/inforRoom";
    }
    @RequestMapping(value = "admin/delete/{id}", method = GET)
    public String deleteCate(@PathVariable int id) {
        categoryRepository.deleteById(id);
        return "redirect:/admin/inforRoom";
    }
    // Phòng
    @RequestMapping(value = "/admin/searchRoom", method = POST)
    public String searchRoom (@RequestParam("searchRoom") String searchRoom, Model model){
        List<RoomEntity> roomEntityList;
        if (searchRoom.isEmpty()){
            roomEntityList = (List<RoomEntity>)roomRepository.findAll();
        }else {
            roomEntityList = roomRepository.findByNameContaining(searchRoom);
        }
        model.addAttribute("list", roomEntityList);
        return "admin/pages/room-manage/roomMain";
    }
    @RequestMapping(value = {"/admin/roomMain"}, method = GET)
    public String pageRoom(Model model) {
        List<RoomEntity> list  = (List<RoomEntity>)roomRepository.findAll();
        model.addAttribute("list", list);
        return "admin/pages/room-manage/roomMain";
    }
    @RequestMapping(value = {"/admin/addRoom"}, method = GET)
    public String addRoom(Model model) {
        List<CategoryEntity> listCate  = (List<CategoryEntity>)categoryRepository.findAll();
        model.addAttribute("listRoom", listCate);
        return "admin/pages/room-manage/addRoom";
    }
    @RequestMapping(value = {"/admin/addRoom"}, method = RequestMethod.POST)
    public String saveRoom(Model model, RoomEntity roomEntity,@RequestParam("categoryId") Integer categoryId) {
        CategoryEntity category = (CategoryEntity)categoryRepository.findById(categoryId).get();
        roomEntity.setCategory(category);
        roomRepository.save(roomEntity);
        model.addAttribute("listRoom",category);

        List<CategoryEntity> listCate  = (List<CategoryEntity>)categoryRepository.findAll();
        model.addAttribute("listRoom", listCate);
        return "admin/pages/room-manage/addRoom";
    }
    @RequestMapping(value = "/admin/updateRoom/{id}", method = GET)
    public String updateRoom(Model model,RoomEntity roomEntity, @PathVariable("id") int id) {
        RoomEntity room = roomRepository.findById(id).get();
        roomEntity.setId(id);
        model.addAttribute("id", id);
        model.addAttribute("room",room);
        model.addAttribute("action","/admin/updateRoom");
        return "admin/pages/room-manage/updateRoom";
    }
    @RequestMapping(value = "/admin/updateRoom", method = RequestMethod.POST)
    public String updateRoom(@ModelAttribute RoomEntity room) {
        roomRepository.save(room);
        return "redirect:/admin/roomMain";
    }
    @RequestMapping(value = "admin/deleteRoom/{id}", method = GET)
    public String deleteRoom(@PathVariable int id) {
        roomRepository.deleteById(id);
        return "redirect:/admin/roomMain";
    }

    // User
    @RequestMapping(value = "/admin/searchUser", method = POST)
    public String searchUser (@RequestParam("searchUser") String searchUser, Model model){
        List<AccountEntity> accountEntities;
        if (searchUser.isEmpty()){
            accountEntities = (List<AccountEntity>) accountRepository.findAll();
        }else {
            accountEntities = accountRepository.findByEmailContaining(searchUser);
        }
        model.addAttribute("listUser", accountEntities);
        return "admin/pages/user-manage/inforUser";
    }
    @RequestMapping(value = {"/admin/addUser"}, method = GET)
    public String addUser(Model model) {
        List<AccountEntity> account  = (List<AccountEntity>)accountRepository.findAll();
        model.addAttribute("listUser", account);
        return "admin/pages/user-manage/addUser";
    }
    @RequestMapping(value = {"admin/addUser"}, method = POST)
    public String addUser (Model model, AccountEntity accountEntity) {
        accountRepository.save(accountEntity);
        return "admin/pages/user-manage/addUser";
    }
    @RequestMapping(value = {"/admin/inforUser"}, method = GET)
    public String pageUser (Model model) {
        List<AccountEntity> account  = (List<AccountEntity>)accountRepository.findAll();
        model.addAttribute("listUser", account);
        return "admin/pages/user-manage/inforUser";
    }
    @RequestMapping(value = "/admin/updateUser/{id}", method = GET)
    public String updateUser(Model model,AccountEntity accountEntity, @PathVariable("id") long id) {
        AccountEntity account = accountRepository.findById(id).get();
        accountEntity.setId(id);
        model.addAttribute("id", id);
        model.addAttribute("action","/admin/updateUser");
        model.addAttribute("account",account);
        return "admin/pages/user-manage/updateUser";
    }
    @RequestMapping(value = "/admin/updateUser", method = RequestMethod.POST)
    public String updateDC(@RequestParam(name = "password") String password,
            @ModelAttribute AccountEntity accountEntity) {
        //Mã hóa mật khẩu
        String encryptedPassword = bCryptPasswordEncoder.encode(password);
        accountEntity.setPassword(encryptedPassword);
        if (accountEntity.getUserRoles() == null) {
            accountEntity.setUserRoles(new HashSet<>());
        }

        Optional<RoleEntity> roleOptional = roleRepository.findById(Long.valueOf(2));
        if (roleOptional.isPresent()) {
            accountEntity.getUserRoles().add(roleOptional.get());
            accountRepository.save(accountEntity);
        } else {
            // Xử lý
        }
//        accountRepository.save(accountEntity);
        return "redirect:/admin/inforUser";
    }
    @RequestMapping(value = "admin/deleteUser/{id}", method = GET)
    public String deleteUser(@PathVariable long id) {
        accountRepository.deleteById(id);
        return "redirect:/admin/inforUser";
    }

    //Discount
    @RequestMapping(value = "/admin/searchDC", method = POST)
    public String searchDC (@RequestParam("searchDC") String searchDC, Model model){
        List<DiscountEntity> discountEntities;
        if (searchDC.isEmpty()){
            discountEntities = (List<DiscountEntity>)discountRepository.findAll();
        }else {
            discountEntities = discountRepository.findByNameContaining(searchDC);
        }
        model.addAttribute("listDiscount", discountEntities);
        return "admin/pages/discount-manage/inforDiscount";
    }
    @RequestMapping(value = {"/admin/addDiscount"}, method = GET)
    public String pageDiscount(Model model) {
        model.addAttribute("pageDiscount",discountRepository.findAll());
        return "admin/pages/discount-manage/addDiscount";
    }
    @RequestMapping(value = {"/admin/addDiscount"}, method = POST)
    public String pageDiscount (Model model, DiscountEntity discountEntity) {
        discountRepository.save(discountEntity);
        model.addAttribute("addDiscount",true);
        return "admin/pages/discount-manage/addDiscount";
    }
    @RequestMapping(value = {"/admin/inforDiscount"}, method = GET)
    public String showDiscount (Model model) {
        List<DiscountEntity> discount  = (List<DiscountEntity>)discountRepository.findAll();
        model.addAttribute("listDiscount", discount);
        return "admin/pages/discount-manage/inforDiscount";
    }
    @RequestMapping(value = "/admin/updateDC/{id}", method = GET)
    public String updateDC(Model model,DiscountEntity discountEntity, @PathVariable("id") int id) {
        DiscountEntity discount = discountRepository.findById(id).get();
        discountEntity.setId(id);
        model.addAttribute("id", id);
        model.addAttribute("discountinfo",discount);
        model.addAttribute("action","/admin/updateDC");
        return "admin/pages/discount-manage/updateDC";
    }
    @RequestMapping(value = "/admin/updateDC", method = RequestMethod.POST)
    public String updateDC(@ModelAttribute DiscountEntity discountEntity) {
        discountRepository.save(discountEntity);
        return "redirect:/admin/inforDiscount";
    }
    @RequestMapping(value = "admin/delDS/{id}", method = GET)
    public String deleteDiscount(@PathVariable int id) {
        discountRepository.deleteById(id);
        return "redirect:/admin/inforDiscount";
    }
    // Đặt phòng
    @RequestMapping(value = "/admin/searchBookingDT", method = POST)
    public String searchBookingDT (@RequestParam("checkinDate")@DateTimeFormat(pattern = "dd-MM-yyyy") Date checkinDate,
                                   @RequestParam("checkoutDate")@DateTimeFormat(pattern = "dd-MM-yyyy") Date checkoutDate,
                                   Model model){
        if(checkinDate == null || checkoutDate == null) {
            List<BookingDetailsEntity> bookingDetailsEntities = (List<BookingDetailsEntity>)bookingDetailsRepository.findAll();
            model.addAttribute("listBookingDT", bookingDetailsEntities);
            return "admin/pages/booking-manage/inforBookingDT";
        }
        List<BookingDetailsEntity> bookingDetailsEntities = (List<BookingDetailsEntity>)bookingDetailsRepository.findByCheckinDateBetween(checkinDate,checkoutDate);
        model.addAttribute("listBookingDT", bookingDetailsEntities);
        return "admin/pages/booking-manage/inforBookingDT";
    }
    @RequestMapping(value = {"/admin/addBookingDT"}, method = GET)
    public String addBookingDT(Model model) {
        model.addAttribute("bookingDT",bookingDetailsRepository.findAll());
        return "admin/pages/booking-manage/addBookingDT";
    }
    @RequestMapping(value = {"/admin/addBookingDT"}, method = RequestMethod.POST)
    public String saveBookingDT(Model model, BookingDetailsEntity bookingDetailsEntity,
                                @RequestParam("categoryId") Integer categoryId,
                                @RequestParam("bookingId") Integer bookingId) {
        CategoryEntity categoryEntity = categoryRepository.findById(categoryId).get();
        bookingDetailsEntity.setCategory(categoryEntity);
        bookingDetailsRepository.save(bookingDetailsEntity);

        List<CategoryEntity> listCateRoom  = (List<CategoryEntity>)categoryRepository.findAll();
        model.addAttribute("listDTRoom", listCateRoom);
        model.addAttribute("addDTRoom",true);

        BookingEntity bookingEntity = bookingRepository.findById(bookingId).get();
        bookingDetailsEntity.setBooking(bookingEntity);
        bookingDetailsRepository.save(bookingDetailsEntity);

        List<BookingEntity> listBooking  = (List<BookingEntity>)bookingRepository.findAll();
        model.addAttribute("listBooking", listBooking);
        model.addAttribute("addBooking",true);
        return "admin/pages/booking-manage/addBookingDT";
    }
    @RequestMapping(value = "/admin/updateBookingDT/{id}", method = GET)
    public String updateBookingDT(HttpSession session, Model model,
                                  BookingDetailsEntity bookingDetails,
                                  @PathVariable("id") int id) {
        BookingDetailsEntity bookingDetailsEntity = bookingDetailsRepository.findById(id);
        bookingDetails.setId(id);
        CategoryEntity categoryEntity = bookingDetailsEntity.getCategory();
        BookingEntity bookingEntity = bookingDetailsEntity.getBooking();
        model.addAttribute("id", id);
        model.addAttribute("bookingdt",bookingDetailsEntity);
        model.addAttribute("category",categoryEntity);
        model.addAttribute("booking",bookingEntity);
        model.addAttribute("action","/admin/updateBookingDT");
        session.setAttribute("id",id);
        return "admin/pages/booking-manage/updateBookingDT";
    }
    @RequestMapping(value = "/admin/updateBookingDT", method = RequestMethod.POST)
    public String updateBookingDT(@RequestParam(name = "categoryId") int categoryId,
                                  @RequestParam(name = "bookingId") int bookingId,
                                  @ModelAttribute BookingDetailsEntity bookingDetailsEntity, HttpSession session,
                                  @ModelAttribute CategoryEntity categoryEntity,
                                  @ModelAttribute BookingEntity bookingEntity) {
        CategoryEntity category = (CategoryEntity)categoryRepository.findById(categoryId).get();
        BookingEntity booking = (BookingEntity)bookingRepository.findById(bookingId);
        if(category != null && booking != null){
            bookingDetailsEntity.setCategory(category);
            bookingDetailsEntity.setBooking(booking);
            bookingDetailsRepository.save(bookingDetailsEntity);
        }
        return "redirect:/admin/inforBookingDT";
    }
    @RequestMapping(value = {"/admin/inforBookingDT"}, method = GET)
    public String showBookingDT (Model model) {
        List<BookingDetailsEntity> bookingDT  = (List<BookingDetailsEntity>)bookingDetailsRepository.findAll();
        model.addAttribute("listBookingDT", bookingDT);
        return "admin/pages/booking-manage/inforBookingDT";
    }
    @RequestMapping(value = "admin/deleteBooking/{id}", method = GET)
    @Transactional
    public String deleteBooing(@PathVariable int id) {
        bookingDetailsRepository.deleteById(id);
        return "redirect:/admin/inforBookingDT";
    }
    // Báo cáo doanh thu
    @RequestMapping(value = {"/admin/totalpayment"}, method = RequestMethod.GET)
    public String getAllPayments(Model model) {
//        List<PaymentEntity> payments = paymentRepository.findAll();
//        double totalRevenue = calculateTotalRevenue(payments);
//
//        model.addAttribute("payments", payments);
//        model.addAttribute("totalRevenue", totalRevenue);
        return "admin/pages/totalpayment";
    }

    @RequestMapping(value = {"/admin/totalpaymentfilters"}, method = RequestMethod.POST)
    public String filterPayments(Model model,
                                 @RequestParam(name = "startDate", required = false)
                                 @DateTimeFormat(pattern = "dd-MM-yyyy") Date startDate,
                                 @RequestParam(name = "endDate", required = false)
                                 @DateTimeFormat(pattern = "dd-MM-yyyy") Date endDate,
                                 RedirectAttributes redirectAttributes) {

        List<PaymentEntity> filteredPayments;

        if (startDate != null && endDate != null) {
            filteredPayments = paymentRepository.findByDateBetween(startDate, endDate);
        } else {
            filteredPayments = paymentRepository.findAll();
        }

        double totalRevenue = calculateTotalRevenue(filteredPayments);

        redirectAttributes.addFlashAttribute("filteredPayments", filteredPayments);
        redirectAttributes.addFlashAttribute("totalRevenue", totalRevenue);

        return "redirect:/admin/totalpayment";
    }

    private double calculateTotalRevenue(List<PaymentEntity> payments) {
        return payments.stream().mapToDouble(PaymentEntity::getPaymentAmount).sum();
    }
}