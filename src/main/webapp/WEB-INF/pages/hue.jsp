<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <section class="section.c" id="next">
                   <div class="container">
                      <div style="margin-top: 100px" class="row    justify-content-center text-center mb-5">
                         <h1 class="mb-4">Đại Nội</h1>
                         <p>
                         Bao gồm Hoàng thành và Tử Cấm Thành, Đại Nội Huế được xây dựng từ năm 1804 nhưng mãi đến năm 1833 đời vua Minh Mạng mới hoàn thành. Trong khi Hoàng thành là nơi để triều đình thực hiện các đại lễ, trong đó phải kể đến cổng Ngọ Môn - nơi thường tổ chức lễ duyệt binh và điện Thái Hòa – là nơi vua cùng bá quan văn võ trong triều cử hành lễ Đại Triều một tháng 2 lần; thì Tử Cấm Thành là nơi sống và sinh hoạt của vua, hoàng hậu, các phi tần cũng như hoàng tộc. Được bao quanh bởi một con kênh, Hoàng thành Huế hướng mặt ra dòng sông Hương thơ mộng. Trải qua nhiều biến động thời gian, những công trình kiến trúc trong Đại Nội Huế dù bị tàn phá nhưng vẫn giữ được những nét tinh túy nhất của một thời hoàng kim.
                            </p>
                         </div>
                   </div>
                      <div class="row">
                         <div class="col-md-18 col-lg-12" data-aos="fade-up">
                            <figure style="text-align:center" class="img-wrap">
                            <img src="resources/images/co_do_hue.jpg" alt="Free website template" class="img-fluid mb-3">
                            </figure>
                         </div>
                      </div>
                </section>
<section class="section.c">
                   <div class="container">
                      <div style="margin-top: 100px" class="row    justify-content-center text-center mb-5">
                         <h1 class="mb-4">Chùa Thiên Mụ</h1>
                         <p>
                         Được xây dựng trên đỉnh một ngọn đồi ở bờ bắc sông Hương, chùa Thiên Mụ không chỉ là một ngôi chùa Phật giáo mà còn là một điểm tham quan rất lãng mạn. Còn được biết với tên chùa Linh Mụ, nơi đây có câu chuyện kể về người phụ nữ đến từ trời xanh, cũng là bắt nguồn của cái tên chùa Thiên Mụ (Linh Mụ). Đến với nơi linh thiêng này, du khách có thể vừa ngắm cảnh trí tuyệt đẹp vừa chiêm ngưỡng nét độc đáo trong lối kiến trúc tuyền thống của các chùa ở Huế. Với địa thế đẹp, chùa Thiên Mụ còn mang đến cho du khách tầm nhìn bất tận hướng ra dòng sông Hương và trải rộng sang những khu vực lân cận. Được bao bọc khung cảnh thiên nhiên, nơi này làm cho du khách cảm thấy thanh tịnh trong tâm hồn – một điều không nơi đâu có được. Kiến trúc, địa thế cùng lịch sử  chính là những điều làm cho chùa Thiên Mụ trở thành một trong những điểm tham quan hấp dẫn khách du lịch ở Huế.</p>
                         </div>
                   </div>
                      <div class="row">
                         <div class="col-md-18 col-lg-12" data-aos="fade-up">
                            <figure style="text-align:center" class="img-wrap">
                            <img style="height:300px" src="resources/images/chuathienmu.png" alt="Free website template" class="img-fluid mb-3">
                            </figure>
                         </div>
                      </div>
                </section>
                <section class="section.c">
                   <div class="container">
                      <div style="margin-top: 100px" class="row    justify-content-center text-center mb-5">
                         <h1 class="mb-4">Lăng tẩm các vị vua</h1>
                         <p>
                        Lăng tẩm của các vị vua triều Nguyễn là một trong những minh chứng cho vương triều phong kiến cuối cùng của Việt Nam. Được xây trên diện tích rộng trong nhiều năm với những thiết kế kiến trúc khác nhau làm nổi bật con người và nét tính cách của mỗi vị vua và thời điểm họ trị vì, lăng tẩm của mỗi vị vua đều có bề dày lịch sử đáng kể cùng những câu chuyện xoay quanh quá trình xây dựng nên lăng tẩm đó. Những lăng tẩm được viếng thăm nhiều nhất có thể kể đến lăng Tự Đức, lăng Khải Định, lăng Minh Mạng, lăng Gia Long và lăng Đồng Khánh.</p>
                        </div>
                   </div>
                      <div class="row">
                         <div class="col-md-18 col-lg-12" data-aos="fade-up">
                            <figure style="text-align:center; margin-bottom: 100px; " class="img-wrap">
                            <img style="height: 300px;" src="resources/images/lang-tam.png" alt="Free website template" class="img-fluid mb-3">
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