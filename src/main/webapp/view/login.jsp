<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/login.css">
    <title>Document</title>
</head>
<body>
    <div class="container">
        <div class="title">Login</div>
        <form action="login" method="post" id="form-1">
        	<h3 style="color:red;margin-bottom:10px">${error}</h3>
            <div class="form-input">
                <div class="input-box">
                    <label class="input-span">Username</label>
                    <input value="${username}" name="username" id="username" type="text" placeholder="Enter your username" required>
                    <span class="form-message" style="color: red;"></span>
                </div>
            </div>

            <div class="form-input">
                <div class="input-box">
                    <label class="input-span">Password</label>
                    <input value="${password}" name="password" id="password" type="password" placeholder="Enter your password" required>
                    <span class="form-message" style="color: red;"></span>
                </div>
            </div>

            <div class="form-checkbox">
                <div class="input-checkbox">
                    <input name="remember" type="checkbox" class="check" value="1">
                    <span class="input-name">Remember me</span>
                </div>
            </div>

            <div class="form-submit">
                <input type="submit" class="input-submit" value="Login">
            </div>

            <div class="signup-link">
                Don't have an account? <a href="register.html">Register</a>
            </div>
        </form>
    </div>

</body>
</html>