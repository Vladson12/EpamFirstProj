package com.epam.app.controller;

import com.epam.app.model.enums.CardState;
import com.epam.app.service.CardService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;

public class DateCardConroller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String date = req.getParameter("date");
        String id = req.getParameter("id");
        String login = req.getParameter("login");
        if (date != null ) {
            new CardService().updateCardStatusAndDate(new CardService().get(Integer.parseInt(id)),
                    CardState.AT_HALL, LocalDate.parse(date).plusDays(1));
            req.setAttribute("login", login);
            req.getRequestDispatcher("/cards").forward(req, resp);
        }
        req.getRequestDispatcher("view/dataFormat.jsp").forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getAttribute("data"));
        super.doPost(req, resp);
    }
}
