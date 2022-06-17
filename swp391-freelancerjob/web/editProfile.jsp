<%-- 
    Document   : editProfile
    Created on : Jun 9, 2022, 7:06:21 PM
    Author     : User
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="image/logo_free-file.png" type="image/x-icon">
        <title>Flance.vn</title>
        <link rel="stylesheet" href="css/editProfile.css">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <% 
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER"); 
            if(loginUser.getDescribe() == null) 
                loginUser.setDescribe("");
        %>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <form action="MainController" method="POST">
        <div class="container">
            <div class="row flex-lg-nowrap">
                <div class="col">
                    <div class="row">
                        <div class="col mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="e-profile">
                                        <div class="row">
                                            <div class="col-12 col-sm-auto mb-3">
                                                <div class="mx-auto" style="width: 140px;">
                                                    <div class="d-flex justify-content-center align-items-center rounded"
                                                         style="height: 140px; background-color: rgb(233, 236, 239);">
                                                        <span
                                                            style="color: rgb(166, 168, 170); font: bold 8pt Arial;"><img src="<%= loginUser.getAvatar() %>" width="140" height="140"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                                <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap"><%= loginUser.getProfileName() %></h4>
                                                    <p class="mb-0"><%= loginUser.getEmail() %></p>
                                                    <div class="mt-2">
                                                        <button class="btn" type="button">
                                                            <i class="fa fa-fw fa-camera"></i>
                                                            <span>Change Image
                                                            <input type="hidden" name="avatar" value="<%= loginUser.getAvatar() %>">
                                                            </span>
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="text-center text-sm-right">
                                                    <span class="badge badge-secondary"><%= loginUser.getRoleID() %></span>
                                                </div>
                                            </div>
                                        </div>
                                        <ul class="nav nav-tabs">
                                            <li class="nav-item"><a href="" class="active nav-link">Thông tin</a></li>
                                        </ul>
                                        <div class="tab-content pt-3">
                                            <div class="tab-pane active">
                                                <form class="form" novalidate="">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Tên đầy đủ</label>
                                                                        <input type="text" name="fullname" class="form-control" value="<%= loginUser.getProfileName() %>">
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Số điện thoại</label>                                                
                                                                        <input type="tel" name="phone" class="form-control" value="<%= loginUser.getPhone() %>">
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Ngày sinh</label>                                                
                                                                        <input type="text" name="birthday" class="form-control" value="<%= loginUser.getBirthday() %>" onfocus="(this.type='date')">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Address</label>
                                                                        <input type="text" name="address" class="form-control" value="<%= loginUser.getAddress() %>">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col mb-3">
                                                                    <div class="form-group">
                                                                        <label>Mô tả</label>
                                                                        <textarea class="form-control" rows="5"
                                                                        name="describe" value="<%=loginUser.getDescribe()%>" placeholder="My Bio">
                                                                        <%=loginUser.getDescribe()%>
                                                                        </textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col d-flex justify-content-center">
                                                            <button class="btn" type="submit" name="action" value="Edit">Save
                                                                Changes</button>
                                                        </div>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-3 mb-3">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="px-xl-3">
                                        <button class="btn btn-block btn-secondary">
                                            <i class="fa fa-sign-out"></i>
                                            <span><a style="text-decoration: none; color: white;" href="MainController?action=Logout">Đăng xuất</a></span>
                                        </button>
                                        <br>
                                    </div>
                                    <a class="btn btn-block btn-secondary" href="changePassword.jsp">Change Password</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        </form>
    <script type="text/javascript">

    </script>
</body>
</html>
