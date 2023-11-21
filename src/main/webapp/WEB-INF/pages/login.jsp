<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Male_Fashion Template">
        <meta name="keywords" content="Male_Fashion, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Login Page</title>
        <!-- Link to Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }

            .login-box {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
                padding: 40px;
                margin: 100px auto;
                max-width: 400px;
            }
        </style>
    </head>
    <body>

        <form action="<c:url value='j_spring_security_check'/>" method="post">
            <div class="login-box">
                <h1 class="text-center">Login</h1>
                <div class="form-group">
                    <c:if test="${message != null && message != ''}">
                        <p style="color: red">${message}</p>
                    </c:if>
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="email" class="form-control" id="username" name="username" placeholder="Enter username">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                </div>
                <button type="submit" class="btn btn-primary btn-block">Sign in</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </div>
        </form>

        <!-- Link to Bootstrap JS and jQuery (put this just before </body>) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
