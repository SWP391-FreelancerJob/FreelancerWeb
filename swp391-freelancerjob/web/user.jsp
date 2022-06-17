<%-- 
    Document   : homePage
    Created on : May 21, 2022, 5:31:30 PM
    Author     : User
--%>

<%@page import="sample.user.UserError"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.jobs.TagDTO"%>
<%@page import="sample.jobs.JobDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="css/user.css">
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
        <title>Flance.vn</title>
    </head>
    <body>

        <div class="container">
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
            
            
            <div class="container">
                <div class="banner">
                    <div class="navbar">
                        <a href="AppearJob">
                            <abbr title="Flance.vn">
                                <img src="image/FLance_free-file.png" class="logo">
                            </abbr>
                        </a>
                        <ul>
                            <li><a href="AppearJob">TRANG CHỦ</a></li>
                            <li><a href="#help">TRỢ GIÚP</a></li>
                            <li class="user">
                                <div class="dropdown1">
                                    <button class="dropbtn">
                                        <a href="#"><img src="<%= loginUser.getAvatar()%>"><%= loginUser.getProfileName()%></a>
                                    </button>
                                    <div class="dropdown1-content">
                                        <a href="profile.jsp">Trang cá nhân</a>
                                        <a href="MainController?action=Logout">Đăng xuất</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="content">
                        <h1>FLANCE</h1>
                        <p>A product by FPT UNIVERSITY</p>
                        <div>
                            <button class="btn" type="button">
                                <a href="#"><span></span>Tìm việc ngay</a>
                            </button>
                            <button class="btn" type="button">
                                <a href="addJob.jsp"><span></span>Đăng bài ngay</a>
                            </button>
                        </div>
                    </div>
                </div>
                <%
                    String search = request.getParameter("search");
                    if (search == null) {
                        search = "";
                    }
                %>
                <div class="topnav">
                    <div class="dropdown">
                        <c:forEach items="${LIST_TAG}" var="tag">
                            <a href="MainController?action=SearchTag&tagID=${tag.tagID}">${tag.tagName}</a>
                        </c:forEach> 
                    </div>                   
                    <form action="MainController" method="POST">
                        <input oninput="searchByName(this)" type="text" value="<%= search%>" name="search" placeholder="Tìm kiếm...">                            
                        <button type="submit" name="action" value="Search">Search</button>
                    </form>
                </div>
                <div class="jobs">
                    <div id="content" class="list">
                        <c:forEach items="${LIST_JOB}" var="job"> 
                            <c:if  test="${job.status == true}">
                                <div class="items">
                                    <div class="post" onclick="window.location.href = 'MainController?action=DetailJob&jobID=${job.jobID}'">
                                        <p id="title">Tiêu đề: ${job.jobName}</p>
                                        <p id="owner">Tên nhà tuyển dụng: ${job.profileName}</p>
                                        <p id="detail">${job.description}</p>
                                        <p id="price">Mức lương: ${job.price} VNĐ</p>
                                        <p id="time">Từ ${job.startTime} đến ${job.endTime}</p>
                                        <a id="tag" href="MainController?action=SearchTag&tagID=${job.tagID}">${job.tagName}</a>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>        
                    </div>
                    <div class="btn-2">
                        <a onclick="loadMore()"><strong>Xem thêm</strong></a>
                    </div>
                </div>
                <jsp:include page="footerHomePage.jsp"></jsp:include>
            </div>


            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script>
                            function loadMore() {
                                var amount = document.getElementsByClassName("post").length;
                                $.ajax({
                                    url: "/swp391-freelancerJob/LoadMoreController",
                                    type: "get",
                                    data: {
                                        exits: amount
                                    },
                                    success: function (data) {
                                        var row = document.getElementById("content");
                                        row.innerHTML += data;
                                    },
                                    error: function (xhr) {
                                        //Do Something to handle error
                                    }
                                });
                            }

                            function searchByName(param) {
                                var txtSearch = param.value;
                                $.ajax({
                                    url: "/swp391-freelancerJob/SearchByAjax",
                                    type: "get", //send it through get method
                                    data: {
                                        search: txtSearch
                                    },
                                    success: function (data) {
                                        var row = document.getElementById("content");
                                        row.innerHTML = data;
                                    },
                                    error: function (xhr) {
                                        //Do Something to handle error
                                    }
                                });
                            }
            </script>

    </body>
</html>
