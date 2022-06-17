<%-- 
    Document   : addJob
    Created on : Jun 7, 2022, 2:37:25 PM
    Author     : User
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
        <title>Flance.vn</title>
        
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("US")) {
                response.sendRedirect("login.jsp");
                return;
            }
            if (loginUser == null) {
                loginUser = new UserDTO();
            }

        %>
        <h1>Hello: <%= loginUser.getProfileName() %></h1>
        
        <form action="MainController" method="POST">
            Tên project: <input type="text" name="jobName" required="" >
            Description: <input type="text" name="description" required="" >
            Image: <input type="text" name="image">
            Price:<input type="text" name="price" required="" >
            StartTime: <input type="date" name="startTime" required="" >
            EndTime:<input type="date" name="endTime" required="" >
            TagName:<input type="text" name="tagID" required="" >
            <input type="hidden" name="accountID" value="<%= loginUser.getAccountID() %>">
            <input type="submit" name="action" value="Post">
        </form>
    </body>
</html>
