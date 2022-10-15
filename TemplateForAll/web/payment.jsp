<%-- 
    Document   : payment
    Created on : Oct 15, 2022, 5:35:15 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nạp tiền vào tài khoản</title>
        <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/universalStyles.css"/>
        <link rel="stylesheet" href="assets/css/animation.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
        <script src="bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
        <script src="Jquery-core-3.0.2/jquery.js"></script>
        <link rel="stylesheet" href="assets/css/payment.css"/>
    </head>
    <body>
        <div class="container">
            <c:import url="header.jsp" />
        </div>
        <section class="section col-12">
            <div class="col-12 my-5">
                <h1 class="h1 text-center ">Nạp tiền vào <span class="text-uppercase">tài khoản</span></h1>
                <div class="text-center">Định mức phù hợp với nhu cầu của mình.</div>
            </div>
            <div class="main col-12 p-4 d-flex justify-content-center">
                <div class="container row p-0">
                    <div class="col-12 inter fs-4 mb-4">Số dư của bạn: <span class="fw-bold">10.000 xu</span></div>
                    <div class=" col-12 p-0 d-flex justify-content-around">
                        <div class="package p-4 col-6 d-flex flex-column">
                            <span class="text col-12 text-center fs-4 fw-bold ">Chuyển khoản qua Momo</span>
                            <span class="text pt-2">1. Quét mã QR bên dưới</span>
                            <span class="text">2. Nhập số tiền bạn muốn nạp - tối thiểu 10.000 vnđ</span>
                            <span class="text col-12 text-center fs-4 fw-bold ">1000 vnđ = 1000 xu</span>

                            <span class="text">3. Hoàn tất quá trình chuyển tiền</span>
                            <span class="text">Sau khoảng 1, 2 phút, tài khoản bạn trên web sẽ được cộng tiền.</span>
                            <img class="w-100 m-auto my-1" src="assets/images/figma/momo.jpg"/>
                        </div>
                    </div>
                    <div>

                    </div>
                </div>
            </div>
        </section>
        <div class="container">
            <c:import url="footer.jsp" />
        </div>

    </body>    
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script src="">
        const swiper = new Swiper('.swiper', {
            // Optional parameters
        });
    </script>
</html>
