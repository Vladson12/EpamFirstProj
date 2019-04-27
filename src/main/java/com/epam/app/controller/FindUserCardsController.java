package com.epam.app.controller;

import com.epam.app.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findUserCards")
public class FindUserCardsController extends HttpServlet {

    private String login;
    private Boolean isLibrarian;

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.getRequestDispatcher("/findUserCards.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<String> logins = UserService.getAllLogins();
        if (req.getParameter("insert") != null) {
            login = req.getParameter("login");
            if (logins.stream().anyMatch(login::equals)) {
                req.setAttribute("login", login);
                req.getRequestDispatcher("/cards").forward(req, resp);
            } else {
                req.getRequestDispatcher("/findUserCards.jsp").forward(req, resp);
            }
        }
    }
}
