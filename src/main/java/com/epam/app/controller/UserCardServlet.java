package com.epam.app.controller;

import com.epam.app.model.Card;
import com.epam.app.model.User;
import com.epam.app.model.enums.CardState;
import com.epam.app.service.CardService;
import com.epam.app.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

public class UserCardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String button = req.getParameter("button");
        String login = (String) req.getAttribute("login");


        if (id != null) {
            int idInt = Integer.valueOf(id);
            login = new CardService().get(idInt).getUser().getLogin();
            req.setAttribute("login", login);
            if (button != null) {
                if (button.equals("home")) {
                    req.setAttribute("id", id);
                    req.getRequestDispatcher("view/dataFormat.jsp").forward(req, resp);
                } else if (button.equals("hall")) {
                    new CardService().updateCardStatusAndDate(new CardService().get(idInt), CardState.AT_HALL,
                            LocalDate.now(ZoneId.systemDefault()));
                } else if (button.equals("return")) {
                    new CardService().updateCardStatusAndDate(new CardService().get(idInt), CardState.RETURNED,
                            LocalDate.now(ZoneId.systemDefault()));
                }
            }
        }
        User currentUser = new UserService().getByLogin(login);
        List<Card> cardListForUser = new CardService().getAllCards(currentUser);
        req.setAttribute("list", cardListForUser);
        req.getRequestDispatcher("view/CardListView.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
