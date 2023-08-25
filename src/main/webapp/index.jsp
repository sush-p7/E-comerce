<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<a href="home.jsp">hh</a>
<%!
    public boolean validateUser(String Email,String Password){
        if (Email.equals("a@g.com")&&Password.equals("123"))
        return true;
        return false;
    }
%>
<%
    //checking user and pass for login
    HttpSession sessionCheck = request.getSession(false);
    // get existing session, don't create one

    if (sessionCheck==null){
        Cookie[] cookies = request.getCookies();
        if (cookies !=null){
            String Email = null;
            String Password = null;

            for (Cookie cookie : cookies){
                if (cookie.getName().equals("emailCookie")) Email = cookie.getValue();
                if (cookie.getName().equals("passwordCookie")) Password =cookie.getValue();
            }

            if (Email !=null && Password !=null && validateUser(Email,Password))
            {
                // Valid user, create session
                sessionCheck = request.getSession();
                sessionCheck.setAttribute("userEmail", Email);
            }else {
                // Invalid user, redirect to login
                response.sendRedirect("login.html");
            }
        } else {
            // No cookies found, redirect to login
            response.sendRedirect("login.html");
        }
        }
    else {
        // Session exists, serve the page content
        // ...
        System.out.println("else block run");
    }
%>
</body>
</html>