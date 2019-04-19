package com.epam.app.controller;

import com.epam.app.service.UserService;
import lombok.NoArgsConstructor;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@NoArgsConstructor
public class AutorizationUserController extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        if (UserService.isAllowedUser(login, password)) {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            String errMessage = "Incorrect Username or password!";
            request.setAttribute("errMessage", errMessage);
            request.getRequestDispatcher("/view/authorization.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
