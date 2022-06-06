<%-- 
    Document   : admin
    Created on : May 21, 2022, 5:32:00 PM
    Author     : User
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flancer.vn</title>
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
        
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
                return;
            }
            if (loginUser == null) {
                loginUser = new UserDTO();
            }


        %>
        <a href="MainController?action=Logout">Logout</a>
        <h1>Hello Admin</h1>
    </body>
</html>
