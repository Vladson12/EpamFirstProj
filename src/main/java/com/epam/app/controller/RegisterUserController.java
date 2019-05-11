package com.epam.app.controller;

import com.epam.app.config.Config;
import com.epam.app.model.User;
import com.epam.app.model.enums.Role;
import com.epam.app.service.UserService;
import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.epam.app.util.password.Password.hash;

@WebServlet("/registration")
public class RegisterUserController extends HttpServlet {

    static final Logger log = Logger.getLogger(RegisterUserController.class);

    @Override
    public void init() {
        Config.set(this.getServletContext(), "mysql");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        boolean isValidLogin = UserService.isLoginValid(login);
        boolean isTheSameLogin = UserService.isLoginDuplicated(login);
        if (isValidLogin) {
            if (!isTheSameLogin) {
                User user = new User(name, Role.READER, login, hash(password));
                UserService.create(user);
                request.getRequestDispatcher("/authorization.jsp").forward(request, response);
            } else {
                request.setAttribute("errMessage", "This email already exists!");
                log.info("Failed to register " + login + ". User with this login is already exists");
            }
        } else {
            request.setAttribute("errMessage", "This Email is invalid");
            log.info("Failed to register " + login + ". Email is invalid");
        }
        request.getRequestDispatcher("/registration.jsp").forward(request, response);
        log.info("Successful registration by " + login);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/registration.jsp");
        requestDispatcher.forward(req, resp);
    }
}
