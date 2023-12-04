<%--
  Created by IntelliJ IDEA.
  User: Mak
  Date: 11/15/2023
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            padding-left: 20%;
            padding-right: 20%;
            padding-top: 5%;

        }
    </style>
</head>
<body>
<h1>Add new Product</h1>
<form:form action="/product/add-product" method="post" modelAttribute="product" enctype="multipart/form-data">
    <form:input path="id" readonly="true" type="hidden"/>
    <div class="mb-3">
        <label for="name" class="form-label fs-4">Product Name</label>
        <form:input type="text" class="form-control" path="name"/>
    </div>
    <div class="mb-3">
        <label for="price" class="form-label fs-4">Product Price</label>
        <form:input type="text" class="form-control" path="price" />
    </div>
    <div class="mb-3">
        <label for="image" class="form-label fs-4">Product image</label>
        <input type="file" class="form-control" id="image" name="img_upload">
    </div>
    <div class="mb-3">
        <label class="form-label fs-4">Category</label>
        <form:select class="form-select" path="category.id">
            <c:forEach items="${categoryList}" var="category">
                <option value="${category.id}">${category.name}</option>
            </c:forEach>
        </form:select>
    </div>
    <p class="fs-4">Product Status</p>
    <div class="form-check">
        <form:radiobutton class="form-check-input" path="status" name="${product.status}" value="true" id="true" />
        <label class="form-check-label" for="true">
            🟢
        </label>
    </div>
    <div class="form-check">
        <form:radiobutton class="form-check-input" path="status" name="${product.status}" value="false" id="false"/>
        <label class="form-check-label" for="false">
            🔴
        </label>
    </div>
    <button class="btn btn-primary" type="submit">Add</button>
</form:form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
