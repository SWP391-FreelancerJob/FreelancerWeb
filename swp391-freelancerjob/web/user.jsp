<%-- 
    Document   : homePage
    Created on : May 21, 2022, 5:31:30 PM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="sample.user.UserDAO"%>
<%@page import="sample.user.UserError"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.jobs.TagDTO"%>
<%@page import="sample.jobs.JobDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="css/user.css">
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
        <title>Flance.vn</title>
    </head>
    <body>
        <%
            int MAX_JOB_IN_PAGE = 3;
        %>
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
                UserError userError = (UserError) request.getAttribute("USER_ERROR");
                if (userError == null) {
                    userError = new UserError();
                }
                if (userError.getForcedAtleast() == null) {
                    userError.setForcedAtleast("");
                }

            %>

        <div class="container">
            
        <%  if (loginUser != null) {
                    if (loginUser.getTags().length == 0) {
            %>
            <!--<div id="popup" class="popup" style="display: none">-->
                <form action="MainController" method="POST">
                    <div class="modal">
                        <div class="modal_inner">
                            <div class="modal_header">
                                <p>Chọn ngành nghề</p>
                            </div>
                            <%  UserDAO user = new UserDAO();
                                List<TagDTO> getAllTag = user.getListAllTag();
                                for (int i = 0; i < getAllTag.size(); i++) {

                            %>

                            <input style="padding-top: 30px" class="popup-tag" type="checkbox" name="tags" value="<%= getAllTag.get(i).getTagID()%>" > <%= getAllTag.get(i).getTagName()%> <br>
                            <%

                                }
                            %>
                            <div style="color: red"><%= userError.getForcedAtleast()%> </div>
                            <div class="modal_footer">
                                <input class="button-popup" type="submit" name="action" value="Submit">
                            </div>
                        </div>
                    </div>
                </form>
            <!--</div>-->
            <%
                    }
                }

            %>
            <div class="banner">
                <div class="navbar">
                    <a href="AppearJob">
                        <abbr title="Flance.vn">
                            <img src="image/FLance_free-file.png" class="logo">
                        </abbr>
                    </a>
                    <ul>
                        <li><a href="AppearJob">TRANG CHỦ</a></li>
                        <li><a href="#help">TRỢ GIÚP</a></li>
                        <li class="user">
                            <div class="dropdown1">
                                <button class="dropbtn1">
                                    <a href="#"><img src="<%= loginUser.getAvatar()%>"><%= loginUser.getProfileName()%></a>
                                </button>
                                <div class="dropdown1-content">
                                    <a href="profile.jsp">Trang cá nhân</a>
                                    <a href="MainController?action=Logout">Đăng xuất</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="content">
                    <h1>FLANCE</h1>
                    <p>A product by FPT UNIVERSITY</p>
                    <div>
                        <button class="btn" type="button">
                            <a href="#"><span></span>Tìm việc ngay</a>
                        </button>
                        <button class="btn" type="button">
                            <a href="addJob.jsp"><span></span>Đăng bài ngay</a>
                        </button>
                    </div>
                </div>
            </div>
            <%
                String search = request.getParameter("search");
                if (search == null) {
                    search = "";
                }
            %>
            <div class="topnav">
                <form action="MainController" method="POST">
                    <input oninput="searchByName(this)" type="text" value="<%= search%>" name="search" placeholder="Tìm kiếm...">                            
                    <input type="hidden" name="action" value="Search">
                </form>
            </div>
            
            <div class="jobs">
                <div class="filter">
                    <div class="filter-list">
                        <form action="MainController" method="POST">
                            <div class="filter-functions">
                                <div>
                                    <label>
                                        <h2>Sắp xếp bài đăng:</h2>
                                    </label>
                                    <select name="searchByTypeSalary" class="box">
                                        <option value="allJob">Tất cả bài đăng</option>
                                        <option value="HighToLow">Thấp đến cao</option>
                                        <option value="LowToHigh">Cao đến thấp</option>
                                    </select>
                                </div>
                                <div>
                                    <label>
                                        <h2>Tìm kiếm theo tag</h2>
                                    </label>                                   
                                    <c:forEach items="${LIST_TAG}" var="tag">
                                        <input type="checkbox" name="tagID" value="${tag.tagID}">
                                        <label for="motor">${tag.tagName}</label><br>
                                    </c:forEach> 
                                </div>

                                <div>
                                    <label><h2>Ngân sách</h2></label>
                                    <select name="searchByTypeMoney" class="box">
                                        <option value="all">Tất cả</option>
                                        <option value="1">< 1 triệu</option>
                                        <option value="1_to_5">1 triệu - 5 triệu</option>
                                        <option value="5_to_10">5 triệu - 10 triệu</option>
                                        <option value="10_to_20">10 triệu - 20 triệu</option>
                                        <option value="20">> 20 triệu</option>
                                    </select>
                                </div>
                            </div>
                            <div class="button-search">
                                <button type="submit" name="action" value="SearchFilter" class="btn btn-search">Search</button>
                            </div>
                        </form>
                    </div>
                </div>
                    
            <div class="jobs">
                    <div id="content" class="list">
                    <%
                        ArrayList<JobDTO> listJob = (ArrayList<JobDTO>)session.getAttribute("LIST_JOB");
                        ArrayList<JobDTO> appearjobs = new ArrayList<JobDTO>();
                        for (JobDTO job : listJob) {
                            if(job.getStatus() == 1)
                                appearjobs.add(job);
                        }
                        int currentPage = (int)session.getAttribute("CURRENT_PAGE");
                        int startAt = MAX_JOB_IN_PAGE * (currentPage - 1);
                        int endAt = (appearjobs.size() > startAt + MAX_JOB_IN_PAGE) ? (startAt + MAX_JOB_IN_PAGE) : (appearjobs.size());
                        for (int i = startAt; i < endAt; i++) {
                            if(appearjobs.get(i).getStatus() == 1) {
                    %>
                            <div class="items">
                                <div class="post" onclick="window.location.href = 'MainController?action=DetailJob&jobID=<%= appearjobs.get(i).getJobID() %>'">
                                    <p id="title">Tiêu đề: <%= appearjobs.get(i).getJobName() %></p>
                                    <p id="owner">Tên nhà tuyển dụng: <%= appearjobs.get(i).getProfileName()%></p>
                                    <p id="detail"><%= appearjobs.get(i).getDescription()%></p>
                                    <p id="price">Mức lương: <%= appearjobs.get(i).getPrice()%> VNĐ</p>
                                    <p id="time">Từ <%= appearjobs.get(i).getStartTime()%> đến <%= appearjobs.get(i).getEndTime()%></p>
                                    <a id="tag" href="MainController?action=SearchTag&tagID=<%= appearjobs.get(i).getTagID() %>"> <%= appearjobs.get(i).getTagName()%></a>
                                </div>
                            </div>
                    <%
                            }
                        }
                    %>
                    <%
                        int numOfPage = (appearjobs.size() % MAX_JOB_IN_PAGE == 0) ? (appearjobs.size() / MAX_JOB_IN_PAGE) : (appearjobs.size() / MAX_JOB_IN_PAGE + 1);
                        for (int i = 1; i <= numOfPage; i++) {
                            if(i != currentPage){
                    %> 
                    <a href="MainController?action=ChangePage&page=<%= i %>">| <%= i %> |</a>
                    <%
                        } else{
                    %>
                    <a>| <%= i %> |</a>
                    <%
                            }
                        }
                    %>
                    </div>
                </div>
        </div>
                    

        <jsp:include page="footerHomePage.jsp"></jsp:include>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
                                        function searchByName(param) {
                                            var txtSearch = param.value;
                                            $.ajax({
                                                url: "/swp391-freelancerJob/SearchByAjax",
                                                type: "get", //send it through get method
                                                data: {
                                                    search: txtSearch
                                                },
                                                success: function (data) {
                                                    var row = document.getElementById("content");
                                                    row.innerHTML = data;
                                                },
                                                error: function (xhr) {
                                                    //Do Something to handle error
                                                }
                                            });
                                        }
    </script>
    
    <script>
    function showPopup() {
        document.getElementById("popup").style.display = "block";
    }
    setTimeout(showPopup, 3000);
    </script>

</body>
</html>