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
        <link rel="stylesheet" href="css/detailJob.css">
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
        <title>Flance.vn</title>
    </head>
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

        <%
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>

        <div class="container">
            <div class="topnav">
                <form action="MainController" method="POST">
                    <input oninput="searchByName(this)" type="text" value="<%= search%>" name="search" placeholder="Tìm kiếm...">                            
                    <input type="hidden" name="action" value="Search">
                </form>
            </div>

            <div class="content">
                <div class="job">
                    <form action="MainController" method="POST">
                        <input type="hidden" name="jobID" value="${JOB.jobID}"
                               <p id="title">Tiêu đề : ${JOB.jobName}</p>
                        <p id="owner">Tên nhà tuyển dụng: ${JOB.profileName}</p>
                        <p id="price">Ngân sách: <span> ${JOB.price} đ</span></p>


                        <p id="detail">${JOB.description}</p>
                        <img src="${JOB.image}" alt="Job" width="400" height="300">
                        <p id="time">Từ ${JOB.startTime} đến ${JOB.endTime}</p>
                        <a id="tag" href="MainController?action=SearchTag&tagID=${JOB.tagID}">${JOB.tagName}</a>
                        <br>

                        <%
                            JobDTO job = (JobDTO) session.getAttribute("JOB");
                            JobDAO jobDAO = new JobDAO();
                            ApplyDAO applyDAO = new ApplyDAO();
                            List<ApplyDTO> listApply = applyDAO.checkAppliedJob(loginUser.getAccountID(), job.getJobID());
                            boolean ownThisPost = jobDAO.jobOwner(loginUser.getAccountID(), job.getJobID());
                            if (listApply.size() == 0 && !ownThisPost) {
                        %>
                        <input type="submit" name="action" value="Apply">
                        <%
                        } else if (listApply.size() > 0) {
                        %>
                        <p>Đã apply thành công</p>
                        <%
                            }
                        %>
                    </form>            
                </div>
                <div class="owner">
                    <div class="user">
                        <a href="#"><img src=""><strong> Người dùng Flance</strong></a>
                    </div>
                    <div class="contact">
                        <br>
                        <p id="contact"> Thông tin liên hệ 1</p>
                        <p id="contact"> Thông tin liên hệ 2</p>                        
                    </div>
                </div>
            </div>
            <jsp:include page="footerHomePage.jsp"></jsp:include>
        </div>    
    </body>
</html>
