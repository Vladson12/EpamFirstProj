package com.epam.app.controller;

import com.epam.app.model.User;
import com.epam.app.service.UserService;
import com.epam.app.util.PageManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/users")
public class UserController extends HttpServlet {

    private List<User> allUsers;
    private String button;
    private String userLogin;
    private static PageManager pageManager;

    static {
        pageManager = new PageManager<User>(10);
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String side;
        if ((side = req.getParameter("pageSide")) != null) {
            if ("previous".equals(side)) {
                pageManager.previousPage();
            } else {
                pageManager.nextPage();
            }
        }
        if (req.getParameter("update") != null) {
            updateUser(req, resp);
        }
        if (req.getParameter("delete") != null) {
            deleteUser(req, resp);
        }
        if (req.getParameter("insert") != null) {
            String login = req.getParameter("login");
            allUsers = UserService.getByContext(login);
        } else {
            allUsers = UserService.getAllUsers();
        }
        req.getSession().setAttribute("users", pageManager.sublist(allUsers));
        req.getRequestDispatcher("/userList.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        userLogin = req.getParameter("login");
        button = req.getParameter("button");
        if (button.equals("edit")) {
            doPut(req, resp);
        } else if (button.equals("delete")) {
            doDelete(req, resp);
        } else if (button.equals("findCards")) {
            req.setAttribute("login", userLogin);
            req.getRequestDispatcher("/cards").forward(req, resp);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("user", UserService.getByLogin(userLogin));
        req.getRequestDispatcher("/userUpdate.jsp").forward(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("user", UserService.getByLogin(userLogin));
        req.getRequestDispatcher("/userDelete.jsp").forward(req, resp);
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) {
        UserService.updateUserByFields(userLogin, req.getParameter("name"),
                req.getParameter("login"), req.getParameter("role"));
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) {
        User deletedUser = UserService.getByLogin(userLogin);
        UserService.deleteUser(deletedUser);
    }

}