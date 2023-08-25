package com.example.c_commerce;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Product {

            public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getProductImg() {
            return productImg;
        }

        public void setProductImg(String productImg) {
            this.productImg = productImg;
        }

        public String getProductName() {
            return productName;
        }

        public void setProductName(String productName) {
            this.productName = productName;
        }

        public String getProductInfo() {
            return productInfo;
        }

        public void setProductInfo(String productInfo) {
            this.productInfo = productInfo;
        }

        public double getProductPrice() {
            return productPrice;
        }

        public void setProductPrice(double productPrice) {
            this.productPrice = productPrice;
        }

        public double getProductCrosePrice() {
            return productCrosePrice;
        }

        public void setProductCrosePrice(double productCrosePrice) {
            this.productCrosePrice = productCrosePrice;
        }

        private int id;
        private String productImg;
        private String productName;
        private String productInfo;
        private double productPrice;
        private double productCrosePrice;

        public List<Product> getProducts() {
            // Declare a List to contain all the POJOs
            List<Product> products = new ArrayList<>();

            // Query to get products from DB
            String sql = "SELECT * FROM product";

            try (

                    // Get a connection to the database
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercesite","root","Sushantp@9");
                    // Create a Statement object to execute the query
                    Statement stmt = conn.createStatement();
                    // Execute the query and get the result set
                    ResultSet rs = stmt.executeQuery(sql);
            ) {

                // Loop over the result set
                while (rs.next()) {
                    // Create a new Product for each row in the result set
                    Product product = new Product();

                    // Use the setters to set the product details
                    product.setId(rs.getInt("Id"));
                    product.setProductImg(rs.getString("Product_img"));
                    product.setProductName(rs.getString("Product_Name"));
                    product.setProductInfo(rs.getString("Product_Info"));
                    product.setProductPrice(rs.getDouble("Product_Price"));
                    product.setProductCrosePrice(rs.getDouble("Product_crose_Price"));

                    // Add the product to the list
                    products.add(product);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

            // Return the list of products
            return products;
        }

}