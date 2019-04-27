package com.epam.app.controller;

import com.epam.app.model.Card;
import com.epam.app.model.User;
import com.epam.app.model.enums.CardState;
import com.epam.app.service.CardService;
import com.epam.app.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

@WebServlet("/cards")
public class UserCardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String button = req.getParameter("button");
        String login = (String) req.getAttribute("login");
        if (id != null) {
            int idInt = Integer.valueOf(id);
            login = CardService.get(idInt).getUser().getLogin();
            req.setAttribute("login", login);
            if (button != null) {
                if (button.equals("home")) {
                    req.setAttribute("id", id);
                    req.getRequestDispatcher("/dateFormat.jsp").forward(req, resp);
                } else if (button.equals("hall")) {
                    CardService.updateCardStatusAndDate(CardService.get(idInt), CardState.AT_HALL,
                            LocalDate.now(ZoneId.systemDefault()));
                } else if (button.equals("return")) {
                    CardService.updateCardStatusAndDate(CardService.get(idInt), CardState.RETURNED,
                            LocalDate.now(ZoneId.systemDefault()));
                }
            }
        }

        User currentUser = UserService.getByLogin(login);
        List<Card> cardsForUser = CardService.getAllCards(currentUser);
        req.setAttribute("list", cardsForUser);
        req.getRequestDispatcher("/cardList.jsp").forward(req, resp);
    }
}
