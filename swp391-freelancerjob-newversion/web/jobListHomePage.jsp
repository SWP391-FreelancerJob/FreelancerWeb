<%-- 
    Document   : jobList
    Created on : Jun 29, 2022, 9:18:42 PM
    Author     : Zenos
--%>
<%@page import="sample.jobs.JobDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.jobs.JobDTO"%>
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
        <link rel="stylesheet" href="assets/css/price_rangs.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
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
        .image-size{
            height: 60px;
            width: 65px;
        }
        .logo{   
            margin-top: 15px;
            height: 90px;
            width: 140px;
        }
        
    </style>
    
    
    <body>
        <%
            int MAX_JOB_IN_PAGE = 5;
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
                                    <a href="HomeController"><img src="assets/img/Flancer.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-9 col-md-9">
                                <div class="menu-wrapper">
                                    <!-- Main-menu -->
                                    <div class="main-menu">
                                        <nav class="d-none d-lg-block">
                                            <ul id="navigation">
                                                <li><a href="HomeController">Trang chủ</a></li>
                                                <li><a href="#">Công Việc</a>
                                                    <ul class="submenu">
                                                        <li><a href="jobListHomePage.jsp">Tìm Công Việc</a></li>
                                                        <li><a href="addJob.jsp">Đăng công việc</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="aboutUs.jsp">Liên lạc</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <!-- Header-btn -->
                                    <div class="header-btn d-none f-right d-lg-block">
                                        <a href="register.jsp" class="btn head-btn1">Đăng ký</a>
                                        <a href="login.jsp" class="btn head-btn2">Đăng nhập</a>
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


            <div class="slider-area ">
                <div class="single-slider section-overly slider-height2 d-flex align-items-center"
                     data-background="./assets/img/background.png">
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


            <div class="job-listing-area pt-120 pb-120">
                <div class="container">
                    <div class="row">
                        <!-- Left content -->
                        <div class="col-xl-3 col-lg-3 col-md-4">
                            <div class="row">
                                <div class="col-12">
                                    <div class="small-section-tittle2 mb-45">
                                        <div class="ion"> <svg xmlns="http://www.w3.org/2000/svg"
                                                               xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="12px">
                                            <path fill-rule="evenodd" fill="rgba(222, 99, 32, 0.85)"
                                                  d="M7.778,12.000 L12.222,12.000 L12.222,10.000 L7.778,10.000 L7.778,12.000 ZM-0.000,-0.000 L-0.000,2.000 L20.000,2.000 L20.000,-0.000 L-0.000,-0.000 ZM3.333,7.000 L16.667,7.000 L16.667,5.000 L3.333,5.000 L3.333,7.000 Z" />
                                            </svg>
                                        </div>
                                        <h4>Bộ lọc</h4>

                                    </div>
                                </div>
                            </div>
                            <!-- Job Category Listing start -->
                            <div class="job-category-listing mb-50">
                                <%
                                    String search = request.getParameter("search");
                                    if (search == null) {
                                        search = "";
                                    }
                                %>
                                <div class="mb-3">
                                    <form action="MainController" method="POST">
                                        <input oninput="searchByName(this)" type="text" value="<%= search%>" name="search" placeholder="Tìm kiếm...">                            
                                        <input type="hidden" name="action" value="SearchHomePage">
                                    </form>
                                </div>


                                <form action="MainController" method="POST">
                                    <!-- single one -->
                                    <div class="single-listing">
                                        <div class="small-section-tittle2">
                                            <h4>Sắp xếp bài đăng:</h4>
                                        </div>
                                        <!-- Select job items start -->
                                        <div class="select-job-items2">
                                            <select name="searchByTypeSalary" class="box">
                                                <option value="allJob">Tất cả bài đăng</option>
                                                <option value="HighToLow">Thấp đến cao</option>
                                                <option value="LowToHigh">Cap đến thấp</option>
                                            </select>
                                        </div>
                                        <!--  Select job items End-->
                                        <!-- select-Categories start -->
                                        <div class="select-Categories pt-80 pb-50">
                                            <div class="small-section-tittle2">
                                                <h4>Lĩnh vực</h4>
                                            </div>
                                            <c:forEach items="${LIST_TAG}" var="tag">   
                                                <label class="container">${tag.tagName}
                                                    <input type="checkbox" name="tagID" value="${tag.tagID}">
                                                    <span class="checkmark"></span>
                                                </label>
                                            </c:forEach> 
                                        </div>
                                        <!-- select-Categories End -->
                                    </div>
                                    <!-- single two -->
                                    <div class="single-listing">
                                        <div class="small-section-tittle2">
                                            <h4>Giá tiền</h4>
                                        </div>
                                        <!-- Select job items start -->
                                        <div class="select-job-items2">
                                            <select name="searchByTypeMoney" class="box">
                                                <option value="all">Tất cả</option>
                                                <option value="1">< 1 triệu</option>
                                                <option value="1_to_5">1 triệu - 5 triệu</option>
                                                <option value="5_to_10">5 triệu - 10 triệu</option>
                                                <option value="10_to_20">10 triệu - 20 triệu</option>
                                                <option value="20">> 20 triệu</option>
                                            </select>
                                        </div>
                                        <!--  Select job items End-->
                                        <!-- select-Categories start -->                                    
                                    </div>

                                    <button type="submit" name="action" value="SearchFilterHomePage" class="btn btn-search ml-4 mt-4">Tìn kiếm</button>
                                </form>
                            </div>
                            <!-- Job Category Listing End -->
                        </div>
                        <!-- Right content -->
                        <div class="col-xl-9 col-lg-9 col-md-8">
                            <!-- Featured_job_start -->
                            <section class="featured-job-area">
                                <div class="container">
                                    <!-- Count of Job list Start -->
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="count-job mb-35">
                                                <span></span>
                                                <!-- Select job items start -->
                                                <div class="select-job-items">
                                                    <span></span>                                                   
                                                </div>
                                                <!--  Select job items End-->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Count of Job list End -->
                                    <!-- single-job-content -->

                                    <%
                                        ArrayList<JobDTO> listJob = (ArrayList<JobDTO>) session.getAttribute("LIST_JOB");
                                        ArrayList<JobDTO> appearjobs = new ArrayList<JobDTO>();
                                        for (JobDTO job : listJob) {
                                            if (job.getStatus() == 1) {
                                                appearjobs.add(job);
                                            }
                                        }
                                        int currentPage = (int) session.getAttribute("CURRENT_PAGE");
                                        int startAt = MAX_JOB_IN_PAGE * (currentPage - 1);
                                        int endAt = (appearjobs.size() > startAt + MAX_JOB_IN_PAGE) ? (startAt + MAX_JOB_IN_PAGE) : (appearjobs.size());
                                        for (int i = startAt; i < endAt; i++) {
                                    %>
                                    <div class="single-job-items mb-30"> 
                                        <div class="job-items">
                                            <div class="company-img">
                                                <a href="MainController?action=DetailJob&jobID=<%= appearjobs.get(i).getJobID()%>"><img class="image-size" src="imageOfJob/<%= appearjobs.get(i).getImage()%>" alt=""></a>
                                            </div>
                                            <div class="job-tittle job-tittle2">
                                                <a href="MainController?action=DetailJob&jobID=<%= appearjobs.get(i).getJobID()%>">
                                                    <h4><%= appearjobs.get(i).getJobName()%></h4>
                                                </a>
                                                <ul>
                                                    <li><%= appearjobs.get(i).getTagName()%></li>
                                                    <li>Từ <%= appearjobs.get(i).getStartTime()%></li>
                                                    <li><%= JobDAO.formatPrice(appearjobs.get(i).getPrice()) %> VNĐ</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="items-link items-link2 f-right">
                                            <a href="MainController?action=DetailJob&jobID=<%= appearjobs.get(i).getJobID()%>">Xem chi tiết</a>
                                        </div>   
                                    </div>
                                    <%
                                        }
                                    %>

                                </div>
                            </section>
                            <!-- Featured_job_end -->
                        </div>
                    </div>
                </div>
            </div>

            <div class="pagination-area pb-115 text-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="single-wrap d-flex justify-content-center">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-start">
                                        <%
                                            int numOfPage = (appearjobs.size() % MAX_JOB_IN_PAGE == 0) ? (appearjobs.size() / MAX_JOB_IN_PAGE) : (appearjobs.size() / MAX_JOB_IN_PAGE + 1);
                                            for (int i = 1; i <= numOfPage; i++) {
                                                if (i != currentPage) {
                                        %> 
                                        <li class="page-item"><a class="page-link" href="MainController?action=ChangePageHomePage&page=<%= i%>"> <%= i%> </a></li>
                                            <%
                                            } else {
                                            %>
                                        <li class="page-item"><a class="page-link"> <%= i%> </a></li>
                                            <%
                                                    }
                                                }
                                            %>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Pagination End  -->

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

        <!-- Jquery Slick , Owl-Carousel Range -->
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
