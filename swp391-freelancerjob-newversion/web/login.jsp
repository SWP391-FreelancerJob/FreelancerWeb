<%-- 
    Document   : login
    Created on : May 19, 2022, 1:18:39 PM
    Author     : User
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Flancer.vn</title>
        <script src='https://www.google.com/recaptcha/api.js?hl=en'></script>
        <script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
        <script src='https://www.google.com/recaptcha/api.js'></script>
        <script src="https://www.google.com/recaptcha/api.js?render=reCAPTCHA_site_key"></script>

        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
        <link rel="stylesheet" href="css/login.css"/>

    </head>
    <body>
        <div class="hero">
        <div class="form-box">
            <img src="image/Freelancer_free-file (1).png" class="web-logo">
            <form action="MainController" method="POST" id="login" class="input-group">
                <input type="text" name="userID" class="input-field" placeholder="Tài Khoản" required>
                <input type="password" name="password" class="input-field" placeholder="Mật Khẩu" required>
                <%
                        String error = (String) request.getAttribute("ERROR");
                        if (error == null) {
                            error = "";
                        }
                    %>
                <h4 style="color: red; text-align: center;"><%= error%></h4>
                <input type="checkbox" class="check-box"><span>Ghi nhớ tài khoản</span>
                <div class="g-recaptcha" data-sitekey="6LfLqgsgAAAAAEPC1O4XchpD1-MosScRM3EHCNVV" data-callback="enableBtn"></div>
                <div class="login-group">
                    <button type="submit" name="action" value="Login" id="button1" disabled="disabled" class="submit-btn"><b>Đăng nhập</b></button>
                    <button type="submit" class="gg-login"><a style="text-decoration: none; color: black; font-weight: 700" href="https://accounts.google.com/o/oauth2/auth?scope=profile+email&redirect_uri=http://localhost:8080/swp391-freelancerJob-main/LoginGoogleServlet&response_type=code
        &client_id=852251482349-aih2jf0kk84k21j4vjulej4k9cfutcpq.apps.googleusercontent.com&approval_prompt=force">Đăng Nhập Bằng Google</a></button>
                </div>
                <h5 class="signup-title">---------- Chưa có tài khoản? ----------</h5>
                <a class="signup" href="register.jsp"><b>Đăng kí</b></a>
            </form>
            

        </div>
             
    </div>
        
        <script>
            function enableBtn() {
                document.getElementById("button1").disabled = false;
            }
        </script>
    </body>

</html>
