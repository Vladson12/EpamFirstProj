package com.epam.app.controller;

import com.epam.app.DAO.UserDAO;
import com.epam.app.DAO.impl.UserDaoImpl;
import com.epam.app.model.User;
import com.epam.app.model.enums.Role;
import com.epam.app.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterUserController extends HttpServlet {

    public RegisterUserController() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        User user = new User();
        user.setName(name);
        user.setLogin(login);
        user.setPassword(password);
        user.setRole(Role.READER);


        boolean isUserRegistered = UserService.create(user);

        if (isUserRegistered)
        {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else
        {
            request.setAttribute("errMessage", "This email already exists!");
            request.getRequestDispatcher("/view/register.jsp").forward(request, response);
        }
    }
}
