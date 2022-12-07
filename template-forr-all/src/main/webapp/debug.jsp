<%-- 
    Document   : debug
    Created on : Dec 7, 2022, 9:17:26 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            input {
                display: block;
            }
        </style>
    </head>
    <body>
        <form action="AddTemplateController" method="POST" enctype="multipart/form-data">
            <input type="text" name="txtName" value="template 1" required>
            <input type="text" name="txtPrice" value="2000" required>
            <input type="file" name="fileZip" accept=".zip,.rar,.7zip" required >
            <input type="text" name="txtCategoryId" value="1" required>
            <input type="file" name="fileImgLink" accept="image/*" required >
            <input type="text" name="txtDescription">
            <input type="submit">
        </form>
    </body>
</html>
