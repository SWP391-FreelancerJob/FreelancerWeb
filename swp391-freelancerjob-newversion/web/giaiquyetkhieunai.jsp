<%-- 
    Document   : giaiquyetkhieunai
    Created on : Jul 19, 2022, 11:14:15 AM
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
            <div class="container">
                <div class="cms-section container cms-content">
                    <div>
                        <h1>Giải quyết khiếu nại</h1>
                        <div class="wrapper-content">
                            <div>
                                <p>Trong khi sử dụng trang kết nối FLance.vn, nếu bạn cần khiếu nại về dịch vụ, bạn có thể thực hiện theo các bước sau:</p>
                                <p>Bước 1: Gửi khiếu nại/yêu cầu xem xét qua email hỗ trợ của FLance hotro@Flance.vn</p>
                                <p>Bước 2: Bộ phận chăm sóc khách hàng của FLance.vn sẽ tiếp nhận khiếu nại và phản hồi tới bạn trong tối đa 72 giờ sau khi gửi. Tùy theo tính chất và mức độ khiếu nại, sau tối đa 10 ngày làm việc, vLance.vn sẽ liên hệ trao đổi với bạn để xác nhận vấn đề và phương án xử lý. Thời gian giải quyết một khiếu nại tối đa là 10 ngày làm việc</p>
                                <p>Bước 3: Trong trường hợp nằm ngoài khả năng và thẩm quyền của FLance.vn, FLance có quyền từ chối xử lý khiếu nại.</p>
                                <p>FLance.vn tôn trọng và nghiêm túc thực hiện các quy định của pháp luật về bảo vệ quyền lợi của thành viên. Vì vậy, đề nghị các bên gồm Khách hàng và Freelancer cần cung cấp đầy đủ, chính xác, trung thực và chi tiết các thông tin có liên quan đến vấn đề cần khiếu nại. Mọi hành vi lừa đảo, gian lận hoặc phá hoại, gây rối sẽ chịu hoàn toàn trách nhiệm trước pháp luật.</p>
                                <p>Trong trường hợp Khách hàng và Freelancer xảy ra mâu thuẫn. FLance.vn không có trách nhiệm giải quyết các mâu thuẫn này.&nbsp;</p>
                                <p>Địa chỉ nhận thư khiếu nại:&nbsp;<br>
                                    Công Ty Cổ phần Magenweb Việt Nam<br>
                                    Địa chỉ: Tòa nhà Ladeco, tầng 12A, số 266 Đội Cấn, phường Liễu Giai, quận Ba Đình, thành phố Hà Nội<br>
                                    Điện thoại: (+84) 024.6684.1818<br>
                                    Email: hotro@Flance.vn</p>
                                <p>&nbsp;</p>
                            </div> </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
