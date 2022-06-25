<%-- 
    Document   : changePassword
    Created on : Jun 9, 2022, 7:31:22 PM
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
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>

        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        %>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
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
                                                            style="color: rgb(166, 168, 170); font: bold 8pt Arial;"><img width="140" height="140" src="<%= loginUser.getAvatar() %>" alt="avatar"></span>
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
                                                            <span>Change Photo</span>
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="text-center text-sm-right">
                                                    <span class="badge badge-secondary"><%= loginUser.getRoleID() %></span>
                                                </div>
                                            </div>
                                        </div>
                                        <form action="MainController" method="post">
                                        <div class="row">
                                            <div class="col-12 col-sm-6 mb-3">
                                                <div class="mb-2"><b>Đổi mật khẩu</b></div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label>Mật khẩu hiện tại</label>
                                                            <input class="form-control" type="password" name="password"
                                                                   placeholder="••••••">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label>Mật khẩu mới</label>
                                                            <input class="form-control" type="password" name="newPassword"
                                                                   placeholder="••••••">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col">
                                                        <div class="form-group">
                                                            <label>Xác nhận <span class="d-none d-xl-inline">Mật
                                                                    khẩu</span></label>
                                                            <input class="form-control" type="password" name="confirmPassword"
                                                                   placeholder="••••••">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col d-flex justify-content-center">
                                                <button class="btn" type="submit" name="action" value="Confirm">Save
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
            </div>
        </div>
        <style>
            .container {
                margin-top: 50px;
            }

            button {
                background-color: #f27405;
            }
        </style>
    </body>
</html>
