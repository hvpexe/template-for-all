<%-- 
    Document   : login.jsp
    Created on : Oct 15, 2022, 8:50:02 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Nhập</title>
        <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/login.css"/>
    </head>
    <body>
        <div class="container">
            <c:import url="header.jsp"></c:import>
            <section class="section row">
                <div class="section-left col-6 d-flex align-content-center justify-content-center">
                    <img src="assets/images/figma/Image-Placeholder.png" width="100%">
                </div>
                <main class="section-right col-6">
                    <h1 class="h1">xin chào,</h1>
                    <div class="text">Đăng nhập hoặc Đăng kí</div>
                    <div class="form-group col">
                        <input class="" placeholder="Tên đăng nhập (6-20 kí tự)" name="username">
                    </div>
                    <div class="form-group col">
                        <input class="" placeholder="Mật khẩu" name="password">
                    </div>
                    <div class="col">
                        <span>Quên mật khẩu?</span>
                        <span>Chưa có tài khoản? <a>Đăng kí</a></span>
                    </div>
                </main>
            </section>
        </div>
    </body>
</html>
