package com.epam.app.controller;

import com.epam.app.model.User;
import com.epam.app.model.enums.Role;
import com.epam.app.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/users")
public class UserController extends HttpServlet {

    List<User> allUsers;
    String button;
    String userLogin;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("get");
        if(req.getParameter("update")!=null) {
            System.out.println("1");
            updateUser(req, resp);
        }
        if(req.getParameter("delete")!=null) {
            System.out.println("2");
            deleteUser(req, resp);
        }
        allUsers = UserService.getAllUsers();
        req.getSession().setAttribute("users", allUsers);
        req.getRequestDispatcher("/userList.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("post");
        userLogin = req.getParameter("login");
        button = req.getParameter("button");
        if(button.equals("edit")){
            doPut(req,resp);
        }else if(button.equals("delete")) {
            doDelete(req,resp);
        }
        resp.sendRedirect("/users");

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("put");
        req.getSession().setAttribute("user",UserService.getByLogin(userLogin));
        req.getRequestDispatcher("/userUpdate.jsp").forward(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("delete");
        req.getSession().setAttribute("user",UserService.getByLogin(userLogin));
        req.getRequestDispatcher("/userDelete.jsp").forward(req, resp);
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User updatedUser = UserService.getByLogin(userLogin);
        updatedUser.setName(req.getParameter("name"));
        updatedUser.setLogin(req.getParameter("login"));
        String role = req.getParameter("role");
        if(role!=null) {
            updatedUser.setRole(Role.valueOf(role));
        }
        UserService.updateUser(updatedUser);
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(userLogin);
        User deletedUser = UserService.getByLogin(userLogin);
        UserService.deleteUser(deletedUser);
    }

}







