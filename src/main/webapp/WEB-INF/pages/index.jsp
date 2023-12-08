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
                        <li class="active"><a href="/">Trang chủ</a></li>
                        <li><a href="rooms">Phòng</a></li>
                        <li><a href="about">Giới Thiệu</a></li>
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
          <div class="col-md-10 text-center" data-aos="fade-up">
            <span class="custom-caption text-uppercase text-white d-block  mb-3">Chào Mừng Đến Với Khách sạn<span class="fa fa-star text-primary"></span>   Sogo Hotel</span>
            <h1 class="heading" style="font-family: 'Roboto', sans-serif;">Sự Lựa Chọn Lí Tưởng</h1>
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

            <form id="availabilityForm" action="/checkAvailability" method="post" onsubmit="return validateForm(event)">
                <div class="row">
                    <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                        <label for="checkin_date" class="font-weight-bold text-black">Ngày đến</label>
                        <div class="field-icon-wrap">
                            <div class="icon"><span class="icon-calendar"></span></div>
                            <input type="text" id="myDateInput" name="checkin_date" class="form-control" style="background-color: white;">
                        </div>
                    </div>
                    <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                        <label for="checkout_date" class="font-weight-bold text-black">Ngày đi</label>
                        <div class="field-icon-wrap">
                            <div class="icon"><span class="icon-calendar"></span></div>
                            <input type="text" id="myDateOutput" name="checkout_date" class="form-control" style="background-color: white;">
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
                        <button type="submit" class="btn btn-primary btn-block text-white">Tìm kiếm</button>
                    </div>
                </div>
            </form>
          </div>


        </div>
      </div>
    </section>

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
            <p><a href="/about" class="btn btn-primary text-white py-2 mr-3">Xem thêm</a> <span class="mr-3 font-family-serif"><em>or</em></span> <a href="https://www.youtube.com/watch?v=RNQV7kD3DI4"  data-fancybox class="text-uppercase letter-spacing-1">Video</a></p>
          </div>
          
        </div>
      </div>
    </section>

    <section class="section">
      <div class="container">
        <div class="row justify-content-center text-center mb-5">
          <div class="col-md-7">
            <h2 class="heading" data-aos="fade-up">Hệ Thống Phòng</h2>
            <p data-aos="fade-up" data-aos-delay="100">Phòng của chúng tôi rất hiện đại và tiện nghi giúp mọi người đến với khách sạn của chúng tôi luôn thoải mái và vui vẻ, với thiết kế có sàn gỗ bóng, vải tự nhiên, đồ nội thất bằng mây thoải mái, cửa chớp kiểu đồn điền và quạt trần</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-4" data-aos="fade-up">
            <a href="/search/Standard" class="room" target="_blank">
              <figure class="img-wrap">
                <img src="resources/images/rooms/Standard.jpg" alt="Free website template" class="img-fluid mb-3">
              </figure>
              <div class="p-3 text-center room-info">
                <h2>Standard Room</h2>
                <span class="text-uppercase letter-spacing-1">100$ / 1 Đêm</span>
              </div>
            </a>
          </div>

          <div class="col-md-6 col-lg-4" data-aos="fade-up">
            <a href="/search/Family" class="room" target="_blank">
              <figure class="img-wrap">
                <img src="resources/images/rooms/Family.jpg" alt="Free website template" class="img-fluid mb-3">
              </figure>
              <div class="p-3 text-center room-info">
                <h2>Family Room</h2>
                <span class="text-uppercase letter-spacing-1">200$ / 1 Đêm</span>
              </div>
            </a>
          </div>

          <div class="col-md-6 col-lg-4" data-aos="fade-up">
            <a href="/search/Penthouse" class="room" target="_blank">
              <figure class="img-wrap">
                <img src="resources/images/rooms/Penthouse.jpg" alt="Free website template" class="img-fluid mb-3">
              </figure>
              <div class="p-3 text-center room-info">
                <h2>Penthouse Room</h2>
                <span class="text-uppercase letter-spacing-1">500$ / 1 Đêm</span>
              </div>
            </a>
          </div>


        </div>
      </div>
    </section>
    
    
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
    
    <section class="section bg-image overlay" style="background-image: url('resources/images/hero_3.jpg');">
          <div class="container">
            <div class="row justify-content-center text-center mb-5">
              <div class="col-md-7">
                <h2 class="heading text-white" data-aos="fade">Món Ăn Của Khách Sạn</h2>
                <p class="text-white" data-aos="fade" data-aos-delay="100">Thức ăn tại khách sạn của chúng tôi không chỉ là bữa ăn, mà là một trải nghiệm ẩm thực đặc biệt, kết hợp giữa hương vị tuyệt vời, chất lượng tốt nhất và sự sáng tạo trong việc chế biến. Dưới đây là một số đặc điểm về thực đơn và ẩm thực tại khách sạn của chúng tôi.</p>
              </div>
            </div>
            <div class="food-menu-tabs" data-aos="fade">
              <ul class="nav nav-tabs mb-5" id="myTab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active letter-spacing-2" id="mains-tab" data-toggle="tab" href="#mains" role="tab" aria-controls="mains" aria-selected="true">Món Chính</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link letter-spacing-2" id="desserts-tab" data-toggle="tab" href="#desserts" role="tab" aria-controls="desserts" aria-selected="false">Tráng Miệng</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link letter-spacing-2" id="drinks-tab" data-toggle="tab" href="#drinks" role="tab" aria-controls="drinks" aria-selected="false">Thức Uống</a>
                </li>
              </ul>
              <div class="tab-content py-5" id="myTabContent">


                <div class="tab-pane fade show active text-left" id="mains" role="tabpanel" aria-labelledby="mains-tab">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">350.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Thịt hun khói</a></h3>
                        <p class="text-white text-opacity-7">Món thịt hun khói là một đặc sản ẩm thực có hương vị độc đáo và hấp dẫn, được chế biến thông qua quá trình hun khói truyền thống. Đây là một món ăn phổ biến và được yêu thích tại nhiều vùng trên thế giới</p>
                      </div>
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">220.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Bò Bít Tết</a></h3>
                        <p class="text-white text-opacity-7">Món bò bít tết thường được ăn kèm với các loại sốt như sốt nấm, sốt tiêu xanh, hoặc sốt bơ. Bạn cũng có thể kèm theo các loại rau sống như cà chua, cà rốt, cần tây và khoai tây chiên.</p>
                      </div>
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">150.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Salad Rong Nho</a></h3>
                        <p class="text-white text-opacity-7">Món salad rong nho là một sự kết hợp tuyệt vời giữa hương vị tươi mới của rau xanh, hương thơm của rong biển và hương ngọt của nho. Đây là một món salad khỏe mạnh, ngon miệng và đầy dinh dưỡng.</p>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">230.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Cơm Chiên Bát Bửu</a></h3>
                        <p class="text-white text-opacity-7">Cơm chiên bát bửu là một món ăn truyền thống ngon miệng và độc đáo trong ẩm thực Trung Quốc. Tên gọi "bát bửu" có thể dịch là "tám vị", thường ám chỉ sự phong phú và hài hòa của tám thành phần khác nhau được sử dụng trong món ăn này.</p>
                      </div>
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">180.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Súp hải sản</a></h3>
                        <p class="text-white text-opacity-7">Món súp hải sản là một đặc sản biển ngon miệng và phổ biến trên toàn thế giới, thường được yêu thích vì hương vị đậm đà, tươi mới và độ dinh dưỡng cao.</p>
                      </div>
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">400.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Tôm càng rang muối</a></h3>
                        <p class="text-white text-opacity-7">Tôm càng rang muối thường được trang trí bằng rau sống như rau sống, cà chua, và hành lá để tạo điểm nhấn màu sắc và tạo hình thức đẹp mắt. Món tôm thường được phục vụ nóng, trực tiếp từ chảo để giữ được độ giòn.</p>
                      </div>
                    </div>
                  </div>


                </div> <!-- .tab-pane -->

                <div class="tab-pane fade text-left" id="desserts" role="tabpanel" aria-labelledby="desserts-tab">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">75.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Bánh su với kem phô mai hạt dẻ</a></h3>
                        <p class="text-white text-opacity-7">Bánh su với kem phô mai hạt dẻ là một món tráng miệng thơm ngon và hấp dẫn, kết hợp giữa sự giòn tan của bánh su, hương vị béo ngậy của kem phô mai, và sự thơm ngon của hạt dẻ.</p>
                      </div>
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">95.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Bánh xốp Macaron vị trà xanh</a></h3>
                        <p class="text-white text-opacity-7">
    Bánh xốp Macaron vị trà xanh là một món tráng miệng thanh nhã, hấp dẫn và đầy sáng tạo. Với lớp vỏ bánh xốp mỏng và nhẹ, kết hợp với nhân kem trà xanh đặc trưng, món này không chỉ là một tác phẩm nghệ thuật ẩm thực mà còn mang lại trải nghiệm hương vị tuyệt vời.</p>
                      </div>
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">110.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Thạch xoài ăn kèm sữa dừa</a></h3>
                        <p class="text-white text-opacity-7">Thạch xoài ăn kèm sữa dừa là một món tráng miệng mát lạnh, hấp dẫn và ngon miệng, đặc biệt là trong những ngày nắng nóng. Món này thường mang lại hương vị ngọt, chua, và béo ngậy từ xoài cùng với sự mát lạnh của thạch và sữa dừa.</p>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">120.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Chè hạnh nhân tàu hũ với long nhãn</a></h3>
                        <p class="text-white text-opacity-7">Chè hạnh nhân tàu hũ với long nhãn là một món tráng miệng truyền thống trong ẩm thực Việt Nam, kết hợp giữa vị ngọt của hạnh nhân, độ mềm của tàu hủ, và hương thơm đặc trưng của long nhãn.</p>
                      </div>
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">65.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Bánh tiramisu</a></h3>
                        <p class="text-white text-opacity-7">Tiramisu là một món tráng miệng ngon miệng, xuất phát từ Ý, được biết đến với hương vị thơm ngon của cà phê và sự mềm mại, béo ngậy của kem cheese mascarpone.</p>
                      </div>
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">75.00</span>
                        <h3 class="text-white"><a href="#" class="text-white">Bánh Mochi</a></h3>
                        <p class="text-white text-opacity-7">Bánh mochi là một loại bánh truyền thống xuất phát từ Nhật Bản, có texture đặc trưng mềm mại, nhẹ nhàng và có thể coi là một trải nghiệm ẩm thực độc đáo.</p>
                      </div>
                    </div>
                  </div>
                </div> <!-- .tab-pane -->
                <div class="tab-pane fade text-left" id="drinks" role="tabpanel" aria-labelledby="drinks-tab">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">95.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Xoài+Thơm+Chanh dây</a></h3>
                        <p class="text-white text-opacity-7">Thức uống xoài + thơm + chanh dây là một lựa chọn tuyệt vời để giải khát và thưởng thức hương vị tươi mới.</p>
                      </div>
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">160.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Mojto</a></h3>
                        <p class="text-white text-opacity-7">Mojito là một thức uống cocktail có nguồn gốc từ Cuba, nổi tiếng với hương vị tươi mát, chua ngọt và hương thơm của lá bạc hà.</p>
                      </div>
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">350.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Bacardi Gold</a></h3>
                        <p class="text-white text-opacity-7">Bacardi Gold là một dòng rum nổi tiếng thuộc sở hữu của nhãn hiệu nổi tiếng Bacardi, một trong những nhãn hiệu rum lớn nhất và được biết đến trên khắp thế giới.</p>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">75.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Capuchino</a></h3>
                        <p class="text-white text-opacity-7">Cappuccino là một loại cà phê phổ biến và thơm ngon, có nguồn gốc từ Ý. Đây là một loại thức uống cà phê espresso kết hợp với sữa hơi nóng và bọt sữa, tạo ra một hương vị phức tạp và lớp bọt mịn ở trên cùng.</p>
                      </div>
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">25.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Nước Uống có ga</a></h3>
                        <p class="text-white text-opacity-7">Nước uống có ga là một dạng thức uống phổ biến trên khắp thế giới, được biết đến với sự tăng động và cảm giác sảng khoái do có chứa carbon dioxide (CO2) tạo nên bọt khí.</p>
                      </div>
                      <div class="food-menu mb-5">
                        <span class="d-block text-primary h4 mb-3">65.000</span>
                        <h3 class="text-white"><a href="#" class="text-white">Trà &amp; Nước Ép</a></h3>
                        <p class="text-white text-opacity-7">Trà và nước ép là hai loại thức uống phổ biến, đa dạng, và rất phổ biến trên khắp thế giới với nhiều loại và hương vị khác nhau.</p>
                      </div>
                    </div>
                  </div>
                </div> <!-- .tab-pane -->
              </div>
            </div>
          </div>
        </section>

        <!-- END section -->

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

            console.log("Checkin Date:", checkinDate);
                    console.log("Checkout Date:", checkoutDate);
                    console.log("Adults:", adults);
                    console.log("Children:", children);

            // Lưu trữ dữ liệu vào sessionStorage (hoặc có thể sử dụng localStorage)
            sessionStorage.setItem("checkin_date", checkinDate);
            sessionStorage.setItem("checkout_date", checkoutDate);
            sessionStorage.setItem("adults", adults);
            sessionStorage.setItem("children", children);

        });
    });
</script>

<script>
    document.getElementById('adults').addEventListener('change', function() {
        var selectedValue = this.value;

        if (selectedValue === 'custom') {
            // Lấy giá trị hiện tại của "Custom"
            var currentCustomOption = this.querySelector('option[value="custom"]');
            var currentCustomValue = currentCustomOption.value;

            // Sử dụng biến lưu trữ giá trị hiện tại
            var quantity = prompt('Nhập số lượng:', currentCustomValue);

            // Kiểm tra nếu người dùng nhập giá trị mới và là số
            if (quantity !== null && quantity.trim() !== '' && !isNaN(quantity)) {
                // Lưu giá trị vào sessionStorage
                sessionStorage.setItem('customQuantity', quantity);

                // Tạo một option mới với giá trị nhập vào
                var newOption = document.createElement('option');
                newOption.value = quantity;
                newOption.text = quantity;

                // Thêm option mới vào danh sách trước option "Custom"
                this.insertBefore(newOption, currentCustomOption);

                // Chọn option mới đã thêm vào
                this.value = quantity;
                // Cập nhật giá trị trong biến adults nếu cần
                adults = quantity;
            } else {
                // Nếu người dùng không nhập giá trị mới hoặc giá trị không phải là số, hiển thị thông báo
                alert('Vui lòng nhập số lượng.');

                // Chọn lại giá trị từ sessionStorage (nếu có)
                var storedQuantity = sessionStorage.getItem('customQuantity');
                if (storedQuantity) {
                    this.value = storedQuantity;
                    // Cập nhật giá trị trong biến adults nếu cần
                    adults = storedQuantity;
                } else {
                    // Nếu không có giá trị trong sessionStorage, chọn lại giá trị mặc định
                    this.value = '1';
                    // Cập nhật giá trị trong biến adults nếu cần
                    adults = '1';
                }
            }
        }
    });
</script>

<script>
document.getElementById('children').addEventListener('change', function() {
    var selectedValue = this.value;

    if (selectedValue === 'custom') {
        // Lấy giá trị hiện tại của "Custom"
        var currentCustomOption = this.querySelector('option[value="custom"]');
        var currentCustomValue = currentCustomOption.value;

        // Sử dụng biến lưu trữ giá trị hiện tại
        var quantity = prompt('Nhập số lượng:', currentCustomValue);

        // Kiểm tra nếu người dùng nhập giá trị mới và là số
        if (quantity !== null && quantity.trim() !== '' && !isNaN(quantity)) {
            // Lưu giá trị vào sessionStorage
            sessionStorage.setItem('customQuantityChildren', quantity);

            // Tạo một option mới với giá trị nhập vào
            var newOption = document.createElement('option');
            newOption.value = quantity;
            newOption.text = quantity;

            // Thêm option mới vào danh sách trước option "Custom"
            this.insertBefore(newOption, currentCustomOption);

            // Chọn option mới đã thêm vào
            this.value = quantity;
        } else {
            // Nếu người dùng không nhập giá trị mới hoặc giá trị không phải là số, hiển thị thông báo
            alert('Vui lòng nhập số lượng.');

            // Chọn lại giá trị từ sessionStorage (nếu có)
            var storedQuantity = sessionStorage.getItem('customQuantityChildren');
            if (storedQuantity) {
                this.value = storedQuantity;
            } else {
                // Nếu không có giá trị trong sessionStorage, chọn lại giá trị mặc định
                this.value = '1';
            }
        }
    }
});
</script>

<script>
    function validateForm(event) {
        var adults = document.getElementById('adults').value;
        var children = document.getElementById('children').value;
        var checkinDate = document.getElementById('myDateInput').value;
        var checkoutDate = document.getElementById('myDateOutput').value;

        // Kiểm tra xem cả hai trường đã được nhập hay chưa
        if (!checkinDate || !checkoutDate) {
            $('#myModal').modal('show');
            event.preventDefault(); // Ngăn chặn sự kiện submit mặc định
            return false; // Ngăn chặn chuyển hướng trang
        }

        // Kiểm tra trường hợp 1
        if (!adults || !children || (adults === '0' && children === '0') || (adults === '0' && !children) || (!adults && children === '0')) {
            $('#myModalCase1').modal('show');
            event.preventDefault(); // Ngăn chặn sự kiện submit mặc định
            return false; // Ngăn chặn chuyển hướng trang
        }

        // Kiểm tra trường hợp 2
        if (adults === '0' && children === '0') {
            $('#myModalCase1').modal('show');
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

     <!-- Modal cho trường hợp adults và children -->
     <div class="modal fade" id="myModalCase1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelCase1" aria-hidden="true">
         <div class="modal-dialog" role="document">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title font-weight-bold text-center" id="exampleModalLabelCase1">Thông báo</h5>
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                         <span aria-hidden="true">&times;</span>
                     </button>
                 </div>
                 <div class="modal-body">
                     Vui lòng đúng nhập thông tin số người lớn và trẻ em
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-danger text-white" data-dismiss="modal">Đóng</button>
                 </div>
             </div>
         </div>
     </div>

  </body>
</html>