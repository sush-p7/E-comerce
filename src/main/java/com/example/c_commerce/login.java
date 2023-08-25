package com.example.c_commerce;
import java.io.*;
import java.sql.*;
import java.sql.DriverManager;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
@WebServlet(name = "login",value = "/login")
public class login extends HelloServlet{
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,SecurityException {
//        super.doGet(request, response);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        if (request.getParameter("login")!=null){
//            out.println("login");
//            String Name = request.getParameter("Name");
            response.sendRedirect("home.jsp");

            String Email =  request.getParameter("Email");
            String Password = request.getParameter("Password");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercesite","root","Sushantp@9");
                String checkQuery = "SELECT * FROM login_details WHERE email = ? AND password = ?";
                PreparedStatement checkStatement = connection.prepareStatement(checkQuery);

                checkStatement.setString(1,Email);
                checkStatement.setString(2,Password);
                ResultSet resultSet = checkStatement.executeQuery();


                if (resultSet.next()) {
                    // User exists, email and password match.
                    response.sendRedirect("index.jsp");
                    response.sendRedirect("home.jsp");

                } else {
                    // No matching user.
                    out.println(
                            "<script>alert('wrong email and password')</script>"

                    );
//                    response.sendRedirect("login.html");
                    out.println("<script type=\"text/javascript\">");
                    out.println("sessionStorage.setItem('loginError', 'Invalid email or password');");
                    out.println("</script>");
                    out.println("<meta http-equiv='refresh' content='0;URL=login.html'>");
//                    response.sendRedirect("login.html");


                }
            } catch (Exception e) {
                out.println(e);
            }

            //check in database for success
            if (Email.equals("a@g.com") && Password.equals("123"))
            {
                //session
                HttpSession session = request.getSession();
                session.setAttribute("userEmail",Email);

                // Create cookies for email and password
                Cookie emailCookie = new Cookie("emailCookie", Email);
                Cookie passwordCookie = new Cookie("passworCookie", Password);

                //set expiry date
                emailCookie.setMaxAge(24*60*60);
                passwordCookie.setMaxAge(24*60*60);

                response.addCookie(emailCookie);
                response.addCookie(passwordCookie);

//                response.sendRedirect("index.jsp");
            }

        }
        if (request.getParameter("siginup")!=null){
            response.sendRedirect("home.jsp");

            out.println("siginup");
            String Name = request.getParameter("Name");
            String Email =  request.getParameter("Email");
            String Password = request.getParameter("Password");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercesite","root","Sushantp@9");
                //insert query
                String insertQuery = "INSERT INTO login_details (name, email, password) VALUES (?, ?, ?)";
                PreparedStatement insertStatement = connection.prepareStatement(insertQuery, PreparedStatement.RETURN_GENERATED_KEYS);
                insertStatement.setString(1, Name);
                insertStatement.setString(2, Email);
                insertStatement.setString(3, Password);

                int rowsAffected = insertStatement.executeUpdate();
                System.out.println(rowsAffected + " row(s) inserted.");

                insertStatement.close();
                connection.close();
                response.sendRedirect("index.jsp");
//                response.sendRedirect("home.jsp");


            } catch (Exception e) {
                out.println(e);
            }

        }

    }
}
