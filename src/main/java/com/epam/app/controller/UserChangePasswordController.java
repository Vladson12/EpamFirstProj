package com.epam.app.controller;

import com.epam.app.model.User;
import com.epam.app.service.UserService;
import com.epam.app.util.password.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.epam.app.util.password.Password.hash;

@WebServlet("/cabinet/changePassword")
public class UserChangePasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/userPasswordChange.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oldPassword = req.getParameter("oldPass");
        int id = Integer.parseInt(req.getParameter("id"));
        User passwordUpdatedUser = UserService.get(id);
        if (!Password.matches(oldPassword, passwordUpdatedUser.getPassword())) {
            req.setAttribute("errMessage", "Incorrect enter of old password");
            req.getRequestDispatcher("/userPasswordChange.jsp").forward(req, resp);
            return;
        }
        String newPassword = req.getParameter("newPass");
        passwordUpdatedUser.setPassword(hash(newPassword));
        UserService.updateUser(passwordUpdatedUser);
        req.getSession().setAttribute("loggedInUser", passwordUpdatedUser);
        resp.sendRedirect("/cabinet");
    }
}
