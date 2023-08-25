<%--
  Created by IntelliJ IDEA.
  User: Sushant
  Date: 01-09-2023
  Time: 10:31 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.*, com.example.c_commerce.Product" %>
<%--<%@ page import="com.example.c_commerce.Product.ProductDataDao" %>--%>
<html>
<head>
    <title>Shope</title>
</head>
<body>
<%@include file="header.jsp"%>
<section>
    <div class="landing">
        <div class="landingImg">
            <img src="img/shope_landing.png" alt="img" />
        </div>
        <div class="page-heading">
            <p>Shope<br><span id="home-style">Home ></span><span id="shope-style">Shope</span></p>
        </div>
    </div>
    </div>
</section>
<section style="margin-top: 20em">
    <%@include file="producCategory.jsp"%>
<%--    <%@include file="producCategory.jsp"%>--%>

<%--</section>--%>
<%--<%@include file="footer.jsp"%>--%>
<%--<%--%>
<%--    Product productDataDao = new Product();--%>
<%--    List<Product> productList = productDataDao.getProducts();--%>
<%--%>--%>

<%--<%--%>
<%--    for (Product product : productList) {--%>
<%--%>--%>

<%--<div class="small-card">--%>
<%--    <div class="card-image">--%>
<%--        <img src="<%= product.getProductImg() %>" alt="#" />--%>
<%--    </div>--%>
<%--    <div class="card-info">--%>
<%--        <span class="product-name"><%= product.getProductName() %></span>--%>
<%--        <span class="product-info"><%= product.getProductInfo() %></span>--%>
<%--        <span class="product-price"><%= product.getProductPrice() %></span>--%>
<%--        <span class="product-crose-price"><%= product.getProductCrosePrice() %></span>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<% } %>--%>
        <%@include file="footer.jsp"%>

</body>
</html>
