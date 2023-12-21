<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sogo Hotel Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="/resources/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/resources/assets/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="/resources/assets/css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="/resources/assets/images/logoSogo.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
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
        <!-- partial:partials/_sidebar.html -->
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
                  <li class="nav-item"> <a class="nav-link" href="addCateRoom">Thêm Loại Phòng</a></li>
                  <li class="nav-item"> <a class="nav-link" href="inforRoom">Thông tin Loại Phòng</a></li>
                   <li class="nav-item"> <a class="nav-link" href="addRoom">Thêm Phòng</a></li>
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
        <div class="container">
            <h2 style="text-align: center;" class="mt-4">BÁO CÁO DOANH THU</h2>

            <form id="totalForm" action="/admin/totalpaymentfilters" method="post" class="mt-4">
                <div class="row">
                    <div class="col-md-3">
                        <label for="startDate" class="form-label">Ngày bắt đầu:</label>
                        <input style="background-color:white" type="text" id="startDate" name="startDate" class="form-control datepicker">
                    </div>

                    <div class="col-md-3">
                        <label for="endDate" class="form-label">Ngày kết thúc:</label>
                        <input style="background-color:white" type="text" id="endDate" name="endDate" class="form-control datepicker">
                    </div>

                    <div class="col-md-2 align-self-end">
                        <button type="submit" class="btn btn-primary">Lọc</button>
                        <button type="button" class="btn btn-secondary" onclick="clearFilter()">Xóa bộ lọc</button>
                    </div>
                </div>
            </form>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead class="thead-dark">
                                <tr class="text-center">
                                   <th style="width:30px">Mã thanh toán</th>
                                   <th style="width:300px">Khách hàng</th>
                                   <th>Ngày thanh toán</th>
                                   <th>Số tiền thanh toán</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="payment" items="${filteredPayments}">
                                <tr class="text-center">
                                    <td>${payment.id}</td>
                                    <td>${payment.name}</td>
                                    <td><fmt:formatDate value="${payment.date}" pattern="dd-MM-yyyy" /></td>
                                    <td><fmt:formatNumber value="${payment.paymentAmount}" pattern="#,##0" /> VNĐ </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
             <h3 style="text-align:center;" id="totalRevenue">Tổng doanh thu: <fmt:formatNumber value="${totalRevenue}" pattern="#,##0" /> VNĐ</h3>
             <button type="button" class="btn btn-success" onclick="exportToExcel()">Xuất Excel</button>
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
    <script src="/resources/assets/vendors/chart.js/Chart.min.js"></script>
    <script src="/resources/assets/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="/resources/assets/js/off-canvas.js"></script>
    <script src="/resources/assets/js/hoverable-collapse.js"></script>
    <script src="/resources/assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="/resources/assets/js/dashboard.js"></script>
    <script src="/resources/assets/js/todolist.js"></script>
    <!-- End custom js for this page -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Initialize datepickers
            const startDatePicker = flatpickr('#startDate', {
                dateFormat: 'd-m-Y',
                onClose: function(selectedDates, dateStr, instance) {
                    // Set minDate for End Date when Start Date is selected
                    if (selectedDates.length > 0) {
                        const minDate = selectedDates[0];
                        flatpickr('#endDate', {
                            dateFormat: 'd-m-Y',
                            minDate: minDate,
                            defaultDate: minDate,
                        });
                    }
                }
            });

            const endDatePicker = flatpickr('#endDate', {
                dateFormat: 'd-m-Y',
            });
        });
    </script>



    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var form = document.getElementById("totalForm");

            form.addEventListener("submit", function (event) {

                // Lấy giá trị từ các trường input
                var startDate = document.getElementById("startDate").value;
                var endDate = document.getElementById("endDate").value;


                // Lưu trữ dữ liệu vào sessionStorage
                sessionStorage.setItem("startDate", startDate);
                sessionStorage.setItem("endDate", endDate);

            });
        });

    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Lấy giá trị từ sessionStorage
            var startDate = sessionStorage.getItem("startDate");
            var endDate = sessionStorage.getItem("endDate");

            // Sử dụng giá trị làm gì đó (ví dụ: điền giá trị vào các trường form trên trang checkAvailability)
            document.getElementById("startDate").value = startDate;
            document.getElementById("endDate").value = endDate;


            // Xóa dữ liệu khỏi sessionStorage nếu cần thiết
            // sessionStorage.removeItem("checkin_date");
            // sessionStorage.removeItem("checkout_date");
            // sessionStorage.removeItem("adults");
            // sessionStorage.removeItem("children");
            sessionStorage.removeItem("startDate");
            sessionStorage.removeItem("endDate");
        });
    </script>

    <script>
        function clearFilter() {
            document.getElementById("startDate").value = "";
            document.getElementById("endDate").value = "";

            startDatePicker.setDate(null);
            endDatePicker.set('minDate', null);

            sessionStorage.removeItem("startDate");
            sessionStorage.removeItem("endDate");
        }
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var buttonPressed = localStorage.getItem('buttonPressed');

            if (!buttonPressed) {
                document.querySelector('button.btn-primary').click();
                localStorage.setItem('buttonPressed', 'true');
            } else {
                localStorage.removeItem('buttonPressed');
            }
        });
    </script>

    <script>
    function exportToExcel() {
        // Get table data
        var table = document.querySelector('table');
        var tableData = [];

        // Add header row
        var headerRow = ['BÁO CÁO DOANH THU'];
        tableData.push(headerRow);
        // Add date range
        var startDate = document.getElementById("startDate").value;
        var endDate = document.getElementById("endDate").value;
        tableData.push(['Từ ngày', startDate, 'Đến ngày', endDate]);

        // Add data rows
        Array.from(table.querySelectorAll('tr')).forEach(row =>
            tableData.push(Array.from(row.querySelectorAll('td, th')).map(cell => cell.textContent))
        );

        // Add empty row for spacing
        tableData.push([]);

        // Add total revenue
        var totalRevenue = document.getElementById("totalRevenue").textContent;
        tableData.push(['', totalRevenue]);

        // Create a worksheet
        var ws = XLSX.utils.aoa_to_sheet(tableData);

        // AutoFit Column Width
        var range = XLSX.utils.decode_range(ws['!ref']);
        for (var i = range.s.c; i <= range.e.c; ++i) {
            var maxCellLength = 0;
            for (var R = range.s.r; R <= range.e.r; ++R) {
                var cellAddress = { c: i, r: R };
                var cellRef = XLSX.utils.encode_cell(cellAddress);
                var cellValue = ws[cellRef] ? ws[cellRef].v : '';
                maxCellLength = Math.max(maxCellLength, cellValue.toString().length);
            }
            ws['!cols'] = ws['!cols'] || [];
            ws['!cols'][i] = { wch: maxCellLength + 2 }; // Add some padding
        }

        // Create a workbook
        var wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');

        // Save the file
        XLSX.writeFile(wb, 'table_data.xlsx');
    }
    </script>
  </body>
</html>