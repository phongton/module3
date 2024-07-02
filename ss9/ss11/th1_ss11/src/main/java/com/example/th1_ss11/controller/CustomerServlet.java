package com.example.th1_ss11.controller;

import com.example.th1_ss11.model.Customer;
import com.example.th1_ss11.service.ICustomerService;
import com.example.th1_ss11.service.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customers")
public class CustomerServlet extends HttpServlet {
    private ICustomerService service = new Service();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action="";
        }
        switch (action) {
            case"create":
            req.getRequestDispatcher("/view/create.jsp").forward(req, resp);
            break;
            default:
                List<Customer> customers = service.findAll();
                req.setAttribute("customers", customers);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                String name = req.getParameter("name");
                String email = req.getParameter("email");
                String address = req.getParameter("address");
                Customer customer = new Customer(name, email, address);
                service.save(customer);
                resp.sendRedirect("/customers");
                break;
            case "delete":
                int id = Integer.parseInt(req.getParameter("id"));
                System.out.println(id);
                boolean isDelete =service.remove(id);
                System.out.println(isDelete);
                if(isDelete){
                    resp.sendRedirect("/customers");
                }else {
                    req.setAttribute("message","xoá không thành công");
                    List<Customer> customers = service.findAll();
                    req.setAttribute("customers", customers);
                    req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                }


                break;
        }
    }
}
