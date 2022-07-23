<%@page import="sample.jobs.ApplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.jobs.ApplyDAO"%>
<%@page import="sample.jobs.JobDAO"%>
<%@page import="sample.jobs.JobDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/price_rangs.css">
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

        .sticky-bar {
            left: 0;
            margin: auto;
            position: relative;
            top: 0;
            width: 100%;
            -webkit-box-shadow: 0 10px 15px rgb(25 25 25 / 10%);
            box-shadow: 0 10px 15px rgb(25 25 25 / 10%);
            z-index: 9999;
            -webkit-animation: 300ms ease-in-out 0s normal none 1 running fadeInDown;
            animation: 300ms ease-in-out 0s normal none 1 running fadeInDown;
            -webkit-box-shadow: 0 10px 15px rgb(25 25 25 / 10%);
            background: #fff;
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
                                    <a href="AppearJob"><img src="assets/img/Flancer.png" alt=""></a>
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

            <!-- Hero Area Start-->
            <div class="slider-area ">
                <div class="single-slider section-overly slider-height2 d-flex align-items-center"
                     data-background="./assets/img/background.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="hero-cap text-center">
                                    <h2>Chi tiết</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Hero Area End -->
            <!-- job post company Start -->
            <div class="job-post-company pt-120 pb-120">
                <input type="hidden" name="jobID" value="${JOB.jobID}">
                <div class="container">
                    <div class="row justify-content-between">
                        <!-- Left Content -->
                        <div class="col-xl-7 col-lg-8">
                            <!-- job single -->
                            <div class="single-job-items mb-50">
                                <div class="job-items">
                                    <div class="company-img company-img-details">

                                    </div>
                                    <div class="job-tittle">
                                        <a href="#">
                                            <h4>${JOB.jobName}</h4>
                                        </a>
                                        <ul>
                                            <li>${JOB.tagName}</li>
                                            <li>Từ ${JOB.startTime} đến ${JOB.endTime}</li>
                                            <li>${JobDAO.formatPrice(JOB.price)} VNĐ</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- job single End -->

                            <div class="job-post-details">
                                <div class="post-details1 mb-50">
                                    <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4>Mô tả</h4>
                                    </div>
                                    <img src="imageOfJob/${JOB.image}" alt="">
                                    <p>${JOB.description}.</p>
                                </div>

                            </div>

                        </div>
                        <!-- Right Content -->
                        <%
                            JobDTO job = (JobDTO) session.getAttribute("JOB");
                            ApplyDAO apply = new ApplyDAO();                                                                    
                            List<ApplyDTO> list = apply.searchApplyByJobID(job.getJobID());
                        %>
                        <div class="col-xl-4 col-lg-4">
                            <div class="post-details3  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Tổng quan về công việc</h4>
                                </div>
                                <ul>
                                    <li>Số lượng apply : <span><%= list.size()%></span></li>
                                    <li>Ngân sách : <span>${JobDAO.formatPrice(JOB.price)} VNĐ</span></li>
                                    <li>Bắt đầu : <span>${JOB.startTime}</span></li>
                                    <li>Kết thúc : <span>${JOB.endTime}</span></li>
                                </ul>
                                <div class="apply-btn2">
                                    <%  
                                        JobDAO jobDAO = new JobDAO();
                            ApplyDAO applyDAO = new ApplyDAO();
                            List<ApplyDTO> listApply = applyDAO.checkAppliedJob(loginUser.getAccountID(), job.getJobID());

                                        boolean ownThisPost = jobDAO.jobOwner(loginUser.getAccountID(), job.getJobID());
                                        if (listApply.size() == 0 && !ownThisPost) {
                                    %>

                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                                        Chào giá
                                    </button>
                                    <%
                                    } else if (listApply.size() > 0) {
                                    %>
                                    <p>Đang chờ duyệt</p>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                            <div class="post-details4  mb-50">
                                <!-- Small Section Tittle -->
                                <div class="small-section-tittle">
                                    <h4>Thông tin người đăng</h4>
                                </div>
                                <%
                                    UserDTO listOwner = (UserDTO) request.getAttribute("LIST_OWNER");
                                    if (listOwner.getPhone() == null) {
                                        listOwner.setPhone("");
                                    }
                                %>
                                <ul>

                                    <li>Người đăng bài: <span><%= listOwner.getProfileName()%></span></li>                                   
                                    <li>Email: <span><%= listOwner.getEmail()%></span></li>
                                    <li>Sđt : <span><%= listOwner.getPhone()%></span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- job post company End -->

            <!-- Pop up -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <form action="MainController" method="POST">

                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Nội dung chào giá</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>1. Bạn có những kinh nghiệm và kỹ năng nào phù hợp với dự án này?</p>
                                <input type="text" name="introduce"/> 
                                <p>2. Bạn dự định thực hiện dự án này như thế nào?</p>
                                <input type="text" name="plan"/>
                                <p>3. Đề xuất chi phí</p>
                                <input type="number" name="offers" value="<%= job.getPrice()%>"/>
                                <p class="mt-1">4. Dự kiến thời gian hoàn thành</p>                              
                                <input type="hidden" name="jobID" value="<%= job.getJobID()%>">
                                <select name="dateValue">
                                    <option value="Ngày">Ngày</option>
                                    <option value="Tuần">Tuần</option>
                                    <option value="Tháng">Tháng</option>
                                </select> <input class="mt-1" type="number" name="completeExpect"/> <br>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                                <button class="btn btn-primary" name="action" value="Apply">Xác nhận</button>
                            </div>

                        </div>
                    </form>
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
