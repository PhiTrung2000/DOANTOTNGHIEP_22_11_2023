<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<!DOCTYPE HTML>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sogo Hotel </title>
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

    <link rel="stylesheet" href="/resources/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="/resources/fonts/fontawesome/css/font-awesome.min.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="/resources/css/style.css">
  </head>
  <body>

    <header class="site-header js-site-header">
      <div class="container-fluid">
        <div class="row align-items-center">
          <div class="col-6 col-lg-4 site-logo" data-aos="fade"><a href="/">Sogo Hotel</a></div>
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
    <section class="site-hero inner-page overlay" style="background-image: url('/resources/images/hero_4.jpg');" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3" style="font-family: 'Roboto', sans-serif;">Hệ Thống Phòng</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="index.jsp">Trang Chủ</a></li>
              <li>&bullet;</li>
              <li>Hệ Thống Phòng</li>
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
      <section class="section">
            <div class="container">
              <div class="row    justify-content-center text-center mb-5">
                 <h2 class="mb-4"> <b>Phòng Standard</b> </h2>
                        <p>Phòng Standard là loại phòng không thể thiếu nhất là đối với những khách sạn có quy mô nhỏ. Đây là nguồn thu khá lớn đối với nhiều khách sạn khi ngày càng có nhiều người trẻ thích du lịch bụi, du lịch trải nghiệm với phương châm tiết kiệm chi phí.</p>
                         </div>
              </div>
              <div class="row">
                <div class="col-md-18 col-lg-12" data-aos="fade-up">
                  <a href="#" class="room">
                    <figure class="img-wrap" Style="text-align:center">
                      <img src="/resources/images/rooms/Standard.jpg"  alt="Free website template" class="img-fluid mb-3">
                    </figure>
                   <div style="margin-left:80px ; color:black" class="text order-1">
                                       <h2 class="mb-4">Mô tả chi tiết</h2>
                                       <p>Tiện ích:</br></br>
                                         1. Phòng Standard thường có diện tích trung bình, đủ cho giường ngủ, phòng tắm và một số không gian cơ bản.</br>
                                         2. Các phòng Standard thường được đặt gần các tiện ích như nhà hàng, quán bar, và khu vực lễ tân để thuận tiện cho việc di chuyển.</br>
                                         3. Phòng Standard thường được trang bị những tiện nghi cơ bản như điều hòa nhiệt độ, truyền hình, điện thoại, và máy sấy tóc.</br></br>
                                         Các đặc điểm nổi bật:</br></br>

                                         1. Phòng Standard thường đi kèm với giường đôi hoặc hai giường đơn, được trang bị chăn ga gối sạch sẽ và thoải mái.</br>
                                         2. Các phòng Standard thường có khả năng kết hợp với các phòng khác để tạo ra không gian lưu trú lớn hơn cho nhóm hoặc gia đình.</br></br>

                                         Lưu ý đặc biệt:</br></br>

                                         Những đồ dùng cần thiết được trang bị trong phòng Standard chỉ bao gồm giường ngủ, chăn, gối, đệm cùng những thiết bị như quạt, tủ đồ, đèn chiếu sáng. Riêng những thiết bị như tivi, tủ lạnh…sẽ ít xuất hiện trong những dạng phòng này. </p>
                                     </div>
                  </a>
                </div>
                <div style="margin-left:700px">
                        <p><a href="/user/booking/Standard" class="btn btn-primary text-white">Đặt Phòng</a></p>
                </div>

              </div>
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

    <script>
            document.addEventListener("DOMContentLoaded", function() {
                // Lấy dữ liệu từ sessionStorage
                var checkinDate = sessionStorage.getItem("checkin_date");
                var checkoutDate = sessionStorage.getItem("checkout_date");

                // Gán sự kiện click cho nút "Đặt Phòng"
                var bookRoomBtn = document.querySelector(".btn.btn-primary.text-white");
                if (bookRoomBtn) {
                    bookRoomBtn.addEventListener("click", function(event) {
                        // Ngăn chặn hành vi mặc định của thẻ a
                        event.preventDefault();

                        // Lấy dữ liệu từ sessionStorage
                        var checkinDate = sessionStorage.getItem("checkin_date");
                        var checkoutDate = sessionStorage.getItem("checkout_date");

                        // Kiểm tra xem hai giá trị đã tồn tại hay không
                        if (!checkinDate || !checkoutDate) {
                            // Hiển thị modal lỗi nếu không tồn tại
                            $('#errorModal').modal('show');
                            return; // Ngăn chặn thực hiện các bước tiếp theo nếu có lỗi
                        }

                        // Kiểm tra xem đã nhập đủ thông tin hay không
                        var adults = sessionStorage.getItem("adults");
                        var children = sessionStorage.getItem("children");

                        if (!adults || !children) {
                            // Hiển thị modal lỗi nếu thông tin không đủ
                            $('#errorModal').modal('show');
                        } else {
                            // Nếu đầy đủ, chuyển hướng đến trang xử lý với các tham số
                            window.location.href = "/user/booking/Standard?checkinDate=" + checkinDate + "&checkoutDate=" + checkoutDate;
                        }
                    });
                }

                // Gán sự kiện click cho nút "Ok" trong modal lỗi
                var okBtn = document.querySelector("#errorModal .btn-primary[data-dismiss='modal']");
                if (okBtn) {
                    okBtn.addEventListener("click", function() {
                        // Điều hướng đến trang /rooms khi nhấn nút "Ok"
                        window.location.href = "/rooms";
                    });
                }
            });
        </script>

            <!-- Bootstrap Modal -->
            <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title font-weight-bold" id="exampleModalLabel">Thông báo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Vui lòng nhập đầy đủ thông tin và tìm phòng trước khi đặt phòng
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Ok</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Đóng</button>
                        </div>
                    </div>
                </div>
            </div>
  </body>
</html>