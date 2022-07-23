<%-- 
    Document   : dieukhoankhachhang
    Created on : Jul 19, 2022, 11:01:39 AM
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
            <div>
                <h1>Điều khoản sử dụng dành cho Khách hàng</h1>
                <div class="wrapper-content">
                    <h2>&nbsp;</h2>
                <h2>1. Tài khoản khách hàng</h2>
                <p>Website FLance.vn (“FLance”, “Chúng tôi”) là nền tảng kết nối Khách hàng và Freelancer tại Việt Nam. FLance.vn có xuất thân từ cộng đồng Freelancer Việt Nam hơn 500.000 thành viên làm việc đa lĩnh vực.</p>
                <p>Để duy trì môi trường làm việc chất lượng cao cho Khách hàng, mọi thông tin được cung cấp trong tài khoản người dùng FLance phải đảm bảo tính trung thực và có nguồn kiểm chứng:</p>
                <ul>
                <li>Mỗi người chỉ được sử dụng một tài khoản, và mỗi tài khoản chỉ thuộc về một người. Tài khoản không được chia sẻ với bất kỳ ai hoặc sao chép dưới mọi hình thức.</li>
                <li>Hồ sơ phải có ảnh đại diện và không được có liên hệ hoặc thuộc quyền sở hữu của bất cứ một công ty nào.</li>
                </ul>
                <p>Ngoài ra, khi đăng việc, tài khoản Khách hàng (bạn) cần đảm bảo các yêu cầu sau:&nbsp;</p>
                <ul>
                <li>Không ghi số điện thoại, email, tài khoản mạng xã hội hoặc bất kỳ thông tin liên lạc nào trong phần thông tin dự án/việc làm.</li>
                <li>Ghi rõ tiêu đề, lĩnh vực chuyên môn (ví dụ: Lập trình viên PHP/Wordpress)</li>
                <li>Có tên đầy đủ, nếu sử dụng nickname phải&nbsp;để trong dấu () bên cạnh tên thật.</li>
                <li>Giới thiệu tóm tắt về bản thân.</li>
                <li>Thành phố cư trú.</li>
                <li>Số điện thoại hợp lệ.</li>
                </ul>
                <h2>&nbsp;</h2>
                <h2>2. Việc theo dự án</h2>
                <p><strong>2.1. Đăng việc dự án</strong><br>
                Một dự án được bắt đầu bằng việc đăng lên website. Dự án của bạn sẽ được chú ý nếu nó được viết một cách chuyên nghiệp, mô tả chính xác các yêu cầu công việc.</p>
                <p>Tất cả các dự án được đăng lên phải phải tuân thủ các chính sách sau:</p>
                <ul>
                <li>Không chia sẻ hoặc thu thập thông tin liên lạc của Freelancer trước khi gửi tin nhắn riêng cho Freelancer.</li>
                <li>Ngôn ngữ lịch sự và không bao hàm nội dung quảng cáo.</li>
                <li>Không đăng cùng một nội dung nhiều lần.</li>
                <li>Không yêu cầu dịch vụ bất hợp pháp, vi phạm quyền sở hữu trí tuệ, quyền tác giả hoặc các điều khoản dịch vụ của một dịch vụ, sản phẩm hoặc trang web khác.</li>
                <li>Không được yêu cầu Freelancer làm miễn phí trong bất kỳ hình thức nào, bao gồm cả các cuộc thi trong đó Freelancers đồng ý tham gia miễn phí hoặc được trả phí rất ít, chỉ người thắng cuộc mới được thanh toán toàn bộ số tiền.</li>
                <li>Không được yêu cầu Freelancer trả phí để được tham gia chào giá.</li>
                <li>Thông tin mô tả của dự án không được chứa bất kỳ nội dung người lớn, tài liệu khiêu dâm hoặc gây phản cảm.</li>
                <li>Không được yêu cầu cung cấp các nội dung vi phạm tính học thuật.</li>
                <li>Thông tin mô tả không chứa nội dung spam hoặc quảng bá trực tiếp hay gián tiếp cho một website, công ty, nhãn hiệu của bên thứ ba.</li>
                </ul>
                <p><br>
                <strong>2.2. Làm việc</strong></p>
                <p>Trong vòng 48 giờ sau khi chọn được Freelancer, Khách hàng có quyền "Hủy giao việc" và Freelancer có quyền "Từ chối nhận việc". Sau khi “Hủy giao việc”, Khách hàng không thể giao lại việc đã hủy cho Freelancer. Ngược lại, Freelancer sau khi “Từ chối nhận việc” sẽ không thể nhận lại công việc đã từ chối. Sau khi Khách hàng “Hủy giao việc” hoặc Freelancer “Từ chối nhận việc”, việc sẽ tự động chuyển về trạng thái “Đang nhận hồ sơ”. Khách hàng có thể giao việc lại cho Freelancer khác. Sau 48h, Khách hàng và Freelancer có thể để lại đánh giá cho nhau.</p>
                <p><br>
                <strong>2.3. Đẩy top dự án&nbsp;</strong></p>
                <p>Tính năng Đẩy top dự án cho phép Khách hàng đưa dự án lên vị trí đầu tiên trong danh sách việc. Tính năng Đẩy top dự án áp dụng cho Việc dự án, Việc bán thời gian và Cuộc thi thiết kế. Dự án được đẩy top sẽ được hiển thị phía bên dưới Dự án nổi bật trên trang dự án công việc mới.</p>
                <p>Khách hàng có thể chọn một trong các hình thức đẩy top, “Đẩy top tức thì” hoặc “Đẩy top tự động”. Với các&nbsp; tính năng “Đẩy top tức thì” và “Đẩy top tự động”, Khách hàng cần thanh toán bằng credit hoặc nâng cấp tài khoản KHPLUS / KHPRO. Vị trí đầu tiên trong danh sách việc sẽ thay đổi dựa trên thời gian của dự án được đẩy. Dự án được đẩy sẽ có vị trí cao hơn vị trí của dự án đã được đẩy trước đó. Khách hàng có thể xem được thời điểm và loại đẩy top ngay trong trang “Xem công việc”.</p>
                <p>2.3.1. Các hình thức đẩy top dự án<br>
                Với tính năng Đẩy top tức thì: Khách hàng được đẩy top cho dự án ngay lập tức, không cần thời gian chờ.&nbsp;</p>
                <p>Với tính năng Đẩy top tự động: Khi Khách hàng sử dụng tính năng “Đẩy top tự động”, hệ thống trên FLance.vn sẽ tự động đẩy top dự án tối đa 01 lần/giờ liên tục trong khoảng thời gian do Khách hàng lựa chọn. Khách hàng có thể lựa chọn sử dụng tính năng “Đẩy top tự động” trong 24h (1 ngày), 72h (3 ngày) hoặc 168h (7 ngày).&nbsp;</p>
                <p>2.3.2. Thời gian đẩy top dự án<br>
                Với đẩy top tức thì: Dự án sẽ được đẩy lên top ngay lập tức mà không cần chờ 6 tiếng.&nbsp;</p>
                <p>Thời gian chờ sẽ tự động được cài đặt lại tính từ lúc đẩy top cuối cùng. Với đẩy top tự động: (a) Khi sử dụng đẩy top tự động, thời gian đẩy top sẽ tự động được cài đặt lại theo chế độ bạn đã chọn. (b) Thời gian đẩy top tự động sẽ được cộng dồn. Thời gian của gói đẩy top tự động sẽ được tính như sau: “thời gian hiện tại bằng thời gian gói mới nhất cộng thời gian gói cũ còn lại”.</p>
                <p>Khách hàng không thể dừng hoặc hủy đẩy top dự án khi đã bắt đầu sử dụng tính năng đẩy top dự án. Credit sẽ không được hoàn lại khi Khách hàng đã chọn Đẩy top tức thì hoặc Đẩy top tự động. Trong mọi trường hợp, quyết định của FLance.vn là quyết định cuối cùng.</p>
                <p>Dự án đã hết hạn nếu được đẩy top sẽ được tự động gia hạn thời gian nhận chào giá. Thời gian được gia hạn chào giá đối với Đẩy top tức thì là 24h, đối với Đẩy top tự động là thời gian đẩy top tự động có hiệu lực tương ứng là 24h, 72h, hoặc 168h. Khách hàng có thể xem lịch sử toàn bộ các lần đẩy top tại khung hiển thị dự án công việc.&nbsp;<br>
                &nbsp;</p>
                <p><strong>2.4. Làm mới dự án</strong></p>
                <p>Tính năng làm mới dự án là tính năng phục hồi và làm mới lại dự án đã hết hạn. Khách hàng chỉ có thể sử dụng tính năng này khi nâng cấp tài khoản KHPRO. Sau khi nâng cấp tài khoản KHPRO, khách hàng có 03 lần làm mới dự án miễn phí mỗi 30 ngày (1 tháng). Số lần miễn phí làm mới dự án được cộng dồn trên thời gian của gói dịch vụ mà khách hàng đã mua.&nbsp;</p>
                <p>Sau khi sử dụng tính năng, dự án của khách hàng sẽ trở về trạng thái ban đầu sau khi đăng: (1) Dự án sau khi làm mới được gắn nhãn (“làm mới”) trên tiêu đề dự án. (2) Dự án sau khi làm mới sẽ xuất hiện phía dưới dự án nổi bật trên đầu trang công việc. (3) Dự án được mở lại và Freelancer có thể chào giá. (4) Dự án sau khi làm mới vẫn giữ nguyên thông tin nội dung, ngân sách dự án. (5) Toàn bộ chào giá đã có trong dự án được giữ nguyên sau khi làm mới. (6) Dự án sau khi làm mới vẫn xuất hiện trong thư gợi ý việc mới hàng ngày được gửi cho Freelancer. Các hoạt động làm mới dự án sẽ được lưu lại trong trang lịch sử dự án.&nbsp;</p>
                <p>Tính năng làm mới dự án sử dụng được cho ba loại công việc: (1) Dự án, (2) Việc bán thời gian, (3) Cuộc thi thiết kế. Khách hàng chỉ sử dụng được tính năng làm mới khi chào giá đã hết hạn, hoặc sau khi dự án đã được đăng 3 ngày trước đó (72 giờ).&nbsp;</p>
                <p>&nbsp;</p>
                <p><strong>2.5. Gói dịch vụ dành cho Khách hàng</strong></p>
                <p>2.5.1. Gói KHBASIC&nbsp;</p>
                <p>Gói KHBASIC là gói dịch vụ cơ bản dành cho khách hàng. Khi sử dụng gói&nbsp; KHBASIC, khách hàng được đăng dự án không mất phí và được mời tối đa 04 Freelancer vào chào giá cho mỗi dự án đã đăng.&nbsp;</p>
                <p>2.5.2. Gói KHPLUS</p>
                <p>Gói KHPLUS là gói dịch vụ mở rộng dành cho khách hàng. Trong thời gian sử dụng gói KHPLUS, khách hàng được đăng dự án không mất phí và được mời tối đa 20 Freelancer vào chào giá cho mỗi dự án đã đăng. Khách hàng được miễn phí đăng dự án bí mật, miễn phí sử dụng tính năng đăng nổi bật dự án, đẩy top tức thì cho dự án.</p>
                <p>2.5.3. Gói KHPRO&nbsp;</p>
                <p>Gói KHPRO là gói dịch vụ toàn diện dành cho khách hàng. Khi sử dụng gói KHPRO, khách hàng được đăng dự án không mất phí và được mời tối đa 50 Freelancer vào chào giá cho mỗi dự án đã đăng. Khách hàng được miễn phí đăng dự án bí mật và miễn phí tính năng đẩy top tức thì trong thời gian sử dụng gói. Khách hàng đồng thời sẽ được sử dụng các quyền lợi sau: (1) Có 03 lần đăng dự án nổi bật trên fanpage FLance.vn trong một tháng; (2) Có 03 lần làm mới dự án đã đăng trong một tháng; (3) Miễn phí sử dụng tính năng liên hệ trực tiếp với Freelancer đã xác thực thông tin liên hệ trên FLance và có chào giá trong các dự án của khách hàng.</p>
                <p>2.5.4. Quy định chung khi sử dụng gói dịch vụ khách hàng</p>
                <p>(1)Toàn bộ các tài khoản chưa nâng cấp sẽ được mặc định là tài khoản KHBASIC.(2)&nbsp;Tài khoản sau khi nâng cấp sẽ trở thành tài khoản KHPLUS hoặc KHPRO.(3)&nbsp;Sau khi hết hạn của gói tài khoản đã nâng cấp, tài khoản sẽ tự động trở về mốc KHBASIC. (4)&nbsp;Mỗi tài khoản chỉ có thể nâng cấp duy nhất 01 gói dịch vụ KHPLUS hoặc KHPRO trong một thời điểm.(5)&nbsp;Sau khi nâng cấp tài khoản, khách hàng không thể hủy gói. Phí đã tiêu dùng để mua gói dịch vụ sẽ không được hoàn trả trong bất kỳ trường hợp nào.</p>
                <p>&nbsp;</p>
                
                <h2>3. Cam kết của FLance</h2>
                <p>FLance đảm bảo quyền lợi thanh toán cho khách hàng và freelancer một cách công bằng, ngay cả khi xảy ra tranh chấp. Đó là cách chúng tôi thể hiện sự tôn trọng đối với các dự án được thực hiện trên FLance.</p>
                <h2>&nbsp;</h2>
                <h2>4. Thanh toán</h2>
                <p>Khách hàng hoặc Freelancer có thể mua các gói dịch vụ liên quan để sử dụng các tính năng kết nối làm việc trên FLance.vn</p>
                <h2>&nbsp;</h2>
                <h2>5. Phản hồi và Đánh giá</h2>
                <p>Những đánh giá trung thực và khách quan góp phần tạo nên một môi trường làm việc sôi động và hiệu quả. Các phản hồi tốt nhất là khi chúng cung cấp thông tin hữu ích cho cả người nhận và cộng đồng nói chung.</p>
                <p>Chúng tôi không giám sát, kiểm duyệt, hoặc điều tra thông tin phản hồi. Tuy nhiên, trong một số trường hợp, chúng tôi có thể xóa xếp hạng và phản hồi nếu phát hiện vi phạm Điều khoản sử dụng của FLance hoặc các hướng dẫn chi tiết dưới đây.</p>
                <p>Nghiêm cấm các hành vi nhằm làm sai lệch thông tin phản hồi, ép buộc người dùng khác bằng cách đe dọa phản hồi tiêu cực hoặc đề nghị để bán hoặc mua dịch vụ để đổi lấy thông tin phản hồi tích cực.</p>
                <p>Thông tin phản hồi thuộc các nội dung sau có thể bị ẩn hoặc chỉnh sửa:</p>
                <ul>
                <li>Spam, quảng cáo hoặc nội dung thương mại khác.</li>
                <li>Nội dung ủng hộ các hoạt động bất hợp pháp.</li>
                <li>Nội dung nói về người khác.</li>
                <li>Bình luận chính trị, tôn giáo, hoặc vấn đề xã hội khác chứ không phải là một lời nhận xét trực tiếp về kinh nghiệm làm việc.</li>
                <li>Xúc phạm, tục tĩu, khiêu dâm, vu khống, bôi nhọ, đe dọa, phân biệt đối xử, hoặc tài liệu khiêu dâm.</li>
                </ul>
                <p>&nbsp;</p>
                <h2><span style="font-size:20px">7.</span>&nbsp;Lưu ý dành cho Khách hàng</h2>
                <p>(1) Chúng tôi có quyền khóa tài khoản của bạn bất cứ khi nào phát hiện vi phạm mà không cần thông báo trước.</p>
                <p>(2) Nội dung các điều khoản sẽ được thay đổi, bổ sung và cập nhật thường xuyên để phù hợp với yêu cầu thực tế.</p> </div>
                </div>

        </div>
    </main>
    
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
