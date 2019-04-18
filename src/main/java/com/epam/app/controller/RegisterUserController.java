package com.epam.app.controller;

import com.epam.app.model.User;
import com.epam.app.model.enums.Role;
import com.epam.app.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterUserController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Copying all the input parameters in to local variables
        String name = request.getParameter("name");
        String login = request.getParameter("login");
        String password = request.getParameter("password");
//        String userName = request.getParameter("username");

        User user = new User();
        //Using Java Beans - An easiest way to play with group of related data
        user.setName(name);
        user.setLogin(login);
        user.setPassword(password);
        user.setRole(Role.READER);


        //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
        boolean isUserRegistered = UserService.create(user);

        if (isUserRegistered)   //On success, you can display a message to user on Home page
        {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else   //On Failure, display a meaningful message to the User.
        {
            request.setAttribute("errMessage", "This email already exists!");
            request.getRequestDispatcher("/view/register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
