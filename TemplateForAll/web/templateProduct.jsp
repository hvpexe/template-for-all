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

        <link rel="stylesheet" href="assets/css/universalStyles.css"/>
        <link rel="stylesheet" href="assets/css/templateProduct.css"/>
    </head>
    <body class="container">
        <c:import url="header.jsp"/> 
        <main class="main">
            <section class="section row">
                <div class="section-left col-12 col-md-6  d-flex align-content-center justify-content-center">
                    <img src="assets/images/figma/Image-Placeholder.png" width="100%">
                </div>
                <div  class="section-right col-12 gap-2 col-md-6">
                    <h1 class="h1 col-12 mb-5">Mẫu template 1</h1>
                    <div class="col-12 d-flex my-5 mb-4">
                        <div class="col-4 d-flex flex-column gap-10">
                            <span class="text text-bold col-12">Tác giả</span>
                            <span class="col-12">
                                <img src="assets/images/figma/user1.png" class="img-fluid rounded-circle" width="20%">
                                <span class="text text-bold ms-3">Account1</span>
                            </span>
                        </div>
                        <div class="col-4 d-flex flex-column gap-10">
                            <span class="text text-bold col-12">Sở hữu</span>
                            <span class="col-12">
                                <img src="assets/images/figma/user2.png" class="img-fluid rounded-circle" width="20%">
                                <span class="text text-bold ms-3">Account2</span>
                            </span>
                        </div>
                    </div>
                    <div class="text text-description text text-bold my-5 col-12 d-flex flex-column">
                        Đây là mẫu template 1 để mọi người có thể hình dung được. Chỗ này ghi bừa vậy cho nhiều chữ thôi chứ không có gì
                    </div>
                    <div class="col-12 d-flex flex-wrap my-5 " style="gap:10px">
                        <span class="category hb-1">Ngắn</span>
                        <span class="category hb-1">Dài</span>
                        <span class="category hb-1">Ngắn nhất</span>
                        <span class="category hb-1">Ngắn</span>
                        <span class="category hb-1">Dài</span>
                        <span class="category hb-1">Ngắn</span>
                        <span class="category hb-1">Ngắn hơn</span>
                        <span class="category hb-1">Ngắn nhất</span>
                        <span class="category hb-1">Ngắn hơn</span>
                        <span class="category hb-1">Dài</span>
                        <span class="category hb-1">Ngắn hơn</span>
                        <span class="category hb-1">Ngắn nhất</span>
                    </div>
                    <div class="h4 text col-12 d-flex  sale">
                        <span class="col">Giá Template</span>
                        <span class="text text-bold h3">10.000 Xu</span>
                    </div>
                    <div class="d-flex gap-5 justify-content-between">
                        <a class="button text-center col text-decoration-none text-white hb-1">Mua Ngay</a>
                    </div>
            </section>
        </main>
    </body>
</html>
