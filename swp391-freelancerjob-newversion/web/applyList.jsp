<%-- 
    Document   : applyList
    Created on : Jun 21, 2022, 1:41:05 PM
    Author     : User
--%>

<%@page import="sample.jobs.JobDAO"%>
<%@page import="java.util.List"%>
<%@page import="sample.jobs.JobDTO"%>
<%@page import="sample.jobs.ApplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.user.UserDAO"%>
<%@page import="sample.jobs.ApplyDAO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
        <title>Flance.vn</title>

        <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
        <!-- Required Fremwork -->
        <link rel="stylesheet" type="text/css" href="assets2/css/bootstrap/css/bootstrap.min.css">
        <!-- themify icon -->
        <link rel="stylesheet" type="text/css" href="assets2/icon/themify-icons/themify-icons.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" type="text/css" href="assets2/icon/font-awesome/css/font-awesome.min.css">
        <!-- am chart export.css -->
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css"
              media="all" />


        <link rel="stylesheet" href="assets/css/responsive.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/price_rangs.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="./profile-Flancer.css">
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
        
        .image{
            width: 100px;
            height: 100px;
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
        <!-- Hero Area Start-->
        <div class="slider-area ">
            <div class="single-slider section-overly slider-height2 d-flex align-items-center"
                 data-background="assets/img/background.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>Danh sách chào giá</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Area End -->
        <main id="content" role="main" tabindex="-1" class="site-main mt-3">


            <div id="primary" class="content-area">


                <div id="post-8" class=" article__page post-8 page type-page status-publish hentry">
                    <div class="article__content article__content--page">
                        <div class="page__content">
                            <div class="woocommerce">                            
                                <div class="container pb-5 mb-2 mb-md-3">
                                    <div class="row">                                   
                                        <section class="col-lg-12">                                       
                                            <div class="job-alerts-item candidates" style="border: solid 1px;">
                                                <h3 class="alerts-title d-flex justify-content-center">Danh sách</h3>
                                                <%
                                                    String jobID = (String) session.getAttribute("SELECTED_JOBID");
                                                    ApplyDAO applyDao = new ApplyDAO();
                                                    UserDAO userDao = new UserDAO();
                                                    JobDAO jobDao = new JobDAO();
                                                    ArrayList<ApplyDTO> applyList = applyDao.searchApplyByJobID(jobID);
                                                    
                                                %>
                                                
                                                <div class="row mt-4">                                                 
                                                    <% 
                                                        for (ApplyDTO apply : applyList) {
                                                        if (userDao.getJobByJobID(apply.getJobID()).getStatus() == 1) {
                                                %>
                                                <div class="col-md-6 pl-5 mt-5 mb-5">
                                                <form action="MainController" method="POST">
                                                    <input type="hidden" name="accountID" value="<%= apply.getAccountID()%>"/>
                                                    <input type="hidden" name="jobID" value="<%= apply.getJobID()%>"/>
                                                    <div class="manager-resumes-item">
                                                        <div class="manager-content">
                                                            <div class="manager-info">
                                                                <div class="manager-name">
                                                                    <h4><%= userDao.GetUserName(apply.getAccountID())%></h4>

                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="update-date">
                                                            <p class="status">
                                                                <strong>Ngày chào giá:</strong> <%= apply.getApplyTime()%> <br>
                                                                <strong>Nội dung chào giá</strong> <br>
                                                                <strong>Kinh nghiệm và kĩ năng:</strong> <br>
                                                                <%= apply.getIntroduce() %> <br>
                                                                <strong>Kế hoạch thực hiện:</strong> <br>
                                                                <%= apply.getPlan()%> <br>
                                                                <strong>Giá:</strong>  <br>  
                                                                <%= jobDao.formatPrice(apply.getOffers()) %> <br>
                                                                <strong>Dự tính hoàn thành:</strong> <br>
                                                                <%= apply.getCompleteExpect() %> <br>
                                                            </p>
                                                            <div class="action-btn">
                                                                <button class="btn btn-xs btn-gray" type="submit" name="action" value="AcceptApply">Chấp nhận</button>
                                                                <button class="btn btn-xs btn-gray" type="submit" name="action" value="RejectApply">Từ chối</button>
                                                            </div>
                                                            <%
                                                                if (apply.isCheckApply() == true) {
                                                            %>
                                                            <p style="color: green">Chấp nhận</p>
                                                            <%
                                                                }
                                                            %>

                                                        </div>
                                                    </div>
                                                </form>
                                                </div>
                                                            
                                                
                                                <%
                                                    List<UserDTO> userApply = (List<UserDTO>) session.getAttribute("SELECT_USER");
                                                %>

                                                <%
                                                    if (userApply != null) {
                                                        if (userApply.size() > 0) {
                                                            for (UserDTO user : userApply) {
                                                                if (user.getAccountID().equalsIgnoreCase(apply.getAccountID())) {
                                                %>

                                                <%
                                                    if (user.getBirthday() == null) {
                                                        user.setBirthday("");
                                                    }
                                                    if (user.getPhone() == null) {
                                                        user.setPhone("");
                                                    }
                                                    if (user.getDescribe() == null) {
                                                        user.setDescribe("");
                                                    }
                                                %>
                                                <div class="col-md-6 mt-5 mb-5">
                                                <h4>Người chào giá <%= user.getProfileName()%></h4> <br>
                                                <img src="avatarOfUser/<%= user.getAvatar()%>" class="img-fluid image mb-2">
                                                <p>Tên : <%= user.getProfileName()%> </p> 
                                                <p>Ngày sinh: <%= user.getBirthday()%></p>
                                                <p>Sđt: <%= user.getPhone()%></p>
                                                <p>Email: <%= user.getEmail()%></p>
                                                <p>Địa chỉ: <%= user.getAddress()%></p>
                                                <p>Mô tả: <%= user.getDescribe()%></p>
                                                </div>
                                                <%
                                                                }
                                                            }
                                                        }
                                                    }
                                                %>           
                                                
                                                <%
                                                    }
                                                %>
                                                <%
                                                    }
                                                %> 
                                                </div>
                                            </div>
                                        </section>

                                    </div>
                                </div>
                            </div>
                            <div class="w3lay-after-content"
                                 style="margin-left: auto; margin-right: auto; text-align: center; " id="w3lay-2096315092">
                                <script async=""
                                src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                                <ins class="adsbygoogle" style="display:block; text-align:center;"
                                     data-ad-layout="in-article" data-ad-format="fluid"
                                     data-ad-client="ca-pub-9153409599391170" data-ad-slot="6211817182"
                                     data-adsbygoogle-status="done"><iframe id="aswift_1"
                                                                       style="height: 1px !important; max-height: 1px !important; max-width: 1px !important; width: 1px !important;"></iframe><iframe
                                        id="google_ads_iframe_1"
                                        style="height: 1px !important; max-height: 1px !important; max-width: 1px !important; width: 1px !important;"></iframe></ins>
                                <script>
                                    (adsbygoogle = window.adsbygoogle || []).push({});
                                </script>
                            </div>
                        </div>

                    </div><!-- .entry-content -->
                </div><!-- #post-## -->
            </div><!-- #primary -->

            <style>
                .widget select {
                    max-width: 100%;
                }

                .footer-categories,
                .sidebar-tags {
                    background: rgba(35, 50, 102, .05);
                    max-width: 1440px;
                    position: relative;
                    overflow: hidden;
                    box-shadow: 0 0 1px #3d57b2;
                    border-radius: 9px;
                    padding: 30px 0;
                }

                .footer-categories:before,
                .sidebar-tags:before {
                    content: "";
                    width: 18px;
                    height: 250px;
                    background: #233266;
                    display: block;
                    position: absolute;
                    z-index: 1;
                    border-radius: 0 0 18px;
                    top: 0;
                    left: 0;
                    box-shadow: 18px -36px 0 #3d57b2, 36px -72px 0 #8194d4;
                }

                .footer-categories .widget_categories,
                .sidebar-tags .widget_categories,
                .footer-categories .widget_tags,
                .sidebar-tags .widget_tags {
                    position: relative;
                    z-index: 10;
                    margin-bottom: 0;
                    padding-left: 90px;
                }

                .footer-categories .widget_categories .widget-title,
                .sidebar-tags .widget_categories .widget-title,
                .footer-categories .widget_tags .widget-title,
                .sidebar-tags .widget_tags .widget-title {
                    font-size: 24px;
                    font-weight: 500;
                    color: #233266;
                }

                .footer-categories .widget_categories ul,
                .sidebar-tags .widget_tags ul {
                    list-style: none;
                    margin: 0;
                    padding: 0;
                    font-size: 14px;
                    columns: 4;
                }

                .footer-categories .widget_categories ul li,
                .sidebar-tags .widget_tags ul li {
                    margin-bottom: 6px;
                }

                .footer-categories .widget_categories ul a,
                .sidebar-tags .widget_tags ul a {
                    color: #233266;
                    text-decoration: none;
                }

                .footer-categories .widget_categories ul a:hover,
                .sidebar-tags .widget_tags ul a:hover {
                    color: #9f374e;
                }

                .sidebar-tags:before {
                    background: #666;
                    box-shadow: 18px -36px 0 #999, 36px -72px 0 #eee;
                }

                @media only screen and (max-width: 51em) {
                    .footer-categories {
                        display: none;
                    }
                }
            </style>
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
