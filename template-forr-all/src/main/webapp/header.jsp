<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,500;0,700;1,400;1,500;1,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
<link rel="stylesheet" href="assets/css/animation.css"/>
<link rel="stylesheet" href="assets/css/header.css"/>
<header class="header">
    <nav class="header-container nav justify-content-center">
        <div class="navbar-brand c-pointer d-flex align-items-center">
            <img src="assets/images/figma/logo_img.png">
            <span class="ms-2">Template For All</span>
        </div>
        <div class="nav-item header-navigation col d-flex justify-content-around mx-lg-3">
            <a class="active" href="displayDiscoverPage">Trang chủ</a>
            <a href="#">Video</a>
            <a href="#">Âm Thanh</a>
            <a href="#">Hình Ảnh</a>
            <a href="#">Website</a>
            <a href="#">Thuyết trình</a>
        </div>
        <c:if test="${USER==null}">
            <a class="nav-item  header-login text-white text-decoration-none" href="login.jsp">
                <div class="button">
                    Đăng nhập
                </div>
            </a>
        </c:if>
        <c:if test="${USER!=null}">
            <div class="header-user position-relative" >
                <div class="user-navigation d-none position-absolute">
                    <div class="list-group row py-2  bg-transparent">
                        <div class="list-group-item px-1 border-top border-bottom gold">
                            <a href="payment.jsp" class="h-underline" style="color: inherit">Gói Nâng Cao
                            </a>
                        </div>
                        <div class="list-group-item px-1 shopping">
                            <a href="displayMyLibraryPage" class="h-underline" style="color: inherit">Thư viện của tôi</a></div>
                        <div class="list-group-item px-1 border-bottom history h-underline">
                            <a href="OrderHistoryController" class="h-underline" style="color: inherit">
                                Lịch sử giao dịch ${USER.isAdmin?'(Admin)':''}
                            </a>
                        </div>
                        <div class="list-group-item px-1 border-0 logout">
                            <a href="LogoutController" class="h-underline" style="color: inherit">
                                Đăng Xuất
                            </a>
                        </div>
                    </div>
                </div>
                <div class="user-display p-2 px-3 d-flex align-items-center  gap-2" onclick="document.querySelector('.user-navigation').classList.toggle('d-none');">
                    <div class="user-avt  d-flex align-items-center justify-content-center far fa-user"></div>
                    <span class="text-capitalize fs-5 mx-auto ">${USER.firstName}</span>
                    <span class="d-flex align-items-center justify-content-center fs-5"><i class="fa-solid fa-chevron-down" style="width: 20px;height: 20px;"></i></span>
                </div>
            </div>
        </c:if>
    </nav>
</header>
