<%-- 
    Document   : changePassword
    Created on : Jun 9, 2022, 7:31:22 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
        <title>Flance.vn</title>
    </head>
    <body>
        <form action="MainController" method="post">
            Your password<input type ="password" name="password" class="input-field" placeholder="Password"> <br>
            New password<input type ="password" name="newPassword" class="input-field" placeholder="Password"> <br>
            Please enter again<input type ="password" name="confirmPassword" class="input-field" placeholder="Password"> <br>
            <input type="submit" name="action" value="Confirm">
        </form>
    </body>
</html>
