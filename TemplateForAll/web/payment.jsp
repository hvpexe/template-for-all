<%-- 
    Document   : payment
    Created on : Oct 15, 2022, 5:35:15 PM
    Author     : Admin
--%>

<%@page import="dto.UserDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="./assets/images/figma/logo_img.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nạp tiền vào tài khoản</title>
        <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/universalStyles.css"/>
        <link rel="stylesheet" href="assets/css/animation.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
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
                <h1 class="h1 text-center ">Gói tải xuống <span class="text-uppercase">NÂNG CAO</span></h1>
                <div class="text-center">Cung cấp cho bạn định mức phù hợp với nhu cầu của mình.</div>
            </div>
            <div class="main col-12 p-4 d-flex justify-content-center">
                <div class="container row p-0">
                    <div class="col-12 inter fs-4 mb-4">Số dư của bạn: <span class="fw-bold"><%= 10000 %> xu</span></div>
                    <div class="container col-12 p-0 d-flex justify-content-around">
                        <div class="package p-3 col-4 mx-4 d-flex flex-column">
                            <span class="text col-12 text-center fs-4 fw-bold ">Cơ bản</span>
                            <img class="h-75 m-auto my-5" src="assets/images/figma/Standard.png" />
                            <span class="text inter fw-bold fs-2 text-center">100.000đ / tháng</span>
                            <h3 class="text">&check; 100.000 XU</h3>
                            <h3 class="text">&check; Tặng 20% với anh em Việt Nam</h3>
                            <h3 class="text">&check; Email support</h3>
                            <h3 class="text">&nbsp</h3>
                            <button class="button w-50 d-flex m-auto my-2 py-3">Mua ngay</button>

                        </div>
                        <div class="package p-3 col-4 mx-4 d-flex flex-column">
                            <span class="text col-12 text-center fs-4 fw-bold ">Nâng cao</span>
                            <img class="h-75 m-auto my-5" src="assets/images/figma/Professional.png"/>
                            <span class="text inter fw-bold fs-2 text-center">500.000đ / tháng</span>
                            <h3 class="text">&check; 100.000 XU</h3>
                            <h3 class="text">&check; Tặng 20% với anh em Việt Nam</h3>
                            <h3 class="text">&check; Email support</h3>
                            <h3 class="text">&check; Được tích trữ XU qua kỳ sau</h3>
                            <button class="button w-50 d-flex m-auto my-2 py-3">Mua ngay</button>
                        </div>
                        <div class="package p-3 col-4 mx-4 d-flex flex-column">
                            <span class="text col-12 text-center fs-4 fw-bold ">Chuyên nghiệp</span>
                            <img class="m-auto my-5" src="assets/images/figma/Enterprise.png"/>
                            <span class="text inter fw-bold fs-2 text-center">1200.000đ / tháng</span>
                            <h3 class="text">&check; Vô hạn XU</h3>
                            <h3 class="text">&check; Giảm 20% với anh em Việt Nam</h3>
                            <h3 class="text">&check; Support 24/7</h3>
                            <h3 class="text">&check; Hỗ trợ tư vấn thiết kế</h3>
                            <button class="button w-50 d-flex m-auto my-2 py-3">Mua ngay</button>
                        </div>
                    </div>

                    <div class="col-12 inter fs-4 mb-4 text-center pt-4"><span class="fw-bold">HOẶC</span></div>


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
