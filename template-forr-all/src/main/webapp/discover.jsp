<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="icon" href="./assets/images/figma/logo_img.png" type="image/x-icon">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Video Template</title>
        <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/discover.css">
    </head>

    <body>
        <div class="container">
            <c:import url="header.jsp"></c:import>

                <section class="section row">
                    <div class="search">
                        <h1 class="search-title">Khám Phá</h1>
                        <form class="search-form" action="searchController">
                            <input type="text" name="search" placeholder="Tìm kiếm template của bạn" value="${requestScope.search}"/>
                        <button type="submit">Tìm Kiếm</button>
                    </form>
                </div>
                <h1 class="template-header">Video template</h1>    


                <div class="row">

                    <c:set var="templateList" value="${requestScope.TEMPLATE_LIST}"></c:set>
                    <c:forEach var="template" items="${templateList}">
                        <div class="col-md-4 col-xs-6 ">
                            <div class="template-image"
                                 style="background-image: url(${template.imgLink});">
                                <div class="template">
                                    <div class="template-title">
                                        ${template.name}
                                    </div>
                                    <div class="d-flex justify-content-between template-info-container">
                                        <div class="template-info">
                                            <div class="template-info-title">
                                                Giá
                                            </div>
                                            <div class="template-info-detail">
                                                ${template.getPriceWithFormat()} XU
                                            </div>
                                        </div>
                                        <div class="template-info">
                                            <div class="template-info-title">
                                                Phân loại
                                            </div>
                                            <div class="template-info-detail">
                                                ${template.categoryName}
                                            </div>
                                        </div>
                                        <a href="displayTemplateDetail?templateId=${template.id}" class="btn btn-detail">Chi tiết</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!--                <h1 class="template-header">Video template</h1>
                                <div class="row">
                                    <div class="col-md-4 col-xs-6 ">
                                        <div class="template-image"
                                             style="background: url(https://cdn3.dhht.vn/wp-content/uploads/2022/07/11-15-phong-tap-gym-sach-se-thiet-bi-hien-dai-tai-sai-gon.jpg);">
                                            <div class="template">
                                                <div class="template-title">
                                                    Mau template
                                                </div>
                                                <div class="d-flex justify-content-between template-info-container">
                                                    <div class="template-info">
                                                        <div class="template-info-title">
                                                            giá
                                                        </div>
                                                        <div class="template-info-detail">
                                                            10000 XU
                                                        </div>
                                                    </div>
                                                    <div class="template-info">
                                                        <div class="template-info-title">
                                                            Phân loại
                                                        </div>
                                                        <div class="template-info-detail">
                                                            am thanh
                                                        </div>
                                                    </div>
                                                    <a href="#" class="btn btn-detail">Chi tiết</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>-->
                <c:import url="footer.jsp"/>
            </section>
        </div>
    </body>

</html>
