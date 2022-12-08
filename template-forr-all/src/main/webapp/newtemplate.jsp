<%-- 
    Document   : my-template
    Created on : Oct 16, 2022, 8:08:45 AM
    Author     : LamVo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

    <head>
        <link rel="icon" href="./assets/images/figma/logo_img.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang Sản Phẩm</title>
        <link rel="stylesheet" href="assets/css/universalStyles.css" />
        <link rel="stylesheet" href="bootstrap-5.0.2-dist/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/animation.css" />
        <script src="bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
        <script src="Jquery-core-3.0.2/jquery.js"></script>
        <!--Css file for tag-->
        <link href="assets/css/animation.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="assets/css/templateProduct.css" />
        <link rel="stylesheet" href="assets/css/tagStyle.css">

    </head>
    <script>
        let templatePrice = 12000;
        let templateId = 'ID123';
    </script>

    <body class="container">
        <c:import url="header.jsp" />

        <main class="main gap-5 flex-column d-flex">
            <section class="section row">
                <!-- temaplate image -->
                <form class="row flex-wrap flex-md-nowrap align-items-start gap-2"
                      action="ModifyTemplateController" method="post" enctype="multipart/form-data">
                    <!-- Add New Template Form -->

                    <div class="col-12 col-md-6 d-flex flex-column p-0 align-content-center justify-content-center hb-2 "
                         onclick="$('#file-uploader').click()">
                        <div class="text-danger text-center inter"
                             id="IMG_ERROR">${IMG_ERROR}</div><c:remove scope="session" var="IMG_ERROR"/>
                        <img id="image-template" <c:if test="${not empty TEMPLATE}">src="${TEMPLATE.imgLink}"</c:if>
                             src="assets/images/figma/add-images.png"
                             width="100%">
                        </div>

                        <input class="d-none" type="file" accept=".jpg, .jpeg, .png"  id="file-uploader"
                               name="fileImgLink"  value="" 
                               onchange="
                                       $('#image-template').attr('src', getObjURL(this.files[0]));
                                       $('#IMG_ERROR').addClass('d-none')"/>

                        <div class="col-12 gap-1 col-md-6 inter d-flex flex-column">
                            <!-- template name -->
                            <label for="txtName">Tên template <font color="red">*</font></label>
                            <input class="raleway text fw-bold" name="txtName" required value="${sessionScope.TEMPLATE.name}" /> </br>
                        <!-- template category -->
                        <div class="col d-flex p-0 my-2 align-items-center">
                            <label for="txtCategoryId">Thể loại <font color="red">*</font></label>
                            <select class="select2 col" required  name="txtCategoryId">
                                <option value="" disabled="disabled" >Choose Category</option>
                                <option value="1">Video</option>
                                <option value="2">Âm Thanh</option>
                                <option value="3">Hình Ảnh</option>
                                <option value="4">Website</option>
                                <option value="5">Thuyết Trình</option>
                            </select>
                        </div>
                        <script >$('[name=txtCategoryId]').children('[value=${sessionScope.TEMPLATE.categoryId}]').attr('selected', 'selected')</script>
                        <!-- description -->
                        <div class="col d-flex p-0 my-2 align-items-center flex-wrap " >
                            <label for="txtDescription">Mô tả <font color="red">*</font></label>
                            <textarea name="txtDescription"
                                      class="text fw-light col-12 d-flex flex-column">${sessionScope.TEMPLATE.description}</textarea>
                        </div>
                        <!-- template price -->
                        <div class="col d-flex p-0 my-2 align-items-center " >
                            <label for="txtPrice">Giá Template <font color="red">*</font></label>
                            <input class="col-4 ms-auto raleway fs-4 m-2 text-end fw-bold" required type="number"
                                    min="0" step="1000" value="${sessionScope.TEMPLATE.price}" name="txtPrice" /> 
                            <span class="raleway fs-4 fw-bold">XU</span>
                        </div>
                        <div class="col d-flex p-0 my-2 align-items-center gap-2 " >
                            <!-- upload file zip -->
                            <label for="fileZip">File Zip <font color="red">*</font></label>
                            <!-- <a class="col-5 button text-center col text-decoration-none text-white hb-1 " onclick="Buy('#confirm-box')">Tải lên</a> -->
                            <input class="col my-2"  
                                   onchange=" $('#FILE_ERROR').addClass('d-none')"
                                   type="file" name="fileZip" id="file-uploader" accept=".zip, .rar, .7zip"
                                   style="margin-top: 5px;" value="${param.fileZip}" />
                        </div>
                        <div class="text-danger inter" id="FILE_ERROR">${FILE_ERROR}</div>
                        <c:remove scope="session" var="FILE_ERROR"/>
                        <button type="submit" class="button mt-auto align-self-end text-center col-12 text-decoration-none text-white hb-1 ">Lưu Template</button>
                    </div>
                    <c:catch>
                        <input type="hidden" name="txtId" value="${sessionScope.TEMPLATE.id}">
                    </c:catch>
                </form>
                <div class="col my-2">
                    <span class="text fs-3 fw-bold inter">Lưu ý <span class="text-danger">*</span>: 
                        <span class="text fw-normal">File Zip chỉnh sửa được để Trống có nghĩa là không có sự thay đổi</span>
                    </span>
                </div>
            </section>
            <!--            <section class="row gap-5">
                            <div class="col-12 d-flex justify-content-between">
                                <h1 class="h1">Một số template khác</h1>
                                <div class="hb-1 button text-white px-4 py-2  my-auto">Tất Cả</div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 col-xs-6 ">
                                    <div class="template-image card"
                                         style="background: url(https://cdn3.dhht.vn/wp-content/uploads/2022/07/11-15-phong-tap-gym-sach-se-thiet-bi-hien-dai-tai-sai-gon.jpg);">
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
                                                        10.000 XU
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
                        </section>-->
        </main>
        <!--        <div class="position-fixed" id="confirm-box">
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
                </div>-->
        <c:import url="footer.jsp" />
        <script src="assets/js/upload-image.js"></script>
    </body>

</html>