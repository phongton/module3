package com.example.demo2.controller;

import com.example.demo2.service.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "Main", value = "/main")
public class Main extends HttpServlet {
    Calculator calculator = new Calculator();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/main.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float a = Float.parseFloat(req.getParameter("a"));
        float b = Float.parseFloat(req.getParameter("b"));
        float c= calculator.multiplication(a,b);
        req.setAttribute("result",c);
        req.getRequestDispatcher("/result.jsp").forward(req,resp);
    }
}
