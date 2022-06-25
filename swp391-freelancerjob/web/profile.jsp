<%-- 
    Document   : profile
    Created on : Jun 9, 2022, 7:04:43 PM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="sample.jobs.JobDTO"%>
<%@page import="sample.jobs.JobDAO"%>
<%@page import="sample.user.UserError"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
        <title>Flance.vn</title>
        <link rel="stylesheet" href="css/profile.css">
        <link rel="stylesheet" href="responsive.css">
        <link rel="stylesheet" href="fonts/remixicon.css">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">

    </head>
    <body>

        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        %>
        <%
            UserError userError = (UserError) request.getAttribute("USER_ERROR");
            if (userError == null) {
                userError = new UserError();
            }
            if (userError.getBirthdayError() == null) {
                userError.setBirthdayError("");
            }
            if (loginUser.getPhone() == null) {
                loginUser.setPhone("");
            }
        %>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <span class="main_bg"></span>
        <div class="container">
            <header>
                <div class="brandLogo">
                    <figure><img src="image/logo_free-file.png" alt="logo" width="40px" height="40px"></figure>
                    <span>Flance FPT University</span>
                </div>
            </header>

            <section class="userProfile card">
                <div class="profile">
                    <figure><img src="<%= loginUser.getAvatar()%>" alt="profile" width="250px" height="250px"></figure>
                </div>
            </section>

            <section class="work_skills card">

                <div class="work">
                    <h1 class="heading">work</h1>
                    <div class="primary">
                        <h1>Thành Phố Hồ Chí Minh</h1>
                        <span>Public</span>
                        <p>Nguyen Van Tang<br> TP.Thu Duc Quan 9</p>
                    </div>
                </div>

                <!-- ===== ===== Skills Contaienr ===== ===== -->
                <div class="skills">
                    <h1 class="heading">Skills</h1>
                    <ul>                      
                        <li style="--i:0">Digital Marketing</li>
                        <li style="--i:1">Business</li>
                        <li style="--i:2">Music & Audio</li>
                        <li style="--i:3">Video & Animation</li>
                    </ul>
                </div>
            </section>

            <!-- ===== ===== User Details Sections ===== ===== -->
            <section class="userDetails card">
                <div class="userName">
                    <h1 class="name"><%= loginUser.getProfileName()%></h1>
                    <div class="map">
                        <i class="ri-map-pin-fill ri"></i>
                    </div>
                    
                </div>

                <div class="rank">
                    <div class="rating">
                        <i class="ri-star-fill rate"></i>
                        <i class="ri-star-fill rate"></i>
                        <i class="ri-star-fill rate"></i>
                        <i class="ri-star-fill rate"></i>
                        <i class="ri-star-fill rate underrate"></i>
                    </div>
                </div>

                <div class="btns">
                    <ul>
                        <li class="sendMsg active">
                            <i class="ri-check-fill ri"></i>
                            <a href="managerJob.jsp">Manager Job</a>
                        </li>

                        <li class="sendMsg">
                            <a href="#">Report User</a>
                        </li>
                    </ul>
                </div>
            </section>


            <!-- ===== ===== Timeline & About Sections ===== ===== -->
            <section class="timeline_about card">
                <div class="tabs">
                    <ul>
                        <li class="about active">
                            <i class="ri-user-3-fill ri"></i>
                            <span>About</span>
                        </li>
                    </ul>
                </div>

                <div class="contact_Info">
                    <h1 class="heading">Mô tả</h1>

                    <h1 class="heading">Thông tin liên lạc</h1>
                    <ul>
                        <li class="phone">
                            <h1 class="label">Số điện thoại:</h1>
                            <span class="info"><%= loginUser.getPhone()%></span>
                        </li>

                        <li class="address">
                            <h1 class="label">Địa chỉ:</h1>
                            <span class="info"><%= loginUser.getAddress()%></span>
                        </li>

                        <li class="email">
                            <h1 class="label">E-mail:</h1>
                            <span class="info"><%= loginUser.getEmail()%></span>
                        </li>

                        <li class="site">
                            <h1 class="label">Site:</h1>
                            <span class="info">Not Yet</span>
                        </li>
                    </ul>
                </div>

                <div class="basic_info">
                    <h1 class="heading">Thông tin căn bản</h1>
                    <ul>
                        <li class="birthday">
                            <h1 class="label">Birthday:</h1>
                            <span class="info"><%= loginUser.getBirthday()%></span>
                        </li>
                    </ul>
                </div>
                <div class="btn">
                    <a href="editProfile.jsp">Edit Profile</a>
                </div>
            </section>
        </div>
                        
    
    </body>
</html>
