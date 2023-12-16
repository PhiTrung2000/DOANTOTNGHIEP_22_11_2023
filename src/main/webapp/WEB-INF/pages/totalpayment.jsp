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
    <title>Payment Management</title>
    <!-- Include Bootstrap styles and flatpickr scripts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

    <!-- Additional styles for better appearance -->
    <style>
        body {
            padding: 20px;
        }

        table {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="mt-4">BÁO CÁO DOANH THU</h2>

    <form id="totalForm" action="/admin/totalpaymentfilters" method="post" class="mt-4">
        <div class="row">
            <div class="col-md-3">
                <label for="startDate" class="form-label">Ngày bắt đầu:</label>
                <input type="text" id="startDate" name="startDate" class="form-control datepicker">
            </div>

            <div class="col-md-3">
                <label for="endDate" class="form-label">Ngày kết thúc:</label>
                <input type="text" id="endDate" name="endDate" class="form-control datepicker">
            </div>

            <div class="col-md-2 align-self-end">
                <button type="submit" class="btn btn-primary">Lọc</button>
                <button type="button" class="btn btn-secondary" onclick="clearFilter()">Xóa bộ lọc</button>
            </div>
        </div>
    </form>

    <!-- Display filtered payments in a Bootstrap table -->
    <table class="table table-bordered mt-4">
        <thead>
        <tr>
            <th>Mã thanh toán</th>
            <th>Khách hàng</th>
            <th>Ngày thanh toán</th>
            <th>Số tiền thanh toán</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="payment" items="${filteredPayments}">
            <tr>
                <td>${payment.id}</td>
                <td>${payment.name}</td>
                <td><fmt:formatDate value="${payment.date}" pattern="dd-MM-yyyy" /></td>
                <td><fmt:formatNumber value="${payment.paymentAmount}" pattern="#,##0" /> VNĐ </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
     <h3 id="totalRevenue">Tổng doanh thu: <fmt:formatNumber value="${totalRevenue}" pattern="#,##0" /> VNĐ</h3>
     <button type="button" class="btn btn-success" onclick="exportToExcel()">Xuất Excel</button>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Initialize datepickers
        const startDatePicker = flatpickr('#startDate', {
            dateFormat: 'd-m-Y',
            enableTime: false,
            onClose: function(selectedDates, dateStr, instance) {
                // Set minDate for End Date when Start Date is selected
                if (selectedDates.length > 0) {
                    const minDate = selectedDates[0];
                    flatpickr('#endDate', {
                        dateFormat: 'd-m-Y',
                        enableTime: false,
                        minDate: minDate,
                        defaultDate: minDate,
                    });
                }
            }
        });

        const endDatePicker = flatpickr('#endDate', {
            dateFormat: 'd-m-Y',
            enableTime: false,
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