<%--
  Created by IntelliJ IDEA.
  User: Sushant
  Date: 01-09-2023
  Time: 10:09 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.*, com.example.c_commerce.Product" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="product-category">
    <span class="product-category-heading">Our Product</span>
    <div class="product-card-section">

<p><%--        <div class="small-card">--%>
    <%--            <div class="card-image">--%>
    <%--                <img src="img/slythe.png" alt="#"/>--%>
    <%--            </div>--%>
    <%--            <div class="card-info">--%>
    <%--                <span class="product-name">Syltherine</span>--%>
    <%--                <span class="product-info">Stylish cafe chair.</span>--%>
    <%--                <span class="product-price">Rp 2.500.000</span--%>
    <%--                ><span class="product-crose-price">Rp 3.500.000</span>--%>
    <%--            </div>--%>
    <%--        </div>--%>

    <%--        <div class="small-card">--%>
    <%--            <div class="card-image">--%>
    <%--                <img src="img/leviosa.png" alt="#" />--%>
    <%--            </div>--%>
    <%--            <div class="card-info">--%>
    <%--                <span class="product-name">Leviosa</span>--%>
    <%--                <span class="product-info">Stylish cafe chair.</span>--%>
    <%--                <span class="product-price">Rp 2.500.000</span--%>
    <%--                ><span class="product-crose-price"></span>--%>
    <%--            </div>--%>
    <%--        </div>--%>

    <%--        <div class="small-card">--%>
    <%--            <div class="card-image">--%>
    <%--                <img src="img/lolito.png" alt="#" />--%>
    <%--            </div>--%>
    <%--            <div class="card-info">--%>
    <%--                <span class="product-name">Lolito</span>--%>
    <%--                <span class="product-info">Luxury big sofa.</span>--%>
    <%--                <span class="product-price">Rp 7.000.000</span--%>
    <%--                ><span class="product-crose-price">Rp 14.000.000</span>--%>
    <%--            </div>--%>
    <%--        </div>--%>

    <%--        <div class="small-card">--%>
    <%--            <div class="card-image">--%>
    <%--                <img src="img/respira.png" alt="#" />--%>
    <%--            </div>--%>
    <%--            <div class="card-info">--%>
    <%--                <span class="product-name">Respira</span>--%>
    <%--                <span class="product-info">Outdoor bar table and stool.</span>--%>
    <%--                <span class="product-price">Rp 500.000</span--%>
    <%--                ><span class="product-crose-price"></span>--%>
    <%--            </div>--%>
    <%--        </div>--%>

    <%--        <div class="small-card">--%>
    <%--            <div class="card-image">--%>
    <%--                <img src="img/grifo.png" alt="#" />--%>
    <%--            </div>--%>
    <%--            <div class="card-info">--%>
    <%--                <span class="product-name">Grifo</span>--%>
    <%--                <span class="product-info">Night lamp.</span>--%>
    <%--                <span class="product-price">Rp 150.000</span--%>
    <%--                ><span class="product-crose-price"></span>--%>
    <%--            </div>--%>
    <%--        </div>--%>

    <%--        <div class="small-card">--%>
    <%--            <div class="card-image">--%>
    <%--                <img src="img/muggo.png" alt="#" />--%>
    <%--            </div>--%>
    <%--            <div class="card-info">--%>
    <%--                <span class="product-name">Muggo</span>--%>
    <%--                <span class="product-info">Small mug.</span>--%>
    <%--                <span class="product-price">Rp 7.000.000</span--%>
    <%--                ><span class="product-crose-price">Rp 14.000.000</span>--%>
    <%--            </div>--%>
    <%--        </div>--%>

    <%--        <div class="small-card">--%>
    <%--            <div class="card-image">--%>
    <%--                <img src="img/pingky.png" alt="#" />--%>
    <%--            </div>--%>
    <%--            <div class="card-info">--%>
    <%--                <span class="product-name">Pingky</span>--%>
    <%--                <span class="product-info">cute bed set.</span>--%>
    <%--                <span class="product-price">Rp. 50000000</span--%>
    <%--                ><span class="product-crose-price">Rp. 50000000</span>--%>
    <%--            </div>--%>
    <%--        </div>--%>

    <%--        <div class="small-card">--%>
    <%--            <div class="card-image">--%>
    <%--                <img src="img/potty.png" alt="#" />--%>
    <%--            </div>--%>
    <%--            <div class="card-info">--%>
    <%--                <span class="product-name">Potty</span>--%>
    <%--                <span class="product-info">Minimalist flower pot</span>--%>
    <%--                <span class="product-price">Rp 500.000</span--%>
    <%--                ><span class="product-crose-price"></span>--%>
    <%--            </div>--%>
    <%--        </div>--%></p>

    <%
        Product productDataDao = new Product();
        List<Product> productList = productDataDao.getProducts();

    %>

    <%
        for (Product product : productList) {
    %>

    <div class="small-card" id="<%= product.getId() %>">
        <div class="card-image">
            <img src="<%= product.getProductImg() %>" alt="#" />
        </div>
        <div class="card-info">
            <span class="product-name"><%= product.getProductName() %></span>
            <span class="product-info"><%= product.getProductInfo() %></span>
            <span class="product-price">Rs.<%= product.getProductPrice() %></span>
            <span class="product-crose-price">Rs.<%= product.getProductCrosePrice() %></span>
        </div>
    </div>

    <% } %>
        <div class="show-more">Show More</div>
    </div>
</div>
</body>
<script>
    window.onload = function() {
        var smallCards = document.getElementsByClassName("small-card");

        for (var i = 0; i < smallCards.length; i++) {
            smallCards[i].addEventListener('click', function(event) {
                var imgSrc = this.getElementsByClassName('card-image')[0].getElementsByTagName('img')[0].src;
                console.log(imgSrc);
                var id = this.getAttribute('id');
                // redirect to the JSP page with the id as a parameter
                window.location.href = 'Product.jsp?id=' + id;
            });

        }
    };
</script>
</html>
