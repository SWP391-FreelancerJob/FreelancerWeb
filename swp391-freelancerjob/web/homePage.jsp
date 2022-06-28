
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.jobs.JobDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/homePage.css">
        <link rel="stylesheet" type="text/css"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="icon" href="./img/logo_free-file.png" type="image/x-icon">
        <title>Flance.vn</title>

    </head>
    <body> 
        <%
            int MAX_JOB_IN_PAGE = 3;
        %>
        <div class="container">
            <jsp:include page="homePageHeader.jsp"></jsp:include>

            <%
                String search = request.getParameter("search");
                if (search == null) {
                    search = "";
                }
            %>
            <div class="topnav">
                <form action="MainController" method="POST">
                    <input oninput="searchByName(this)" type="text" value="<%= search%>" name="search"  placeholder="Search...">                            
                    <input type="hidden" name="action" value="SearchHomePage">
                </form>
            </div>
                    
            <div class="jobs">
                <div class="filter">
                    <div class="filter-list">
                        <form action="MainController" method="POST">
                            <div class="filter-functions">
<!--                                <div>
                                    <button type="submit" name="action" value="AllJob">Tất cả các bài</button><br>                                    
                                </div>-->
                                <div>
                                    <label>
                                        <h2>Sắp xếp bài đăng:</h2>
                                    </label>
                                    <select name="searchByTypeSalary" class="box">
                                        <option value="allJob">Tất cả bài đăng</option>
                                        <option value="HighToLow">Thấp đến cao</option>
                                        <option value="LowToHigh">Cap đến thấp</option>
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
                                <button type="submit" name="action" value="SearchFilterHomePage" class="btn btn-search">Search</button>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div id="content" class="list">
                    <%
                        ArrayList<JobDTO> listJob = (ArrayList<JobDTO>) session.getAttribute("LIST_JOB");
                        ArrayList<JobDTO> appearjobs = new ArrayList<JobDTO>();
                        for (JobDTO job : listJob) {
                            if(job.getStatus() == 1)
                                appearjobs.add(job);
                        }
                        int currentPage = (int) session.getAttribute("CURRENT_PAGE");
                        int startAt = MAX_JOB_IN_PAGE * (currentPage - 1);
                        int endAt = (appearjobs.size() > startAt + MAX_JOB_IN_PAGE) ? (startAt + MAX_JOB_IN_PAGE) : (appearjobs.size());
                        
                        
                        for (int i = startAt; i < endAt; i++) {
                    %>
                    <div class="items">
                        <div class="post" onclick="window.location.href = 'login.jsp'">
                            <p id="title">Tiêu đề: <%= appearjobs.get(i).getJobName()%></p>
                            <p id="owner">Tên nhà tuyển dụng: <%= appearjobs.get(i).getProfileName()%></p>
                            <p id="detail"><%= appearjobs.get(i).getDescription()%></p>
                            <p id="price">Mức lương: <%= appearjobs.get(i).getPrice()%> VNĐ</p>
                            <p id="time">Từ <%= appearjobs.get(i).getStartTime()%> đến <%= appearjobs.get(i).getEndTime()%></p>
                            <a id="tag" href="MainController?action=SearchTagHomePage&tagID=<%= appearjobs.get(i).getTagID() %>"> <%= appearjobs.get(i).getTagName()%></a>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <%
                        int numOfPage = (appearjobs.size() % MAX_JOB_IN_PAGE == 0) ? (appearjobs.size() / MAX_JOB_IN_PAGE) : (appearjobs.size() / MAX_JOB_IN_PAGE + 1);
                        for (int i = 1; i <= numOfPage; i++) {
                            if (i != currentPage) {
                    %> 

                    <a href="MainController?action=ChangePage&page=<%= i%>">| <%= i%> |</a>
                    <%
                    } else {
                    %>
                    <a>| <%= i%> |</a>
                    <%
                            }
                        }
                    %>

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

    </body>
</html>
