<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/detailJob.css">
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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
        
        <%
                    String search = request.getParameter("search");
                    if (search == null) {
                        search = "";
                    }
                %>
        
        <div class="container">
        <div class="topnav">
            <div class="dropdown">
                <a class="dropbtn" href="#">Lĩnh vực</a>
                <div class="dropdown-content">
                    <c:forEach items="${LIST_TAG}" var="tag">
                            <a href="MainController?action=SearchTag&tagID=${tag.tagID}">${tag.tagName}</a>
                        </c:forEach> 
                </div>
            </div>
            <div class="dropdown">
                <a class="dropbtn" href="./Login.html">Danh sách freelancer</a>
                <div class="dropdown-content">
                    <a href="./Login.html">Lập trình</a>
                    <a href="./Login.html">Thiết kế</a>
                    <a href="./Login.html">Dịch thuật</a>
                    <a href="./Login.html">Tào lao</a>
                    <a href="./Login.html">Khác</a>
                </div>
            </div>
            <div class="dropdown">
                <a class="dropbtn" href="./Login.html">Sản phẩm đã làm</a>
                <div class="dropdown-content">
                    <a href="./Login.html">Lập trình</a>
                    <a href="./Login.html">Thiết kế</a>
                    <a href="./Login.html">Dịch thuật</a>
                    <a href="./Login.html">Tào lao</a>
                    <a href="./Login.html">Khác</a>
                </div>
            </div>
             <form action="MainController" method="POST">
                    <input oninput="searchByName(this)" type="text" value="<%= search%>" name="search" placeholder="Tìm kiếm...">                            
                    <button type="submit" name="action" value="Search">Search</button>
                </form>
        </div>
        <div class="content">
            <div class="job">
                <p id="title">Tiêu đề : ${JOB.jobName}</p>
                    <p id="owner">Tên nhà tuyển dụng: ${JOB.profileName}</p>
                    <p id="price">Ngân sách: <span> ${JOB.price} đ</span></p>
                <p id="detail">${JOB.description}</p>
                <img src="${JOB.image}" alt="Job" width="400" height="300">
                <p id="time">Từ ${JOB.startTime} đến ${JOB.endTime}</p>
                <a id="tag" href="MainController?action=SearchTag&tagID=${JOB.tagID}">${JOB.tagName}</a>
            </div>
            <div class="owner">
                <div class="user">
                    <a href="./footer.html"><img src=""><strong> Người dùng Flance</strong></a>
                </div>
                <div class="contact">
                    <br>
                    <p id="contact"> Thông tin liên hệ 1</p>
                    <p id="contact"> Thông tin liên hệ 2</p>
                    <p id="contact"> Hình thức thanh toán</p>
                </div>
            </div>
        </div>
        
        <jsp:include page="footerHomePage.jsp"></jsp:include>
    </div>
    </body>
</html>
