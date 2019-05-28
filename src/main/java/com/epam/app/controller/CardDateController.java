package com.epam.app.controller;

import com.epam.app.model.enums.CardState;
import com.epam.app.service.CardService;
import lombok.extern.log4j.Log4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;

@Log4j
@WebServlet("/cardDate")
public class CardDateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/dateFormat.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String date = req.getParameter("date");
        String id = req.getParameter("id");
        String login = req.getParameter("login");
        if (!date.isEmpty()) {
            req.setAttribute("login", login);
            req.setAttribute("id", id);
            LocalDate newDate = LocalDate.parse(date).plusDays(1);
            if (LocalDate.now(ZoneId.systemDefault()).compareTo(newDate) > 0) {
                req.getRequestDispatcher("/dateFormat.jsp").forward(req, resp);
            } else {
                CardService.updateCardStatusAndDate(CardService.get(Integer.parseInt(id)),
                        CardState.AT_HOME, newDate);
                req.getRequestDispatcher("/cards").forward(req, resp);
                log.info("User " + login + "Card status has been update");
            }
        } else {
            req.setAttribute("login", login);
            req.setAttribute("id", id);
            req.getRequestDispatcher("/dateFormat.jsp").forward(req, resp);
        }
    }
}
