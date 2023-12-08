<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
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

    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/animate.css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="resources/css/aos.css">
    <link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="resources/css/jquery.timepicker.css">
    <link rel="stylesheet" href="resources/css/fancybox.min.css">

    <link rel="stylesheet" href="fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="fonts/fontawesome/css/font-awesome.min.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="resources/css/style.css">
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
                        <li><a href="/">Trang chủ</a></li>
                        <li><a href="rooms">Phòng</a></li>
                        <li class="active"><a href="about">Giới Thiệu</a></li>
                        <li><a href="destination">Điểm Đến</a></li>
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

    <section class="site-hero overlay" style="background-image: url(resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
            <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3" style="font-family: 'Roboto', sans-serif;">Về Chúng Tôi</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="index.html">Trang Chủ</a></li>
              <li>&bullet;</li>
              <li>Giới thiệu</li>
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

    <section class="py-5 bg-light">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-12 col-lg-7 ml-auto order-lg-2 position-relative mb-5" data-aos="fade-up">
            <figure class="img-absolute">
              <img src="resources/images/food-1.jpg" alt="Image" class="img-fluid">
            </figure>
            <img src="resources/images/rooms/VIP.jpg" alt="Image" class="img-fluid rounded">
          </div>
          <div class="col-md-12 col-lg-4 order-lg-1" data-aos="fade-up">
            <h2 class="heading">Chào Mừng!</h2>
            <p class="mb-4">Chào mừng quý khách đến với khách sạn chúng tôi! Chúng tôi rất vinh dự được đón tiếp và phục vụ quý khách trong hành trình của mình. Với cam kết đem đến trải nghiệm lưu trú độc đáo và thoải mái nhất, chúng tôi tự hào về dịch vụ chăm sóc khách hàng tận tâm và không ngừng nỗ lực để đáp ứng mọi nhu cầu của quý vị</p>
            <p><a href="#" class="btn btn-primary text-white py-2 mr-3">Xem thêm</a> <span class="mr-3 font-family-serif"><em>or</em></span> <a href="https://vimeo.com/channels/staffpicks/93951774"  data-fancybox class="text-uppercase letter-spacing-1">Video</a></p>
          </div>

        </div>
      </div>
    </section>

    <div class="container section">

          <div class="row justify-content-center text-center mb-5">
            <div class="col-md-7 mb-5">
              <h2 class="heading" data-aos="fade-up">Thành Viên</h2>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="100">
              <div class="block-2">
                <div class="flipper">
                  <div class="front" style="background-image: url(resources/images/person_3.jpg);">
                    <div class="box">
                      <h2>Trần Hải</h2>
                      <p>Font End - Back End Support</p>
                    </div>
                  </div>
                  <div class="back">
                    <!-- back content -->
                    <blockquote>
                      <p>Trần Hải - Học viên trung tâm đào tạo Lập trình viên chuyên nghiệp Iviettech</p>
                    </blockquote>
                    <div class="author d-flex">
                      <div class="image mr-3 align-self-center">
                        <img src="resources/images/person_3.jpg" alt="">
                      </div>
                      <div class="name align-self-center">Trần Hải <span class="position">Font End - Back End Support</span></div>
                    </div>
                  </div>
                </div>
              </div> <!-- .flip-container -->
            </div>

            <div class="col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="200">
              <div class="block-2"> <!-- .hover -->
                <div class="flipper">
                  <div class="front" style="background-image: url(resources/images/person_1.jpg);">
                    <div class="box">
                      <h2>Trung Nguyễn</h2>
                      <p>Back End - Font End Support</p>
                    </div>
                  </div>
                  <div class="back">
                    <!-- back content -->
                    <blockquote>
                      <p>Phi Trung - Học viên trung tâm đào tạo Lập trình viên chuyên nghiệp Iviettech</p>
                    </blockquote>
                    <div class="author d-flex">
                      <div class="image mr-3 align-self-center">
                        <img src="resources/images/person_1.jpg" alt="">
                      </div>
                      <div class="name align-self-center">Trung Nguyễn <span class="position">Back End - Font End Support</span></div>
                    </div>
                  </div>
                </div>
              </div> <!-- .flip-container -->
            </div>

            <div class="col-md-6 col-lg-4" data-aos="fade-up" data-aos-delay="300">
              <div class="block-2">
                <div class="flipper">
                  <div class="front" style="background-image: url(resources/images/person_2.jpg);">
                    <div class="box">
                      <h2>Văn Thịnh</h2>
                      <p>Font End</p>
                    </div>
                  </div>
                  <div class="back">
                    <!-- back content -->
                    <blockquote>
                      <p>Văn Thịnh - Học viên trung tâm đào tạo Lập trình viên chuyên nghiệp Iviettech</p>
                    </blockquote>
                    <div class="author d-flex">
                      <div class="image mr-3 align-self-center">
                        <img src="resources/images/person_2.jpg" alt="">
                      </div>
                      <div class="name align-self-center">Văn Thịnh <span class="position">Font End</span></div>
                    </div>
                  </div>
                </div>
              </div> <!-- .flip-container -->
            </div>
          </div>
        </div>
    <!-- END .block-2 -->

<section class="section slider-section bg-light">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade-up">Một số hình ảnh</h2>
            <p data-aos="fade-up" data-aos-delay="100">Khách sạn chúng tôi tự hào với kiến trúc đẹp mắt và thiết kế hiện đại. Bên ngoài, quý khách sẽ được chào đón bởi một kiến trúc sang trọng, tinh tế, và nổi bật trong bức tranh đô thị hoặc tự nhiên xung quanh</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="home-slider major-caousel owl-carousel mb-5" data-aos="fade-up" data-aos-delay="200">
              <div class="slider-item">
                <a href="images/slider-1.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="resources/images/slider-1.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-2.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="resources/images/slider-2.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-3.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="resources/images/slider-3.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-4.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="resources/images/slider-4.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-5.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="resources/images/slider-5.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-6.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="resources/images/slider-6.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
              <div class="slider-item">
                <a href="images/slider-7.jpg" data-fancybox="images" data-caption="Caption for this image"><img src="resources/images/slider-7.jpg" alt="Image placeholder" class="img-fluid"></a>
              </div>
            </div>
            <!-- END slider -->
          </div>

        </div>
      </div>
    </section>
    <!-- END section -->

    <div class="section">
      <div class="container">

        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7 mb-5">
            <h2 class="heading" data-aos="fade">Hành Trình Phát Triển</h2>
          </div>
        </div>

        <div class="row justify-content-center">
          <div class="col-md-8">
            <div class="timeline-item" date-is='2010' data-aos="fade">
              <h3>Bắt Đầu</h3>
              <p>Khách sạn chúng tôi bắt đầu hành trình của mình vào năm 2010 với niềm đam mê và cam kết mang lại trải nghiệm lưu trú độc đáo. Cơ sở đầu tiên mở cửa, mang đến không gian thoải mái và dịch vụ chăm sóc khách hàng chất lượng.</p>
            </div>

            <div class="timeline-item" date-is='2013' data-aos="fade">
              <h3>Mở Rộng Đến Địa Điểm Mới</h3>
              <p>Với sự phát triển nhanh chóng và niềm tin từ phía khách hàng, chúng tôi quyết định mở rộng mạng lưới. Năm 2013, chi nhánh thứ hai được mở, mang đến cho khách hàng thêm sự lựa chọn và trải nghiệm mới.</p>
            </div>

            <div class="timeline-item" date-is='2016' data-aos="fade">
              <h3>Nâng Cao Chất Lượng Dịch Vụ</h3>
              <p>Chúng tôi không ngừng nỗ lực cải thiện chất lượng dịch vụ. Năm 2016, chúng tôi đầu tư cập nhật không gian và tiện nghi, đồng thời đào tạo nhân viên để đảm bảo mọi khách hàng có được trải nghiệm lưu trú tốt nhất có thể.</p>
            </div>

            <div class="timeline-item" date-is='2019' data-aos="fade">
              <h3>Chào Đón Thế Hệ Mới</h3>
              <p>Với sự xuất hiện của thế hệ mới và sự thay đổi trong xu hướng du lịch, chúng tôi tập trung vào việc tạo ra không gian lưu trú hiện đại và linh hoạt. Năm 2019, chúng tôi chính thức giới thiệu các phòng và tiện nghi tiên tiến, phục vụ nhu cầu đa dạng của khách hàng.</p>
            </div>

            <div class="timeline-item" date-is='2022' data-aos="fade">
              <h3>Bền Vững và Tầm Nhìn Tương Lai</h3>
              <p>Đối mặt với thách thức của thời đại, chúng tôi cam kết với việc bền vững và trách nhiệm xã hội. Chúng tôi đã triển khai các biện pháp bảo vệ môi trường và tham gia vào các hoạt động cộng đồng để đóng góp tích cực cho sự phát triển.</p>
            </div>
          </div>
        </div>

      </div>
    </div>

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

    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  </body>
</html>