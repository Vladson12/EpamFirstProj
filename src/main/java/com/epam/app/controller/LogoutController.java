package com.epam.app.controller;

import com.epam.app.model.User;
import org.apache.log4j.Logger;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {

    static final Logger log = Logger.getLogger(LogoutController.class);

    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");
        session.invalidate();
        log.info("User " + user.getLogin() + " logouted");
        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            log.error("Exceptions happen!", e);
        }
    }
}