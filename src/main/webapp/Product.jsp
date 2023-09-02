<%--
  Created by IntelliJ IDEA.
  User: Sushant
  Date: 02-09-2023
  Time: 01:44 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
<link rel="stylesheet" href="StyleProduct.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<body>
<%@include file="header.jsp"%>
<div style="width: auto;
height: 100px;
flex-shrink: 0;
background: #F9F1E7;">

</div>
<%
    String id = request.getParameter("id");
    // now you can use the id for your needs
%>
<%--<%=id%>--%>
<%----%>
<%
    Product productData = new Product();
    List<Product> productDataList = productData.getProducts();
%>

<%
    for (Product product : productDataList) {
        String productId = String.valueOf(product.getId());
        if (productId.equals(id)){

%>

<div id="product">
    <div class="product_images" style="background: url('<%=product.getProductImg()%>');
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;"></div>
    <div class="product_details">
        <div class="back">
            <span class="material-symbols-outlined">chevron_left</span>
            <h6>Back to <a href="shop.jsp">Shop</a></h6>
        </div>

<%--        <h2>The Atelier Tailored Coat<%= product.getProductName()%></h2>--%>
        <h2><%= product.getProductName()%></h2>
        <h3>$<%= product.getProductPrice()%></h3>

        <div class="about">
            <p>Availability :<span><%=product.getAvailability()%></span></p>
            <p>Product Code : <span>#<%= product.getId()%></span></p>
            <p>Tags : <span><%=product.getTag()%></span> </p>
        </div>

        <p><%=product.getProductDescription()%></p>
        <ul>
            <li><%= product.getProductInfo()%></li>
            <li><%=product.getFit()%></li>
            <li><%=product.getMaterial()%></li>
            <li>Free shipping with <%=product.getShippingDay()%> days delivery</li>
        </ul>
<%}}%>
        <a href="" id="Clear_Selection" >Clear Selection</a>

        <div class="cta">
            <div class="btn btn_primary" id="addToCart">add to cart</div>
            <div class="btn btn_outline_secondary">
                <span class="material-symbols-outlined">favorite</span>add to wishlist</div>
        </div>
    </div>
</div>
<%@include file="producCategory.jsp"%>
<%@include file="footer.jsp"%>
<%----%>
<script>
    console.log(<%=id%>);
    var addToCart = document.getElementById("addToCart");
    addToCart.addEventListener('click',function (event){
        window.location.href = 'CartTab.jsp?id=' + <%=id%>;
    })
</script>
</body>
</html>
