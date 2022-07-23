<%-- 
    Document   : aboutUs
    Created on : Jul 8, 2022, 9:40:40 AM
    Author     : Zenos
--%>

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
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/LOGO FPT.png">

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
        
        .logo {
            padding: 7px;
            width: 10rem;
        }

        


        .single-slider {
            height: 35rem;
            /* padding: 5rem; */
            color: #fff;
        }

        .border-btn2 {
            border: 0.3rem solid;
        }

        .online-cv {
            margin-top: 15rem;
        }

        .footer {
            background-color: #24262b;
            padding: 70px 0;
            margin-top: 15rem;
        }

        .container-footer {
            max-width: 1170px;
            margin: auto;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
        }


    </style>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        %> 
        <!-- Preloader Start -->
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
                                    <%
                                        if (loginUser == null) {
                                    %>
                                    <a href="HomeController"><img src="assets/img/Flancer.png" alt=""></a>
                                        <%
                                        } else {
                                        %>                                   
                                    <a href="AppearJob"><img src="assets/img/Flancer.png" alt=""></a>
                                        <%
                                            }
                                        %>
                                </div>
                            </div>
                            <div class="col-lg-9 col-md-9">
                                <div class="menu-wrapper">
                                    <!-- Main-menu -->
                                    <div class="main-menu">
                                        <nav class="d-none d-lg-block">
                                            <ul id="navigation">
                                                <%
                                                    if (loginUser == null) {
                                                %>
                                                <li><a href="HomeController">Trang chủ</a></li>
                                                    <%
                                                        }
                                                    %>

                                                <%
                                                    if (loginUser != null) {
                                                %>
                                                <li><a href="AppearJob">Trang chủ</a></li>
                                                    <%
                                                        }
                                                    %>
                                                <li><a href="#">Công việc</a>
                                                    <ul class="submenu">
                                                        <%
                                                            if (loginUser == null) {
                                                        %>
                                                        <li><a href="jobListHomePage.jsp">Tìm Công Việc</a></li>
                                                            <%
                                                                }
                                                            %>
                                                            <%
                                                                if (loginUser != null) {
                                                            %>
                                                        <li><a href="jobList.jsp">Tìm Công Việc</a></li>
                                                            <%
                                                                }
                                                            %>
                                                        <li><a href="addJob.jsp">Đăng công việc</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="aboutUs.jsp">Liên hệ</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <!-- Header-btn -->
                                    <%
                                        if (loginUser == null) {
                                    %>
                                    <div class="header-btn d-none f-right d-lg-block">
                                    <a href="register.jsp" class="btn head-btn1">Đăng kí</a>
                                    <a href="login.jsp" class="btn head-btn2">Đăng nhập</a>
                                </div>
                                    <%
                                        }
                                    %>
                                    <%
                                        if (loginUser != null) {
                                    %>
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
                                    <%
                                        }
                                    %>
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
            <!-- Hero Area Start-->
            <div class="slider-area ">
                <div class="single-slider section-overly slider-height2 d-flex align-items-center"
                     data-background="image/banner.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="hero-cap text-center">
                                    <h2 style="color: #fff;
                                        font-size: 5rem;">About us</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Hero Area End -->
            <!-- Support Company Start-->
            <div class="support-company-area fix section-padding2">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-6 col-lg-6">
                            <div class="right-caption">
                                <!-- Section Tittle -->
                                <div class="section-tittle section-tittle2">
                                    <span>What we are doing</span>
                                    <h2>A lot Talented people are getting Jobs</h2>
                                </div>
                                <div class="support-caption">
                                    <p class="pera-top">Mollit anim laborum duis au dolor in voluptate velit ess cillum
                                        dolore eu lore dsu quality mollit anim laborumuis au dolor in voluptate velit
                                        cillum.</p>
                                    <p>Mollit anim laborum.Duis aute irufg dhjkolohr in re voluptate velit esscillumlore eu
                                        quife nrulla parihatur. Excghcepteur signjnt occa cupidatat non inulpadeserunt
                                        mollit aboru. temnthp incididbnt ut labore mollit anim laborum suis aute.</p>
                                    <a href="about.html" class="btn post-btn">Post a job</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 dflex-d align-self-end">
                            <div class="support-location-img">
                                <img src="assets/img/about-instruduce.png" alt="">
                                <div class="support-img-cap text-center">
                                    <p>Since</p>
                                    <span>2022</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Support Company End-->
            <!-- How  Apply Process Start-->
            <div class="apply-process-area apply-bg pt-150 pb-150" data-background="assets/img/gallery/how-applybg.png">
                <div class="container">
                    <!-- Section Tittle -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-tittle white-text text-center">
                                <span>Apply process</span>
                                <h2 style="color: #f27405;"> How it works</h2>
                            </div>
                        </div>
                    </div>
                    <!-- Apply Process Caption -->
                    <div class="row">
                        <div class="col-lg-4 col-md-6">
                            <div class="single-process text-center mb-30">
                                <div class="process-ion">
                                    <span class="flaticon-search"></span>
                                </div>
                                <div class="process-cap">
                                    <h5 style="color: #f27405;">1. Search a job</h5>
                                    <p>Sorem spsum dolor sit amsectetur adipisclit, seddo eiusmod tempor incididunt ut
                                        laborea.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="single-process text-center mb-30">
                                <div class="process-ion">
                                    <span class="flaticon-curriculum-vitae"></span>
                                </div>
                                <div class="process-cap">
                                    <h5 style="color: #f27405;">2. Apply for job</h5>
                                    <p>Sorem spsum dolor sit amsectetur adipisclit, seddo eiusmod tempor incididunt ut
                                        laborea.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="single-process text-center mb-30">
                                <div class="process-ion">
                                    <span class="flaticon-tour"></span>
                                </div>
                                <div class="process-cap">
                                    <h5 style="color: #f27405;">3. Get your job</h5>
                                    <p>Sorem spsum dolor sit amsectetur adipisclit, seddo eiusmod tempor incididunt ut
                                        laborea.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- How  Apply Process End-->
            <!-- Online CV Area Start -->
            <div class="online-cv cv-bg section-overly pt-90 pb-120" data-background="image/2222.png"
                 style="height: 35rem;">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10">
                            <div class="cv-caption text-center">
                                <p class="pera1">FEATURED TOURS Packages</p>
                                <p class="pera2"> Make a Difference with Your Online Resume!</p>
                                <a href="#" class="border-btn2 border-btn4" style="color: #fff;
                                   margin-top: 5rem;"> <strong> your cv</strong></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Online CV Area End-->
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
