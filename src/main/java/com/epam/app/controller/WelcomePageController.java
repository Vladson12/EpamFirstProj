package com.epam.app.controller;

import com.epam.app.util.db.DbUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/")
public class WelcomePageController extends HttpServlet {

    static {


    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DbUtils.setPropertiesFile(getServletContext().
                getRealPath("resources\\mysql.properties"));
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/welcomePage.jsp");
        requestDispatcher.forward(req, resp);
    }
}
