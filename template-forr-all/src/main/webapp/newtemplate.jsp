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
            <c:set var="templateDto" value="${requestScope.TEMPLATE}"></c:set>
            <!-- temaplate image -->
            <div class="row">
                <!-- Add New Template Form -->
                <form action="AddTemplateController" method="post" enctype="multipart/form-data">
                </form>
                    <div class="col-4 col-md-6  d-flex align-content-center justify-content-center"
                        onclick="$('#file-uploader').click()">
                        <img id="image-template" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgN_Urbwj9iK0eVPrm0FY8c5K8z5nYeCfwgtqjm2-9YK-U5kTuzejdIvl9Ue1nlPFZ5yQ&usqp=CAU" 
                        width="100%">
                    </div>
                        <input class="d-none" type="file" accept=".jpg, .jpeg, .png" id="file-uploader"
                            name="fileImgLink"  value="" 
                            onchange="$('#image-template').attr('src',getObjURL(this.files[0]))"/>
                    
                    <div class="col-8 gap-2 col-md-6">
                        <!-- template name -->
                        <label for="txtName">Tên template <font color="red">*</font></label>
                        <input name="txtName" value="${templateDto.name}" /> </br>
                        <!-- template category -->
                        <label for="txtCategoryId">Thể loại <font color="red">*</font></label>
                        <select class="select2" name="txtCategoryId">
                            <option value="" disabled="disabled" selected>Choose Category</option>
                            <option value="1">Video</option>
                            <option value="2">Âm Thanh</option>
                            <option value="3">Hình Ảnh</option>
                            <option value="4">Website</option>
                            <option value="5">Thuyết Trình</option>
                        </select></br>
                        <!-- description -->
                        <label for="txtDescription">Mô tả <font color="red">*</font></label>
                        <textarea name="txtDescription"
                            class="text text-description fw-light col-12 d-flex flex-column">${templateDto.description}</textarea>
                        <!-- template price -->
                        <label for="txtPrice">Giá Template <font color="red">*</font></label>
                        <input class="col-4" type="number" min="1" step="1" name="txtPrice" /> Xu</br>
                        <!-- upload file zip -->
                        <label for="fileZip">File Zip <font color="red">*</font></label>
                        <!-- <a class="col-5 button text-center col text-decoration-none text-white hb-1 " onclick="Buy('#confirm-box')">Tải lên</a> -->
                        <input class="col-8" type="file" name="fileZip" id="file-uploader" accept=".zip, .rar, .7zip"
                            style="margin-top: 5px;" value="${param.fileZip}" />

                        <button type="submit" class="button text-center col text-decoration-none text-white hb-1 ">Lưu Template</button>
                    </div>
                
            </div>
        </section>
        <section class="row gap-5">
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
        </section>
    </main>
    <div class="position-fixed" id="confirm-box">
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
    <c:import url="footer.jsp" />
    <script src="assets/js/upload-image.js"></script>
</body>

</html>