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
                            <a class="btn btn-danger">Đã hủy</a>
                       </c:if>
                       <c:if test="${bookList.status ne 'Cancel'}">
                          <a class="btn btn-success">Hoàn thành</a>
                          <form id="cancelBookingForm" action="/user/cancel" method="post" class="d-inline" onsubmit="return ConfirmForm(event)">
                              <input type="hidden" name="bookingId" class="bookingIdInput" value="${bookList.id}">
                              <input type="submit" value="Hủy đặt phòng" class="btn btn-danger" >
                          </form>
                       </c:if>
                       </c:when>
                       <c:otherwise>
                       <c:if test="${bookList.status eq 'Cancel'}">
                            <a class="btn btn-danger">Đã hủy</a>
                       </c:if>
                       <c:if test="${bookList.status ne 'Cancel'}">
                         <a class="btn btn-success">Hoàn thành</a>
                       </c:if>
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
