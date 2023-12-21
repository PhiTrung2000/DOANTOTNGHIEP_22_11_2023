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
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="/resources/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="/resources/assets/images/logoSogo.png" />
    <!-- Thư viện Flatpickr từ CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
              <div class="navbar-menu-wrapper d-flex align-items-stretch">
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                  <span class="mdi mdi-menu"></span>
                </button>
                <ul class="navbar-nav navbar-nav-right">
                  <li class="nav-item nav-profile dropdown">
                    <a class="nav-link dropdown-toggle" id="profileDropdown" href="/admin/home" data-bs-toggle="dropdown" aria-expanded="false">
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
                      <a href="/admin/home" class="nav-link">
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
                      <a class="nav-link" href="/admin/home">
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
                          <li class="nav-item"> <a class="nav-link" href="/admin/roomMain">Thông Tin Phòng</a></li>
                          <li class="nav-item"> <a class="nav-link" href="/admin/addRoom">Thêm Phòng</a></li>
                          <li class="nav-item"> <a class="nav-link" href="/admin/inforRoom">Thông tin Loại Phòng</a></li>
                          <li class="nav-item"> <a class="nav-link" href="/admin/addCateRoom">Thêm Loại Phòng</a></li>
                          <li class="nav-item"> <a class="nav-link" href="/admin/inforBookingDT">Thông tin Đặt Phòng</a></li>
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
                          <li class="nav-item"> <a class="nav-link" href="/admin/inforUser">Thông tin người dùng</a></li>
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
                            <li class="nav-item"> <a class="nav-link" href="/admin/addDiscount">Thêm Khuyến Mãi</a></li>
                            <li class="nav-item"> <a class="nav-link" href="/admin/inforDiscount">Thông tin Khuyến Mãi</a></li>
                         </ul>
                      </div>
                    </li>
                    <li class="nav-item">
                         <a class="nav-link" href="/admin/totalpayment">
                            <span class="menu-title">Báo Cáo Doanh Thu</span>
                         </a>
                    </li>
                  </ul>
                </nav>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> Form elements </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Forms</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Form elements</li>
                </ol>
              </nav>
            </div>
            <div class="row">
              <div class="col-md-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Cập nhật phòng</h4>
                    <form action="${action}" method="post" class="forms-sample">
                      <input type="hidden" class="form-control" id="id" name="id" value="${id}">
                      <div class="form-group">
                        <label for="checkinDate">Ngày đến</label>
                        <input type="text" class="form-control" id="checkinDate" name="checkinDate" placeholder="Ngày đến" value=${bookingdt.checkinDate} required >
                      </div>
                      <div class="form-group">
                        <label for="checkoutDate">Ngày đi</label>
                        <input type="text" class="form-control" id="checkoutDate" name="checkoutDate" placeholder="Ngày đi" value=${bookingdt.checkoutDate} required >
                      </div>
                      <div class="form-group">
                          <label for="numOfAdult">Số người lớn</label>
                          <input type="number" class="form-control" id="numOfAdult" name="numOfAdult" placeholder="Số người lớn" value=${Math.round(bookingdt.numOfAdult)} required oninput="calculateTotalPeople()">
                      </div>
                      <div class="form-group">
                          <label for="numOfChild">Số trẻ em</label>
                          <input type="number" class="form-control" id="numOfChild" name="numOfChild" placeholder="Số trẻ em"  value=${Math.round(bookingdt.numOfChild)} required oninput="calculateTotalPeople()">
                      </div>
                      <div class="form-group">
                          <label for="numOfChild">Tổng</label>
                          <input type="number" class="form-control" id="numOfPeople" name="numOfPeople" placeholder="Tổng số người" value=${bookingdt.numOfPeople} required readonly>
                      </div>
                      <div class="form-group">
                          <label for="numOfChild">categoryId</label>
                          <input type="number" class="form-control" id="categoryId" name="categoryId" placeholder="categoryId" value=${category.id} required readonly>
                      </div>
                      <div class="form-group">
                           <label for="numOfChild">bookingId</label>
                           <input type="number" class="form-control" id="bookingId" name="bookingId" placeholder="bookingId" value=${booking.id} required readonly>
                      </div>
                      <input type="submit" value="Cập nhật" class="btn btn-gradient-primary me-2"></button>
                    </form>
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


      </div>
      <!-- page-body-wrapper ends -->
    </div>
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
    <!-- endinject -->
    <script>
        function calculateTotalPeople() {
            // Lấy giá trị từ ô input số người lớn và số trẻ em
            var numOfAdult = parseInt(document.getElementById('numOfAdult').value) || 0;
            var numOfChild = parseInt(document.getElementById('numOfChild').value) || 0;

            // Tính tổng số người
            var totalPeople = numOfAdult + numOfChild;

            // Hiển thị tổng số người vào ô input tổng số người
            document.getElementById('numOfPeople').value = totalPeople;
        }
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Lấy đối tượng input type text
            var checkinDateInput = document.getElementById('checkinDate');
            var checkoutDateInput = document.getElementById('checkoutDate');

            // Khởi tạo Flatpickr cho trường input
            flatpickr(checkinDateInput, {
                dateFormat: 'Y-m-d', // Định dạng ngày 'dd/MM/yyyy'
                allowInput: true, // Cho phép người dùng nhập giá trị bằng tay
                defaultDate: new Date('${bookingdt.checkinDate}'),
            });
            // Khởi tạo Flatpickr cho trường output
            flatpickr(checkoutDateInput, {
                dateFormat: 'Y-m-d', // Định dạng ngày 'dd/MM/yyyy'
                allowInput: true, // Cho phép người dùng nhập giá trị bằng tay
                defaultDate: new Date('${bookingdt.checkoutDate}'),
            });
        });
    </script>

  </body>
</html>