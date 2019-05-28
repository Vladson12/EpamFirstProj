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

@WebServlet("/cabinet/usercards")
public class UserPersonalCardController extends HttpServlet {
    private static final PageManager pageManager;
    private String login;
    private List<Card> cards;
    private String id;
    private String button;

    static {
        pageManager = new PageManager<Card>(11);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String side;
        if ((side = req.getParameter("pageSide")) != null) {
            if ("previous".equals(side)) {
                pageManager.previousPage();
            } else {
                pageManager.nextPage();
            }
        }
        login = req.getParameter("login");
        cards = CardService.updateCardsOfUser(login);
        req.getSession().setAttribute("login", login);
        req.getSession().setAttribute("list", pageManager.sublist(cards));
        req.getRequestDispatcher("/cardList.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        id = req.getParameter("id");
        button = req.getParameter("button");
        if (id != null) {
            doPut(req,resp);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (button != null) {
            CardService.updateCardStatusAndDate(CardService.get(Integer.valueOf(id)), CardState.RETURNED,
                    LocalDate.now(ZoneId.systemDefault()));
            cards = CardService.updateCardsOfUser(login);
        }
        req.getSession().setAttribute("login", login);
        req.getSession().setAttribute("list", pageManager.sublist(cards));
        req.getRequestDispatcher("/cardList.jsp").forward(req, resp);
    }


}
