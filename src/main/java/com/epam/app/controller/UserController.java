package com.epam.app.controller;

import com.epam.app.model.User;
import com.epam.app.model.enums.Role;
import com.epam.app.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/users")
public class UserController extends HttpServlet {

    private List<User> allUsers;
    private String button;
    private String userLogin;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("update")!=null) {
            updateUser(req, resp);
        }
        if(req.getParameter("delete")!=null) {
            deleteUser(req, resp);
        }
        if(req.getParameter("insert")!=null) {
            String login = req.getParameter("login");
            List<String> allLogins = UserService.getAllLogins();
            allLogins = allLogins.stream().filter(o->o.contains(login)).collect(Collectors.toList());
            if (allLogins.isEmpty()){
                allUsers= new ArrayList<>();
            } else{
                allUsers = allLogins.stream().map(UserService::getByLogin).collect(Collectors.toList());
            }
        } else {
            allUsers = UserService.getAllUsers();
        }
        req.getSession().setAttribute("users", allUsers);
        req.getRequestDispatcher("/userList.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        userLogin = req.getParameter("login");
        button = req.getParameter("button");
        if(button.equals("edit")){
            doPut(req,resp);
        }else if(button.equals("delete")) {
            doDelete(req,resp);
        }else if(button.equals("findCards")) {
            req.setAttribute("login", userLogin);
            req.getRequestDispatcher("/cards").forward(req, resp);
        }
        resp.sendRedirect("/users");
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("user", UserService.getByLogin(userLogin));
        req.getRequestDispatcher("/userUpdate.jsp").forward(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
        User deletedUser = UserService.getByLogin(userLogin);
        UserService.deleteUser(deletedUser);
    }

}