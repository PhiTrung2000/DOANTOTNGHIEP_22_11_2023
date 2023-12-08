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
                         <h1 class="mb-4">Hội Quán Trung Hoa
</h1>
                         <p>
Những hội quán nằm trong phố cổ là nơi những thương nhân và người dân Trung Quốc từ xưa đến sinh hoạt và thờ cúng. Về sau môt vài hội quán được chuyển thành chùa hoặc đền thờ người dân Trung Quốc tôn vinh những vị thánh, thần trong văn hóa của mình. Một vài hội quán nổi tiếng cho du khách tham quan là hội quán Phúc Kiến, hội quán Quảng Đông, hội quán Trung Hoa…
                            </p>
                         </div>
                   </div>
                      <div class="row">
                         <div class="col-md-18 col-lg-12" data-aos="fade-up">
                            <figure style="text-align:center" class="img-wrap">
                            <img style="height: 300px" src="resources/images/hoi-quan-trung-hoa.png" alt="Free website template" class="img-fluid mb-3">
                            </figure>
                         </div>
                      </div>
                </section>
<section class="section.c">
                   <div class="container">
                      <div style="margin-top: 100px" class="row    justify-content-center text-center mb-5">
                         <h1 class="mb-4">Nhà cổ
</h1>
                         <p>
Đại điện cho sự hòa trộn trong kiến trúc và văn hóa của Trung Quốc và Nhật Bản với Việt Nam, những ngôi nhà cổ ở Hội An là một trong những nơi du khách cần phải đến để cảm nhận về một thành phố cảng nổi tiếng Đông Nam Á thế kỷ thứ 18. Qua nhiều thế hệ, những ngôi nhà cổ vẫn được bảo tồn và thu hút rất nhiều khách du lịch đến tìm hiểu về cuộc sống của người dân vào thời hoàng kim của phố cổ Hội An. Những nhà cổ nổi tiếng có thể kể đến nhà cổ Tấn Ký, Phùng Hưng, Quân Thắng.</p>
                         </div>
                   </div>
                      <div class="row">
                         <div class="col-md-18 col-lg-12" data-aos="fade-up">
                            <figure style="text-align:center" class="img-wrap">
                            <img style="height:300px" src="resources/images/nha-co.png" alt="Free website template" class="img-fluid mb-3">
                            </figure>
                         </div>
                      </div>
                </section>
                <section class="section.c">
                   <div class="container">
                      <div style="margin-top: 100px" class="row    justify-content-center text-center mb-5">
                         <h1 class="mb-4">Món ngon địa phương
</h1>
                         <p>
Đến với Hội An, ẩm thực là một điều không thể thiếu trong danh sách những trải nghiệm của du khách. Phản ánh con người và vùng quê hồn hậu, thanh bình, những món ăn tại Hội An có thể làm bạn nhớ đến hương thơm và mùi vị của một số món ăn từ Trung Quốc, Nhật Bản và cả Ấn Độ.  Trong những món ăn tinh tế đầy hương vị nhưng cũng không kém phần ngon miệng đó, một vài gợi ý dành cho du khách là cao lầu (món mì với sợi mì dày, dai, nhìn giống sợi mì udon của Nhật Bản), bánh bao – bánh vạc (bánh bao Hội An, thường được nhắc đến với cái tên “bánh hoa hồng”), bánh mì (du khách có thể tìm được một trong những hàng bánh mì ngon nhất Việt Nam tại Hội An, được công nhận bởi đầu bếp và người ẫn chương trình nổi tiếng Anthony Bourdain) và cơm gà (cơm dẻo với thịt gà luộc xé sợi, ăn cùng tương ớt Hội An, chanh, ngò và hành tây thái mỏng).
                        </p>
                        </div>
                   </div>
                      <div class="row">
                         <div class="col-md-18 col-lg-12" data-aos="fade-up">
                            <figure style="text-align:center; margin-bottom: 100px; " class="img-wrap">
                            <img style="height: 300px;" src="resources/images/mon-an.png" alt="Free website template" class="img-fluid mb-3">
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