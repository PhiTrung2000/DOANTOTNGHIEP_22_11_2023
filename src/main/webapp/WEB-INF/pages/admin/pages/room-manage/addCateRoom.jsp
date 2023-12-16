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
    <link rel="shortcut icon" href="/resources/assets/images/favicon.ico" />
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
                    <h4 class="card-title">Thêm phòng</h4>
                    <form action="addCateRoom" method="post" class="forms-sample">
                      <div class="form-group">
                        <label for="bed">Số giường</label>
                        <input type="number" class="form-control" id="bed" name="bed" placeholder="Số giường" required >
                      </div>
                      <div class="form-group">
                        <label for="name">Tên phòng</label>
                        <select class="form-control form-control-sm" id="name" name="name">
                            <option>Standard</option>
                            <option>Deluxe</option>
                            <option>Suite</option>
                            <option>VIP</option>
                            <option>Family</option>
                            <option>Penthouse</option>
                      </select>
                      </div>
                      <div class="form-group">
                        <label for="numOfPeople">Số lượng người</label>
                        <input type="number" class="form-control" id="numOfPeople" name="numOfPeople" placeholder="Số lượng người" required>
                      </div>
                      <div class="form-group">
                        <label for="price">Giá</label>
                        <input type="number" class="form-control" id="price" name="price" placeholder="Giá" required>
                      </div>
                      <div class="form-group">
                        <label for="status">Tình trạng</label>
                        <select class="form-control form-control-sm" id="status" name="status">
                            <option>Available</option>
                            <option>NoAvailable</option>
                      </select>
                      </div>

                      <input type="submit" value="Thêm Phòng" class="btn btn-gradient-primary me-2"></button>
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
  </body>
</html>