<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử đặt phòng</title>
    <!-- Thêm các thư viện CSS Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">Lịch sử đặt phòng</h2>

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
            <th class="text-center">Thao Tác</th>
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
                          <a class="btn btn-success">Hoàn thành</a>
                          <a href="javascript:void(0);" onclick="confirmCancelBooking('${bookList.id}')" class="btn btn-danger">Hủy đặt phòng</a>
                       </c:when>
                       <c:otherwise>
                           <a class="btn btn-success">Hoàn thành</a>
                       </c:otherwise>
                   </c:choose>
               </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Thêm các thư viện JavaScript Bootstrap -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    function confirmCancelBooking(bookingId) {
        var confirmation = confirm("Bạn có chắc chắn muốn hủy đặt phòng không?");

        if (confirmation) {
            window.location.href = "<c:url value='/cancelBooking'/>" + "/" + bookingId;
        } else {
        }
    }
</script>

</body>
</html>
