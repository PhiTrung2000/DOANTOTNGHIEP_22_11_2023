<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="resources/css/animate.css">
        <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
        <link rel="stylesheet" href="resources/css/aos.css">
        <link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="resources/css/jquery.timepicker.css">
        <link rel="stylesheet" href="resources/css/fancybox.min.css">

        <link rel="stylesheet" href="resources/fonts/ionicons/css/ionicons.min.css">
        <link rel="stylesheet" href="resources/fonts/fontawesome/css/font-awesome.min.css">

        <!-- Theme Style -->
        <link rel="stylesheet" href="resources/css/style.css">
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
                        <li><a href="rooms">Phòng</a></li>
                        <li><a href="about">Giới Thiệu</a></li>
                        <li class="active"><a href="destination">Điểm Đến</a></li>
                        <li><a href="contact">Liên Hệ</a></li>
                        <li><a href="restaurant">Nhà Hàng</a></li>
                        <li><a href="dangky">Đăng Ký</a></li>
                        <c:if test="${not empty username}">
                            <li style="background-color: #4CAF50; color: #fff; padding: 10px; border-radius: 55px; font-size: 23px; display: inline-block;">Welcome, ${username}</li>
                            <li><a href="/user/history" target="_blank">Lịch sử đặt phòng</a></li>
                            <li><a href="logout">Đăng xuất</a></li>
                        </c:if>
                        <c:if test="${empty username}">
                            <li><a href="login">Đăng Nhập</a></li>
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
    <section class="site-hero inner-page overlay" style="background-image: url(resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3">Điểm đến</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="/">Trang chủ</a></li>
              <li>&bullet;</li>
              <li>Điểm đến</li>
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
        <section class="section.c">
                           <div class="container">
                              <div style="margin-top: 100px" class="row    justify-content-center text-center mb-5">
                                 <h1 class="mb-4">Núi Ngũ Hành Sơn
        </h1>
                                 <p>
Núi Ngũ Hành Sơn gồm 5 ngọn núi đá vôi đã trở thành điểm nhấn đặc biệt cho Đà Nẵng từ nhiều năm nay. Tượng trưng cho 5 yếu tố: Kim – Mộc – Thủy – Hỏa – Thổ, Ngũ Hành Sơn là cái nôi của tự nhiên. Đến đây, bạn sẽ ngạc nhiên bởi những gì được tạo ra bởi bàn tay của thiên nhiên. Trong mỗi động, du khách sẽ tìm thấy nhiều tượng Phật được tạo ra từ đá vôi một cách tự nhiên, đặc biệt là động Huyền Không. Vì vậy, Ngũ Hành Sơn còn là điểm đến chính trong hành trình “du lịch tâm linh” của nhiều u khách. Qua động Vân Thông, du khách có thể lên đến đỉnh của ngọn Thủy sơn, nơi du khách có thể thu gọn trong tầm mắt toàn bộ bãi biển Non Nước và những vùng xung quanh. Ngũ Hành Sơn còn là nơi trú ẩn cho quân đội Việt Nam trong suốt những năm tháng chiến tranh chống Thực dân Pháp và Đế quốc Mỹ. Ngày nay, Ngũ Hành Sơn và khu vực lân cận trở thành làng đá mỹ nghệ với những nghệ nhân tài năng trong điêu khắc và chạm trổ những tác phẩm nghệ thuật từ đá.                                    </p>
                                 </div>
                           </div>
                              <div class="row">
                                 <div class="col-md-18 col-lg-12" data-aos="fade-up">
                                    <figure style="text-align:center" class="img-wrap">
                                    <img style="height: 300px" src="resources/images/Ngu-hanh-son.png" alt="Free website template" class="img-fluid mb-3">
                                    </figure>
                                 </div>
                              </div>
                        </section>
        <section class="section.c">
                           <div class="container">
                              <div style="margin-top: 100px" class="row    justify-content-center text-center mb-5">
                                 <h1 class="mb-4">Chùa Linh Ứng
        </h1>
                                 <p>
Nằm trên bán đảo Sơn Trà, chùa Linh Ứng (một trong ba ngôi chùa cùng mang tên Linh Ứng tại Đà Nẵng) là một điểm đến khác trong hành trình “du lịch tâm linh” mà chắc hẳn du khách sẽ thích thú tìm hiểu. Tựa lưng vào bán đảo Sơn Trà, chùa Linh Ưng mang đến cho du khách một hình ảnh bao la bất tận của đại dương trước mắt. Điểm hấp dẫn nhất của ngôi chùa là bức tượng Quán Thế Âm màu trắng ,cao 67m – là một trong những bức tượng Quán Thế Âm cao nhất tại Việt Nam và ở Đông Nam Á. Hướng mặt về biển Đông, tượng Quan Thế Âm như bảo vệ cho thành phố Đà Nẵng khỏi những thiên tai, bão lũ đến từ đại dương, Về đêm, tượng Quan Thế Âm còn là ngọn hải đăng cho những ngư dân đánh cá với lời cầu chúc bình an.
</p>                                 </div>
                           </div>
                              <div class="row">
                                 <div class="col-md-18 col-lg-12" data-aos="fade-up">
                                    <figure style="text-align:center" class="img-wrap">
                                    <img style="height:300px" src="resources/images/chua-linh-ung.png" alt="Free website template" class="img-fluid mb-3">
                                    </figure>
                                 </div>
                              </div>
                        </section>
                        <section class="section.c">
                           <div class="container">
                              <div style="margin-top: 100px" class="row    justify-content-center text-center mb-5">
                                 <h1 class="mb-4">BaNa Hill
        </h1>
                                 <p>
Vốn là địa điểm cho quân lính nghỉ ngơi của Thực dân Pháp trong thời kỳ chiến tranh, Bà Nà hiện nay đã được phát triển thành một địa diểm lý tưởng cho du lịch sinh thái và nghỉ dưỡng. Với kỷ lục dành cho đường dây cáp treo cao nhất và dài nhất thế giới, Bà Nà sở hữu bầu không khí trong lành, tươi mát của núi rừng. Lên đến đỉnh núi Bà Nà bằng đường cáp treo, du khách có thể đến thăm khu Làng Pháp, vườn hoa Le Jardin D’amour  và công viên Fantasy – công viên vui chơi trong nhà lớn nhất Đông nam Á. Ngôi chùa Linh Ứng cũng là nơi du khách không thể bỏ qua khi đến thăm Bà Nà.                                </p>
                                </div>
                           </div>
                              <div class="row">
                                 <div class="col-md-18 col-lg-12" data-aos="fade-up">
                                    <figure style="text-align:center; margin-bottom: 100px; " class="img-wrap">
                                    <img style="height: 300px;" src="resources/images/ba-na.png" alt="Free website template" class="img-fluid mb-3">
                                    </figure>
                                 </div>
                              </div>
                        </section>

            <section class="section bg-image overlay" style="background-image: url('resources/images/hero_4.jpg');">
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
    <script src="resources/js/jquery-3.3.1.min.js"></script>
        <script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
        <script src="resources/js/popper.min.js"></script>
        <script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/owl.carousel.min.js"></script>
        <script src="resources/js/jquery.stellar.min.js"></script>
        <script src="resources/js/jquery.fancybox.min.js"></script>


        <script src="resources/js/aos.js"></script>

        <script src="resources/js/bootstrap-datepicker.js"></script>
        <script src="resources/js/jquery.timepicker.min.js"></script>



        <script src="resources/js/main.js"></script>
      </body>
    </html>