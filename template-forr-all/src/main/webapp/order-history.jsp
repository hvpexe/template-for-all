<%-- 
    Document   : order-history
    Created on : Dec 4, 2022, 12:41:34 PM
    Author     : Admin
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link rel="stylesheet" href="assets/css/discover.css">
        <link rel="stylesheet" href="assets/css/orderhistory.css"/>
    </head>
    <body>
        <div class="container">
            <c:import url="header.jsp" />
        </div>
        <section class="section col-12">
            <div class="my-5 raleway text-center col">
                <h1 class="search-title">Lịch Sử Giao Dịch</h1>
            </div>
            <div class="container container-fluid row p-0 m-auto" >
                <div class="col-md-10 col m-auto ">
                    <div class="col loc d-flex gap-2 my-2 align-items-center">
                        <span class="text d-block">Lọc Theo</span>
                        <select class="selection d-block ">
                            <option value="${MONTH * 3}" selected>3 tháng gần nhất</option>
                            <option value="${MONTH * 6}">6 tháng gần nhất</option>
                            <option value="${MONTH * 12}">12 tháng gần nhất</option>
                            <option value="all">Tất cả</option>
                        </select>
                        <c:if test="${!USER.isIsAdmin()}">
                            <div class="ms-auto inter fs-5  ">Số dư của bạn: <span class="fw-bold raleway">${USER.coin} xu</span> </div>
                        </c:if>
                    </div>
                    <c:set var="now" value="<%=new Timestamp(System.currentTimeMillis()).getTime()%>"/>
                    <div class="d-grid col-12 order-table">
                        <c:forEach items="${KEYS}" var="key">
                            <div class="order-section">
                                <div class="d-flex align-items-center fw-bold">
                                    <div class="order-day fw-bold text fs-6 col">
                                        ${key}
                                    </div>
                                </div>
                                <c:forEach items="${ORDERS.get(key)}" var="o" >
                                    <div data-time="${now- o.orderDate.getTime()}" class="order d-flex align-items-center fw-bold border-bottom">
                                        <span class="g-col-1 inter p-0"><img class="img-fluid p-3" src="assets/images/figma/${o.orderType}.png"></span>

                                        <span class="col-5 inter d-flex template-name">
                                            <img class="w-25 py-1 px-3 img-object-fit-cover" src="${o.template.imgLink}" >
                                            <span>
                                                <div>
                                                    ${o.template.name}
                                                    <c:if test="${o.orderType=='recharge'}">
                                                        <div>${o.user.username}</div>
                                                        <div class="fw-light">${o.user.getName()}</div>
                                                    </c:if>
                                                </div>
                                                <div class="clamp-2 fs-6 fw-light">${o.template.description}</div>
                                            </span>
                                        </span>
                                        <span class="col-2 inter text-center " 
                                              title="<fmt:formatDate pattern = "HH:mm" 
                                                              value = "${o.orderDate}" /> ${key}">
                                              <fmt:formatDate pattern = "HH:mm" 
                                                              value = "${o.orderDate}" />
                                        </span>
                                        <span class="col inter ${o.orderType} ${o.isApproved()} text-center pe-2">${o.orderPrice} xu </span>

                                        <span class="col inter d-flex justify-content-center align-items-center ">
                                            <c:if test="${USER.isAdmin}">
                                                <form onsubmit="return confirm('Kiểm tra kĩ tài khoảng trước khi Chấp Nhận')" 
                                                      action="OrderHistoryController" method="POST">
                                                    <button class="btn btn-success btn-circle btn-sm" title="Chấp Nhận"
                                                            ${o.isApproved()=='Approved'?'disabled':''}>
                                                        <i class="fa-solid fa-check text-light"></i>
                                                    </button>
                                                    <input type="hidden" name="money" value="${o.getOrderPrices()}"/>
                                                    <input type="hidden" name="time" value="${o.orderDate.getTime()}"/>
                                                    <input type="hidden" name="userid" value="${o.user.id}"/>
                                                </form>
                                            </c:if>
                                            <c:if test="${!USER.isAdmin && o.orderType=='recharge'}"> 
                                                ${o.isApproved()}
                                            </c:if>
                                        </span>

                                    </div>
                                </c:forEach>
                            </div>
                        </c:forEach>
                    </div>
                </div>
        </section>
        <script src="assets/js/order-history.js"></script>
        <div class="container">
            <c:import url="footer.jsp" />
        </div>
    </body>
</html>
