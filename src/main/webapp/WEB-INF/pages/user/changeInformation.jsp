<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Thay đổi thông tin</title>
		<link rel="icon" type="image/png" href="/resources/images/icon_logo.png">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

		<!-- STYLE CSS -->
		<link rel="stylesheet" href="/resources/signup/css/style.css">
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	</head>

	<body>

		<div class="wrapper" style="background-image: url('/resources/signup/images/bg-registration-form-2.jpg');">
			<div class="inner">
				<form action="/user/changeInformation" method="post">
					<h3>Thông Tin Cá Nhân</h3>
					<div class="form-wrapper">
						<label for="">Họ và tên</label>
						<input type="text" class="form-control" id="fullname" name="name" value="${infoAccount.name}">
					</div>
					<div class="form-group">
						<div class="form-wrapper">
							<label for="">Ngày sinh</label>
							<input type="date" class="form-control" id="dob" name="dayOfBirth" value=${infoAccount.dayOfBirth}>
						</div>
						<div class="form-wrapper">
							<label for="gender">Giới tính:</label>
                        <select class="form-control" id="gender" name="gender" value=${infoAccount.gender}>
                            <option value="Nam">Nam</option>
                            <option value="Nữ">Nữ</option>
                            <option value="Khác">Khác</option>
                        </select>
						</div>
					</div>
					<div class="form-group">
						<div class="form-wrapper">
							<label for="">Địa chỉ</label>
							<input type="text" class="form-control" id="address" name="address" value="${infoAccount.address}">
						</div>
						<div class="form-wrapper">
							<label for="">Số điện thoại</label>
							<input type="tel" class="form-control" id="phone" name="phone" value=${infoAccount.phone}>
						</div>
					</div>
					<input style="display: none" type="text" class="form-control" id="status" name="status" value=${infoAccount.status} hidden>
					<input style="display: none" type="text" class="form-control" id="email" name="email" value=${infoAccount.email} hidden>
					<input style="display: none" type="text" class="form-control" id="password" name="password" value=${infoAccount.password} hidden>
					<p style="color: green"> ${notification} </p>
                    <div class="form-group">
                        <div class="form-wrapper">
						<label>
							<button type="submit">Thay đổi thông tin</button>
						</label>
					    </div>
                    <div class="form-wrapper">
						<label>
							<button id="changePasswordBtn">Đổi Mật Khẩu</button>
						</label>
					</div>
					</div>
					<p style="text-align: center;">Quay Về <a href="/">Trang Chủ</a></p>
				</form>
			</div>
		</div>

<script>
        function showPassword() {
            var passwordInput = document.getElementById("password");

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
            } else {
                passwordInput.type = "password";
            }
        }
</script>

<script>
        document.addEventListener("DOMContentLoaded", function () {
            var selectedCategory = "${infoAccount.gender}";
            document.getElementById("gender").value = selectedCategory;
        });
    </script>

    <script>
        $(document).ready(function() {
            $("#changePasswordBtn").click(function(e) {
                e.preventDefault();

                window.location.href = "/user/changePassword";
            });
        });
    </script>

	</body>
</html>