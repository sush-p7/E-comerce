package com.example.c_commerce;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "Validate",value = "/Validate")
public class Validate extends HelloServlet {
    public boolean validateUser(String Email,String Password) {
        if (Email.equals("a@g.com") && Password.equals("123"))
            return true;
        return false;
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        super.doGet(request, response);
        doPost(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

}
