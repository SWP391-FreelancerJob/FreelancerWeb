<%-- 
    Document   : homePage
    Created on : May 21, 2022, 5:31:30 PM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="sample.user.UserDAO"%>
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
        <title>Flance.vn</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="./assets/img/LOGO FPT.png">
        
        <!-- CSS here -->
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
        
        .pointer:hover{
            cursor: pointer;
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
        <div id="preloader-active">
            <div class="preloader d-flex align-items-center justify-content-center">
                <div class="preloader-inner position-relative">
                    <div class="preloader-circle"></div>
                    <div class="preloader-img pere-text">
                        <img src="assets/img/Flancer.png" alt="">
                    </div>
                </div>
            </div>
        </div>
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
                                        
                                        
        <main>

            <!-- slider Area Start-->
            <div class="slider-area ">
                <!-- Mobile Menu -->
                <div class="slider-active">
                    <div class="single-slider slider-height d-flex align-items-center"
                         data-background="assets/img/background.png">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-6 col-lg-9 col-md-10">
                                    <div class="hero__caption">
                                        <h1>Tìm công việc bạn thích nhất</h1>
                                    </div>
                                </div>
                            </div>
                            <!-- Search Box -->
                            <div class="row">
                                <div class="col-xl-8">
                                    <!-- form -->                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- slider Area End-->
            <!-- Our Services Start -->
            <div class="our-services section-pad-t30">
                <div class="container">
                    <!-- Section Tittle -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-tittle text-center">
                                <span>CÁC LĨNH VỰC</span>
                                <h2>Công Việc Hàng Đầu</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row d-flex justify-contnet-center">
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 pointer" onclick="window.location.href = 'SearchTagController?tagID=T01'">
                            <div class="single-services text-center mb-30">
                                <div class="services-ion">
                                    <span class="flaticon-tour"></span>
                                </div>
                                <div class="services-cap">
                                    <h5>Thiết kế độ họa</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 pointer" onclick="window.location.href = 'SearchTagController?tagID=T02'">
                            <div class="single-services text-center mb-30">
                                <div class="services-ion">
                                    <span class="flaticon-cms"></span>
                                </div>
                                <div class="services-cap">
                                    <h5>Quảng cáo</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 pointer" onclick="window.location.href = 'SearchTagController?tagID=T03'">
                            <div class="single-services text-center mb-30">
                                <div class="services-ion">
                                    <span class="flaticon-report"></span>
                                </div>
                                <div class="services-cap">
                                    <h5>Văn bản và dịch thuật</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 pointer" onclick="window.location.href = 'SearchTagController?tagID=T04'">
                            <div class="single-services text-center mb-30">
                                <div class="services-ion">
                                    <span class="flaticon-app"></span>
                                </div>
                                <div class="services-cap">
                                    <h5>Chỉnh sửa hình ảnh</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 pointer" onclick="window.location.href = 'SearchTagController?tagID=T05'">
                            <div class="single-services text-center mb-30">
                                <div class="services-ion">
                                    <span class="flaticon-helmet"></span>
                                </div>
                                <div class="services-cap">
                                    <h5>Chỉnh sửa videos</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 pointer" onclick="window.location.href = 'SearchTagController?tagID=T06'">
                            <div class="single-services text-center mb-30">
                                <div class="services-ion">
                                    <span class="flaticon-high-tech"></span>
                                </div>
                                <div class="services-cap">
                                    <h5>Công nghệ thông tin</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 pointer" onclick="window.location.href = 'SearchTagController?tagID=T07'">
                            <div class="single-services text-center mb-30">
                                <div class="services-ion">
                                    <span class="flaticon-real-estate"></span>
                                </div>
                                <div class="services-cap">
                                    <h5>Kinh doanh</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 pointer" onclick="window.location.href = 'SearchTagController?tagID=T08'">
                            <div class="single-services text-center mb-30">
                                <div class="services-ion">
                                    <span class="flaticon-content"></span>
                                </div>
                                <div class="services-cap">
                                    <h5>Khác</h5>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </main>
        
        <jsp:include page="footer.jsp"></jsp:include>
            <!-- JS here -->

        <!-- All JS Custom Plugins Link Here here -->
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