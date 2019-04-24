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

@WebServlet("/registration")
public class RegisterUserController extends HttpServlet {

    public RegisterUserController() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        User user = new User(name, Role.READER, login, password);

        boolean isValidLogin = UserService.isLoginValid(login);
        boolean isTheSameLogin = UserService.isLoginDuplicated(user);
        if (isValidLogin) {
            if (!isTheSameLogin) {
                UserService.create(user);
                request.getRequestDispatcher("/authorization.jsp").forward(request, response);
            } else {
                request.setAttribute("errMessage", "This email already exists!");
            }
        } else {
            request.setAttribute("errMessage", "This email invalid");
        }
        request.getRequestDispatcher("/registration.jsp").forward(request, response);


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/registration.jsp");
        requestDispatcher.forward(req, resp);
    }
}
