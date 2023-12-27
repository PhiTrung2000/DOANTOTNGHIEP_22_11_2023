<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    <link rel="stylesheet" href="/resources/fonts/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="/resources/fonts/fontawesome/css/font-awesome.min.css">

    <!-- Theme Style -->
    <link rel="stylesheet" href="/resources/css/style.css">
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
                            <li><a href="/user/changeInformation" target="_blank">Thay đổi thông tin</a></li>
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

    <section class="site-hero inner-page overlay" style="background-image: url(/resources/images/hero_4.jpg)" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3" style="font-family: 'Roboto', sans-serif;">Thanh Toán</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="/">Trang chủ</a></li>
              <li>&bullet;</li>
              <li>Thanh toán</li>
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

   <section class="section contact-section" id="next">
       <div class="container">
           <div class="row justify-content-center">
               <div class="col-md-6 text-center" data-aos="fade-up" data-aos-delay="100">
                   <h2 class="section-heading">Thông tin thanh toán</h2>
                   <p class="section-subheading">Vui lòng điền thông tin thanh toán của bạn</p>
               </div>
           </div>
           <div class="row justify-content-center">
               <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                   <form id="availabilityForm" action="/user/payment" method="post">
                      <div class="form-group">
                          <label for="paymentType">Loại Thanh Toán:</label>
                          <select class="form-control" id="paymentType" name="paymentType">
                               <option value="Thẻ tín dụng" ${paymentType == 'Thẻ tín dụng' ? 'selected' : ''}>Thẻ tín dụng</option>
                                  <option value="Thẻ ghi nợ" ${paymentType == 'Thẻ ghi nợ' ? 'selected' : ''}>Thẻ ghi nợ</option>
                                  <option value="Thẻ ngân hàng" ${paymentType == 'Thẻ ngân hàng' ? 'selected' : ''}>Thẻ ngân hàng</option>
                          </select>
                      </div>

                       <div class="form-group">
                           <label for="bankName">Tên Ngân Hàng:</label>
                           <select class="form-control" id="bank" name="bank" value="${bank}">
                                   <option value="Agribank" ${bank == 'Agribank' ? 'selected' : ''}>Agribank</option>
                                   <option value="Viettinbank" ${bank == 'Viettinbank' ? 'selected' : ''}>Viettinbank</option>
                                   <option value="Techcombank" ${bank == 'Techcombank' ? 'selected' : ''}>Techcombank</option>
                                   <option value="Sacombank" ${bank == 'Sacombank' ? 'selected' : ''}>Sacombank</option>
                           </select>
                       </div>

                       <div class="form-group">
                           <label for="accountNumber">Số Tài Khoản:</label>
                           <input type="text" class="form-control" id="numberCard" name="numberCard" value="${numberCard}"
                               placeholder="Nhập số tài khoản" >
                       </div>

                       <div class="form-group">
                           <label for="accountHolder">Chủ Tài Khoản:</label>
                           <input type="text" class="form-control" id="name" name="name" value="${name}" readonly>
                       </div>

                       <div class="form-group">
                           <label for="amount">Số Tiền Thanh Toán:</label>
                           <input type="text" class="form-control" id="amount" name="amount" value="${formattedPrice}" readonly>
                       </div>

                       <div class="form-group">
                           <label for="promoCode">Mã Khuyến Mãi:</label>
                           <input type="text" class="form-control" id="code" name="code" placeholder="Nếu có" value=${code}>
                       </div>
                       <p style="color: red;">${errorMessage}</p>
                       <p style="color: green;">${success}</p>
                       <p style="color: red;">${fail}</p>
                       <!-- Đặt nút bên trong thẻ form -->
                       <input type="submit" id="checkInfoButton" style="background-color: orange; color: white; padding: 10px 20px; border-radius: 40px; border: none; cursor: pointer;" value="Kiểm tra thông tin" onmouseover="this.style.backgroundColor='#ff8c00'" onmouseout="this.style.backgroundColor='orange'">
                   </form>
                   <!-- Form cho việc thanh toán -->
                   <form id="paymentForm" action="/user/processPayment" method="post" style="display: none;">
                       <input type="hidden" name="checkinDate" id="myDateInput">
                       <input type="hidden" name="checkoutDate" id="myDateOutput">
                       <input type="hidden" name="adults" id="adults">
                       <input type="hidden" name="children" id="children">
                       <input type="text" style="display: none;" class="form-control" id="code" name="code" placeholder="Nếu có" value=${code} >
                       <input type="submit" style="background-color: green; color: white; padding: 10px 20px; border-radius: 40px; border: none; cursor: pointer;" value="Thanh toán">
                   </form>
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
        document.addEventListener("DOMContentLoaded", function () {
            var form = document.getElementById("availabilityForm");

            form.addEventListener("submit", function (event) {

                // Lấy giá trị từ các trường input
                var checkinDate = document.getElementById("myDateInput").value;
                var checkoutDate = document.getElementById("myDateOutput").value;
                var adults = document.getElementById("adults").value;
                var children = document.getElementById("children").value;
                var paymentType = document.getElementById("paymentType").value;
                var bank = document.getElementById("bank").value;
                var numberCard = document.getElementById("numberCard").value;

                // Lưu trữ dữ liệu vào sessionStorage (hoặc có thể sử dụng localStorage)
                sessionStorage.setItem("checkin_date", checkinDate);
                sessionStorage.setItem("checkout_date", checkoutDate);
                sessionStorage.setItem("adults", adults);
                sessionStorage.setItem("children", children);
                sessionStorage.setItem("paymentType", paymentType);
                sessionStorage.setItem("bank", bank);
                sessionStorage.setItem("numberCard", numberCard);
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
            var paymentType = document.getElementById("paymentType").value;
            var bank = document.getElementById("bank").value;
            var numberCard = document.getElementById("numberCard").value;

             // Log các giá trị để kiểm tra
                console.log("fromDate:", fromDate);
                console.log("toDate:", toDate);
                console.log("adults:", adults);
                console.log("children:", children);
                console.log("paymentType:", paymentType);
                console.log("bank:", bank);
                console.log("numberCard:", numberCard);

            // Sử dụng giá trị làm gì đó (ví dụ: điền giá trị vào các trường form trên trang checkAvailability)
            document.getElementById("myDateInput").value = fromDate;
            document.getElementById("myDateOutput").value = toDate;
            document.getElementById("adults").value = adults;
            document.getElementById("children").value = children;
            document.getElementById("paymentType").value = paymentType;
            document.getElementById("bank").value = bank;
            document.getElementById("numberCard").value = numberCard;


            // Xóa dữ liệu khỏi sessionStorage nếu cần thiết
            // sessionStorage.removeItem("checkin_date");
            // sessionStorage.removeItem("checkout_date");
            // sessionStorage.removeItem("adults");
            // sessionStorage.removeItem("children");
        });
    </script>

    <script>
        // Lấy giá trị Tên Phòng từ localStorage
        var selectedRoom = sessionStorage.getItem('selectedRoom');

        // Kiểm tra xem giá trị có tồn tại không
        if (selectedRoom) {
            // Sử dụng giá trị Tên Phòng và đặt vào thẻ <span> trong thẻ <p>
            document.getElementById('selectedRoom').innerText = selectedRoom;
        }
    </script>

    <script>
        // Lấy giá trị từ server hoặc từ model (đã được định dạng trước)
        var priceVND = ${priceVND};

        // Định dạng số với dấu chấm phân cách hàng nghìn và không có số lẻ
        var formattedPrice = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND', minimumFractionDigits: 0 }).format(priceVND);

        // Hiển thị giá trị đã định dạng trong thẻ span
        document.getElementById('formattedPriceVND').innerText = formattedPrice;
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Lấy giá trị từ model
            var priceUSD = ${price}; // Giá trị mặc định nếu không có từ server

            // Kiểm tra xem có dạng .0 không
            var formattedPrice = priceUSD % 1 === 0 ? priceUSD.toFixed(0) : priceUSD;

            // Định dạng số với dấu chấm phân cách hàng nghìn và không có số lẻ
            formattedPrice = new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD', minimumFractionDigits: 0 }).format(formattedPrice);

             // Loại bỏ dấu $ ở đầu giá trị
            formattedPrice = formattedPrice.substring(1);

            // Thay thế dấu , bằng dấu .
             formattedPrice = formattedPrice.replace(/,/g, '.');

             // Thêm đơn vị VNĐ đằng trước số tiền
             formattedPrice = "VND " + formattedPrice;

            // Hiển thị giá trị đã định dạng trong trường input
            document.getElementById('amount').value = formattedPrice;
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Lấy giá trị từ model (hoặc từ sessionStorage, tùy vào cách bạn lưu trữ giá trị)
            var nameValue = "${name}"; // Giá trị mặc định nếu không có từ server

            // Nếu có giá trị name, hiển thị nút Thanh toán
            if (nameValue.trim() !== "") {
                document.getElementById("paymentForm").style.display = "block";
                document.getElementById("checkInfoButton").style.display = "none";

                // Lấy các phần tử input và select cần chuyển sang dạng chỉ đọc
                var paymentTypeInput = document.getElementById('paymentType');
                var bankInput = document.getElementById('bank');
                var numberCardInput = document.getElementById('numberCard');
                var nameInput = document.getElementById('name');
                var amountInput = document.getElementById('amount');
                var codeInput = document.getElementById('code');

                // Chuyển sang dạng chỉ đọc
                paymentTypeInput.setAttribute('disabled', 'disabled');
                bankInput.setAttribute('disabled', 'disabled');
                numberCardInput.setAttribute('readonly', 'readonly');
                nameInput.setAttribute('readonly', 'readonly');
                amountInput.setAttribute('readonly', 'readonly');
                codeInput.setAttribute('readonly', 'readonly');
            }
        });
    </script>

  </body>
</html>