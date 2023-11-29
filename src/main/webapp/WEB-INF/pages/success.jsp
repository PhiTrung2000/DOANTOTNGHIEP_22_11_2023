<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Đặt Phòng</title>
    <!-- Bổ sung các thư viện hoặc CSS cần thiết tại đây -->
</head>
<body>

    <h1>Form Đặt Phòng</h1>

    <form id="bookingForm" action="/user/processPayment" method="post">

        <label for="customerName">Tên khách hàng:</label>
        <input type="text" id="customerName" name="customerName" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="phone">Số điện thoại:</label>
        <input type="number" id="phone" name="phone" required><br>

        <label for="checkinDate">Ngày nhận phòng:</label>
        <input type="text" id="myDateInput" name="myDateInput" required><br>

        <label for="checkoutDate">Ngày trả phòng:</label>
        <input type="text" id="myDateOutput" name="myDateOutput" required><br>

        <label for="numOfAdult">Số người lớn:</label>
        <input type="number" id="adults" name="adults" required><br>

        <label for="numOfChild">Số trẻ em:</label>
        <input type="number" id="children" name="children" required><br>

        <label for="roomType">Loại phòng:</label>
        <input type="text" id="roomType" name="roomType" required><br>

        <label for="roomPrice">Giá phòng:</label>
        <input type="number" id="roomPrice" name="roomPrice" required><br>

        <label for="discount">Khuyến mãi:</label>
        <input type="number" id="discount" name="discount"><br>

        <label for="totalAmount">Tổng tiền thanh toán:</label>
        <input type="number" id="totalAmount" name="totalAmount" readonly><br>

        <button type="submit">Đặt phòng</button>
    </form>

    <script>
            document.addEventListener("DOMContentLoaded", function () {
                var form = document.getElementById("bookingForm");

                form.addEventListener("submit", function (event) {

                    // Lấy giá trị từ các trường input
                    var checkinDate = document.getElementById("myDateInput").value;
                    var checkoutDate = document.getElementById("myDateOutput").value;
                    var adults = document.getElementById("adults").value;
                    var children = document.getElementById("children").value;

                    // Lưu trữ dữ liệu vào sessionStorage (hoặc có thể sử dụng localStorage)
                    sessionStorage.setItem("checkin_date", checkinDate);
                    sessionStorage.setItem("checkout_date", checkoutDate);
                    sessionStorage.setItem("adults", adults);
                    sessionStorage.setItem("children", children);
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

                 // Log các giá trị để kiểm tra
                    console.log("fromDate:", fromDate);
                    console.log("toDate:", toDate);
                    console.log("adults:", adults);
                    console.log("children:", children);

                // Sử dụng giá trị làm gì đó (ví dụ: điền giá trị vào các trường form trên trang checkAvailability)
                document.getElementById("myDateInput").value = fromDate;
                document.getElementById("myDateOutput").value = toDate;
                document.getElementById("adults").value = adults;
                document.getElementById("children").value = children;

                // Xóa dữ liệu khỏi sessionStorage nếu cần thiết
                // sessionStorage.removeItem("checkin_date");
                // sessionStorage.removeItem("checkout_date");
                // sessionStorage.removeItem("adults");
                // sessionStorage.removeItem("children");
            });
        </script>

</body>
</html>
