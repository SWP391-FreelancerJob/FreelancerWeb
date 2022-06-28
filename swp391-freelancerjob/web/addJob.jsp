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
        <link rel="stylesheet" href="css/addJob.css">
        <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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
        <%
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <div class="container">
        <div class="topnav">
            <form action="MainController" method="POST">
                    <input oninput="searchByName(this)" type="text" value="<%= search%>" name="search" placeholder="Tìm kiếm...">                            
                    <input type="hidden" name="action" value="Search">
                </form>
        </div>
        <div class="content">
            <div class="form">
            <form action="MainController" method="POST">
                Tên dự án: <input type="text" name="jobName" required="" id="title"><br>
                Mô tả: <input type="text" name="description" required="" id="detail"><br>
                Hình ảnh: <input type="text" name="image" id="img"><br>
                Giá: <input type="text" name="price" required="" id="price"><br>
                Thời gian: <input type="date" name="startTime" required="" id="time"> đến <input type="date" name="endTime" required="" id="time"><br>
                Thuộc lĩnh vực: <select name="tagID" id="tag" class="box" >
                    <option value="T01">Thiết kế đồ họa</option>
                    <option value="T02">Quảng cáo</option>
                    <option value="T03">Văn bản và dịch thuật</option>
                    <option value="T04">Chỉnh sửa hình ảnh</option>
                    <option value="T05">Chỉnh sửa videos</option>
                    <option value="T06">Công nghệ thông tin</option>
                    <option value="T07">Kinh doanh</option>
                    <option value="T08">Khác</option>
                </select><br>
                <input type="hidden" name="accountID" value="<%= loginUser.getAccountID() %>">
                <button name="action" value="Post">Đăng bài</button>
            </form>
        </div>
        </div>
        
        <jsp:include page="footerHomePage.jsp"></jsp:include>
    </div>
        
    </body>
</html>
