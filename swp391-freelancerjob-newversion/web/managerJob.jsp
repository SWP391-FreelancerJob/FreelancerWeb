<%-- 
    Document   : managerJob
    Created on : Jun 23, 2022, 9:35:31 AM
    Author     : User
--%>

<%@page import="sample.jobs.ApplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.jobs.ApplyDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.jobs.JobDTO"%>
<%@page import="sample.jobs.JobDAO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
        <title>Flance.vn</title>
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
        .table {
    width: 120%;
    margin-bottom: 1rem;
    background-color: transparent;
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
                                <h2>Danh sách công việc</h2>
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
                                        <aside class="col-lg-4 pt-4 pt-lg-0">
                                            <div class="cz-sidebar-static rounded-lg box-shadow-lg px-0 pb-0 mb-5 mb-lg-0">
                                                <div class="px-4 mb-4">
                                                    <div class="media align-items-center">

                                                        <img class="rounded-circle avatar ml-2" src="avatarOfUser/<%= loginUser.getAvatar()%>" alt="avatar" />

                                                        <div class="media-body pl-3">
                                                            <h3 class="font-size-base mb-0"><%= loginUser.getProfileName()%></h3>
                                                            <span
                                                                class="text-accent font-size-sm"><%= loginUser.getEmail()%></span>
                                                        </div>
                                                    </div>
                                                </div>

                                                <nav class="woocommerce-MyAccount-navigation">
                                                    <ul class="list-unstyled mb-0">
                                                        <li
                                                            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--edit-account border-top mb-0">
                                                            <a href="profile.jsp"
                                                               class="nav-link-style d-flex align-items-center px-4 py-3 text-dark">
                                                                <i class="czi-user align-middle opacity-60 mr-2"></i>
                                                                Chi tiết tài khoản</a>
                                                        </li>
                                                        <li
                                                            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--orders border-top mb-0">
                                                            <a href="jobsApplied.jsp"
                                                               class="nav-link-style d-flex align-items-center px-4 py-3 text-dark">
                                                                <i class="czi-bag align-middle opacity-60 mr-2"></i>
                                                                Danh sách công việc<span
                                                                    class="font-size-sm text-muted ml-auto"></span>
                                                            </a>
                                                        </li>
                                                        <li
                                                            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--downloads border-top mb-0">
                                                            <a href="managerJob.jsp"
                                                               class="nav-link-style d-flex align-items-center px-4 py-3 text-dark">
                                                                <i
                                                                    class="czi-cloud-download align-middle opacity-60 mr-2"></i>
                                                                Danh sách bài đăng<span
                                                                    class="font-size-sm text-muted ml-auto"></span>
                                                            </a>
                                                        </li>
                                                        <li
                                                        class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--payment-methods border-top mb-0">
                                                        <a href="waitingForApproval.jsp"
                                                           class="nav-link-style d-flex align-items-center px-4 py-3 text-dark">
                                                            <i class="czi-card align-middle opacity-60 mr-2"></i>
                                                            Danh sách chờ duyệt</a>
                                                    </li>

                                                        <li
                                                            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--communication-preferences border-top mb-0">
                                                            <a href="editProfile.jsp"
                                                               class="nav-link-style d-flex align-items-center px-4 py-3 text-dark">
                                                                <i class="czi-card align-middle opacity-60 mr-2"></i>
                                                                Chỉnh sửa thông tin</a>
                                                        </li>
                                                        <li
                                                            class="woocommerce-MyAccount-navigation-link woocommerce-MyAccount-navigation-link--editpassword is-active border-top mb-0">
                                                            <a href="changePassword.jsp"
                                                               class="nav-link-style d-flex align-items-center px-4 py-3 text-dark">
                                                                <i class="czi-home align-middle opacity-60 mr-2"></i>
                                                                Đổi mật khẩu</a>
                                                        </li>

                                                    </ul>
                                                </nav>

                                            </div>
                                        </aside>
                                        <section class="col-lg-8">
                                            <div class="woocommerce-MyAccount-content">
                                                <div
                                                    class="d-flex justify-content-between align-items-center pt-lg-2 pb-4 pb-lg-5 mb-lg-3">
                                                    <h3 class="font-size-base text-dark mb-0 ml-180">Hello, <%= loginUser.getProfileName()%></h3>

                                                </div>

                                                <div class="tab-content" id="myTabContent">                                                   
                                                    <div class="tab-pane fade active show" id="recuiter" role="tabpanel"
                                                         aria-labelledby="recuiter-tab" aria-expanded="true">
                                                        <table class="table table-stripe">
                                                            <tbody>
                                                                <tr>
                                                                    <td>STT</td>
                                                                    <td>Chủ đề</td>
                                                                    <td>Giá tiền </td>
                                                                    <td>Thời gian</td>
                                                                    <td>Số người chào giá</td>
                                                                    <td>Xem chi tiết</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <%
                                                                        JobDAO dao = new JobDAO();
                                                                        ApplyDAO apply = new ApplyDAO();
                                                                        ArrayList<JobDTO> jobList = dao.SearchJobByAccountID(loginUser.getAccountID());
                                                                        int count = 1;
                                                                        for (JobDTO job : jobList) {
                                                                            if (job.getStatus() == 1 || job.getStatus() == 2) {
                                                                    %>
                                                                <tr>
                                                                    
                                                                    <td><%= count++%></td>
                                                                    <td style="max-width: 150px; white-space: normal;"><%= job.getJobName()%></td>
                                                                    <td><%= JobDAO.formatPrice(job.getPrice()) %> VNĐ</td>
                                                                    <td>Từ <%= job.getStartTime()%> đến <%= job.getEndTime()%></td>
                                                                    <% List<ApplyDTO> listApply = apply.searchApplyByJobID(job.getJobID());
                                                                        if (job.getStatus() == 1) {%>
                                                                    <td class="d-flex justify-content-center"><%= listApply.size()%></td>
                                                                    <td>
                                                                        <a class="text-dark" href="MainController?action=ShowApplyList&jobID=<%= job.getJobID()%>">
                                                                            Chi tiết</a>
                                                                    </td>
                                                                    <% } else if (job.getStatus() == 2) { %>
                                                                    <td>Đang tiến hành</td> 
                                                                    <td><a class="text-dark" href="WorkingForEmployerController?JobID=<%= job.getJobID() %>">Quản lý công việc</a></td>
                                                                    <% } %>                                                                  
                                                                    
                                                                    
                                                                </tr>
                                                                <%
                                                                            }
                                                                        }
                                                                    %>

                                                            </tbody>
                                                        </table>
                                                    </div>
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
