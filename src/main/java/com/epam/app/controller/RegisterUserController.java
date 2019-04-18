package com.epam.app.controller;

import com.epam.app.model.User;
import com.epam.app.model.enums.Role;


import com.epam.app.service.UserService;
import org.apache.commons.validator.routines.EmailValidator;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//import org.apache.commons.validator.routines.EmailValidator;

public class RegisterUserController extends HttpServlet {

    public RegisterUserController() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Copying all the input parameters in to local variables
        String name = request.getParameter("name");
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        User user = new User(name, Role.READER, login, password);


        EmailValidator emailValidator = EmailValidator.getInstance();

        if (emailValidator.isValid(login)) {
            user.setLogin(login);
            //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
            boolean isUserRegistered = UserService.create(user);

            if (isUserRegistered)   //On success, you can display a message to user on Home page
            {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            } else   //On Failure, display a meaningful message to the User.
            {
                request.setAttribute("errMessage", "This email already exists!");
            }
        } else {
            request.setAttribute("errMessage", "This email invalid");
        }
        request.getRequestDispatcher("/view/register.jsp").forward(request, response);


    }
}
