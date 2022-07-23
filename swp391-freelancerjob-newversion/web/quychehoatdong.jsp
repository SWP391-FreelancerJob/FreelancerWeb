<%-- 
    Document   : quychehoatdong
    Created on : Jul 19, 2022, 11:10:08 AM
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
                        <h1>Quy chế hoạt động</h1>
                        <div class="wrapper-content">
                            <div><strong>QUY CHẾ HOẠT ĐỘNG CỦA TRANG FLANCE.VN</strong>
                                <p>Bạn đang là chủ một doanh nghiệp hay phụ trách một dự án. Mặc dù đã tiêu tốn nhiều chi phí cho giới thiệu dịch vụ và trả lương nhân viên, nhưng công việc vẫn không được hoàn thành như mong muốn, bởi vì nhân viên của bạn thiếu một vài kỹ năng. Nếu bạn lo lắng về việc phải tuyển mới và xây dựng một đội ngũ nhân viên đông đảo để giải quyết tất cả công việc thì hoàn toàn không cần làm như vậy.</p>
                                <p>Giải pháp là FLance.vn - Trang kết nối Freelancer và Khách hàng hay còn được biết đến là Website việc freelance lớn nhất Việt Nam.</p>
                                <p>Với một cộng đồng hàng trăm nghìn&nbsp;Freelancer tài năng được hội tụ từ khắp Việt Nam, FLance.vn cung cấp cho doanh nghiệp của bạn nguồn nhân lực chất lượng để thực hiện công việc với mức chi phí hợp lý nhất. Lợi ích khi thuê Freelancer tại FLance.vn, Doanh nghiệp của bạn sẽ tiết kiệm được thời gian, tối ưu chi phí và thúc đẩy tăng trưởng ngày một nhanh hơn.</p>
                                <p>FLance.vn đã kết nối thành công hàng trăm doanh nghiệp và Freelancer trên toàn Việt Nam trong lĩnh vực phát triển phần mềm, thiết kế đồ họa - website, marketing online, kế toán – thuế. FLance.vn mong muốn tạo ra một môi trường thân thiện, công bằng, kết nối an toàn giữa Freelancer và Khách hàng.&nbsp;</p>
                                <p>&nbsp;</p>
                                <strong>I. Nguyên tắc chung</strong>
                                <p>Sàn giao dịch điện tử FLance.vn do Công Ty Cổ phần Magenweb Việt Nam (Công ty) thực hiện hoạt động và vận hành.</p>
                                <p>Nguyên tắc này áp dụng cho các thành viên đăng ký sử dụng, tham gia đăng thông tin tìm kiếm công việc hoặc tìm nhân sự được thực hiện trên nền tảng kết nối FLance.vn.</p>
                                <p>Thương nhân, tổ chức, cá nhân tham gia nền tảng kết nối FLance.vn tự do thỏa thuận trên cơ sở tôn trọng quyền và lợi ích hợp pháp của các bên tham gia hoạt động cung cấp và thuê dịch vụ thông qua hợp đồng, tuân thủ quy định pháp luật Việt Nam.</p>
                                <p>Thông tin dịch vụ cung cấp được đăng tải trên nền tảng kết nối FLance.vn phải đáp ứng đầy đủ các quy định của pháp luật có liên quan, không thuộc các trường hợp cấm theo quy định của pháp luật.</p>
                                <p>Hoạt động đăng tin qua FLance.vn phải được thực hiện công khai, minh bạch, đảm bảo quyền lợi của Khách hàng và Freelancer.</p>
                                <p>Tất cả các nội dung trong Quy định này phải tuân thủ theo hệ thống pháp luật hiện hành của Việt Nam. Thành viên khi tham gia vào FLance.vn phải tự tìm hiểu trách nhiệm pháp lý của mình đối với luật pháp hiện hành của Việt Nam và cam kết thực hiện đúng những nội dung trong Quy chế của FLance.vn.</p>
                                <br>
                                <strong>II. Quy định chung</strong>
                                <p>Tên Miền Sàn Giao dịch Thương mại Điện tử:</p>
                                <p>Sàn giao dịch TMĐT FLance.vn do Công Ty Cổ phần Magenweb Việt Nam phát triển với tên miền Sàn giao dịch là: FLance.vn (sau đây gọi tắt là: “Sàn giao dịch TMĐT FLance.vn”).</p>
                                <p>Định nghĩa chung:<br>
                                    Freelancer: là nhóm, cá nhân có nhu cầu sử dụng dịch vụ của FLance.vn để đăng thông tin chào giá trực tuyến các dự án trên Sàn giao dịch<br>
                                    Khách hàng: là thương nhân, tổ chức, cá nhân có nhu cầu đăng trự tuyến các dự án lên Sàn Giao dịch FLance.vn để tìm kiếm Freelancer có chất lượng.<br>
                                    Thành viên: là bao gồm cả Freelancer lẫn Khách hàng.</p>
                                <p>Thành viên phải tạo tài khoản để sử dụng các dịch vụ trên Sàn. Thành viên phải đăng ký kê khai ban đầu các thông tin cá nhân có liên quan, được Ban quản lý sàn TMĐT FLance.vn chính thức công nhận và được phép sử dụng dịch vụ do Sàn giao dịch TMĐT FLance.vn.</p>
                                <p>Khi đăng ký là thành viên của FLance.vn, thành viên hiểu rằng:<br>
                                    + Thành viên có thể tạo một tài khoản cá nhân của mình để sử dụng.<br>
                                    + Thành viên có thể đăng tin giới thiệu dịch vụ theo đúng quy chuẩn, cam kết của thành viên hợp pháp đã công bố trên sàn.</p>
                                <p>Nội dung bản Quy chế này tuân thủ theo các quy định hiện hành của Việt Nam</p>
                                <p>Thành viên khi tham gia vào Sàn giao dịch TMĐT FLance.vn phải tự tìm hiểu trách nhiệm pháp lý của mình đối với luật pháp hiện hành của Việt Nam và cam kết thực hiện đúng những nội dung trong Quy chế của Sàn giao dịch FLance.vn.</p>
                                <br>
                                <strong>III. Quy trình giao dịch</strong>
                                <p><strong>a. Quy trình tạo tài khoản người dùng trên FLance.vn</strong></p>
                                <p>Bước 1: Tạo tài khoản</p>
                                <p>Bạn cũng có thể đăng nhập vào FLance.vn bằng tài khoản Facebook hoặc tài khoản Google.</p>

                                <p><em>(Bạn có thể dễ dàng đăng ký tài khoản trên FLance.vn bằng Email, tài khoản Facebook hoặc tài khoản Google.)</em></p>
                                <p>&nbsp;</p>
                                <p>Bước 2: Xác thực tài khoản</p>
                                <p>Sau khi tạo tài khoản thành công, bạn cần xác thực tài khoản bằng số điện thoại/CMND</p>

                                <p><em>(Truy cập vào mục Xác thực thông tin và thực hiện xác thực theo hướng dẫn.)</em></p>
                                <p>&nbsp;</p>
                                <p>Bước 3: Cập nhật thông tin cá nhân, hồ sơ làm việc và hồ sơ năng lực</p>

                                <em>(Cập nhật thông tin cơ bản thật đầy đủ theo hướng dẫn để thể hiện sự uy tín của bạn.)</em>
                                <p>&nbsp;</p>
                                <p><strong>b. Quy trình dành cho khách hàng</strong></p>
                                <p><strong>Quy trình đăng dự án</strong></p>
                                <p>Bước 1: Vào mục đăng việc</p>
                                <p>Bạn nhấp vào nút “Đăng dự án” hiển thị trên thanh Menu hoặc trên trang chủ.</p>

                                <p><em>(Nhấp chọn nút “Đăng dự án” trên thanh Menu hoặc trang chủ. Mẫu đăng việc của FLance đã sẵn sàng để bạn sử dụng)</em></p>
                                <p>&nbsp;</p>
                                <p>Bước 2: Điền thông tin</p>
                                <p>Sau khi vào mục Đăng việc, bạn sẽ thấy mẫu để tiền tên công việc và mô tả như hình sau.</p>

                                <p><em>(Bạn điền thông tin theo hướng dẫn)</em></p>
                                <p>&nbsp;</p>
                                <p>Tiếp theo bạn cần chọn ngân sách cho công việc và thêm kỹ năng trong các danh mục như hình sau đây:</p>

                                <p><em>(Chọn ngân sách cho dự án)</em></p>
                                <p>&nbsp;</p>
                                <p>Bước 3: Đăng việc trên FLance</p>
                                <p>Sau khi hoàn tất các bước ở trên bạn hãy bấm vào nút <strong>Đăng việc</strong></p>

                                <em>(Sau khi điền đầy đủ thông tin, nhấp chọn nút “Đăng việc” để hoàn thành. Dự án của bạn sau khi đăng sẽ cần duyệt trước khi được hiển thị)</em>
                                <p>&nbsp;</p>
                                <p><strong>Hướng dẫn đánh giá freelancer</strong></p>
                                <p>Khi xác nhận kết thúc dự án, bạn hãy bấm nút Đánh giá Freelancer ngay trong trang Tin nhắn.</p>

                                <p><em>(Đánh giá Freelancer ngay trong trang Tin nhắn)</em></p>
                                <p>&nbsp;</p>
                                <p>Sau khi bấm nút màn hình hiện lên 5 tiêu chí Đánh giá chất lượng dịch vụ và nhận xét về Freelancer.</p>

                                <p><em>(Sau khi bấm nút, bạn có thể bỏ phiếu dựa trên 5 tiêu chí Đánh giá chất lượng dịch vụ và nhận xét về Freelancer)</em></p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>

                                <p><em>(Sau khi bình chọn sao, bạn hãy để lại nhận xét cho Freelancer)</em></p>
                                <p>&nbsp;</p>
                                <p>&nbsp;</p>
                                <p><strong>c. Quy trình dành cho Freelancer</strong></p>
                                <p><strong>Quy trình chào giá dự án</strong></p>
                                <p>Bước 1: Đọc hiểu yêu cầu công việc</p>
                                <p>Đọc kỹ dự án để nắm được các thông tin cơ bản và hiểu được yêu cầu của khách hàng.</p>

                                <p><em>(Freelancer cần đọc kỹ thông tin công việc trước khi chào giá)</em></p>
                                <p>&nbsp;</p>
                                <p>Bước 2 : Đề xuất thuyết phục khách hàng</p>
                                <p>Đề xuất thuyết phục khách hàng thuê bạn, bạn cần giải đáp hai câu hỏi:</p>
                                <p>- Vì sao bạn phù hợp với công việc này</p>
                                <p>- Bạn dự định thực hiện công việc này như thế nào</p>

                                <p>&nbsp;</p>
                                <p>Bước 3 : Đề xuất chi phí</p>
                                <p>Điền mức đề xuất chi phí để thực hiện công việc cho khách hàng bằng cách điền vào bảng:</p>

                                <p><em>(Bạn điền mức lương đề xuất của bạn cho công việc)</em></p>
                                <p>&nbsp;</p>
                                <p>Bước 4: Dự kiến thời gian hoàn thành</p>
                                <p>Hãy cho khách hàng biết thời gian bạn dự tính hoàn thành dự án</p>

                                <p><em>(Dự kiến thời gian hoàn thành)</em></p>
                                <p>&nbsp;</p>
                                <p>Bước 5 : Chú ý cách trình bày nội dung chào giá</p>
                                <p>Hãy viết đoạn văn dễ đọc, các đoạn vừa phải và nên ngắt dòng hợp lý. Một chào giá thành công trên FLance.vn được thống kê có độ dài trung bình 396 ký tự.</p>
                                <p>Kiểm tra một lượt các thông tin đã điền, sau đó bấm nút <strong>Gửi chào giá</strong> để chào giá của bạn được gửi tới khách hàng.</p>
                                <p>Sau khi bạn gửi chào giá, khách hàng sẽ nhận được chào giá như ví dụ dưới đây</p>

                                <p><em>(Mẫu chào giá đã được hiển thị thành công)</em></p>
                                <p>&nbsp;</p>
                                <p>Freelancer và khách hàng sẽ liên hệ với nhau chủ yếu qua hệ thống tin nhắn do FLance cung cấp.</p>
                                <p>Trên FLance, chỉ khách hàng mới có thể chủ động liên hệ trước với freelancer. Nếu khách hàng liên hệ với bạn, bạn sẽ nhận được tin nhắn như hình dưới đây:</p>

                                <p><em>(Mẫu tin nhắn hiển thị khi Khách hàng nhắn tin)</em></p>
                                <p>Bạn có thể dùng hệ thống tin nhắn trên để trao đổi và gửi sản phẩm cho khách hàng.&nbsp;</p>
                                <p>&nbsp;</p>
                                <p><strong>Cách gửi sản phẩm cho Khách hàng</strong></p>
                                <p>Cách 1: Thêm tài liệu đính kèm</p>
                                <p>Bạn có thể đăng sản phẩm lên trang tin nhắn FLance bằng cách bấm vào Thêm tài liệu đính kèm như hình dưới:</p>

                                <p><em>(Cách gửi sản phẩm cho khách hàng bằng tính năng “Thêm tài liệu”)</em></p>
                                <p>&nbsp;</p>
                                <p>Cách 2: Gửi link sản phẩm</p>
                                <p>Bạn có thể đăng sản phẩm lên các trang như Google Drive, Dropbox, v.v. rồi gửi đường link cho khách hàng qua trang tin nhắn của FLance. Khách hàng sẽ truy cập vào đường link đó và tải sản phẩm về.</p>

                                <p><em>(Cách gửi sản phẩm cho khách hàng bằng cách gửi link online của sản phẩm)</em></p>
                                <p>&nbsp;</p>
                                <p><strong>Chính sách giao nhận, vận chuyển</strong></p>
                                <p>Khách hàng và Freelancer sẽ giao nhận công việc bằng chức năng giao việc trên website FLance.vn và trao đổi công việc qua công cụ nhắn tin trên Sàn. Hoặc khách hàng và Freelancer có thể liên hệ trực tiếp với nhau theo hướng dẫn thao tác trên Sàn, thông tin của Freelancer sẽ được gửi tới khách hàng qua email. Hai bên có thể làm việc trực tiếp để thuận tiện cho dự án/công việc. Sau khi hoàn thành công việc, sản phẩm và kết quả công việc do hai bên tự thỏa thuận về phương thức giao nhận, tùy thuộc vào tính chất dự án, công việc và tùy vào khoảng cách địa lý giữa các bên. Kết thúc dự án, hai bên xác nhận hoàn tất công việc trên website.</p>
                                &nbsp;
                                <p><strong>Chính sách bảo hành</strong></p>
                                <p>FLance.vn là đơn vị trung gian (bên thứ ba) có chức năng kết nối Khách hàng và Freelancer. Khách hàng và Freelancer có thể lựa chọn làm việc trên FLance để nhận được chứng nhận và đánh giá tích cực. Trong quá trình thực hiện, hai bên không hoàn thành công việc, FLance có thể hỗ trợ tìm Freelancer khác phù hợp với yêu cầu của Khách hàng</p>
                                &nbsp;
                                <p><strong>Quy trình hỗ trợ giải quyết khiếu nại</strong></p>
                                <p>Khi xảy ra tranh chấp, FLance đề cao giải pháp thương lượng hòa giải giữa các bên nhằm duy trì sự tin cậy và chất lượng dịch vụ của FLance.vn theo các bước sau: FLance không có nghĩa vụ giải quyết các vấn đề tranh chấp giữa Khách hàng và Freelancer. FLance sẽ hỗ trợ tư vấn để Khách hàng và Freelancer làm việc hiệu quả. Khách hàng hoặc Freelancer cần đọc và tuân thủ theo
                                <p>&nbsp;</p>
                                <p><strong>IV. Quy trình thanh toán</strong></p>
                                <p><strong>Quy trình thanh toán giữa Khách hàng, Freelancer và FLance.vn </strong></p>
                                <p>FLance sẽ không can thiệp vào hoạt động thanh toán giữa Khách hàng và Freelancer. Để tiếp cận và liên hệ được nhiều Freelancer và công việc hơn, Khách hàng, Freelancer có thể nâng cấp gói tài khoản của mình nhằm sử dụng được toàn bộ các tính năng làm việc trên FLance. Bạn có thể xem thêm hướng dẫn nâng cấp tài khoản Khách hàng, hoặc hướng dẫn nâng cấp tài khoản Freelancer trên FLance.vn</p>
                                <p><strong>LƯU Ý:</strong></p>
                                <p>- Trong trường hợp phát sinh phụ phí chuyển khoản, Khách hàng hoặc Freelancer vui lòng thanh toán chi phí này với ngân hàng.<br>
                                    - Trong trường hợp Khách hàng quên không ghi mã số ID dự án khi chuyển tiền, vui lòng gửi biên lai chuyển khoản cho hotro@Flance.vn để được hỗ trợ giải quyết.</p>
                                <p>&nbsp;</p>
                                <p><strong>V. Đảm bảo an toàn giao dịch</strong></p>
                                <p>Ban quản lý sẽ áp dụng các biện pháp kỹ thuật để bảo vệ thông tin về nội dung trên FLance.vn. Để đảm bảo các giao dịch được tiến hành thành công, hạn chế tối đa rủi ro có thể phát sinh.</p>
                                <p>Để đảm bảo các giao dịch được tiến hành thành công, hạn chế tối đa rủi ro có thể phát sinh, các bên phải cung cấp thông tin đầy đủ (tên, địa chỉ, số điện thoại, email, số CMND).</p>
                                <p>Freelancer và Khách hàng có thể liên hệ với nhau qua công cụ nhắn tin xác nhận thông tin dự án được đăng tải tại FLance.vn có chính xác không.<br>
                                    Trong trường hợp Freelancer yêu cầu bạn phải chuyển riêng 1 khoản tiền trước khi cung cấp dịch vụ. Khách hàng phải thận trọng, tìm hiểu những thông tin liên quan đến Freelancer. FLance.vn không chịu trách nhiệm về những thiệt hại hay rủi ro thành viên có thể gánh chịu khi thực hiện các điều kiện khác không liên quan đến nội dung công việc đăng tải.</p>
                                <p>Khách hàng tuyệt đối không sử dụng bất kỳ chương trình, công cụ hay hình thức nào khác để can thiệp vào hệ thống hay làm thay đổi cấu trúc dữ liệu. Nghiêm cấm việc phát tán, truyền bá hay cổ vũ cho bất kỳ hoạt động nào nhằm can thiệp, phá hoại hay xâm của hệ thống website. Mọi vi phạm sẽ bị xử lý theo Quy chế và quy định của pháp luật.</p>
                                <p>Mọi thông tin giao dịch được bảo mật, trừ trường hợp buộc phải cung cấp khi Cơ quan pháp luật yêu cầu.</p>
                                <p>&nbsp;</p>
                                <p><strong>VI. Bảo vệ thông tin cá nhân Khách hàng và Freelancer</strong></p>
                                <p><strong>1. Mục đích và phạm vi thu nhập</strong></p>
                                <p>Việc thu thập dữ liệu chủ yếu trên website bao gồm: email, số điện thoại, địa chỉ, số CMND với cá nhân hoặc Mã số thuế với công ty; thông tin mô tả kỹ năng, kinh nghiệm đối với Freelancer, tài khoản ngân hàng đối với Khách hàng,…. Đây là các thông tin mà Ban Quản Lý website cần các bên cung cấp bắt buộc khi đăng ký sử dụng dịch vụ và để Ban Quản Lý website liên hệ xác nhận khi các bên đăng ký sử dụng dịch vụ trên website nhằm đảm bảo quyền lợi cho cả Khách hàng và cả Freelancer. FLance thu thập thông tin khách hàng và có nhiệm vụ bảo vệ thông tin khách hàng theo .&nbsp;</p>
                                <p>Khách hàng và cả Freelancer sẽ tự chịu trách nhiệm về bảo mật và lưu giữ mọi hoạt động sử dụng dịch vụ dưới tên đăng ký, mật khẩu và hộp thư điện tử của mình.&nbsp;</p>
                                <p>&nbsp;</p>
                                <p><strong>2. Phạm vi sử dụng thông tin</strong></p>
                                <p>&nbsp;FLance.vn sử dụng thông tin thành viên cung cấp để:</p>
                                <ul>
                                    <li>Cung cấp dịch vụ đăng tin cho Khách hàng và chào dự án cho Freelancer.</li>
                                    <li>Gửi các thông báo đến bên cung cấp dịch khi có đơn hàng</li>
                                    <li>Ngăn ngừa các hoạt động phá hủy tài khoản người dùng của Freelancer và Khách hàng hoặc các hoạt động giả mạo thông tin hai bên.</li>
                                    <li>Nâng cao chất lượng dịch vụ dành cho đối tác và Khách hàng.</li>
                                    <li>Giải quyết các vấn đề, tranh chấp phát sinh liên quan đến việc sử dụng dịch vụ qua website</li>
                                    <li>Ngăn chặn những hoạt động vi phạm pháp luật Việt Nam</li>
                                </ul>
                                <p>FLance không sử dụng thông tin cá nhân của Freelancer và Khách hàng ngoài mục đích xác nhận và liên hệ có liên quan đến giao dịch tại Website</p>
                                <p>Trong trường hợp có yêu cầu của pháp luật,&nbsp; FLance.vn có trách nhiệm hợp tác cung cấp thông tin cá nhân thành viên khi có yêu cầu từ cơ quan tư pháp bao gồm: Viện kiểm sát, tòa án, cơ quan công an điều tra liên quan đến hành vi vi phạm pháp luật nào đó của Khách hàng. Ngoài ra, không ai có quyền xâm phạm vào thông tin cá nhân của thành viên.</p>
                                <p>&nbsp;</p>
                                <p><strong>3. Thời gian lưu trữ thông tin</strong></p>
                                <p>Dữ liệu của Freelancer và Khách hàng sẽ được lưu trữ cho đến khi có yêu cầu hủy bỏ hoặc tự thành viên đăng nhập và thực hiện hủy bỏ. Còn lại trong mọi trường hợp thông tin sẽ được bảo mật trên máy chủ của FLance.vn.</p>
                                &nbsp;
                                <p><strong>4. Phương tiện và công cụ để người dùng tiếp cận và chỉnh sửa dữ liệu cá nhân của mình.</strong></p>
                                <p>- Khách hàng/Freelancer có quyền tự kiểm tra, cập nhật, điều chỉnh hoặc hủy bỏ thông tin cá nhân của mình bằng cách đăng nhập vào tài khoản trên website FLance.vn, và dùng chức năng chỉnh sửa để điều chỉnh hoặc xóa dữ liệu cá nhân.</p>
                                <p>- Khách hàng/Freelancer có quyền gửi khiếu nại về việc lộ thông tin các nhân cho bên thứ 3 đến Ban quản trị của FLance.vn. Khi tiếp nhận những phản hồi này, FLance.vn sẽ xác nhận lại thông tin, phải có trách nhiệm trả lời lý do và hướng dẫn thành viên khôi phục và bảo mật lại thông tin.</p>
                                <p>&nbsp;</p>
                                <p><strong>5. Cam kết bảo mật thông tin cá nhân Khách hàng</strong></p>
                                <p>Thông tin Khách hàng/Freelancer trên FLance.vn được cam kết bảo mật tuyệt đối theo. Việc thu thập và sử dụng thông tin của Khách hàng/Freelancer chỉ được thực hiện khi có sự đồng ý của Khách hàng đó trừ những trường hợp pháp luật có quy định khác.</p>
                                <p>&nbsp;</p>
                                <p><strong>6. Cơ chế tiếp nhận và giải quyết khiếu nại liên quan đến việc thông tin cá nhân</strong><em> </em></p>
                                <p>Khi Khách hàng gửi thông tin cá nhân của Khách hàng cho chúng tôi, Khách hàng đã đồng ý với các điều khoản mà chúng tôi đã nêu ở trên, FLance.vn cam kết bảo mật thông tin cá nhân của các Khách hàng bằng mọi cách thức có thể. Chúng tôi sử dụng các hệ thống mã hóa nhằm bảo vệ thông tin này không bị truy lục, sử dụng hoặc tiết lộ ngoài ý muốn.</p>
                                <p>FLance.vn cũng khuyến cáo các Khách hàng nên bảo mật các thông tin liên quan đến mật khẩu truy xuất của các Khách hàng và không nên chia sẻ với bất kỳ người nào khác.</p>
                                <p>Trong trường hợp có phản ánh của Khách hàng về việc sử dụng thông tin trái với mục đích đã nêu, FLance.vn sẽ tiến hành giải quyết theo các bước sau:</p>
                                <p>Bước 1: Khách hàng gửi thông tin phản hồi về việc thông tin cá nhân thu thập trái với mục đích đã nêu kèm bằng chứng cụ thể, rõ ràng.</p>
                                <p>Bước 2: Bộ phận Chăm sóc Khách hàng của FLance.vn tiếp nhận và giải quyết với các bên có liên quan.</p>
                                <p>Bước 3: Trong trường hợp vượt ra khỏi tầm kiểm soát của FLance.vn, chúng tôi sẽ đưa ra các cơ quan có thẩm quyền để yêu cầu giải quyết</p>
                                <p>Chúng tôi luôn hoan nghênh các ý kiến đóng góp, liên hệ và phản hồi thông tin từ Khách hàng về “Chính sách bảo mật” này. Nếu Khách hàng có những thắc mắc liên quan xin vui lòng liên hệ theo địa chỉ email: hotro@FLance.vn</p>
                                &nbsp;
                                <p><strong>VII. Bảo về quyền lợi của thành viên</strong></p>
                                <p>Ban quản lý FLance.vn yêu cầu các cá nhân khi đăng ký là thành viên, phải cung cấp đầy đủ thông tin cá nhân có liên quan như: Họ và tên, địa chỉ liên lạc, email, điện thoại, số CMND và chịu trách nhiệm về tính pháp lý của những thông tin trên. Ban quản lý FLance.vn không chịu trách nhiệm cũng như không giải quyết mọi khiếu nại có liên quan đến quyền lợi của các bên nếu xét thấy tất cả thông tin cá nhân của các bên cung cấp khi đăng ký ban đầu là không chính xác.</p>
                                <p>Thành viên có quyền phản ánh về chất lượng của website FLance.vn đến ban quản trị. Mặt khác thành viên cũng có thể phản ánh tính xác thực về những tin bài liên quan đến nội dung của Freelancer.</p>
                                <p>FLance.vn luôn đảm bảo giải quyết những phản ánh, khiếu nại liên quan đến chất lượng của website FLance.vn. Đối với những phản ánh liên quan đến các thành viên hoạt động trên FLance.vn ban quản trị sẽ có biện pháp xử lý dựa theo mức độ.</p>
                                &nbsp;
                                <p><strong>VIII. Quản lý thông tin xấu</strong></p>
                                <p><strong>1. Quy định thành viên:</strong></p>
                                <p>Thành viên sẽ tự chịu trách nhiệm về bảo mật và lưu giữ mọi hoạt động sử dụng dịch vụ dưới tên đăng ký, mật khẩu của mình. Thành viên có trách nhiệm thông báo kịp thời cho&nbsp; FLance.vn về những hành vi sử dụng trái phép, lạm dụng, vi phạm bảo mật, lưu giữ tên đăng ký và mật khẩu của bên thứ ba để có biện pháp giải quyết phù hợp.</p>
                                <p>Thành viên không sử dụng dịch vụ của FLance.vn vào những mục đích bất hợp pháp, không hợp lý, lừa đảo, đe doạ, thăm dò thông tin bất hợp pháp, phá hoại, tạo ra và phát tán virus gây hư hại tới hệ thống, cấu hình, truyền tải thông tin của FLance.vn hay sử dụng dịch vụ của mình vào mục đích đầu cơ, lũng đoạn thị trường tạo những đơn đặt hàng, chào hàng giả, kể cả phục vụ cho việc phán đoán nhu cầu thị trường. Trong trường hợp vi phạm thì thành viên phải chịu trách nhiệm về các hành vi của mình trước pháp luật.</p>
                                <p>Thành viên không được thay đổi, chỉnh sửa, gán ghép, sao chép, truyền bá, phân phối, cung cấp và tạo những công cụ tương tự của dịch vụ do FLance.vn cung cấp cho một bên thứ ba nếu không được sự đồng ý của FLance.vn trong bản Quy chế này.</p>
                                <p>Thành viên không được hành động gây mất uy tín của FLance.vn dưới mọi hình thức như gây mất đoàn kết giữa các thành viên bằng cách sử dụng tên đăng ký thứ hai, thông qua một bên thứ ba hoặc tuyên truyền, phổ biến những thông tin không có lợi cho uy tín của FLance.vn.</p>
                                <p>&nbsp;</p>
                                <p><strong>2. Hành vi cấm trong hoạt động đăng tải tin để giới thiệu, quảng cáo sản phẩm, dịch vụ trên FLance</strong></p>
                                <ul>
                                    <li>Quảng cáo thiếu thẩm mỹ, trái với truyền thống lịch sử, văn hóa, đạo đức, thuần phong mỹ tục Việt Nam.</li>
                                    <li>Quảng cáo xúc phạm uy tín, danh dự, nhân phẩm của tổ chức, cá nhân.</li>
                                    <li>Quảng cáo có sử dụng hình ảnh, lời nói, chữ viết của cá nhân khi chưa được cá nhân đó đồng ý, trừ trường hợp được pháp luật cho phép.</li>
                                    <li>Quảng cáo không đúng hoặc gây nhầm lẫn về khả năng kinh doanh, khả năng cung cấp sản phẩm, hàng hóa, dịch vụ của tổ chức, cá nhân kinh doanh sản phẩm, hàng hóa, dịch vụ; về số lượng, chất lượng, giá, công dụng, kiểu dáng, bao bì, nhãn hiệu, xuất xứ, chủng loại, phương thức phục vụ, thời hạn bảo hành của sản phẩm, hàng hoá, dịch vụ đã đăng ký hoặc đã được công bố.</li>
                                    <li>Quảng cáo bằng việc sử dụng phương pháp so sánh trực tiếp về giá cả, chất lượng, hiệu quả sử dụng sản phẩm, hàng hóa, dịch vụ của mình với giá cả, chất lượng, hiệu quả sử dụng sản phẩm, hàng hóa, dịch vụ cùng loại của tổ chức, cá nhân khác.</li>
                                    <li>Quảng cáo có nội dung cạnh tranh không lành mạnh theo quy định của pháp luật về cạnh tranh.</li>
                                    <li>Quảng cáo vi phạm pháp luật về sở hữu trí tuệ</li>
                                </ul>
                                <p>&nbsp;</p>
                                <p><strong>3. Cơ chế rà soát, kiểm soát thông tin của Ban quản lý FLance đối với tin bài đăng tải trên website: </strong></p>
                                <p>Quy định này nhằm thống nhất việc quản lý và cập nhật thông tin trên website FLance.vn, đảm bảo thông tin trên website phù hợp với nội dung hoạt động của công ty.</p>
                                <p>Thông tin cá nhân của thành viên bắt buộc phải xác thực bằng số điện thoại, số CMND. Sau khi Khách hàng đăng các dự án, FLance.vn sẽ kiểm tra nội dung đảm bảo không vi phạm các quy định về đăng tin trước khi cho nội dung hiển thị.</p>
                                <p>Các thông tin đưa lên website FLance.vn là thông tin chính thức, công khai được bộ phận quản lý website kiểm duyệt. Đề nghị Khách hàng/Freelancer phải chấp hành đúng nội quy đăng tin tại mục “Quản lý thông tin xấu” trong bản Quy chế hoạt động này</p>
                                <p>FLance.vn sẽ toàn quyền loại bỏ các tin đăng của thành viên nếu như tin đăng vi phạm quy chế đăng tin. Các tin đăng không phù hợp sẽ bị yêu cầu điều chỉnh. FLance.vn giữ quyền quyết định về việc lưu giữ hay loại bỏ tin đã đăng trên trang web này theo điều khoản quy định chung hoặc thỏa thuận đã có với Khách hàng.</p>
                                &nbsp;
                                <p><strong>IX. Trách nhiệm trong trường hợp phát sinh lỗi kỹ thuật</strong></p>
                                <p>FLance.vn cam kết nỗ lực đảm bảo sự an toàn và ổn định của toàn bộ hệ thống kỹ thuật. Tuy nhiên, trong trường hợp xảy ra sự cố do lỗi của FLance.vn, FLance.vn sẽ ngay lập tức áp dụng các biện pháp để đảm bảo quyền lợi cho người sử dụng dịch vụ trên website.</p>
                                <p>Khi thực hiện các đăng tin trên Sàn, bắt buộc các thành viên phải thực hiện đúng theo các quy trình hướng dẫn.</p>
                                <p>Ban quản lý&nbsp;FLance.vn cam kết cung cấp chất lượng dịch vụ tốt nhất cho các thành viên tham gia giao dịch. Trường hợp phát sinh lỗi kỹ thuật, lỗi phần mềm hoặc các lỗi khách quan khác dẫn đến Thành viên không thể tham gia giao dịch được thì các Thành viên thông báo cho Ban quản lý&nbsp; qua email, chúng tôi sẽ khắc phục lỗi trong thời gian sớm nhất, tạo điều kiện cho các thành viên tham gia&nbsp; FLance.vn.</p>
                                <p>Tuy nhiên, Ban quản lý&nbsp;FLance.vn sẽ không chịu trách nhiệm giải quyết trong trường hợp thông báo của các thành viên không đến được Ban quản lý, phát sinh từ lỗi kỹ thuật, lỗi đường truyền, phần mềm hoặc các lỗi khác không do Ban quản lý gây ra.</p>
                                &nbsp;
                                <p><strong>X. Quyền và nghĩa vụ của Ban quản lý FLance.vn</strong></p>
                                <p><strong>1. Quyền của Ban quản lý FLance.vn</strong></p>
                                <p>FLance.vn sẽ tiến hành cung cấp các dịch vụ cho những thành viên tham gia sau khi đã hoàn thành các thủ tục và các điều kiện bắt buộc mà&nbsp; FLance.vn nêu ra.</p>
                                <p>Trong trường hợp có cơ sở để chứng minh thành viên cung cấp thông tin cho&nbsp; FLance.vn không chính xác, sai lệch, không đầy đủ hoặc vi phạm pháp luật hay thuần phong mỹ tục Việt Nam thì&nbsp; FLance.vn có quyền từ chối, tạm ngừng hoặc chấm dứt quyền sử dụng dịch vụ của thành viên.</p>
                                <p>FLance.vn có thể chấm dứt quyền thành viên và quyền sử dụng một hoặc tất cả các dịch vụ của thành viên và sẽ thông báo cho thành viên trong thời hạn ít nhất là một (01) tháng trong trường hợp thành viên vi phạm các Quy chế của FLance.vn hoặc có những hành vi ảnh hưởng đến hoạt động trên FLance.vn.</p>
                                <p>FLance.vn sẽ xem xét việc chấm dứt quyền sử dụng dịch vụ và quyền thành viên của thành viên nếu thành viên không hoạt động trên FLance trong suốt 6 tháng trở lên. Nếu muốn tiếp tục trở thành thành viên và được cấp lại quyền sử dụng dịch vụ thì phải đăng ký lại từ đầu theo mẫu và thủ tục của FLance.vn.</p>
                                <p>FLance.vn có thể chấm dứt ngay quyền sử dụng dịch vụ và quyền thành viên của thành viên nếu FLance.vn phát hiện thành viên vi phạm pháp luật, bị kết án hoặc đang trong thời gian thụ án. Trong trường hợp thành viên tiếp tục hoạt động có thể gây cho FLance.vn trách nhiệm pháp lý, có những hoạt động lừa đảo, giả mạo, gây rối loạn thị trường, gây mất đoàn kết đối với các thành viên khác của&nbsp; FLance.vn, hoạt động vi phạm pháp luật hiện hành của Việt Nam. Trong trường hợp chấm dứt quyền thành viên và quyền sử dụng dịch vụ thì tất cả các chứng nhận, các quyền hạn của thành viên được cấp sẽ không còn giá trị và hiệu lực trên FLance.vn</p>
                                <p>FLance.vn giữ bản quyền sử dụng dịch vụ và các nội dung trên FLance.vn theo các quy dịnh pháp luật về bảo hộ sở hữu trí tuệ tại Việt Nam. Tất cả các biểu tượng, nội dung theo các ngôn ngữ khác nhau đều thuộc quyền sở hữu của&nbsp; FLance.vn. Nghiêm cấm mọi hành vi sao chép, sử dụng và phổ biến bất hợp pháp các quyền sở hữu trên.</p>
                                <p>FLance.vn giữ quyền được thay đổi bảng, biểu giá dịch vụ và phương thức thanh toán trong thời gian cung cấp dịch vụ cho thành viên theo nhu cầu và điều kiện khả năng của FLance.vn và sẽ báo trước cho thành viên thời hạn là một (01) tháng.</p>
                                <p>&nbsp;</p>
                                <p><strong>2. Nghĩa vụ và trách nhiệm của Ban quản lý FLance.vn</strong></p>
                                <p>FLance.vn có trách nhiệm xây dựng, thực hiện “cơ chế kiểm tra, giám sát để đảm bảo việc cung cấp thông tin của Freelancer trên website được thực hiện chính xác đầy đủ” theo quy định của pháp luật Việt Nam.&nbsp;</p>
                                <p>FLance.vn chịu trách nhiệm xây dựng website bao gồm một số công việc chính như: nghiên cứu, thiết kế, mua sắm các thiết bị phần cứng và phần mềm, kết nối Internet, xây dựng chính sách phục vụ cho hoạt động.</p>
                                <p>FLance.vn trong điều kiện và phạm vi cho phép. FLance.vn sẽ tiến hành triển khai và hợp tác với các đối tác trong việc xây dựng hệ thống các dịch vụ, các công cụ tiện ích phục vụ cho việc giao dịch của các thành viên tham gia và người sử dụng trên&nbsp; FLance.vn.</p>
                                <p>FLance.vn có trách nhiệm tiếp nhận phản ánh từ thành viên nếu xảy ra tranh chấp giữa Khách hàng và Freelancer. Ban quản trị sẽ cân nhắc xem xét những phản ánh đó. Tuy theo mức độ&nbsp; FLance.vn sẽ có phương án giải quyết bảo vệ quyền lợi của thành viên.</p>
                                <p>FLance.vn chịu trách nhiệm xây dựng, bổ sung hệ thống các kiến thức, thông tin về: nghiệp vụ ngoại thương, hệ thống văn bản pháp luật thương mại trong nước và quốc tế, thị trường nước ngoài, cũng như các tin tức có liên quan đến hoạt động của&nbsp; FLance.vn.</p>
                                <p>FLance.vn sẽ tiến hành các hoạt động xúc tiến, quảng bá FLance.vn ra thị trường nước ngoài trong phạm vi và điều kiện cho phép, góp phần mở rộng, kết nối đáp ứng các nhu cầu tìm kiếm bạn hàng và phát triển thị trường nước ngoài của các thành viên tham gia&nbsp; FLance.vn.</p>
                                <p>FLance.vn sẽ cố gắng đến mức cao nhất trong phạm vi và điều kiện có thể để duy trì hoạt động bình thường của FLance.vn và khắc phục các sự cố như: sự cố kỹ thuật về máy móc, lỗi phần mềm, hệ thống đường truyền internet, nhân sự, các biến động xã hội, thiên tai, mất điện, các quyết định của cơ quan nhà nước hay một tổ chức liên quan thứ ba. Tuy nhiên nếu những sự cố trên xẩy ra nằm ngoài khả năng kiểm soát, là những trường hợp bất khả kháng mà gây thiệt hại cho thành viên thì FLance.vn không phải chịu trách nhiệm liên đới.</p>
                                &nbsp;
                                <p><strong>XI. Quyền và trách nhiệm của Freelancer</strong></p>
                                <p><strong>1. Quyền của Freelancer</strong></p>
                                <p>Sau khi tạo tài khoản, xác thực tài khoản và thông tin cá nhân, Freelancer sẽ được cấp một tài khoản để cập nhật thông tin cá nhân trên Flance.vn .</p>
                                <p>Freelancer sẽ được hỗ trợ những kỹ năng/thao tác cần thiết để quản lý tài khoản hoặc gửi chào giá trên Flance.vn qua tổng đài hỗ trợ hoặc email đến bộ phận chăm sóc, tư vấn củaVlance.vn nếu được yêu cầu hỗ trợ</p>
                                <p>Freelancer được quyền đăng tin hoặc chạy quảng cáo hiển thị trên Flance.vn và hưởng các chính sách ưu đãi do ban quản lý Flance.vn đề ra trong quá trình hoạt động theo thỏa thuận/hợp đồng đã ký kết.</p>
                                <p>&nbsp;</p>
                                <p><strong>2. Trách nhiệm của Freelancer</strong></p>
                                <p>Freelancer phải cung cấp đầy đủ thông tin, số ĐKKD/Số CMND, ngành nghề lĩnh vực hoạt động, email, số điện thoại, thông tin tài khoản ngân hàng ,… cho ban quản lý Flance.vn. Freelancer phải cam kết các thông tin, giấy tờ cung cấp là chính xác.</p>
                                <p>Freelancer có trách nhiệm niêm yết chính xác thông tin về hình ảnh sản phẩm, giá cả, chính sách hỗ trợ (nếu có)….một cách cụ thể, rõ ràng.</p>
                                <p>Phối hợp với Flance.vn giải quyết những vấn đề tranh chấp giữa khách hàng với Freelancer về những khiếu nại trong quá trình trao đổi/liên hệ diễn ra qua sàn giao dịch TMĐT Flance.vn. Freelancer có nghĩa vụ phải bồi thường những thiết hại của thành viên khi lỗi được xác định thuộc về Freelancer.</p>
                                <p>&nbsp;</p>
                                <p><strong>XII. Quyền và trách nhiệm của Khách hàng</strong></p>
                                <p><strong>1. Quyền của Khách hàng</strong></p>
                                <p>Khi đăng ký tài khoản và được FLance.vn đồng ý, thành viên là Khách hàng sẽ được FLance.vn hướng dẫn, hỗ trợ để đăng tin dự án/công việc.</p>
                                <p>Thành viên là Khách hàng được sử dụng tài khoản để sử dụng dịch vụ và quản lý hoạt động cũng như trao đổi với Freelancer.</p>
                                <p>Thành viên là Khách hàng được nhân viên của&nbsp; FLance.vn hướng dẫn sử dụng được các công cụ, các tính năng phục vụ cho việc tìm kiếm thông tin và sử dụng các dịch vụ tiện ích trên&nbsp;FLance.vn.</p>
                                <p>Thành viên có quyền đóng góp ý kiến cho&nbsp;FLance.vn trong quá trình hoạt động. Các kiến nghị được gửi trực tiếp bằng thư, fax hoặc email đến cho FLance.vn.</p>
                                <p><strong>2. Trách nhiệm của Khách hàng</strong></p>
                                <p>Thành viên sẽ tự chịu trách nhiệm về bảo mật và lưu giữ và mọi hoạt động sử dụng dịch vụ dưới tên đăng ký, mật khẩu và hộp thư điện tử của mình.</p>
                                <p>Thành viên có trách nhiệm thông báo kịp thời cho FLance.vn về những hành vi sử dụng trái phép, lạm dụng, vi phạm bảo mật, lưu giữ tên đăng ký và mật khẩu của mình để hai bên cùng hợp tác xử lý.</p>
                                <p>Thành viên cam kết những thông tin cung cấp cho FLance.vn và những thông tin đang tải lên&nbsp; FLance.vn là chính xác.</p>
                                <p>Thành viên tự chịu trách nhiệm về nội dung, hình ảnh của thông tin Doanh nghiệp và các thông tin khác cũng như toàn bộ quá trình giao dịch với các đối tác trên&nbsp; FLance.vn.</p>
                                <p>Thành viên Freelancer và Khách hàng có trách nhiệm cung cấp thông tin về nội dung công việc tuyển dụng hỗ trợ&nbsp; FLance.vn trong việc giải quyết tranh chấp phát sinh giữa Freelancer và Khách hàng diễn ra qua Sàn.<br>
                                    Thành viên cam kết, đồng ý không sử dụng dịch vụ của&nbsp; FLance.vn vào những mục đích bất hợp pháp, không hợp lý, lừa đảo, đe dọa, thăm dò thông tin bất hợp pháp, phá hoại, tạo ra và phát tán virus gây hư hại tới hệ thống, cấu hình, truyền tải thông tin của FLance.vn hay sử dụng dịch vụ của mình vào mục đích đầu cơ, lũng đoạn thị trường tạo những đơn đặt hàng, chào hàng giả, kể cả phục vụ cho việc phán đoán nhu cầu thị trường. Trong trường hợp vi phạm thì thành viên phải chịu trách nhiệm về các hành vi của mình trước pháp luật.</p>
                                <p>Thành viên cam kết không được thay đổi, chỉnh sửa, sao chép, truyền bá, phân phối, cung cấp và tạo những công cụ tương tự của dịch vụ do FLance.vn cung cấp cho một bên thứ ba nếu không được sự đồng ý của FLance.vn trong Quy định này.</p>
                                <p>Thành viên không được hành động gây mất uy tín của&nbsp; FLance.vn dưới mọi hình thức như gây mất đoàn kết giữa các thành viên bằng cách sử dụng tên đăng ký thứ hai, thông qua một bên thứ ba hoặc tuyên truyền, phổ biến những thông tin không có lợi cho uy tín của&nbsp; FLance.vn.</p>
                                &nbsp;
                                <p><strong>XIII. Điều khoản áp dụng</strong></p>
                                <p>Quy chế của Sàn giao dịch điện tử FLance.vn chính thức có hiệu lực thi hành kể từ ngày ký Quyết định ban hành kèm theo Quy chế này. FLance.vn có quyền và có thể thay đổi Quy chế này bằng cách thông báo lên FLance.vn cho các thành viên biết. Quy chế sửa đổi có hiệu lực kể từ ngày Quyết định về việc sửa đổi Quy chế có hiệu lực. Việc thành viên tiếp tục sử dụng dịch vụ sau khi Quy chế sửa đổi được công bố và thực thi đồng nghĩa với việc thành viên đã chấp nhận Quy chế sửa đổi này.</p>
                                <p>Quy chế hoạt động sẽ được FLance.vn cập nhật bổ sung liên tục mà không cần thông báo trước. Thành viên tham gia FLance.vn có trách nhiệm tuân theo quy chế hiện hành khi giao dịch trên website.</p>
                                &nbsp;
                                <p><strong>XIV. Điều khoản cam kết</strong></p>
                                <p>Mọi thành viên bao gồm Khách hàng và Freelancer khi sử dụng FLance.vn để giao dịch trực tuyến thì đồng nghĩa việc các bên có liên quan đã chấp thuận tuân theo quy chế này.<br>
                                    Mọi thắc mắc của Khách hàng xin vui lòng liên hệ với FLance.vn theo thông tin công khai minh bạch tại FLance.vn.</p>
                                <p>&nbsp;</p>
                                <div>ĐẠI DIỆN CÔNG TY</div>
                            </div> </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
