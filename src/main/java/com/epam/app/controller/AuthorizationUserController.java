package com.epam.app.controller;

import com.epam.app.model.User;
import com.epam.app.service.UserService;
import com.epam.app.util.AppUtils;
import lombok.NoArgsConstructor;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@NoArgsConstructor
public class AuthorizationUserController extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String login = request.getParameter("login");
        String password = request.getParameter("password");
        User userAccount = UserService.findUser(login, password);

        if (UserService.isAllowedUser(login, password)) {
            AppUtils.storeLoginedUser(request.getSession(), userAccount);
            request.getRequestDispatcher("/view/index.jsp").forward(request, response);
        } else {
            String errMessage = "Incorrect Username or password!";
            request.setAttribute("errMessage", errMessage);
            request.getRequestDispatcher("/view/authorization.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("view/authorization.jsp");
        requestDispatcher.forward(req, resp);
    }
}
