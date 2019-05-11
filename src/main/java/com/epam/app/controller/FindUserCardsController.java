package com.epam.app.controller;

import com.epam.app.service.UserService;
import lombok.extern.log4j.Log4j;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Log4j
@WebServlet("/findUserCards")
public class FindUserCardsController extends HttpServlet {

    private String login;

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
                log.info("Requested cards of user " + login);
            } else {
                req.getRequestDispatcher("/findUserCards.jsp").forward(req, resp);
                log.info("Filed to get cards user " + login);
            }
        }
    }
}
