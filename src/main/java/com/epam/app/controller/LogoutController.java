package com.epam.app.controller;

import com.epam.app.model.User;
import com.epam.app.util.SessionHelper;
import lombok.extern.log4j.Log4j;
import org.apache.log4j.Logger;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Log4j
@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("loggedInUser");
        session.invalidate();
        ////////////////////
        SessionHelper.sessions.remove(session);
        ////////////////////
//        System.out.println(session == null ? "session + " + session.getId() + " is null" : "session "  + session.getId() + " is true");
        log.info("User " + user.getLogin() + " logouted");
        try {
            response.sendRedirect("/");
        } catch (IOException e) {
            log.error("Exceptions happen!", e);
        }
    }
}