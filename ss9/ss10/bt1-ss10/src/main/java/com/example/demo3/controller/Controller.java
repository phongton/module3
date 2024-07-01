package com.example.demo3.controller;

import com.example.demo3.model.Customer;
import com.example.demo3.service.CustomerService;
import com.example.demo3.service.ICustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Controller" , value = "/customer")
public class Controller extends HttpServlet {
    private static ICustomerService service = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customers = service.getCustomers();
        req.setAttribute("customers",customers);
        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

}
