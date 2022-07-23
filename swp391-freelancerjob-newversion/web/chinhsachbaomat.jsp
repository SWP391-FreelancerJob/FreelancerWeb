<%-- 
    Document   : chinhsachbaomat
    Created on : Jul 19, 2022, 11:12:23 AM
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
                        <h1>Chính sách bảo mật</h1>
                        <div class="wrapper-content">
                            <div>
                                <p><strong><em>1. Mục đích và phạm vi thu nhập</em></strong></p>
                                <p>Việc thu thập dữ liệu chủ yếu trên website bao gồm: email, số điện thoại, địa chỉ, số CMND với cá nhân hoặc Mã số thuế với công ty; thông tin mô tả kỹ năng, kinh nghiệm đối với Freelancer, tài khoản ngân hàng đối với khách hàng,…. Đây là các thông tin mà Ban Quản Lý website cần các bên cung cấp bắt buộc khi đăng ký sử dụng dịch vụ và để Ban Quản Lý website liên hệ xác nhận khi các bên đăng ký sử dụng dịch vụ trên website nhằm đảm bảo quyền lợi cho cả khách hàng và cả Freelancer.</p>
                                <p>Khách hàng và cả Freelancer sẽ tự chịu trách nhiệm về bảo mật và lưu giữ mọi hoạt động sử dụng dịch vụ dưới tên đăng ký, mật khẩu và hộp thư điện tử của mình.</p>
                                &nbsp;
                                <p><strong><em>2. Phạm vi sử dụng thông tin</em></strong></p>
                                <p>Sàn giao dịch TMĐT Flance.vn sử dụng thông tin thành viên cung cấp để:<br>
                                    Cung cấp dịch vụ đăng tin cho khách hàng và chào dự án cho freelancer.<br>
                                    Gửi các thông báo đến bên cung cấp dịch khi có đơn hàng<br>
                                    Ngăn ngừa các hoạt động phá hủy tài khoản người dùng của Freelancer và khách hàng hoặc các hoạt động giả mạo thông tin hai bên.<br>
                                    Nâng cao chất lượng dịch vụ dành cho đối tác và khách hàng.<br>
                                    Giải quyết các vấn đề, tranh chấp phát sinh liên quan đến việc sử dụng dịch vụ qua website<br>
                                    Ngăn chặn những hoạt động vi phạm pháp luật Việt Nam<br>
                                    Không sử dụng thông tin cá nhân của Freelancer và khách hàng ngoài mục đích xác nhận và liên hệ có liên quan đến giao dịch tại Website<br>
                                    Trong trường hợp có yêu cầu của pháp luật: Sàn giao dịch TMĐT Flance.vn có trách nhiệm hợp tác cung cấp thông tin cá nhân thành viên khi có yêu cầu từ cơ quan tư pháp bao gồm: Viện kiểm sát, tòa án, cơ quan công an điều tra liên quan đến hành vi vi phạm pháp luật nào đó của khách hàng. Ngoài ra, không ai có quyền xâm phạm vào thông tin cá nhân của thành viên.</p>
                                &nbsp;
                                <p><strong><em>3. Thời gian lưu trữ thông tin</em></strong></p>
                                <p>- Dữ liệu của Freelancer và khách hàng sẽ được lưu trữ cho đến khi có yêu cầu hủy bỏ hoặc tự thành viên đăng nhập và thực hiện hủy bỏ. Còn lại trong mọi trường hợp thông tin sẽ được bảo mật trên máy chủ của Flance.vn.</p>
                                &nbsp;
                                <p><strong><em>4. Địa chỉ của đơn vị thu nhập quản lý thông tin cá nhân</em></strong></p>
                                <p>Công Ty Cổ phần Magenweb Việt Nam</p>
                                <p>Địa chỉ: Tòa nhà Ladeco, tầng 12A, số 266 Đội Cấn, phường Liễu Giai, quận Ba Đình, thành phố Hà Nội</p>
                                <p>Điện thoại: (+84) 024.6684.1818</p>
                                <p>Email: hotro@Flance.vn</p>
                                &nbsp;
                                <p><strong><em>5. Phương tiện và công cụ để người dùng tiếp cận và chỉnh sửa dữ liệu cá nhân của mình.</em></strong></p>
                                <p>- Khách hàng/Freelancer có quyền tự kiểm tra, cập nhật, điều chỉnh hoặc hủy bỏ thông tin cá nhân của mình bằng cách đăng nhập vào tài khoản trên website Flance.vn, và dùng chức năng chỉnh sửa để điều chỉnh hoặc xóa dữ liệu cá nhân.</p>
                                <p>- Khách hàng/Freelancer có quyền gửi khiếu nại về việc lộ thông tin các nhân cho bên thứ 3 đến Ban quản trị của Sàn giao dịch thương mại điện tử Flance.vn. Khi tiếp nhận những phản hồi này, Flance.vn sẽ xác nhận lại thông tin, phải có trách nhiệm trả lời lý do và hướng dẫn thành viên khôi phục và bảo mật lại thông tin.</p>
                                <p>Email: hotro@Flance.vn</p>
                                &nbsp;
                                <p><strong><em>6. Cam kết bảo mật thông tin cá nhân khách hàng</em></strong></p>
                                <p>- Thông tin Khách hàng/Freelancer trên Flance.vn được cam kết bảo mật tuyệt đối theo chính sách bảo vệ thông tin cá nhân của Flance.vn. Việc thu thập và sử dụng thông tin của Khách hàng/Freelancer chỉ được thực hiện khi có sự đồng ý của khách hàng đó trừ những trường hợp pháp luật có quy định khác.</p>
                                <p>- Flance.vn sử dụng phần mềm Secure Sockets Layer (SSL) để bảo vệ thông tin của Khách hàng/Freelancer trong quá trình chuyển dữ liệu bằng cách mã hóa thông tin bạn nhập vào.</p>
                                <p>- Khách hàng/Freelancer có trách nhiệm tự bảo vệ mình trước sự tiếp cận thông tin về password khi dùng chung máy tính với nhiều người. Khi đó, Khách hàng/Freelancer phải chắc chắn đã thoát khỏi tài khoản sau khi sử dụng dịch vụ của Flance.vn.</p>
                                <p>- Flance.vn cam kết không cố ‎‎ý tiết lộ thông tin khách hàng/ Freelancer , không chia sẻ thông tin nếu chưa được sự đồng ý xác nhận của khách hàng hoặc vi phạm những cam kết giữa Flance.vn với các bên.</p>
                                <p>- Chính sách bảo mật thông tin khách hàng của Flance.vn chỉ được áp dụng tại Flance.vn. Nó không bao gồm hoặc liên quan đến các bên thứ ba khác đặt quảng cáo hoặc có liên kết tại Flance.vn. Khách hàng/Freelancer nên tham khảo và phân biệt rõ sự khác biệt trong chính sách bảo mật thông tin khách hàng của những website này.</p>
                                <p>- Trong trường hợp máy chủ lưu trữ thông tin bị hacker tấn công dẫn đến mất mát dữ liệu Khách hàng/Freelancer, Flance.vn sẽ có trách nhiệm thông báo vụ việc cho cơ quan chức năng điều tra xử lý kịp thời và thông báo cho Khách hàng/Freelancer được biết.</p>
                                <p>- Ban quản lý Flance.vn yêu cầu các cá nhân khi đăng ký là thành viên, phải cung cấp đầy đủ thông tin cá nhân có liên quan như: Họ và tên, địa chỉ liên lạc, email, số CMND, số tài khaorn ngân hàng và chịu trách nhiệm về tính pháp lý của những thông tin trên. Ban quản lý Flance.vn không chịu trách nhiệm cũng như không giải quyết mọi khiếu nại có liên quan đến quyền lợi của Khách hàng/Freelancer đó nếu xét thấy tất cả thông tin Khách hàng/Freelancer cung cấp khi đăng ký ban đầu là không chính xác.</p>
                                &nbsp;
                                <p><strong><em>7. Cơ chế tiếp nhận và giải quyết khiếu nại liên quan đến việc thông tin cá nhân</em></strong></p>
                                <p>Khi khách hàng gửi thông tin cá nhân của khách hàng cho chúng tôi, khách hàng đã đồng ý với các điều khoản mà chúng tôi đã nêu ở trên, Flance.vn cam kết bảo mật thông tin cá nhân của các khách hàng bằng mọi cách thức có thể. Chúng tôi sử dụng các hệ thống mã hóa nhằm bảo vệ thông tin này không bị truy lục, sử dụng hoặc tiết lộ ngoài ý muốn.</p>
                                <p>Flance.vn cũng khuyến cáo các khách hàng nên bảo mật các thông tin liên quan đến mật khẩu truy xuất của các khách hàng và không nên chia sẻ với bất kỳ người nào khác.</p>
                                <p>Trong trường hợp có phản ánh của khách hàng về việc sử dụng thông tin trái với mục đích đã nêu, Flance.vn sẽ tiến hành giải quyết theo các bước sau:<br>
                                    Bước 1: Khách hàng gửi thông tin phản hồi về việc thông tin cá nhân thu thập trái với mục đích đã nêu.<br>
                                    Bước 2: Bộ phận Chăm sóc Khách hàng của Flance.vn tiếp nhận và giải quyết với các bên có liên quan.<br>
                                    Bước 3: Trong trường hợp vượt ra khỏi tầm kiểm soát của Flance.vn, chúng tôi sẽ đưa ra các cơ quan có thẩm quyền để yêu cầu giải quyết</p>
                                <p>Chúng tôi luôn hoan nghênh các ý kiến đóng góp, liên hệ và phản hồi thông tin từ khách hàng về “Chính sách bảo mật” này. Nếu khách hàng có những thắc mắc liên quan xin vui lòng liên hệ theo địa chỉ Email: hotro@Flance.vn</p>
                            </div> </div>
                    </div>
                </div>
            </div>
        </main>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
