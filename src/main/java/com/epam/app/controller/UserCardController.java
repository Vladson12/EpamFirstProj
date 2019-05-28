package com.epam.app.controller;

import com.epam.app.model.Card;
import com.epam.app.model.enums.CardState;
import com.epam.app.service.CardService;
import com.epam.app.util.PageManager;

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
    private static final PageManager pageManager;
    private String id;
    private String button;
    private String login;

    static {
        pageManager = new PageManager<Card>(11);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String side;
        if ((side = req.getParameter("pageSide")) != null) {
            req.setAttribute("login", login);
            if ("previous".equals(side)) {
                pageManager.previousPage();
            } else {
                pageManager.nextPage();
            }
        }
        login = (String) req.getAttribute("login");
        List<Card> cardsForUser = CardService.updateCardsOfUser(login);
        req.setAttribute("list", pageManager.sublist(cardsForUser));
        req.getRequestDispatcher("/cardList.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        id = req.getParameter("id");
        button = req.getParameter("button");
        login = (String) req.getAttribute("login");
        if (id != null) {
            doPut(req, resp);
        }
        List<Card> cardsForUser = CardService.updateCardsOfUser(login);
        req.setAttribute("list", pageManager.sublist(cardsForUser));
        req.getRequestDispatcher("/cardList.jsp").forward(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idInt = Integer.parseInt(id);
        login = CardService.get(idInt).getUser().getLogin();
        req.setAttribute("login", login);
        if (button != null) {
            switch (button) {
                case "home":
                    req.setAttribute("id", id);
                    req.getRequestDispatcher("/dateFormat.jsp").forward(req, resp);
                    break;
                case "hall":
                    CardService.updateCardStatusAndDate(CardService.get(idInt), CardState.AT_HALL,
                            LocalDate.now(ZoneId.systemDefault()));
                    break;
                case "return":
                    CardService.updateCardStatusAndDate(CardService.get(idInt), CardState.RETURNED,
                            LocalDate.now(ZoneId.systemDefault()));
                    break;
                default:
                    break;
            }
        }
    }
}
