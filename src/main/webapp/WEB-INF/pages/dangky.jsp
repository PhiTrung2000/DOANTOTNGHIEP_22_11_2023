<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<title>Đăng ký</title>
		<link rel="icon" type="image/png" href="/resources/images/icon_logo.png">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
		
		<!-- STYLE CSS -->
		<link rel="stylesheet" href="/resources/signup/css/style.css">
	</head>

	<body>

		<div class="wrapper" style="background-image: url('/resources/signup/images/bg-registration-form-2.jpg');">
			<div class="inner">
				<form action="/dangky" method="post">
					<h3>Đăng Ký Thành Viên</h3>
					<div class="form-group">
						<div class="form-wrapper">
							<label for="">Email</label>
							<input type="email" class="form-control" id="email" name="email">
						</div>
						<div class="form-wrapper">
							<label for="">Password</label>
							<input type="password" class="form-control" id="password" name="password">
						</div>
						<div>
							<label for="">Show</label>
							<input type="checkbox" onclick="showPassword()" style="transform: scale(0.4); margin-top: 10px;" class="form-control">
						</div>
					</div>
					<div class="form-wrapper">
						<label for="">Họ và tên</label>
						<input type="text" class="form-control" id="fullname" name="name">
					</div>
					<div class="form-group">
						<div class="form-wrapper">
							<label for="">Ngày sinh</label>
							<input type="date" class="form-control" id="dob" name="dayOfBirth">
						</div>
						<div class="form-wrapper">
							<label for="gender">Giới tính:</label>
                        <select class="form-control" id="gender" name="gender">
                            <option value="Nam">Nam</option>
                            <option value="Nữ">Nữ</option>
                            <option value="Khác">Khác</option>
                        </select>
						</div>
					</div>
					<div class="form-group">
						<div class="form-wrapper">
							<label for="">Địa chỉ</label>
							<input type="text" class="form-control" id="address" name="address">
						</div>
						<div class="form-wrapper">
							<label for="">Số điện thoại</label>
							<input type="tel" class="form-control" id="phone" name="phone">
						</div>
					</div>
					<div class="form-wrapper">
						<label>
							<button type="submit">Đăng ký</button>
						</label>
					</div>					
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

	</body>
</html>