package com.example.bt2_ss10;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.Provider;

@WebServlet(name = "CalController", value = "/calculate")
public class CalController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.getRequestDispatcher("/calculate.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float A = Float.parseFloat(req.getParameter("first"));
        float B = Float.parseFloat(req.getParameter("second"));
        String C= req.getParameter("operator");
        System.out.println(A);
        System.out.println(B);
        System.out.println(C);
        req.setAttribute("first", A);
        req.setAttribute("second", B);
        req.setAttribute("operator", C);
        req.getRequestDispatcher("/operator.jsp").forward(req, resp);
    }
}
