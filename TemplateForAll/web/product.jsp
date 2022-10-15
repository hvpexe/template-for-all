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
        <link rel="icon" href="./assets/images/figma/logo_img.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang Sản Phẩm</title>
        <link rel="stylesheet" href="assets/css/universalStyles.css"/>
        <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/animation.css"/>
        <script src="bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
        <script src="Jquery-core-3.0.2/jquery.js"></script>
        <link rel="stylesheet" href="assets/css/templateProduct.css"/>
    </head>
    <body class="container">
        <c:import url="header.jsp"/> 
        <main class="main gap-5 flex-column d-flex">
            <section class="section row">
                <c:set var="templateDto" value="${requestScope.TEMPLATE}"></c:set>
                    <div class="section-left col-12 col-md-6  d-flex align-content-center justify-content-center">
                        <img src="${templateDto.imgLink}" width="100%">
                </div>
                <div  class="section-right col-12 gap-2 col-md-6">
                    <h1 class="h1 col-12 mb-5">${templateDto.name}</h1>
                    <!--                    <div class="col-12 d-flex my-5 mb-4">
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
                                        </div>-->
                    <div class="text text-description text text-bold my-5 col-12 d-flex flex-column">
                        ${templateDto.description}
                    </div>
                    <div class="col-12 d-flex flex-wrap my-5 " style="gap:10px">
                        <span class="category fw-bold hb-1">Ngắn</span>
                        <span class="category fw-bold hb-1">Dài</span>
                        <span class="category fw-bold hb-1">Ngắn nhất</span>
                        <span class="category fw-bold hb-1">Ngắn</span>
                        <span class="category fw-bold hb-1">Dài</span>
                        <span class="category fw-bold hb-1">Ngắn</span>
                        <span class="category fw-bold hb-1">Ngắn hơn</span>
                        <span class="category fw-bold hb-1">Ngắn nhất</span>
                        <span class="category fw-bold hb-1">Ngắn hơn</span>
                        <span class="category fw-bold hb-1">Dài</span>
                        <span class="category fw-bold hb-1">Ngắn hơn</span>
                        <span class="category fw-bold hb-1">Ngắn nhất</span>
                    </div>
                    <div class="h4 text col-12 d-flex  sale">
                        <span class="col">Giá Template</span>
                        <span class="text text-bold h3 raleway fw-bold">${templateDto.price} Xu</span>
                    </div>

                    <div class="d-flex gap-3 justify-content-between">
                        <a class="button text-center col text-decoration-none text-white hb-1 " onclick="Buy('#confirm-box')">Mua Ngay</a>
                        <!--<a class="button cart text-center col text-decoration-none hb-1 ">Them vao Gio hang</a>-->
                    </div>
            </section>
            <section class="row gap-5">
                <div class="col-12 d-flex justify-content-between">
                    <h1 class="h1">Một số template khác</h1>
                    <div class="hb-1 button text-white px-4 py-2  my-auto">Tất Cả</div>
                </div>
                <div class="row">
                    <div class="col-md-4 col-xs-6 ">
                        <div class="template-image card" style="background: url(https://cdn3.dhht.vn/wp-content/uploads/2022/07/11-15-phong-tap-gym-sach-se-thiet-bi-hien-dai-tai-sai-gon.jpg);">
                            <div class="template">
                                <div class="template-title raleway">
                                    Mẫu template fix cứng
                                </div>
                                <div class="d-flex justify-content-between template-info-container">
                                    <div class="template-info">
                                        <div class="template-info-title inter">
                                            Giá
                                        </div>
                                        <div class="template-info-detail raleway fw-bold">
                                            10000 XU
                                        </div>
                                    </div>
                                    <div class="template-info">
                                        <div class="template-info-title">
                                            Phân loại
                                        </div>
                                        <div class="template-info-detail">
                                            Am thanh
                                        </div>
                                    </div>
                                    <a href="#" class="btn button text-white fs-6 raleway px-4 fw-bold">Chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <div class="position-fixed" id="confirm-box" >
            <div class="gray-box"></div>
            <div class="container border rounded col col-md-4 p-3 rounded">
                <div class="col border rounded py-4 text-center">
                    <div class="text p-4 fw-bold raleway">Bạn có muốn mua template này không?</div>
                    <div class="col p-4 d-flex gap-5 justify-content-evenly">
                        <button class="button col-3 py-2 yes hb-1 p-3">CÓ</button> 
                        <button class="button bg-secondary no hb-1 col-3 py-2 p-3">Không</button> 
                    </div>
                </div>
            </div>
        </div>           
        <c:import url="footer.jsp"/> 
        <script src="assets/js/product.js"></script>
    </body>
</html>
