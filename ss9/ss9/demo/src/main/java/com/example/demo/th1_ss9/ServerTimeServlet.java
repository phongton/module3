package com.example.demo.th1_ss9;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.Date;

@WebServlet(name="ServerTimeServlet" , urlPatterns = "")

public class ServerTimeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LocalDateTime now = LocalDateTime.now();
        request.setAttribute("now", now);

        request.getRequestDispatcher("/index.jsp").forward(request,response);

    }
}
