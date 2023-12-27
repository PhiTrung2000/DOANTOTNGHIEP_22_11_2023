<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
          <div class="col-6 col-lg-4 site-logo" data-aos="fade">
              <a href="/">
                  <img src="resources/images/logo_hotel_1.png" width="200" height="40">
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
                        <li><a href="rooms">Phòng</a></li>
                        <li><a href="about">Giới Thiệu</a></li>
                        <li class="active"><a href="destination">Điểm Đến</a></li>
                        <li><a href="contact">Liên Hệ</a></li>
                        <li><a href="restaurant">Nhà Hàng</a></li>
                        <li><a href="dangky">Đăng Ký</a></li>
                        <c:if test="${not empty username}">
                            <li style="background-color: #4CAF50; color: #fff; padding: 10px; border-radius: 55px; font-size: 23px; display: inline-block;">Welcome, ${username}</li>
                            <li><a href="/user/history" target="_blank">Lịch sử đặt phòng</a></li>
                            <li><a href="/user/changeInformation" target="_blank">Thay đổi thông tin</a></li>
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
            <h1 class="heading mb-3" style="font-family: 'Roboto', sans-serif;">Điểm đến</h1>
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

    <section class="section blog-post-entry bg-light" id="next">
      <div class="container">
        
        <div class="row">
          <div class="col-lg-4 col-md-6 col-sm-6 col-12 post mb-5" data-aos="fade-up" data-aos-delay="100">

            <div class="media media-custom d-block mb-4 h-100">
              <a href="hue" class="mb-4 d-block"><img src="resources/images/co_do_hue.jpg" alt="Image placeholder" class="img-fluid"></a>
              <div class="media-body">
                <h2 class="mt-0 mb-3"><a href="hue">Cố Đô Huế</a></h2>
                <p>Thủ đô xưa của Việt Nam – Huế mang trong mình vẻ đẹp thanh lịch và yên bình. Đến với Huế, du khách có thể cảm nhận hơi thở của những ngày xưa cũ trong trong con người, cách sống, phong tục tập quán.</p>
              </div>
            </div>

          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 col-12 post mb-5" data-aos="fade-up" data-aos-delay="200">
            <div class="media media-custom d-block mb-4 h-100">
              <a href="hoi_an" class="mb-4 d-block"><img src="resources/images/hoi_an.png" alt="Image placeholder" class="img-fluid"></a>
              <div class="media-body">
                <h2 class="mt-0 mb-3"><a href="hoi_an">Phố Cổ Hội An</a></h2>
                <p>Là khu phố cổ được UNESCO công nhận Di sản Văn hóa Thế giới năm 1999 và được mệnh danh là một trong những địa điểm lãng mạn nhất thế giới, Hội An giữ trong mình âm hưởng của nền văn hóa Việt Nam truyền thống hòa cùng những sắc màu văn hóa thế giới.</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 col-12 post mb-5" data-aos="fade-up" data-aos-delay="300">
            <div class="media media-custom d-block mb-4 h-100">
              <a href="da_nang" class="mb-4 d-block"><img src="resources/images/causonghan.jpg" alt="Image placeholder" class="img-fluid"></a>
              <div  class="media-body">
                <h2 class="mt-0 mb-3"><a href="da_nang">Đà Nẵng</a></h2>
                <p> Đứng đầu trong danh sách những điểm đến lý tưởng cho du khách theo trang web nổi tiếng Tripadvisor, Đà Nẵng không chỉ là thành phố trung tâm của miền biển duyên hải miền Trung Việt Nam mà còn là một địa điểm tuyệt vời cho du khách đến để khám phá và nghỉ dưỡng.</p>
              </div>
            </div>
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