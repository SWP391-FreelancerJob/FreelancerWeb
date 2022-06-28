<%-- 
    Document   : register
    Created on : May 30, 2022, 7:54:02 PM
    Author     : User
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flancer.vn</title>
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">  
        <link rel="stylesheet" href="css/signup.css"/>

    </head>
    <body>
        
    <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
            if(userError.getAccountIDError() == null){
                userError.setAccountIDError("");
            }
            if(userError.getConfirmError() == null){
                userError.setConfirmError("");
            }
            if(userError.getEmailError() == null){
                userError.setEmailError("");
            }
            if(userError.getBirthdayError() == null){
                userError.setBirthdayError("");
            }
    %>
        
        <div class="hero">
        <div class="form-box">
            <div class="form-title">
                <b>Đăng kí</b>
            </div>

            <form action="MainController" method="POST" id="signup" class="input-group">
                    <input type="text" name="userID" class="input-field" placeholder="Tài Khoản/Username" required>
                    <div style="color: red"><%= userError.getAccountIDError() %> </div>
                    <input type="text" name="userName" class="input-field" placeholder="Tên người dùng/Fullname"
                        required>
                    <input type="password" name="password" class="input-field" placeholder="Mật khẩu/Password">
                    <input type="password" name="confirmPassword" class="input-field"
                        placeholder="Nhập lại mật khẩu/Confirm Password">
                    <div style="color: red"><%= userError.getConfirmError() %> </div>
                    <input type="email" name="email" class="input-field" placeholder="Email" required>
                    <div style="color: red"><%= userError.getEmailError() %> </div>
                    <input type="text" name="address" class="input-field" placeholder="Address">
                    <input type="tel" name="phone" class="input-field" placeholder="Số điện thoại/Phonenumber">
                    <input type="text" name="birthday" class="input-field" placeholder="Ngày sinh" onfocus="(this.type='date')">
                    <div style="color: red"><%= userError.getBirthdayError() %> </div>
                    <input type="checkbox" class="check-box"><label>I agree to the term & conditions</label>
                    <button class="submit-btn" name="action" value="Register">Đăng kí</button>
            </form>
    <div style="text-align: center; margin-top: 10px">Already have an account? <a style="text-decoration: none" href="login.jsp">Login here</a></div>
        </div>
    </div>

        
    </body>
</html>
