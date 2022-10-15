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
        <script src="bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
        <script src="Jquery-core-3.0.2/jquery.js"></script>
        <link rel="stylesheet" href="assets/css/universalStyles.css"/>
        <link rel="stylesheet" href="assets/css/animation.css"/>
        <link rel="stylesheet" href="assets/css/login.css"/>
    </head>
    <body>
        <div class="container">
            <c:import url="header.jsp"></c:import>
            <section class="section row">
                <div class="section-left col-12 col-md-6 d-none d-md-flex align-content-center justify-content-center">
                    <img src="assets/images/figma/Image-Placeholder.png" width="100%">
                </div>


                <!--Login Form-->
                <div class="section-right col-12 col-md-6 " id="form_section">
                    <form action="loginController" class="d-flex  flex-column"  method="post">
                        <h1 class="h1">xin chào,</h1>
                        <div class="text text-bold">Đăng nhập hoặc Đăng kí</div>
                        <div class="form-group col align-items-end pb-3 d-flex">
                            <input type="text" class="" placeholder="Tên đăng nhập (6-20 kí tự)" name="txtUsername" value=""
                                   required/>
                        </div>
                        <div class="form-group col align-items-start pt-3 d-flex">

                            <input type="password" class="" placeholder="Mật khẩu" name="txtPassword" value=""
                                   required/>

                        </div>
                        <div class="col d-flex flex-column gap-3 mt-3">
                            <button class="hb-1" type="submit">Tiếp tục</button>
                            <div class="col my-3 d-flex justify-content-between text text-bold">
                                <span>Quên mật khẩu?</span>
                                <span>Chưa có tài khoản? <a href="#" class="text-decoration-none" onclick="changeForm()">Đăng kí</a></span>
                            </div>
                        </div>
                        <hr width="100%">
                        <div class="col row justify-content-center align-items-end gap-3 my-3">
                            <span class="text text-bold col-12 text-center">Hoặc đăng nhập bằng</span>
                            <div class="google d-flex align-items-center justify-content-center hb-2" >
                                <img class="img-thumbnail border-0" src="assets/images/figma/Google-alt.png"/>
                                <span>Google</span>
                            </div>
                        </div>
                    </form>
                    <form class="d-flex flex-column d-none gap-3" action="registerController"   method="post">
                        <h1 class="h1">Đăng kí</h1>
                        <div class="text text-bold">Điền tên đăng nhập và mật khẩu</div>
                        <div class="form-group col align-items-end  d-flex">
                            <input type="text" class="" placeholder="Tên đăng nhập (6-20 kí tự)" name="txtUsername" value=""
                                   required/>
                        </div>
                        <div class="form-group col align-items-start d-flex">

                            <input type="password" class="" placeholder="Mật khẩu" name="txtPassword" value=""
                                   required/>

                        </div>
                        <div class="form-group col align-items-start d-flex">

                            <input type="password" class="" placeholder="Mật khẩu" name="txtrePassword" value=""
                                   required/>

                        </div>
                        <div class="col d-flex flex-column">
                            <button class="hb-1" type="submit">Tiếp tục</button>
                            <div class="col d-flex justify-content-between my-5 text text-center text-bold">
                                <span class="d-block m-auto">Đã có tài khoản? 
                                    <a href="#" class="text-decoration-none" onclick="changeForm()">Đăng nhập</a>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </body>
    <script src="assets/js/login.js"></script>
</html>
