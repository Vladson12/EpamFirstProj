package com.epam.app.controller;

import com.epam.app.model.User;
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
public class UserListController extends HttpServlet {
    private static final int BUTTONS_TO_SHOW = 3;
    public static final int INITIAL_PAGE = 0;
    public static final int INITIAL_PAGE_SIZE = 10;
    public static final int[] PAGE_SIZES = {10};

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<User> allUsers = UserService.getAllUsers();

        req.getSession().setAttribute("userlist", allUsers);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/userList.jsp");
        requestDispatcher.forward(req, resp);
    }

}
