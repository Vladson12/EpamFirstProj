package com.epam.app.controller;

import com.epam.app.model.User;
import com.epam.app.util.SessionHelper;
import lombok.extern.log4j.Log4j;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Log4j
@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");
        SessionHelper.endSession(user.getId(), session);
        log.info("User " + user.getLogin() + " logouted");
        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            log.error("Exceptions happen!", e);
        }
    }
}