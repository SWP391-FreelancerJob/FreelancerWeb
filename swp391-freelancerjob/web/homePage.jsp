
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.jobs.JobDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
            <jsp:useBean id="a" class="sample.user.UserDAO" scope="request"></jsp:useBean>        
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
            <title>Flancer.vn</title>

            <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
            <link rel="stylesheet" href="css/homePage.css">
            <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

        </head>
        <body>       
            <div class="container">
                <div class="banner">
                    <div class="navbar">
                        <a href="homePage.jsp">
                            <abbr title="Freelancer">
                                <img src="image/Freelancer_free-file (1).png" class="logo">
                            </abbr>
                        </a>
                        <ul>
                            <li><a href="login.jsp">Trang chủ</a></li>
                            <li><a href="#help">Trợ giúp</a></li>
                            <li><a href="login.jsp">Đăng nhập</a></li>
                            <li><a href="register.jsp">Đăng ký</a></li>
                        </ul>
                    </div>
                    <div class="content">
                        <h1>FLANCE</h1>
                        <p>A product by FPT UNIVERSITY</p>
                        <div>
                            <button class="btn" type="button">
                                <a href="login.jsp"><span></span>Tìm việc ngay</a>
                            </button>
                            <button class="btn" type="button">
                                <a href="login.jsp"><span></span>Đăng bài ngay</a>
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
                <form action="MainController" method="POST">
                    <input type="text" value="<%= search%>" name="search"  placeholder="Search...">                            
                    <button type="submit" name="action" value="SearchHomePage">Search</button>
                </form>
            </div>

            <div class="list">
                <c:forEach items="${a.listJobHomePage}" var="job"> 
                    <c:if  test="${job.status == true}">
                        <div class="items">
                            <div class="post">
                                <p id="title">${job.jobName}</p>
                                <p id="owner">Tên nhà tuyển dụng: ${job.profileName}</p>
                                <p id="detail">${job.description}</p>
                                <p id="price">Mức lương: ${job.price} VNĐ</p>
                                <p id="time">${job.startTime}</p>
                                <a id="tag" href="#">${job.tagName}</a>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>    

            
            <footer class="footer" id="help">
                <div class="container-footer">
                    <div class="row">
                        <div class="footer-col">
                            <h4>Giới thiệu</h4>
                            <ul>
                                <li><a href="./footer.html">Về chúng tôi</a></li>
                                <li><a href="./footer.html">Dịch vụ</a></li>
                                <li><a href="./footer.html">Các ứng dụng liên kết</a></li>
                                <li><a href="./footer.html">Nhà tài trợ</a></li>
                                <li><a href="./footer.html">blog</a></li>
                            </ul>
                        </div>
                        <div class="footer-col">
                            <h4>Hướng dẫn</h4>
                            <ul>
                                <li><a href="./footer.html">Hướng dẫn hoàn thiện hồ sơ</a></li>
                                <li><a href="./footer.html">Hướng dẫn tìm việc</a></li>
                                <li><a href="./footer.html">Hướng dẫn đăng dự án</a></li>
                                <li><a href="./footer.html">Hướng dẫn thanh toán</a></li>
                                <li><a href="./footer.html">các hình thức thanh toán</a></li>
                            </ul>
                        </div>
                        <div class="footer-col">
                            <h4>Quy định</h4>
                            <ul>
                                <li><a href="./footer.html">điều khoản sử dụng</a></li>
                                <li><a href="./footer.html">điều khoản khách hàng</a></li>
                                <li><a href="./footer.html">điều khoản freelancer</a></li>
                                <li><a href="./footer.html">điều khoản thanh toán</a></li>
                                <li><a href="./footer.html">quy chế hoạt động</a></li>
                                <li><a href="./footer.html">chính sách bảo mật</a></li>
                                <li><a href="./footer.html">giải quyết khiếu nại</a></li>
                            </ul>
                        </div>
                        <div class="footer-col">
                            <h4>thông tin liên lạc</h4>
                            <div class="social-links">
                                <a href="https://www.facebook.com/Koulse"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-phone" aria-hidden="true"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>
