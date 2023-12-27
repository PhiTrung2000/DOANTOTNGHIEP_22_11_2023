<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
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
                        <li><a href="/rooms">Phòng</a></li>
                        <li><a href="/about">Giới Thiệu</a></li>
                        <li><a href="/destination">Điểm đến</a></li>
                        <li><a href="/contact">Liên Hệ</a></li>
                        <li><a href="/restaurant">Nhà Hàng</a></li>
                        <li><a href="/dangky">Đăng Ký</a></li>
                        <c:if test="${not empty username}">
                            <li style="background-color: #4CAF50; color: #fff; padding: 10px; border-radius: 55px; font-size: 23px; display: inline-block;">Welcome, ${username}</li>
                            <li class="active"><a href="/user/history" target="_blank">Lịch sử đặt phòng</a></li>
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

    <section class="site-hero inner-page overlay" style="background-image: url('/resources/images/hero_4.jpg');" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row site-hero-inner justify-content-center align-items-center">
          <div class="col-md-10 text-center" data-aos="fade">
            <h1 class="heading mb-3" style="font-family: 'Roboto', sans-serif;">Lịch Sử Đặt Phòng</h1>
            <ul class="custom-breadcrumbs mb-4">
              <li><a href="/">Trang Chủ</a></li>
              <li>&bullet;</li>
              <li>Lịch sử đặt phòng</li>
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
      <section class="section" id="next">
<div class="container mt-5">
    <h2 class="mb-4" style="font-family: 'Roboto', sans-serif; text-align: center;">Thông tin đặt phòng</h2>


    <table class="table table-bordered">
        <thead>
        <tr>
            <th class="text-center">Mã đặt phòng</th>
            <th class="text-center">Ngày Đặt</th>
            <th class="text-center">Ngày Đến</th>
            <th class="text-center">Ngày Đi</th>
            <th class="text-center">Số Người Lớn</th>
            <th class="text-center">Số Trẻ Em</th>
            <th class="text-center">Loại Phòng</th>
            <th class="text-center">Trạng thái</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${bookingList}" var="bookList">
            <tr>
                <td class="text-center">${bookList.id}</td>
                <td class="text-center"><fmt:formatDate value="${bookList.bookingdate}" pattern="dd-MM-yyyy" /></td>
                <!-- Các trường khác của BookingEntity -->
                <c:forEach var="bookingDetails" items="${bookList.bookingDetailsEntityList}" varStatus="status">
                    <td class="text-center"><fmt:formatDate value="${bookingDetails.checkinDate}" pattern="dd-MM-yyyy" /></td>
                    <td class="text-center"><fmt:formatDate value="${bookingDetails.checkoutDate}" pattern="dd-MM-yyyy" /></td>
                    <td class="text-center">${fn:replace(bookingDetails.numOfAdult, '.0', '')}</td>
                    <td class="text-center">${fn:replace(bookingDetails.numOfChild, '.0', '')}</td>
                    <td class="text-center">${bookingDetails.category.name}</td>
                </c:forEach>
               <td class="text-center">
                   <c:set var="currentDate" value="<%= new java.util.Date() %>" />
                   <c:set var="bookingDate" value="${bookList.bookingdate}" />

                   <c:choose>
                       <c:when test="${currentDate.time - bookingDate.time < 2 * 24 * 60 * 60 * 1000}">
                       <c:if test="${bookList.status eq 'Cancel'}">
                            <a style="color: white;" class="btn btn-danger">Đã hủy</a>
                       </c:if>
                       <c:if test="${bookList.status ne 'Cancel'}">
                          <a style="color: white;" class="btn btn-success">Hoàn thành</a>
                          <form id="cancelBookingForm" action="/user/cancel" method="post" class="d-inline" onsubmit="return ConfirmForm(event)">
                              <input type="hidden" name="bookingId" class="bookingIdInput" value="${bookList.id}">
                              <input type="submit" value="Hủy" class="btn btn-danger" >
                          </form>
                       </c:if>
                       </c:when>
                       <c:otherwise>
                       <c:if test="${bookList.status eq 'Cancel'}">
                            <a style="color: white;" class="btn btn-danger">Đã hủy</a>
                       </c:if>
                       <c:if test="${bookList.status ne 'Cancel'}">
                         <a style="color: white;" class="btn btn-success">Hoàn thành</a>
                       </c:if>
                       </c:otherwise>
                   </c:choose>
               </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
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

    <!-- Modal -->
    <div class="modal fade" id="cancelReservationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title font-weight-bold" id="exampleModalLabel">Xác nhận hủy đặt phòng</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Bạn có chắc chắn muốn hủy đặt phòng?</p>
                    <p>Sau khi hủy bạn sẽ được hoàn trả lại 80% số tiền đã thanh toán</p>
                    <p>Lưu ý: Thao tác này không thể hoàn tác lại</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary text-white" id="confirmCancel">Xác nhận</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function ConfirmForm(event) {
            // Ngăn chặn gửi form mặc định
            event.preventDefault();

            // Lấy giá trị bookingId từ thẻ input
            var bookingIdInput = event.target.querySelector('.bookingIdInput');
            var bookingId = bookingIdInput.value;

            // Hiển thị modal xác nhận hủy đặt phòng
            $('#cancelReservationModal').modal('show');

            // Xử lý sự kiện nút xác nhận trong modal
            document.getElementById('confirmCancel').addEventListener('click', function() {
                // Đóng modal
                $('#cancelReservationModal').modal('hide');

                // Cập nhật action của form với giá trị bookingId
                var form = event.target;
                form.action = '/user/cancel/' + bookingId;

                // Gửi form
                form.submit();
            });
        }
    </script>

  </body>
</html>