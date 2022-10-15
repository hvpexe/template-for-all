<%-- 
    Document   : product
    Created on : Oct 15, 2022, 12:37:09 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang Sản Phẩm</title>
        <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/animation.css"/>
        <script src="bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
        <script src="Jquery-core-3.0.2/jquery.js"></script>

        <link rel="stylesheet" href="assets/css/login.css"/>
        <link rel="stylesheet" href="assets/css/product.css"/>
    </head>
    <body class="container">
        <c:import url="header.jsp"/> 
        <main class="main">
            <section class="section row">
                <div class="section-left col-12 col-md-6  d-flex align-content-center justify-content-center">
                    <img src="assets/images/figma/Image-Placeholder.png" width="100%">
                </div>
                <form action="login" method="post" class="section-right col-12 col-md-6" id="main">
                    <h1 class="h1">Mẫu template 1</h1>
                    <div class="col d-flex ">
                        <div class="col-4 user">
                            <span class="text-bold">Tác giả</span>
                            <span class="">
                                <img class="img-fluid w-25 rounded-circle">
                                <span class="text-bold">Account1</span>
                            </span>
                        </div>
                        <div class="col-4 user">
                            <span class="text-bold">Sở hữu</span>
                            <span class="">
                                <img class="img-fluid w-25 rounded-circle">
                                <span class="text-bold">Account2</span>
                            </span>
                        </div>
                    </div>
                    <div class="text-description text-bold col d-flex flex-column">
                        Đây là mẫu template 1 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì
                    </div>
                    <div class="col d-flex flex-wrap " style="gap:10px">
                        <span class="category">Ngắn</span>
                        <span class="category">Dài</span>
                        <span class="category">Ngắn hơn</span>
                        <span class="category">Ngắn nhất</span>
                    </div>

                </form>
            </section>
        </main>
    </body>
</html>
