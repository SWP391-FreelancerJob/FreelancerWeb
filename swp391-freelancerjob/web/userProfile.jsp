<%-- 
    Document   : userProfile
    Created on : Jun 21, 2022, 1:36:28 PM
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
        <div>   
        <%  
            UserDTO user = (UserDTO) session.getAttribute("SELECT_USER"); 
        %>
        <h1>Welcome <%= user.getProfileName() %></h1> <br>
        <img src="<%= user.getAvatar() %>" width="50" height="50">
        <p>Full name : <%= user.getProfileName() %> </p> <br>
        <p>Birthday: <%= user.getBirthday() %></p>
        <p>Phone: <%= user.getPhone() %></p> <br>
        <p>Email: <%= user.getEmail() %></p> <br>
        <p>Address: <%= user.getAddress() %></p> <br>
        <%  if(user.getDescribe() == null) 
                user.setDescribe(""); 
        %>
        <p>Describe: <%= user.getDescribe() %></p> <br>
    </body>
</html>
