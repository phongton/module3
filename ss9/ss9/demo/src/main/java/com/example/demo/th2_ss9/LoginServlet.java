package com.example.demo.th2_ss9;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/th2")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String username = req.getParameter("username");
       String password = req.getParameter("password");
       if(username.equals("admin") && password.equals("123456")){
           req.setAttribute("username", username);
           req.setAttribute("password", password);
           req.getRequestDispatcher("login.jsp").forward(req, resp);
       }
       else {
           req.setAttribute("username", username);
           req.getRequestDispatcher("logan.jsp").forward(req, resp);
       }

    }
}
