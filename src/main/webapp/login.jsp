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
        <link rel="stylesheet" href="assets/css/animation.css"/>
        <link rel="stylesheet" href="assets/css/login.css"/>
        <script src="bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
        <script src="Jquery-core-3.0.2/jquery.js"></script>
    </head>
    <body>
        <div class="container">
            <c:import url="header.jsp"></c:import>
            <section class="section row">
                <div class="section-left col-12 col-md-6  d-flex align-content-center justify-content-center">
                    <img src="assets/images/figma/Image-Placeholder.png" width="100%">
                </div>
                <form action="login" class="section-right col-12 col-md-6" id="main">
                    <h1 class="h1">xin chào,</h1>
                    <div class="text">Đăng nhập hoặc Đăng kí</div>
                    <div class="form-group col align-items-end pb-3 d-flex">
                        <input class="" placeholder="Tên đăng nhập (6-20 kí tự)" name="username">
                    </div>
                    <div class="form-group col align-items-start pt-3 d-flex">
                        <input class="" placeholder="Mật khẩu" name="password">
                    </div>
                    <div class="col d-flex flex-column">
                        <div class="col d-flex justify-content-between text">
                            <span>Quên mật khẩu?</span>
                            <span>Chưa có tài khoản? <a href="#" onclick="changeRegister('#main')">Đăng kí</a></span>
                        </div>
                        <button type="submit">Tiếp tục</button>
                    </div>
                    <div class="col row justify-content-center align-items-end  pt-3">
                        <span class="text col-12 text-center">Hoặc đăng nhập bằng</span>
                        <div class="google d-flex align-items-center justify-content-center hb-2" >
                            <img class="img-thumbnail border-0" src="assets/images/figma/Google-alt.png"/>
                            <span>Google</span>
                        </div>
                    </div>

                </form>
            </section>
        </div>
            
    </body>
</html>
