<%-- 
    Document   : dieukhoansudung
    Created on : Jul 19, 2022, 10:56:49 AM
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
            <div class="content">
                <h1>Điều khoản sử dụng</h1>
                <div class="wrapper-content">
                    <p>&nbsp;</p>
                    <p><strong>1. CHẤP THUẬN CÁC ĐIỀU KHOẢN</strong></p>
                    <p>Thỏa thuận sau đây là một thỏa thuận ràng buộc pháp lý giữa Bạn (có thể là "Khách hàng" hoặc "Freelancer" và nhóm điều hành mạng cộng đồng FLance® ("Chúng tôi”). Thỏa thuận bao gồm các điều khoản dịch vụ mà bạn phải tuân thủ để có được quyền tiếp cận và sử dụng dịch vụ của chúng tôi. Tại từng thời điểm, chúng tôi có thể cập nhật Điều khoản dịch vụ theo quyết định của mình mà không cần thông báo trực tiếp cho bạn. Bạn chịu trách nhiệm tìm hiểu phiên bản mới nhất bằng cách truy cập website www.FLance.vn.</p>
                    <p><strong>XIN VUI LÒNG ĐỌC ĐIỀU KHOẢN DỊCH VỤ NÀY MỘT CÁCH CẨN TRỌNG TRƯỚC KHI ĐĂNG KÝ LÀM THÀNH VIÊN. NẾU BẠN KHÔNG ĐỒNG Ý VỚI NHỮNG RÀNG BUỘC CỦA ĐIỀU KHOẢN DỊCH VỤ NÀY, VUI LÒNG KHÔNG SỬ DỤNG HOẶC TRUY CẬP DỊCH VỤ CỦA CHÚNG TÔI.</strong></p>
                    <p>&nbsp;</p>
                    <p><strong>2. MÔ TẢ DỊCH VỤ</strong></p>
                    <p>FLance® là cộng đồng online kết nối những freelancer tìm việc để kiếm thêm thu nhập và những khách hàng, những công ty cần tìm kiếm nguồn nhân lực chất lượng với chi phí hợp lý và hiệu quả cao. FLance® cung cấp những công cụ, tiện ích trực tuyến giúp cả freelancer và khách hàng quản lý công việc, giao dịch và thanh toán. FLance® cũng tạo ra một môi trường công bằng nơi các bên được bảo vệ quyền lợi đích đáng và an tâm khi giao dịch. Những tiện ích của FLance® sẽ được gọi chung là "Dịch vụ". Bạn hiểu và đồng ý rằng Dịch Vụ này sẽ bao gồm một số thông tin liên lạc của Ban quản trị FLance® qua các phương tiện như email, SMS, Website... Các thông tin liên lạc này được coi là một phần không tách rời của Dịch vụ và Bạn sẽ không có khả năng từ chối nhận các thông tin này trừ khi Bạn chấm dứt việc sử dụng tài khoản của mình trên FLance.vn.</p>
                    <p><strong>FLance® KHÔNG PHẢI LÀ ĐƠN VỊ CUNG CẤP DỊCH VỤ VIỆC LÀM, CŨNG KHÔNG PHẢI ĐƠN VỊ MÔI GIỚI VIỆC LÀM. CHÚNG TÔI CHỈ CUNG CẤP NHỮNG TIỆN ÍCH ĐỂ CÁC BÊN GIAO DỊCH, HỖ TRỢ CHO CÁC BÊN TRONG QUÁ TRÌNH THỰC HIỆN CÁC GIAO DỊCH. </strong></p>
                    <p>&nbsp;</p>
                    <p><strong>3. TRÁCH NHIỆM VỚI TÀI KHOẢN, MẬT KHẨU ĐƯỢC CUNG CẤP</strong></p>
                    <p>Bạn sẽ nhận được một mật khẩu và tài khoản sau khi hoàn tất thủ tục đăng ký sử dụng Dịch Vụ. Bạn có trách nhiệm bảo mật mật khẩu và tài khoản và hoàn toàn chịu trách nhiệm đối với tất cả các hoạt động diễn ra dưới việc sử dụng mật khẩu hoặc tài khoản của mình. Bạn đồng ý (a) thông báo ngay cho chúng tôi về bất cứ trường hợp nào sử dụng trái phép mật khẩu hoặc tài khoản của bạn hoặc bất cứ trường hợp nào khác vi phạm sự bảo mật, và (b) bảo đảm rằng Bạn luôn thoát khỏi tài khoản của mình sau mỗi lần sử dụng. Chúng tôi không thể và sẽ không chịu trách nhiệm đối với bất cứ tổn thất hoặc thiệt hại nào phát sinh do Bạn không tuân thủ quy định này.</p>
                    <p>&nbsp;</p>
                    <p><strong>4. TRÁCH NHIỆM CUNG CẤP THÔNG TIN</strong></p>
                    <p>Với tư cách là người sử dụng dịch vụ, Bạn phải cam kết: (a) bạn có đủ tư cách pháp lý và tư cách pháp nhân khi sử dụng dịch vụ (b) cung cấp các thông tin mới nhất, đầy đủ, trung thực và chính xác về bản thân trong Hồ sơ cá nhân, (c) duy trì và cập nhật kịp thời Hồ sơ cá nhân để bảo đảm rằng dữ liệu này là đầy đủ, trung thực và chính xác. Nếu Bạn cung cấp bất cứ thông tin nào không trung thực hoặc không chính xác, hoặc nếu FLance® có căn cứ hợp lý để nghi ngờ rằng thông tin đó không trung thực hoặc không chính xác, FLance® có quyền đình chỉ hoặc chấm dứt tài khoản của Bạn; từ chối một phần hoặc toàn bộ việc sử dụng Dịch vụ tại thời điểm hiện tại hoặc trong tương lai.</p>
                    <p>&nbsp;</p>
                    <p><strong>5. TRÁCH NHIỆM VỀ NỘI DUNG ĐĂNG TẢI</strong></p>
                    <p>Bạn hiểu rằng bạn hoàn toàn chịu trách nhiệm trước pháp luật về các Nội dung bạn tạo ra bao gồm nhưng không giới hạn dữ liệu, văn bản, phần mềm, âm thanh, hình ảnh, video, email. Chúng tôi không có nghĩa vụ theo dõi các tài liệu được đăng và vì vậy, không bảo đảm về tính hợp pháp, chính xác, nguyên vẹn hoặc chất lượng của Nội Dung đó. Tại các khu vực được phép đăng tải Nội dung, bạn có thể chia sẻ thông tin được phép dưới các định dạng chúng tôi mặc định và bạn phải tự chịu trách nhiệm đối với các nội dung, thông tin, hình ảnh và bất kỳ sự chia sẻ nào khác của bạn với cá nhân người sử dụng hoặc nhóm người sử dụng. Tuy nhiên, trong mọi trường hợp, chúng tôi vẫn được bảo lưu quyền xử lý các thông tin đăng tải cho phù hợp với thuần phong mỹ tục, các quy tắc đạo đức và các quy tắc đảm bảo an ninh quốc gia, và chúng tôi có toàn quyền cho phép hoặc không cho phép bài viết của bạn xuất hiện hay tồn tại tại các khu vực được phép chia sẻ thông tin.</p>
                    <p>&nbsp;</p>
                    <p><strong>6. HẠN CHẾ HOẠT ĐỘNG</strong></p>
                    <p>Không giới hạn các biện pháp khắc phục hậu quả khác, chúng tôi có thể chấm dứt sự tham gia của bạn, loại bỏ thông tin của bạn hoặc cảnh báo cộng đồng về hành động của bạn và từ chối cung cấp dịch vụ nếu: (a) Bạn đã sử dụng sai mục đích các dịch vụ, có hành vi trái pháp luật hoặc đạo đức (b), chúng tôi có căn cứ hợp lý để nghi ngờ rằng thông tin bạn cung cấp không trung thực hoặc không chính xác, (c) chúng tôi tin rằng hành động của bạn là gian lận, lừa đảo và có thể gây ra tổn thất tài chính hoặc trách nhiệm pháp lý cho cộng đồng hoặc chúng tôi, (d) sử dụng các dịch vụ với mục đích thương mại mà không có sự đồng ý trước bằng văn bản đồng ý của chúng tôi (e) vi phạm các quyền của chúng tôi hoặc bên thứ ba, bao gồm nhưng không giới hạn quyền sở hữu trí tuệ, quyền tác giả, bằng sáng chế, thương hiệu, bí mật thương mại hoặc các quyền riêng tư; (f) phát tán các ứng dụng độc hại hoặc tấn công chiếm đoạt quyền điều khiển hệ thống, dữ liệu hoặc thông tin cá nhân.</p>
                    <p>&nbsp;</p>
                    <p><strong>7. GIỚI HẠN TRÁCH NHIỆM</strong></p>
                    <p>Bạn hiểu rõ và đồng ý rằng: (a) việc bạn sử dụng dịch vụ và giao dịch trên website của chúng tôi là quyết định của bạn. Ngoại trừ các trường hợp phân xử được dựa trên các căn cứ lưu lại tại website của chúng tôi, bạn sẽ chịu toàn bộ các rủi ro phát sinh. Chúng tôi khước từ các bảo đảm về chất lượng cung cấp dịch vụ hoặc uy tín cá nhân của các bên tham gia. (b) chúng tôi không có nghĩa vụ phải xử lý các khiếu nại liên quan đến chất lượng dịch vụ các bên cung cấp ngoài những giao dịch trên website của chúng tôi và từ chối tất cả các ràng buộc liên quan. (c) chúng tôi không chịu trách nhiệm đối với dịch vụ của bên thứ ba sử dụng thông tin của chúng tôi để cung cấp dịch vụ cho các bạn. (d) chúng tôi không bảo đảm rằng (i) dịch vụ sẽ không bị gián đoạn, kịp thời, an toàn hoặc không có lỗi, (ii) dịch vụ sẽ có thể truy cập được tại bất kỳ thời điểm nào hoặc tại từng thời điểm qua kênh mà bạn lựa chọn hoặc sử dụng, (iii) thông tin, nội dung hoặc các quảng cáo có trong dịch vụ sẽ chính xác hoặc đáng tin cậy, (iv) việc mất mát dữ liệu và các nội dung khác được bảo đảm tối đa (e) chúng tôi bảo lưu quyền sửa đổi, ngừng tạm thời hoặc vĩnh viễn dịch vụ cho dù có hoặc không có báo trước. chúng tôi không có trách nhiệm đối với bất cứ sự điều chỉnh, tạm ngưng hoặc không tiếp tục cung cấp dịch vụ.</p>
                    <p>&nbsp;</p>
                    <p><strong>8. BẢO MẬT</strong></p>
                    <p>Chúng tôi không bán hoặc cho thuê thông tin của bạn cho bên thứ ba ngoài hệ thống FLance&nbsp;mà không có sự cho phép của bạn và chúng tôi chỉ sử dụng thông tin của bạn như được mô tả trong Điều khoản riêng tư. Chúng tôi xem bảo vệ sự riêng tư của người sử dụng như một nguyên tắc cộng đồng quan trọng hàng đầu. Bạn có thể xem xét lại chính sách bảo mật hiện tại của chúng tôi tại Điều khoản riêng tư.</p>
                    <p>&nbsp;</p>
                    <p><strong>9. SỞ HỮU TRÍ TUỆ</strong></p>
                    <p>Tất cả quyền sở hữu trí tuệ hiện có trong các Dịch vụ của FLance® đều thuộc về FLance® hoặc cấp phép hợp pháp cho FLance® sử dụng. Theo đó, tất cả các quyền lợi hợp pháp đều được đảm bảo. Trừ phi nhận được sự đồng ý của FLance®, bạn không được phép tải lên, gửi, xuất bản, sửa đổi, tái sản xuất, truyền hoặc phân phát dưới bất cứ hình thức nào các Dịch vụ FLance® cung cấp. Chúng tôi có toàn quyền, bao gồm nhưng không chỉ giới hạn các quyền tác giả, thương hiệu và các quyền sở hữu khác mà chúng tôi có trong các Dịch vụ của FLance®.Tất cả các yếu tố cấu thành nên Dịch vụ mà chúng tôi cung cấp đều thuộc phạm vi sở hữu của chúng tôi cho dù đã đăng ký hoặc chưa đăng ký. Việc sử dụng quyền sở hữu của chúng tôi cần phải được chúng tôi cho phép trước bằng văn bản. Ngoài việc cấp phép bằng văn bản, chúng tôi không cấp phép dưới bất kỳ hình thức nào khác cho dù đó là hình thức công bố hay hàm ý, hoặc thông qua việc để bạn sử dụng dịch vụ. Và do vậy, bạn không có quyền sử dụng Dịch vụ của chúng tôi vào mục đích thương mại mà không có sự cho phép bằng văn bản của chúng tôi trước đó. Bạn đồng ý để chúng tôi tự do sử dụng, tiết lộ, áp dụng và sửa đổi bất kỳ ý tưởng, khái niệm, cách thức, đề xuất, gợi ý, bình luận hoặc hình thức thông báo nào khác mà bạn cung cấp cho chúng tôi (“Phản hồi”) có liên quan tới FLance® và/hoặc dịch vụ của FLance® một cách hoàn toàn miễn phí. Bạn từ bỏ và đồng ý từ bỏ bất kỳ quyền và yêu cầu với bất kỳ khoản tiền thưởng, nhuận bút, lệ phí và/ hoặc các hình thức thanh toán khác liên quan đến việc chúng tôi sử dụng, tiết lộ, áp dụng, và/hoặc chỉnh sửa bất kỳ hoặc tất cả Phản hồi của bạn.</p>
                    <p>&nbsp;</p>
                    <p><strong>10. KHIẾU NẠI, GIẢI QUYẾT TRANH CHẤP</strong></p>
                    <p>Thông qua việc đăng ký hoặc sử dụng website và dịch vụ của chúng tôi, bạn mặc nhiên đồng ý và tuân thủ toàn bộ các quy định của Luật pháp Việt Nam. Trong trường hợp một hoặc một số điều khoản của bản Quy định sử dụng này xung đột với các quy định của luật pháp và bị Tòa án coi là vô hiệu lực, điều khoản đó sẽ được chỉnh sửa cho phù hợp với quy định của pháp luật hiện hành, và phần còn lại của Quy định sử dụng vẫn giữ nguyên giá trị.</p>
                    <p>&nbsp;</p>
                    <p><u><em>Lưu ý:</em></u><em>&nbsp;Nội dung các điều khoản sẽ được thay đổi, bổ sung&nbsp;và cập nhật thường xuyên để phù hợp với yêu cầu thực tế.</em></p>
                    <p>&nbsp;</p> </div>
            </div>

        </div>
    </main>
    
    
    <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
