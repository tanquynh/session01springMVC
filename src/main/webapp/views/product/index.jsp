<%--
  Created by IntelliJ IDEA.
  User: Mak
  Date: 11/15/2023
  Time: 1:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            padding-left: 20%;
            padding-right: 20%;
            padding-top: 5%;

        }

    </style>
</head>
<body>
<c:if test="${not empty message}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${message}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>

<h1 class="text-center">Product List</h1>
<%--<form action="student?action=search" method="post">--%>

<%--    <input type="text" class="form-control inline-block" name="searchTerm"/>--%>
<%--    <button class="btn btn-success inline-block">Search</button>--%>
<%--</form>--%>
<table class="table">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Name</th>
        <th scope="col">Price</th>
        <th scope="col">Image</th>
        <th scope="col">Category</th>
        <th scope="col">Status</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${productList}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td><img src="/uploads/images/${product.image}" alt="${product.image}" width="100px"/></td>
            <td>${product.category.name}</td>
            <td>${product.status ? "🟢" : "🔴"}</td>
            <td>
                <a href="product/edit/${product.id}" class="btn btn-success">Edit</a>
                <a href="product/delete/${product.id}" class="btn btn-danger">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="product/add" class="btn btn-primary">Add</a>
<a href="product/sort" class="btn btn-info">Sort by name</a>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

</body>
</html>