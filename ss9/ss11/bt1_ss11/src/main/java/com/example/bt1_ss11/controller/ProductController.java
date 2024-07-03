package com.example.bt1_ss11.controller;

import com.example.bt1_ss11.model.Product;
import com.example.bt1_ss11.service.impl.IService;
import com.example.bt1_ss11.service.impl.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {

    private static IService service = new Service();

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
                String description = req.getParameter("description");
                int price = Integer.parseInt(req.getParameter("price"));
                Product product = new Product(name, description, price);
                service.saveProduct(product);
                resp.sendRedirect("/product");
            case "delete":
                int id = Integer.parseInt(req.getParameter("id"));
                boolean isDelete = service.deleteProduct(id);
                if (isDelete) {
                    resp.sendRedirect("/product");
                } else {
                    req.setAttribute("message", "Xoá không thành công");
                    List<Product> products = service.findAllProduct();
                    req.setAttribute("product", products);
                    req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                }
                break;
            case "search":
                String search = req.getParameter("txtSearch");
                List<Product> product1 = service.findByName(search);
                req.setAttribute("product", product1);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
                break;
            case "edit":
                 id= Integer.parseInt(req.getParameter("id"));
                 name = req.getParameter("name");
                 description = req.getParameter("description");
                 price = Integer.parseInt(req.getParameter("price"));
                 boolean isUpdate=service.updateProduct(id,name,description,price);
                 if(isUpdate){
                     resp.sendRedirect("/product");
                 }else{
                     req.setAttribute("message", "Cập nhật không thành công!!!");
                     List<Product> products = service.findAllProduct();
                     req.setAttribute("products", products);
                     req.getRequestDispatcher("/product/list.jsp").forward(req, resp);
                 }
                 break;


            default:
                List<Product> products = service.findAllProduct();
                req.setAttribute("product", products);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
        }
    }

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
              Product product=service.findById(id);
              req.setAttribute("product",product);
              req.getRequestDispatcher("/view/edit.jsp").forward(req, resp);

              break;
            default:
                List<Product> products = service.findAllProduct();
                req.setAttribute("product", products);
                req.getRequestDispatcher("/view/list.jsp").forward(req, resp);
        }
    }
}
