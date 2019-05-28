package com.epam.app.controller;

import com.epam.app.model.User;
import com.epam.app.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cabinet/profile")
public class UserProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = UserService.get(Integer.parseInt(req.getParameter("id")));
        req.getSession().setAttribute("user", user);
        req.getRequestDispatcher("/userProfile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User profileUpdatedUser = UserService.get(id);
        profileUpdatedUser.setName(req.getParameter("name"));
        UserService.updateUser(profileUpdatedUser);
        req.getSession().setAttribute("loggedInUser", profileUpdatedUser);
        resp.sendRedirect("/cabinet/profile?id=" + id);
    }
}
