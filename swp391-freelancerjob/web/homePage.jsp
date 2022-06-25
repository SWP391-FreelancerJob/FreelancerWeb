
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
        <div class="container">

            <jsp:include page="homePageHeader.jsp"></jsp:include>

            <%
                String search = request.getParameter("search");
                if (search == null) {
                    search = "";
                }
            %>

            <div class="topnav">
                <div class="dropdown">
                    <c:forEach items="${LIST_TAG}" var="tag">
                        <a class="dropbtn" href="MainController?action=SearchTagHomePage&tagID=${tag.tagID}">${tag.tagName}</a>
                    </c:forEach>
                </div>
                <form action="MainController" method="POST">
                    <input oninput="searchByName(this)" type="text" value="<%= search%>" name="search"  placeholder="Search...">                            
                    <input type="hidden" name="action" value="SearchHomePage">
                </form>
            </div>

            <div class="jobs">
                <div id="content" class="list">
                    <c:forEach items="${LIST_JOB}" var="job"> 
                        <c:if  test="${job.status == 1}">
                            <div class="items">
                                <div class="post" onclick="window.location.href = 'login.jsp'">
                                    <p id="title">Tiêu đề: ${job.jobName}</p>
                                    <p id="owner">Tên nhà tuyển dụng: ${job.profileName}</p>
                                    <p id="detail">${job.description}</p>
                                    <p id="price">Mức lương: ${job.price} VNĐ</p>
                                    <p id="time">Từ ${job.startTime} đến ${job.endTime}</p>
                                    <a id="tag" href="MainController?action=SearchTagHomePage&tagID=${job.tagID}">${job.tagName}</a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>           
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