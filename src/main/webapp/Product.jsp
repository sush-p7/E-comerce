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
<%=id%>
</body>
</html>
