<%-- 
    Document   : workingJobforBoss
    Created on : Jul 3, 2022, 12:54:32 AM
    Author     : Admin
--%>

<%@page import="sample.user.UserDAO"%>
<%@page import="sample.jobs.ApplyDTO"%>
<%@page import="sample.jobs.ApplyDAO"%>
<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.Collections"%>
<%@page import="sample.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flance.vn</title>
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/LOGO FPT.png">


        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/price_rangs.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <style>
        .avatar{
            width: 40px;
            height: 40px;
        }

        .dropdown:hover .dropdown-menu { 
            display: block; 
            margin-top: 0;
        }
        .logo{   
            margin-top: 15px;
            height: 90px;
            width: 140px;
        }

        .head-btn1 {
            width: 9rem;
            padding: 20px 0;
            text-align: center;
            margin: 15px 10px;
            border-radius: 3px;
            font-weight: bold;
            border: solid #f27405;
            background: transparent;
            color: #f27405;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .head-btn2 {
            width: 9rem;
            padding: 20px 0;
            text-align: center;
            margin: 15px 10px;
            border-radius: 3px;
            font-weight: bold;
            border: solid #f27405;
            background: transparent;
            color: #f27405;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .dropdown1 {
            position: relative;
            /* display: inline-block; */
            border: solid #f27405;
            height: 3.2rem;
            padding-top: 0.5rem;
            border-radius: 25px;
        }

        .dropbtn1 {
            background-color: transparent;
            color: #f27405;
            border: none;
        }

        .dropbtn1 a {
            color: #f27405;
            font-size: 16px;
        }

        .dropdown1-content {
            left: 1rem;
            display: none;
            position: absolute;
            background-color: transparent;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
            width: 11rem;
        }

        .dropdown1-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown1-content a:hover {
            background-color: #f1f1f1;
            color: #24262b;
        }

        .dropdown1:hover .dropdown1-content {
            display: block;
        }

        .dropdown1 img {
            width: 45px;
            cursor: pointer;
            border-radius: 50%;
            float: left;
            border: none;
            position: relative;
            right: 0.38rem;
            bottom: 0.56rem;
        }

        .single-slider {
            height: 35rem;
            /* padding: 5rem; */
            color: #fff;
        }

        .border-btn2 {
            border: 0.3rem solid;
        }

        .list {
            margin-top: 2rem;
        }

        .post {
            background-color: #f1f1f1;
            padding: 1rem 2rem;
            box-shadow: 0px 0px 10px 5px #463f3fc9;
            margin-bottom: 3rem;
            margin-top: -1rem;
            border-radius: 5px;
        }

        .post p {
            display: block;
            border: none;
            width: 100%;
            margin: 1rem 0;
        }

        #title {
            font-size: 2rem;
            color: #f27405;
            cursor: default;
        }

        #owner {
            font-size: 1.6rem;
            background-color: #ddd;
            cursor: default;
        }

        #detail {
            font-size: 1rem;
            cursor: default;
        }

        #price {
            padding: 5px;
            font-size: 20px;
            background-color: #ddd;
            cursor: default;
        }

        #feedback {
            background-color: #ddd;
            cursor: default;
        }

        #time {
            cursor: default;
        }

        #tag {
            color: #f27405;
            width: 6rem;
            padding: 0.3rem 0.6rem;
            transition: 0.5s;
        }
        #link{
            margin-top: 1rem;
            width: 17rem;
            border: solid black;
            background-color: #ffffff;
            cursor: default;
        }

        .footer {
            background-color: #24262b;
            padding: 70px 0;
            margin-top: 5rem;
        }

        .container-footer {
            max-width: 1170px;
            margin: auto;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
        }

        .footer-col {
            width: 25%;
            padding: 0 15px;
        }

        .footer-col h4 {
            font-size: 18px;
            color: #ffffff;
            text-transform: capitalize;
            margin-bottom: 35px;
            font-weight: 500;
            position: relative;
        }

        .footer-col h4::before {
            content: '';
            position: absolute;
            left: 0;
            bottom: -10px;
            background-color: #f27405;
            height: 2px;
            box-sizing: border-box;
            width: 50px;
        }

        .footer-col ul li:not(:last-child) {
            margin-bottom: 10px;
        }

        .footer-col ul li a {
            font-size: 16px;
            text-transform: capitalize;
            color: #ffffff;
            text-decoration: none;
            font-weight: 300;
            color: #bbbbbb;
            display: block;
            transition: all 0.3s ease;
        }

        .footer-col ul li a:hover {
            color: #ffffff;
            padding-left: 8px;
        }

        .footer-col .social-links a {
            display: inline-block;
            height: 40px;
            width: 40px;
            background-color: rgba(255, 255, 255, 0.2);
            margin: 0 10px 10px 0;
            text-align: center;
            line-height: 40px;
            border-radius: 50%;
            color: #ffffff;
            transition: all 0.5s ease;
        }

        .footer-col .social-links a:hover {
            color: #24262b;
            background-color: #ffffff;
        }
    </style>


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

        <!-- Preloader Start -->
        <header>
            <!-- Header Start -->
            <div class="header-area header-transparrent">
                <div class="headder-top header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-3 col-md-2">
                                <!-- Logo -->
                                <div class="logo">
                                    <a href="AppearJob"><img src="assets/img/Flancer.png" alt="logo"></a>
                                </div>
                            </div>
                            <div class="col-lg-9 col-md-9">
                                <div class="menu-wrapper">
                                    <!-- Main-menu -->
                                    <div class="main-menu">
                                        <nav class="d-none d-lg-block">
                                            <ul id="navigation">
                                                <li><a href="AppearJob">Trang chủ</a></li>
                                                <li><a href="#">Công Việc</a>
                                                    <ul class="submenu">
                                                        <li><a href="jobList.jsp">Tìm Công Việc</a></li>
                                                        <li><a href="addJob.jsp">Đăng công việc</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="aboutUs.jsp">Liên lạc</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <!-- Header-btn -->

                                    <div class="dropdown">
                                        <div class="mb-3">                                            
                                            <img class="rounded-circle avatar ml-2" src="avatarOfUser/<%= loginUser.getAvatar()%>" alt="avatar" />
                                            <%= loginUser.getProfileName()%>                                            
                                        </div>
                                        <div class="dropdown-menu pt-2 pr-4" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="profile.jsp"><i class="fas fa-user pr-2"></i>Trang cá nhân</a>
                                            <a class="dropdown-item" href="changePassword.jsp"><i class="fas fa-key pr-2"></i>Đổi mật khẩu</a>
                                            <a class="dropdown-item" href="payment.jsp"><i class="fab fa-cc-visa pr-2"></i>Phương thức thanh toán</a> 
                                            <a class="dropdown-item" href="historyJob.jsp"><i class="fas fa-history pr-2"></i>Lịch sử công việc</a>
                                            <a class="dropdown-item" href="MainController?action=Logout"><i class="fas fa-sign-out-alt pr-2"></i>Đăng xuất</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Header End -->
        </header>

        <div class="slider-area ">
            <div class="single-slider section-overly slider-height2 d-flex align-items-center"
                 data-background="assets/img/background.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>Kiểm tra dự án</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <main>
            <div class="container">


                <%  String jobID = (String) session.getAttribute("CURRENT_JOB");
                    ProductDAO productDAO = new ProductDAO();
                    UserDAO user = new UserDAO();
                    List<ProductDTO> listProduct = productDAO.product(jobID);
                    Collections.reverse(listProduct);
                %>

                <%
                    if (listProduct.size() == 0) {
                %>
                <a class="btn text-center mt-3" href="ContactController" >Liên hệ</a>               
                <h4 class="text-center mt-5 mb-2">Chưa có bài </h4>
                <%
                    }
                %>

                <%
                    if (listProduct.size() > 0) {
                %>

                <div class="mt-3 mb-3">
                    <a class="btn text-white" onclick="document.getElementById('endJob').style.display = 'block';">Kết thúc công việc</a>                  
                    <a class="btn" href="ContactController" >Liên hệ</a>
                </div>

                <% if (user.getJobByJobID(jobID).getStatus() == 2) {
                %>  <div id="endJob" style="display: none">
                    <h1>Bạn có thực sự muốn kết thúc công việc này không ?</h1> <br>
                    <div class="d-flex justify-content-center">
                        <a class="mr-5 font-weight-bold" style="color: black" onclick="document.getElementById('endJob').style.display = 'none'"> Không </a> 
                        <a class="mr-5 font-weight-bold"style="color: black" href="EndOfTheJobController">Có</a>
                    </div>

                </div>
                <%
                    }
                %> 

                <div class="list">
                    <div class="post">
                        <p id="title">Tiêu đề: <%= listProduct.get(0).getTitle()%></p>
                        <p id="detail">Mô tả: <%= listProduct.get(0).getDescription()%></p>                        
                        <p id="time">Ngày gửi: <%= listProduct.get(0).getDateUpload()%></p>
                        <a target="__blank" class="btn"  href="<%= listProduct.get(0).getLink()%>">Nhận bài</a>
                    </div>
                </div>
                <div id="loadMoreContainer" style="display: none">        
                    <%

                        for (int i = 1; i < listProduct.size(); i++) {
                    %>
                    <div class="list">
                        <div class="post">
                            <p id="title">Tiêu đề: <%= listProduct.get(i).getTitle()%></p>
                            <p id="detail">Mô tả: <%= listProduct.get(i).getDescription()%></p>                        
                            <p id="time">Ngày gửi: <%= listProduct.get(i).getDateUpload()%></p>
                            <button class="btn" onclick="window.location.href = '<%= listProduct.get(i).getLink()%>'">Kiểm tra lại</button></p>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>


                <button class="btn mb-3" style="display: block" id="zoomIn" onclick="document.getElementById('loadMoreContainer').style.display = 'block';
                        document.getElementById('zoomOut').style.display = 'block';
                        document.getElementById('zoomIn').style.display = 'none'">Xem thêm các phiên bản cũ</button>
                <button  class="btn mb-3" style="display: none" id="zoomOut"onclick="document.getElementById('loadMoreContainer').style.display = 'none';
                        document.getElementById('zoomIn').style.display = 'block';
                        document.getElementById('zoomOut').style.display = 'none'">Thu gọn bài đăng</button>
                <%
                    }
                %>


                <% if (user.getJobByJobID(jobID).getStatus() == 3) {
                %>
                <script>
                    function showPopup() {
                        $('#exampleModal').modal('show')
                    }
                    setTimeout(showPopup, 0000);
                </script>
                <%
                    }
                %>

                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Ý kiến của bạn về công việc này</h5>
                                <button  type="button" onclick="window.location.href = 'managerJob.jsp'" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <% 
            ApplyDAO apply = new ApplyDAO();
            List<ApplyDTO> applyList = apply.searchApplyByJobID(jobID);
            for (ApplyDTO applyListSelect : applyList) {
                    if(applyListSelect.isCheckApply() == true){
                                %>
                                <form action="MainController" method="POST">
                                    <h5>Bạn có muốn phản hồi về <%= applyListSelect.getAccountID() %> không ?</h5> <br>
                                    Phản hồi <input type="text" name="feedback"> <br>
                                    <div class="ml-35">
                                        <a class="text-dark mt-3" href="managerJob.jsp"> Đóng </a>
                                        <button class="mt-3 text-dark bg-light" type="submit" name="action" value="feedback">Ý kiến</button>                            
                                    </div>
                                </form>

                                <%
                            }
                        }
                                %>
                            </div>
                            
                        </div>
                    </div>
                </div>    

        </main>

        <jsp:include page="footer.jsp"></jsp:include>



        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <!-- Jquery, Popper, Bootstrap -->
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

        <!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>
        <script src="./assets/js/price_rangs.js"></script>
        <!-- Date Picker -->
        <script src="./assets/js/gijgo.min.js"></script>
        <!-- One Page, Animated-HeadLin -->
        <script src="./assets/js/wow.min.js"></script>
        <script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

        <!-- Scrollup, nice-select, sticky -->
        <script src="./assets/js/jquery.scrollUp.min.js"></script>
        <script src="./assets/js/jquery.nice-select.min.js"></script>
        <script src="./assets/js/jquery.sticky.js"></script>

        <!-- contact js -->
        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

        <!-- Jquery Plugins, main Jquery -->
        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>
    </body>
</html> 