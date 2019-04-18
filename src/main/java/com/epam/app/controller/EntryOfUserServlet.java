package com.epam.app.controller;

import com.epam.app.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class EntryOfUserServlet extends HttpServlet {

    String login;

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        List<String> all = new UserService().getAllLogins();
        if (req.getParameter("insert") != null) {
            login = req.getParameter("login");
            if(all.stream().anyMatch(login::equals)){
                req.setAttribute("login",login);
                req.getRequestDispatcher("/cards").forward(req,resp);

            }else{
                req.getRequestDispatcher("view/enterOfUser.jsp").forward(req,resp);
            }
        }
    }


}
