package com.example.c_commerce;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class cartItem {
    private String UserGmail, Product_img, Product_Name, Product_Compny;
    private int Product_Quantity, Product_Price, Product_Id;

    // getters
    public String getUserGmail() {
        return UserGmail;
    }

    public String getProduct_img() {
        return Product_img;
    }

    public String getProduct_Name() {
        return Product_Name;
    }

    public String getProduct_Compny() {
        return Product_Compny;
    }

    public int getProduct_Quantity() {
        return Product_Quantity;
    }

    public int getProduct_Price() {
        return Product_Price;
    }

    public int getProduct_Id() {
        return Product_Id;
    }

    // setters
    public void setUserGmail(String UserGmail) {
        this.UserGmail = UserGmail;
    }

    public void setProduct_img(String Product_img) {
        this.Product_img = Product_img;
    }

    public void setProduct_Name(String Product_Name) {
        this.Product_Name = Product_Name;
    }

    public void setProduct_Compny(String Product_Compny) {
        this.Product_Compny = Product_Compny;
    }

    public void setProduct_Quantity(int Product_Quantity) {
        this.Product_Quantity = Product_Quantity;
    }

    public void setProduct_Price(int Product_Price) {
        this.Product_Price = Product_Price;
    }

    public void setProduct_Id(int Product_Id) {
        this.Product_Id = Product_Id;
    }

    // your database interaction and object population code
    public List<cartItem> getCartItems(String user) {
        List<cartItem> cartItems = new ArrayList<>();

        String sql = "SELECT * FROM cart WHERE UserGmail = ?"; // Use prepared statement to avoid SQL injection

        try (
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercesite","root","Sushantp@9");
                PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setString(1, user); // Set the parameter
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                cartItem item = new cartItem();

                item.setUserGmail(rs.getString("UserGmail"));
                item.setProduct_img(rs.getString("Product_img"));
                item.setProduct_Name(rs.getString("Product_Name"));
                item.setProduct_Compny(rs.getString("Product_Compny"));
                item.setProduct_Quantity(rs.getInt("Product_Quantity"));
                item.setProduct_Price(rs.getInt("Product_Price"));
                item.setProduct_Id(rs.getInt("Product_Id"));

                cartItems.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cartItems;
    }

//    while calling use this
//    String user = (String) session.getAttribute("user");
//    List<cartItem> userCartItems = getCartItems(user);

}