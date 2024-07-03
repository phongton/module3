package com.codegym.ss10.controllers;

import com.codegym.ss10.models.Student;
import com.codegym.ss10.services.IStudentService;
import com.codegym.ss10.services.impl.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentController", value = "/student")
public class StudentControllers extends HttpServlet {

    private static IStudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                req.getRequestDispatcher("/student/create.jsp").forward(req, resp);
                break;
                case "edit":
                    long id = Long.parseLong(req.getParameter("id"));
                    Student student = studentService.findById(id);
                    req.setAttribute("student", student);
                    req.getRequestDispatcher("/student/edit.jsp").forward(req, resp);
                    break;
            default:
                List<Student> students = studentService.findAll();
                req.setAttribute("students", students);
                req.getRequestDispatcher("/student/list.jsp").forward(req, resp);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if(action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                String name = req.getParameter("name");
                String address = req.getParameter("address");
                Float points = Float.parseFloat(req.getParameter("point"));
                Student student = new Student(name, address, points);
                studentService.save(student);
                resp.sendRedirect("/student");
                break;
            case "delete":
                Long id = Long.parseLong(req.getParameter("id"));
                Boolean isDelete = studentService.deleteById(id);
                if(isDelete) {
                    resp.sendRedirect("/student");
                } else {
                    req.setAttribute("message", "Xóa không thành công");
                    List<Student> students = studentService.findAll();
                    req.setAttribute("students", students);
                    req.getRequestDispatcher("/student/list.jsp").forward(req, resp);
                }
                break;
            case "search":
                String search = req.getParameter("txtSearch");
                List<Student> students=studentService.findByName(search);
                req.setAttribute("students", students);
                req.getRequestDispatcher("/student/list.jsp").forward(req, resp);
                break;
            case "edit":
                 id = Long.parseLong(req.getParameter("id"));
                 name = req.getParameter("name");
                 address = req.getParameter("address");
                 points = Float.parseFloat(req.getParameter("point"));
                 Student student1=new Student(id,name,address,points);
                 boolean edit = studentService.update(student1);
                 if(edit) {
                     resp.sendRedirect("/student");
                 }



        }
    }
}
