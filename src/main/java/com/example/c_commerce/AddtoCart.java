package com.example.c_commerce;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
@WebServlet(name = "addtoCart", value = "/addto-cart")
public class AddtoCart extends HttpServlet{

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,SecurityException {
        response.setContentType("text/html");

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,SecurityException{
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        System.out.println("add to cart");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercesite","root","Sushantp@9");
            String id = request.getParameter("PId");
            HttpSession session = request.getSession();
            String user = (String) session.getAttribute("user");
            System.out.println(id);
            System.out.println(user);
            String addQuery = "INSERT INTO cart (Product_Id, Product_img, Product_Name, Product_Price) " +
                    "SELECT Id, Product_img, Product_name, Product_price " +
                    "FROM product " +
                    "WHERE Id = ?;";
            try {
                PreparedStatement addProduct = connection.prepareStatement(addQuery);
                addProduct.setString(1, id);
                int affectedRows = addProduct.executeUpdate();

                if (affectedRows > 0) {
                    String updateEmailQuery = "UPDATE cart SET UserGmail = ? WHERE Product_Id = ?";
                    PreparedStatement updateEmail = connection.prepareStatement(updateEmailQuery);
                    updateEmail.setString(1, user);
                    updateEmail.setString(2, id);
                    updateEmail.executeUpdate();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}