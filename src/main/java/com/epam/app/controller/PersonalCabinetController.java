package com.epam.app.controller;

import com.epam.app.model.Book;
import com.epam.app.model.User;
import com.epam.app.model.enums.BookState;
import com.epam.app.model.enums.Genre;
import com.epam.app.model.enums.Role;
import com.epam.app.service.BookService;
import com.epam.app.service.UserService;
import com.epam.app.util.PageManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.stream.Collectors;

@WebServlet("/cabinet")
public class PersonalCabinetController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = UserService.get(Integer.parseInt(req.getParameter("id")));
        req.getSession().setAttribute("user", user);
        req.getRequestDispatcher("/cabinet.jsp").forward(req, resp);

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        User user =  UserService.get(id);
        user.setName(req.getParameter("name"));
        user.setRole(Role.getRole(req.getParameter("role")));
        UserService.updateUser(user);
        req.getSession().invalidate();
        resp.sendRedirect("/logout");
    }
}
