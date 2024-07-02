package com.example.bt11_ss12.controller;

import com.example.bt11_ss12.model.User;
import com.example.bt11_ss12.service.IService;
import com.example.bt11_ss12.service.impl.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private IService service = new Service();
    private User user;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                req.getRequestDispatcher("/view/create.jsp").forward(req, resp);
                break;
            case "edit":
                    int id = Integer.parseInt(req.getParameter("id"));
                    User user = service.findUserById(id);
                    req.setAttribute("user", user);
                    req.getRequestDispatcher("/view/edit.jsp").forward(req, resp);
                    break;
            case "sort":
                List<User> user1 = service.sortedName();
                req.setAttribute("user", user1);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;

            default:
                List<User> users = service.findAll();
                req.setAttribute("user", users);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                String name = req.getParameter("name");
                String email = req.getParameter("email");
                String country = req.getParameter("country");
                user = new User(name, email, country);
                service.saveUser(user);
                resp.sendRedirect("/user");
                break;
            case "delete":
                int id = Integer.parseInt(req.getParameter("id"));
                boolean deleted = service.deleteUser(id);
                if (deleted) {
                    resp.sendRedirect("/user");
                } else {
                    req.setAttribute("message", "không thể xoá");
                    List<User> users = service.findAll();
                    req.setAttribute("user", users);
                    req.getRequestDispatcher("/view/list.jsp").forward(req, resp);

                }
            case "search":
                String search = req.getParameter("txtSearch");
                List<User> user = service.findUserByName(search);
                req.setAttribute("user", user);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
            case "edit":
                id = Integer.parseInt(req.getParameter("id"));
                name = req.getParameter("name");
                email = req.getParameter("email");
                country=req.getParameter("country");
                User user1=new User(id, name, email, country);
                boolean isUpdate = service.updateUser(user1);
                if (isUpdate) {
                    resp.sendRedirect("/user");
                }



        }
    }
}
