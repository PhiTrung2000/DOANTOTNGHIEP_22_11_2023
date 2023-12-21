<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Purple Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/assets/vendors/css/vendor.bundle.base.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="/resources/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="/resources/assets/images/logoSogo.png" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                      <a class="navbar-brand brand-logo" href="home"><img src="/resources/assets/images/SogoHotel.png" alt="logo" /></a>
                      <a class="navbar-brand brand-logo-mini" href="home"><img src="/resources/assets/images/logoSogo.png" alt="logo" style="width: 30px; height: 30px;" /></a>
                    </div>
              <div class="navbar-menu-wrapper d-flex align-items-stretch">
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                  <span class="mdi mdi-menu"></span>
                </button>
                <ul class="navbar-nav navbar-nav-right">
                  <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" id="profileDropdown" href="home" data-bs-toggle="dropdown" aria-expanded="false">
                      <div class="nav-profile-img">
                        <img src="/resources/assets/images/faces/face1.jpg" alt="image">
                        <span class="availability-status online"></span>
                      </div>
                      <div class="nav-profile-text">
                        <p class="mb-1 text-black">Admin</p>
                      </div>
                    </a>
                    <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="/logout">
                        <i class="mdi mdi-logout me-2 text-primary"></i> Signout </a>
                    </div>
                  </li>
                </ul>
                <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                  <span class="mdi mdi-menu"></span>
                </button>
              </div>
            </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
                  <ul class="nav">
                    <li class="nav-item nav-profile">
                      <a href="home" class="nav-link">
                        <div class="nav-profile-image">
                          <img src="/resources/assets/images/faces/face1.jpg" alt="profile">
                          <span class="login-status online"></span>
                          <!--change to offline or busy as needed-->
                        </div>
                        <div class="nav-profile-text d-flex flex-column">
                          <span class="font-weight-bold mb-2">Admin</span>
                          <span class="text-secondary text-small">Booking Hotel Manager</span>
                        </div>
                        <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="home">
                        <span class="menu-title">Trang Chủ</span>
                        <i class="mdi mdi-home menu-icon"></i>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                        <span class="menu-title">Quản Lí Phòng</span>
                        <i class="menu-arrow"></i>
                        <i class="mdi mdi-crosshairs-gps menu-icon"></i>
                      </a>
                      <div class="collapse" id="ui-basic">
                        <ul class="nav flex-column sub-menu">
                          <li class="nav-item"> <a class="nav-link" href="roomMain">Thông Tin Phòng</a></li>
                          <li class="nav-item"> <a class="nav-link" href="addRoom">Thêm Phòng</a></li>
                          <li class="nav-item"> <a class="nav-link" href="inforRoom">Thông tin Loại Phòng</a></li>
                          <li class="nav-item"> <a class="nav-link" href="addCateRoom">Thêm Loại Phòng</a></li>
                          <li class="nav-item"> <a class="nav-link" href="inforBookingDT">Thông tin Đặt Phòng</a></li>
                        </ul>
                      </div>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" data-bs-toggle="collapse" href="#user-manage" aria-expanded="false" aria-controls="user-manage">
                        <span class="menu-title">Quản Lí Người Dùng</span>
                        <i class="menu-arrow"></i>
                        <i class="mdi mdi-crosshairs-gps menu-icon"></i>
                      </a>
                      <div class="collapse" id="user-manage">
                        <ul class="nav flex-column sub-menu">
                          <li class="nav-item"> <a class="nav-link" href="inforUser">Thông tin người dùng</a></li>
                          <li class="nav-item"> <a class="nav-link" href="/dangky">Thêm người dùng</a></li>
                        </ul>
                      </div>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" data-bs-toggle="collapse" href="#discount-manage" aria-expanded="false" aria-controls="#discount-manage">
                        <span class="menu-title">Quản Lí Khuyến Mãi</span>
                        <i class="menu-arrow"></i>
                        <i class="mdi mdi-crosshairs-gps menu-icon"></i>
                      </a>
                      <div class="collapse" id="discount-manage">
                         <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="addDiscount">Thêm Khuyến Mãi</a></li>
                            <li class="nav-item"> <a class="nav-link" href="inforDiscount">Thông tin Khuyến Mãi</a></li>
                         </ul>
                      </div>
                    </li>
                    <li class="nav-item">
                         <a class="nav-link" href="totalpayment">
                            <span class="menu-title">Báo Cáo Doanh Thu</span>
                         </a>
                    </li>
                  </ul>
                </nav>
        <!-- partial -->
      <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h2 class="text-center">Thông Tin Đặt Phòng</h2>
                    </div>
                    <div class="card-body">
                        <form action="searchBookingDT" method="post">
                            <div class="container">
                                <div class="row text-center">
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <label for="checkinDate" class="font-weight-bold text-black">Ngày đến</label>
                                            <div class="field-icon-wrap">
                                                <input type="text" id="checkinDate" name="checkinDate" class="form-control" style="background-color: white;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <label for="checkoutDate" class="font-weight-bold text-black">Ngày đi</label>
                                            <div class="field-icon-wrap">
                                                <input type="text" id="checkoutDate" name="checkoutDate" class="form-control" style="background-color: white;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center align-items-center">
                                        <button type="submit" class="btn btn-primary" style="border-radius: 5px; width: 150px;">Search</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr class="text-center">
                                    <th>ID</th>
                                    <th>Ngày đến</th>
                                    <th>Ngày đi</th>
                                    <th>Số người lớn</th>
                                    <th>Số trẻ em</th>
                                    <th>Tổng số người</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listBookingDT}" var="b">
                                <tr class="text-center">
                                    <td>${b.id}</td>
                                    <td><fmt:formatDate value="${b.checkinDate}" pattern="dd-MM-yyyy" /></td>
                                    <td><fmt:formatDate value="${b.checkoutDate}" pattern="dd-MM-yyyy" /></td>
                                    <td>${fn:replace(b.numOfAdult, '.0', '')}</td>
                                    <td>${fn:replace(b.numOfChild, '.0', '')}</td>
                                    <td>${fn:replace(b.numOfPeople, '.0', '')}</td>
                                    <td>
                                        <a class="btn btn-primary btn-sm" href="<c:url value='/admin/updateBookingDT/${b.id}'/>">Sửa</a>
                                        <a class="btn btn-primary btn-sm" href="<c:url value='/admin/deleteBooking/${b.id}'/>">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.html -->

          <!-- partial -->
        </div>
        <!-- main-panel ends -->

      <!-- page-body-wrapper ends -->

    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="/resources/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="/resources/assets/js/off-canvas.js"></script>
    <script src="/resources/assets/js/hoverable-collapse.js"></script>
    <script src="/resources/assets/js/misc.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- endinject -->
    <script>
                document.addEventListener('DOMContentLoaded', function () {
                    // Initialize datepickers
                    const startDatePicker = flatpickr('#checkinDate', {
                        dateFormat: 'd-m-Y',
                        onClose: function(selectedDates, dateStr, instance) {
                            // Set minDate for End Date when Start Date is selected
                            if (selectedDates.length > 0) {
                                const minDate = selectedDates[0];
                                flatpickr('#checkoutDate', {
                                    dateFormat: 'd-m-Y',
                                    minDate: minDate,
                                    defaultDate: minDate,
                                });
                            }
                        }
                    });

                    const endDatePicker = flatpickr('#checkoutDate', {
                        dateFormat: 'd-m-Y',
                    });
                });
            </script>
  </body>
</html>