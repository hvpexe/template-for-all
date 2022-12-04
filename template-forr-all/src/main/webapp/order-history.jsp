<%-- 
    Document   : order-history
    Created on : Dec 4, 2022, 12:41:34 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="./assets/images/figma/logo_img.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lịch Sử Giao Dịch</title>
        <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/universalStyles.css"/>
        <link rel="stylesheet" href="assets/css/animation.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
        <script src="bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
        <script src="Jquery-core-3.0.2/jquery.js"></script>
        <link rel="stylesheet" href="assets/css/order-history.css"/>
    </head>
    <body>
        <div class="container">
            <c:import url="header.jsp" />
        </div>
        <section class="section col-12">
            <div class="main col-12 p-4 d-flex justify-content-center">
                <div class="container row p-0">
                    ${ORDERS}
                </div>
            </div>
        </section>
        <div class="container">
            <c:import url="footer.jsp" />
        </div>
    </body>
</html>
