
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
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

    .footer-col {
        width: 25%;
        padding: 0 15px;
    }

    .footer-col h4 {
        font-size: 18px;
        color: #ffffff;
        text-transform: capitalize;
        margin-bottom: 35px;
        font-weight: 500;
        position: relative;
    }

    .footer-col h4::before {
        content: '';
        position: absolute;
        left: 0;
        bottom: -10px;
        background-color: #f27405;
        height: 2px;
        box-sizing: border-box;
        width: 50px;
    }

    .footer-col ul li:not(:last-child) {
        margin-bottom: 10px;
    }

    .footer-col ul li a {
        font-size: 16px;
        text-transform: capitalize;
        color: #ffffff;
        text-decoration: none;
        font-weight: 300;
        color: #bbbbbb;
        display: block;
        transition: all 0.3s ease;
    }

    .footer-col ul li a:hover {
        color: #ffffff;
        padding-left: 8px;
    }
.social-links{
    margin-top: 7rem;
}
    .footer-col .social-links a {
        display: inline-block;
        height: 40px;
        width: 40px;
        background-color: rgba(255, 255, 255, 0.2);
        margin: 0 10px 10px 0;
        text-align: center;
        line-height: 40px;
        border-radius: 50%;
        color: #ffffff;
        transition: all 0.5s ease;
    }

    .footer-col .social-links a:hover {
        color: #24262b;
        background-color: #ffffff;
    }
</style>
<footer class="footer" id="help">
        <div class="container-footer">
            <div class="row">
                <div class="footer-col">
                    <h4>Thông tin cơ bản</h4>
                    <ul>
                        <li><a target="_blank" href="aboutUs.jsp">Về chúng tôi</a></li>
                        <li><a target="_blank" href="#">Sản phẩm tạo bởi sinh viên FPT</a></li>

                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Hướng dẫn</h4>
                    <ul>
                        <li><a target="_blank" href="#">Hướng dẫn hoàn thiện hồ sơ</a></li>
                        <li><a target="_blank" href="#">Hướng dẫn chào giá</a></li>
                        <li><a target="_blank" href="#">Hướng dẫn nộp sản phẩm</a></li>
                        <li><a target="_blank" href="#">Hướng dẫn thanh toán</a></li>
                        <li><a target="_blank" href="#">các hình thức thanh toán</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Quy định</h4>
                    <ul>
                        <li><a target="_blank" href="dieukhoansudung.jsp">điều khoản sử dụng</a></li>
                        <li><a target="_blank" href="dieukhoankhachhang.jsp">điều khoản khách hàng</a></li>
                        <li><a target="_blank" href="dieukhoanfreelancer.jsp">điều khoản freelancer</a></li>
                        <li><a target="_blank" href="dieukhoanthanhtoan.jsp">điều khoản thanh toán</a></li>
                        <li><a target="_blank" href="quychehoatdong.jsp">quy chế hoạt động</a></li>
                        <li><a target="_blank" href="chinhsachbaomat.jsp">chính sách bảo mật</a></li>
                        <li><a target="_blank" href="giaiquyetkhieunai.jsp">giải quyết khiếu nại</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>thông tin liên lạc</h4>
                    <ul>
                        <li><a target="_blank" href="https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+FPT+TP.+HCM/@10.8411276,106.8076943,17z/data=!3m1!4b1!4m5!3m4!1s0x31752731176b07b1:0xb752b24b379bae5e!8m2!3d10.8411276!4d106.809883?hl=vi-VN">Địa chỉ: Lô E2a-7, Đường D1, Khu Công nghệ cao, P.Long Thạnh Mỹ, Tp. Thủ Đức, TP.HCM.</a></li>
                    </ul>
                    <div class="social-links">
                        <a href="https://www.facebook.com/Koulse"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa fa-envelope"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-phone" aria-hidden="true"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

