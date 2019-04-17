package com.epam.app.controller;

import com.epam.app.DAO.UserDAO;
import com.epam.app.DAO.impl.UserDaoImpl;
import com.epam.app.model.User;
import com.epam.app.model.enums.Role;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterUserController extends HttpServlet {

    public RegisterUserController() {
    }

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

        UserDAO registerDao = new UserDaoImpl();

        //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
        String userRegistered = registerDao.addUser(user);

        if(userRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Home page
        {
            request.getRequestDispatcher("/view/list.jsp").forward(request, response);
        }
        else   //On Failure, display a meaningful message to the User.
        {
            request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("/view/register.jsp").forward(request, response);
        }
    }
}
