<%-- 
    Document   : profile
    Created on : Jun 9, 2022, 7:04:43 PM
    Author     : User
--%>

<%@page import="sample.contact.ContactDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sample.jobs.JobDTO"%>
<%@page import="sample.jobs.JobDAO"%>
<%@page import="sample.user.UserError"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Flance.vn</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/LOGO FPT.png">

    <!-- CSS here -->
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
<link rel="stylesheet" href="css/contact.css">

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

</style>

<body>
    <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
            if (userError.getMessageError() == null) {
                userError.setMessageError("");
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
    <!-- Header Start -->

    <div class="slider-area ">
        <div class="single-slider section-overly slider-height2 d-flex align-items-center"
             data-background="assets/img/background.png">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Thông tin cơ bản</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero Area End -->
    
    <main class="content mt-3">       
            <div class="container p-0">

                
                <div class="card">
                    <div class="row">                   
                        <div class="col-12 col-lg-12 col-xl-12">
                            <div class="py-2 px-4 border-bottom d-none d-lg-block">
                                <div class="d-flex align-items-center py-1">
                                    
                                    <div>
                                        <strong>Liên lạc với đối tác</strong>
                                    </div>

                                </div>
                            </div>

                            <div class="position-relative">
                                <div class="chat-messages p-4">   

                                    <%      
                                        List<ContactDTO> listMessage = (List<ContactDTO>) session.getAttribute("LIST_MESSAGE");

                                            for (ContactDTO list : listMessage) {
                                            String dau_gach = list.getAccountID() + "   " + list.getMessage();
                                            String[] parts = list.getDate().split("-");
                                            String final_date = parts[2] + "-" + parts[1] + "-" + parts[0];
                                            String[] time = list.getTime().split("\\.");
                                            String final_time = time[0];
                                    %>


                                    <%
                                        if (list.getAccountID().equals(loginUser.getAccountID()) == true) {
                                    %>

                                    <div class="chat-message-right pb-4">
                                        <div>
                                            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2"><%= final_time%></div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                                            <div class="font-weight-bold mb-1">Bạn</div>
                                            <%= list.getMessage()%>
                                        </div>
                                            </div>
                                        <div class="d-flex justify-content-center"><%= final_date %></div>
                                    



                                    <%
                                    } else if (list.getAccountID().equals(loginUser.getAccountID()) == false) {
                                    %>

                                    <div class="chat-message-left pb-4">
                                        <div>
                                            <img src="https://bootdey.com/img/Content/avatar/avatar3.png" class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                                            <div class="text-muted small text-nowrap mt-2"><%= final_time%></div>
                                        </div>
                                        <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                                            <div class="font-weight-bold mb-1"><%= list.getAccountID()%></div>
                                            <%= list.getMessage()%>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center"><%= final_date %></div>
                                    
                                    <%
                                            }
                                        }
                                    %>



                                </div>
                            </div>

                            <div class="flex-grow-0 py-3 px-4 border-top">
                                <form action="MainController" method="POST">
                                <div class="input-group">
                                    <div style="color: red"><%= userError.getMessageError()%> </div>
                                    <input type="text" name="Message" class="form-control" placeholder="Aa">
                                    <button type="submit" name="action" value="Send" class="bg-warning text-dark">Gửi</button>
                                </div>
                                </form>
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