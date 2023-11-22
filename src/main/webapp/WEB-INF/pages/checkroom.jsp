<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sogo Hotel by Colorlib.com</title>
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
  </head>
  <body>
    
    <header class="site-header js-site-header">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="col-6 col-lg-4 site-logo" data-aos="fade"><a href="index.html">Sogo Hotel</a></div>
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
                        <li><a href="/">Home</a></li>
                        <li class="active"><a href="/rooms">Rooms</a></li>
                        <li><a href="about.html">About</a></li>
                        <li><a href="events.html">Events</a></li>
                        <li><a href="contact.html">Contact</a></li>
                        <li><a href="reservation.html">Reservation</a></li>
                        <li><a href="/dangky">Đăng Ký</a></li>
                        <c:if test="${not empty username}">
                            <li>Welcome, ${username}</li>
                            <li><a href="/logout">Logout</a></li>
                        </c:if>
                        <c:if test="${empty username}">
                            <li><a href="/login">Login</a></li>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal != null and pageContext.request.isUserInRole('ROLE_ADMIN')}">
                            <li><a href="/admin/home">Admin</a></li>
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
                <h1 class="heading mb-3">Rooms</h1>
                <ul class="custom-breadcrumbs mb-4">
                  <li><a href="index.html">Home</a></li>
                  <li>&bullet;</li>
                  <li>Rooms</li>
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

                <form id="availabilityForm" action="/user/booking/${categoryName}" method="get">
                <div class="row">
                    <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                        <label for="checkin_date" class="font-weight-bold text-black">Check In</label>
                        <div class="field-icon-wrap">
                            <div class="icon"><span class="icon-calendar"></span></div>
                            <input type="text" id="myDateInput" name="checkinDate" class="form-control" style="background-color: white;">
                        </div>
                    </div>
                    <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                        <label for="checkout_date" class="font-weight-bold text-black">Check Out</label>
                        <div class="field-icon-wrap">
                            <div class="icon"><span class="icon-calendar"></span></div>
                            <input type="text" id="myDateOutput" name="checkoutDate" class="form-control" style="background-color: white;">
                        </div>
                    </div>
                    <div class="col-md-6 mb-3 mb-md-0 col-lg-3">
                        <div class="row">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label for="adults" class="font-weight-bold text-black">Adults</label>
                                <div class="field-icon-wrap">
                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                    <select name="adults" id="adults" class="form-control">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4+</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3 mb-md-0">
                                <label for="children" class="font-weight-bold text-black">Children</label>
                                <div class="field-icon-wrap">
                                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                    <select name="children" id="children" class="form-control">
                                        <option value="0">0</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4+</option>
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
                      <button class="btn btn-success" onclick="bookRoom('${room.name}')">Đặt phòng</button>
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


    <section class="section bg-image overlay" style="background-image: url('images/hero_4.jpg');">
      <div class="container" >
        <div class="row align-items-center">
          <div class="col-12 col-md-6 text-center mb-4 mb-md-0 text-md-left" data-aos="fade-up">
            <h2 class="text-white font-weight-bold">A Best Place To Stay. Reserve Now!</h2>
          </div>
          <div class="col-12 col-md-6 text-center text-md-right" data-aos="fade-up" data-aos-delay="200">
            <a href="reservation.html" class="btn btn-outline-white-primary py-3 text-white px-5">Reserve Now</a>
          </div>
        </div>
      </div>
    </section>
    
    <footer class="section footer-section">
      <div class="container">
        <div class="row mb-4">
          <div class="col-md-3 mb-5">
            <ul class="list-unstyled link">
              <li><a href="#">About Us</a></li>
              <li><a href="#">Terms &amp; Conditions</a></li>
              <li><a href="#">Privacy Policy</a></li>
             <li><a href="#">Rooms</a></li>
            </ul>
          </div>
          <div class="col-md-3 mb-5">
            <ul class="list-unstyled link">
              <li><a href="#">The Rooms &amp; Suites</a></li>
              <li><a href="#">About Us</a></li>
              <li><a href="#">Contact Us</a></li>
              <li><a href="#">Restaurant</a></li>
            </ul>
          </div>
          <div class="col-md-3 mb-5 pr-md-5 contact-info">
            <!-- <li>198 West 21th Street, <br> Suite 721 New York NY 10016</li> -->
            <p><span class="d-block"><span class="ion-ios-location h5 mr-3 text-primary"></span>Address:</span> <span> 198 West 21th Street, <br> Suite 721 New York NY 10016</span></p>
            <p><span class="d-block"><span class="ion-ios-telephone h5 mr-3 text-primary"></span>Phone:</span> <span> (+1) 435 3533</span></p>
            <p><span class="d-block"><span class="ion-ios-email h5 mr-3 text-primary"></span>Email:</span> <span> info@domain.com</span></p>
          </div>
          <div class="col-md-3 mb-5">
            <p>Sign up for our newsletter</p>
            <form action="#" class="footer-newsletter">
              <div class="form-group">
                <input type="email" class="form-control" placeholder="Email...">
                <button type="submit" class="btn"><span class="fa fa-paper-plane"></span></button>
              </div>
            </form>
          </div>
        </div>
        <div class="row pt-5">
          <p class="col-md-6 text-left">
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          </p>
            
          <p class="col-md-6 text-right social">
            <a href="#"><span class="fa fa-tripadvisor"></span></a>
            <a href="#"><span class="fa fa-facebook"></span></a>
            <a href="#"><span class="fa fa-twitter"></span></a>
            <a href="#"><span class="fa fa-linkedin"></span></a>
            <a href="#"><span class="fa fa-vimeo"></span></a>
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
        flatpickr("#myDateInput", {
            dateFormat: "d-m-Y",
        });
    </script>

    <script>
            flatpickr("#myDateOutput", {
                dateFormat: "d-m-Y",
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
    function bookRoom(roomName) {
        // Set giá trị phòng được chọn vào input hidden
        document.getElementById('selectedRoom').value = roomName;
        // Submit form để gửi yêu cầu đặt phòng
        document.getElementById('bookingForm').submit();
    }
</script>
  </body>
</html>