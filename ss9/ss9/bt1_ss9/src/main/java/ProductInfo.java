package com.example.bt1_ss9;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ProductInfo", value = "indexabc")
public class ProductInfo extends HttpServlet {
    private IService productService = new Service();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        double price = Double.parseDouble(request.getParameter("price"));
        double percent = Double.parseDouble(request.getParameter("percent"));
        double amount = productService.percentNumber(price, percent);
        double newPrice = productService.newPrice(amount, price);
        request.setAttribute("amount", amount);
        request.setAttribute("newPrice", newPrice);
        request.getRequestDispatcher("/amount.jsp").forward(request, response);
    }
}
