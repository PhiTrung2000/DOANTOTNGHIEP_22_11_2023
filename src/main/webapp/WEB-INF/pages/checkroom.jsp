<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sogo Hotel</title>
    <link rel="icon" type="image/png" href="/resources/images/icon_logo.png">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=|Roboto+Sans:400,700|Playfair+Display:400,700">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/aos.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/css/jquery.timepicker.css">
    <link rel="stylesheet" href="/resources/css/fancybox.min.css">
    
    <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="/resources/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Lấy giá trị từ sessionStorage
            var storedQuantity = sessionStorage.getItem('customQuantity');

            // Kiểm tra nếu có giá trị, cập nhật option trong dropdown menu
            if (storedQuantity) {
                // Lấy danh sách các option trong dropdown menu
                var options = document.getElementById('adults').options;

                // Kiểm tra xem giá trị có nằm trong danh sách mặc định hay không
                var isDefaultValue = Array.from(options).some(function (option) {
                    return option.value === storedQuantity;
                });

                // Nếu giá trị không nằm trong danh sách mặc định, thêm nó vào
                if (!isDefaultValue) {
                    var newOption = document.createElement('option');
                    newOption.value = storedQuantity;
                    newOption.text = storedQuantity;
                    options.add(newOption);
                }

                // Cập nhật giá trị của dropdown menu
                document.getElementById('adults').value = storedQuantity;
            }
        });
        </script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                // Lấy giá trị từ sessionStorage
                var storedQuantity = sessionStorage.getItem('customQuantityChildren');

                // Kiểm tra nếu có giá trị, cập nhật option trong dropdown menu
                if (storedQuantity) {
                    // Lấy danh sách các option trong dropdown menu
                    var options = document.getElementById('children').options;

                    // Kiểm tra xem giá trị có nằm trong danh sách mặc định hay không
                    var isDefaultValue = Array.from(options).some(function (option) {
                        return option.value === storedQuantity;
                    });

                    // Nếu giá trị không nằm trong danh sách mặc định, thêm nó vào
                    if (!isDefaultValue) {
                        var newOption = document.createElement('option');
                        newOption.value = storedQuantity;
                        newOption.text = storedQuantity;
                        options.add(newOption);
                    }

                    // Cập nhật giá trị của dropdown menu
                    document.getElementById('children').value = storedQuantity;
                }
            });
            </script>

  </head>
  <body>
    
    <header class="site-header js-site-header">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="col-6 col-lg-4 site-logo" data-aos="fade">
              <a href="/">
                  <img src="/resources/images/logo_hotel_1.png" width="200" height="40">
              </a>
        </div>
          <div class="col-6 col-lg-8">


            <div class="site-menu-toggle js-site-menu-toggle"  data-aos="fade">
              <span></span>
              <span></span>
              <span></span>
            </div>
            <!-- END menu-toggle -->

<div class="site-navbar js-site-navbar">
              <nav role="navigation">
                <div class="container">
                  <div class="row full-height align-items-center">
                    <div class="col-md-6 mx-auto">
                      <ul class="list-unstyled menu">
                        <li><a href="/">Trang chủ</a></li>
                        <li class="active"><a href="/rooms">Phòng</a></li>
                        <li><a href="/about">Giới Thiệu</a></li>
                        <li><a href="/destination">Điểm đến</a></li>
                        <li><a href="/contact">Liên Hệ</a></li>
                        <li><a href="/restaurant">Nhà Hàng</a></li>
                        <li><a href="/dangky">Đăng Ký</a></li>
                        <c:if test="${not empty username}">
                            <li style="background-color: #4CAF50; color: #fff; padding: 10px; border-radius: 55px; font-size: 23px; display: inline-block;">Welcome, ${username}</li>
                            <li><a href="/user/history" target="_blank">Lịch sử đặt phòng</a></li>
                            <li><a href="/logout">Đăng xuất</a></li>
                        </c:if>
                        <c:if test="${empty username}">
                            <li><a href="/login">Đăng Nhập</a></li>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal != null and pageContext.request.isUserInRole('ROLE_ADMIN')}">
                            <li><a href="admin/home">Admin</a></li>
                        </c:if>
                      </ul>
                    </div>
                  </div>
                </div>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- END head -->



      <a class="mouse smoothscroll" href="#next">
        <div class="mouse-icon">
          <span class="mouse-wheel"></span>
        </div>
      </a>
    </section>
    <!-- END section -->
    <section class="site-hero inner-page overlay" style="background-image: url(/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
          <div class="container">
            <div class="row site-hero-inner justify-content-center align-items-center">
              <div class="col-md-10 text-center" data-aos="fade">
                <h1 class="heading mb-3" style="font-family: 'Roboto', sans-serif;">Phòng</h1>
                <ul class="custom-breadcrumbs mb-4">
                  <li><a href="/">Trang chủ</a></li>
                  <li>&bullet;</li>
                  <li>Phòng</li>
                </ul>
              </div>
            </div>
          </div>

          <a class="mouse smoothscroll" href="#next">
            <div class="mouse-icon">
              <span class="mouse-wheel"></span>
            </div>
          </a>
        </section>
        <!-- END section -->

        <section class="section bg-light pb-0"  >
          <div class="container">

            <div class="row check-availabilty" id="next">
              <div class="block-32" data-aos="fade-up" data-aos-offset="-200">

                <form id="availabilityForm" action="/user/booking/${categoryName}" method="get" onsubmit="return validateForm(event)">
                <div class="row">
                    <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                        <label for="checkin_date" class="font-weight-bold text-black">Ngày đến</label>
                        <div class="field-icon-wrap">
                            <div class="icon"><span class="icon-calendar"></span></div>
                            <input type="text" id="myDateInput" name="checkinDate" class="form-control" style="background-color: white;">
                        </div>
                    </div>
                    <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                        <label for="checkout_date" class="font-weight-bold text-black">Ngày đi</label>
                        <div class="field-icon-wrap">
                            <div class="icon"><span class="icon-calendar"></span></div>
                            <input type="text" id="myDateOutput" name="checkoutDate" class="form-control" style="background-color: white;">
                        </div>
                    </div>
                    <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
                        <div class="row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label for="adults" class="font-weight-bold text-black">Người lớn</label>
                                <div class="field-icon-wrap">
                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                    <select name="adults" id="adults" class="form-control">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4+</option>
                                        <option value="custom">Custom</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label for="children" class="font-weight-bold text-black">Trẻ em</label>
                                <div class="field-icon-wrap">
                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                    <select name="children" id="children" class="form-control">
                                        <option value="0">0</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4+</option>
                                        <option value="custom">Custom</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 align-self-end">
                        <button type="submit" class="btn btn-primary btn-block text-white">Tìm Phòng</button>
                    </div>
                </div>
            </form>
              </div>
            </div>
          </div>
        </section>
    
    <section class="section bg-light">
      <div class="container">
        <h2 class="text-center">Danh sách phòng có sẵn</h2>
        <table class="table table-bordered table-hover">
          <thead class="thead-light">
            <tr>
              <th class="text-center">STT</th>
              <th class="text-center">Tên Phòng</th>
              <th class="text-center">Thao Tác</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="room" items="${availableRooms}" varStatus="loop">
              <tr>
                <td class="text-center">${loop.index + 1}</td>
                <td class="text-center">${room.name}</td>
                <td class="text-center">
                  <c:choose>
                    <c:when test="${room.status eq 'Available'}">
                      <button class="btn btn-success" onclick="bookRoom('${room.name}', '/user/infomation-${categoryName}')">Đặt phòng</button>
                    </c:when>
                    <c:otherwise>
                      <button class="btn btn-secondary" disabled>Hết phòng</button>
                    </c:otherwise>
                  </c:choose>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>

        <form id="bookingForm" action="/booking" method="post">
          <input type="hidden" id="selectedRoom" name="selectedRoom" value="">
        </form>
      </div>
    </section>


            <section class="section bg-image overlay" style="background-image: url('/resources/images/hero_4.jpg');">
            <div class="container" >
              <div class="row align-items-center">
                <div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
                  <h2 class="text-white font-weight-bold">Một Địa Điểm Đáng Để Ở. Đặt Ngay !</h2>
                </div>
                <div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
                  <a href="/rooms" class="btn btn-outline-white-primary py-3 text-white px-5">Đặt Ngay</a>
                </div>
              </div>
            </div>
          </section>

         <footer class="section footer-section">
             <div class="container">
                 <div class="row mb-4">
                     <div class="col-md-3 mb-5">
                         <ul class="list-unstyled link">
                             <li><a href="/about">Về chúng tôi</a></li>
                             <li><a href="https://tripadvisor.mediaroom.com/VN-terms-of-use">Điều khoản &amp; Điều kiện</a></li>
                             <li><a href="https://tripadvisor.mediaroom.com/VN-terms-of-use">Chính sách Riêng tư</a></li>
                             <li><a href="/rooms">Phòng</a></li>
                         </ul>
                     </div>
                     <div class="col-md-3 mb-5">
                         <ul class="list-unstyled link">
                             <li><a href="/rooms">Hệ thống phòng</a></li>
                             <li><a href="/about">Về chúng tôi</a></li>
                             <li><a href="/contact">Liên hệ</a></li>
                             <li><a href="/restaurant">Nhà hàng</a></li>
                         </ul>
                     </div>
                     <div class="col-md-3 mb-5 pr-md-5 contact-info">
                         <p><span class="d-block"><span class="ion-ios-location h5 mr-3 text-primary"></span>Địa chỉ:</span> <span>38 Bạch Đằng, <br> Quận Hải Châu, TP. Đà Nẵng, Việt Nam</span></p>
                         <p><span class="d-block"><span class="ion-ios-telephone h5 mr-3 text-primary"></span>Điện thoại:</span> <span>0905 666 888</span></p>
                         <p><span class="d-block"><span class="ion-ios-email h5 mr-3 text-primary"></span>Email:</span> <span>sogohotel@gmail.com</span></p>
                     </div>
                 </div>
                 <div class="row pt-5">
                     <p class="col-md-6 text-left">
                         Bản quyền &copy;<script>document.write(new Date().getFullYear());</script> Bản quyền thuộc về Sogo Hotel </a>
                     </p>
                 </div>
             </div>
         </footer>
    
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/jquery.stellar.min.js"></script>
    <script src="/resources/js/jquery.fancybox.min.js"></script>
    
    
    <script src="/resources/js/aos.js"></script>
    
    <script src="/resources/js/bootstrap-datepicker.js"></script>
    <script src="/resources/js/jquery.timepicker.min.js"></script>

    

    <script src="/resources/js/main.js"></script>

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
   <script>
           document.addEventListener("DOMContentLoaded", function () {
               flatpickr("#myDateInput", {
                   dateFormat: "d-m-Y", // Định dạng ngày hiển thị cho ô Check In
                     minDate: "today",
                   onChange: function (selectedDates, dateStr, instance) {
                       var checkOutInput = document.getElementById("myDateOutput");

                       // Kiểm tra nếu ngày Check Out đã được chọn và trước ngày Check In
                       if (checkOutInput.value !== "" && flatpickr.parseDate(checkOutInput.value, "d-m-Y") <= selectedDates[0]) {
                           alert("Ngày đến không hợp lệ. Vui lòng chọn lại");
                           checkOutInput.value = ""; // Xóa giá trị ngày Check Out nếu không hợp lệ
                       }
                   },
               });

               flatpickr("#myDateOutput", {
                   dateFormat: "d-m-Y", // Định dạng ngày hiển thị cho ô Check Out
                    minDate: "today",
                   onChange: function (selectedDates, dateStr, instance) {
                       var checkInInput = document.getElementById("myDateInput");

                       // Kiểm tra nếu ngày Check Out trước ngày Check In
                       if (flatpickr.parseDate(dateStr, "d-m-Y") <= flatpickr.parseDate(checkInInput.value, "d-m-Y")) {
                           alert("Ngày đi không hợp lệ. Vui lòng chọn lại");
                           instance.clear(); // Xóa giá trị ngày Check Out nếu không hợp lệ
                       }
                   },
               });
           });
       </script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var form = document.getElementById("availabilityForm");

        form.addEventListener("submit", function (event) {

            // Lấy giá trị từ các trường input
            var checkinDate = document.getElementById("myDateInput").value;
            var checkoutDate = document.getElementById("myDateOutput").value;
            var adults = document.getElementById("adults").value;
            var children = document.getElementById("children").value;

            // Lưu trữ dữ liệu vào sessionStorage (hoặc có thể sử dụng localStorage)
            sessionStorage.setItem("checkin_date", checkinDate);
            sessionStorage.setItem("checkout_date", checkoutDate);
            sessionStorage.setItem("adults", adults);
            sessionStorage.setItem("children", children);

        });
    });

</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Lấy giá trị từ sessionStorage
        var fromDate = sessionStorage.getItem("checkin_date");
        var toDate = sessionStorage.getItem("checkout_date");
        var adults = sessionStorage.getItem("adults");
        var children = sessionStorage.getItem("children");

        // Log values to console
        console.log("From Date:", fromDate);
        console.log("To Date:", toDate);
        console.log("Adults:", adults);
        console.log("Children:", children);

        // Sử dụng giá trị làm gì đó (ví dụ: điền giá trị vào các trường form trên trang checkAvailability)
        document.getElementById("myDateInput").value = fromDate;
        document.getElementById("myDateOutput").value = toDate;
        document.getElementById("adults").value = adults;
        document.getElementById("children").value = children;


        // Xóa dữ liệu khỏi sessionStorage nếu cần thiết
        // sessionStorage.removeItem("checkin_date");
        // sessionStorage.removeItem("checkout_date");
        // sessionStorage.removeItem("adults");
        // sessionStorage.removeItem("children");
    });
</script>

<script>
    function bookRoom(roomName, destinationUrl) {
        // Set giá trị phòng được chọn vào input hidden
        // document.getElementById('selectedRoom').value = roomName;
         sessionStorage.setItem('selectedRoom', roomName);
         window.open(destinationUrl, '_blank');
    }
</script>

<script>
    $(document).ready(function(){
        // Show modal when either Adults or Children container is clicked
        $('#adults, #children').on('click', function(){
            $('#changeGuestsModal').modal('show');
        });

        // Redirect to /rooms when OK is clicked
        $('#confirmChange').click(function(){
            window.location.href = '/rooms';
        });
    });
</script>

<!-- Modal -->
<div class="modal fade" id="changeGuestsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title font-weight-bold" id="exampleModalLabel">Thay đổi số lượng người ở?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Bạn muốn thay đổi số lượng người ở? Vui lòng nhấn Ok để quay lại trang tìm kiếm loại phòng cho phù hợp nhé.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary text-white" id="confirmChange">OK</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
            </div>
        </div>
    </div>
</div>

<script>
     function validateForm(event) {
       var checkinDate = document.getElementById('myDateInput');
       var checkoutDate = document.getElementById('myDateOutput');

       // Kiểm tra xem cả hai trường đã được nhập hay chưa
       if (!checkinDate.value || !checkoutDate.value) {
          $('#myModal').modal('show');
         event.preventDefault(); // Ngăn chặn sự kiện submit mặc định
         return false; // Ngăn chặn chuyển hướng trang
       }

       // Nếu mọi thứ hợp lệ, cho phép chuyển hướng trang
       return true;
     }
   </script>

   <!-- Bootstrap Modal -->
     <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
       <div class="modal-dialog" role="document">
         <div class="modal-content">
           <div class="modal-header">
             <h5 class="modal-title font-weight-bold text-center" id="exampleModalLabel">Thông báo</h5>
             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
               <span aria-hidden="true">&times;</span>
             </button>
           </div>
           <div class="modal-body">
             Vui lòng nhập cả ngày đến và ngày đi
           </div>
           <div class="modal-footer">
            <button type="button" class="btn btn-danger text-white" data-dismiss="modal">Đóng</button>
           </div>
         </div>
       </div>
     </div>

  </body>
</html>