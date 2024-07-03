package com.example.bt1ss10.controller;

import com.example.bt1ss10.model.Customer;
import com.example.bt1ss10.service.CustomerService;
import com.example.bt1ss10.service.ICustomerService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Controller",value = "/customer")
public class Controller extends HttpServlet {
private static  ICustomerService service = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customers = service.getCustomers();
        req.setAttribute("customers",customers);
        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }
}
