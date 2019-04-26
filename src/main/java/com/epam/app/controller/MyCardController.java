package com.epam.app.controller;

import com.epam.app.model.Card;
import com.epam.app.model.enums.CardState;
import com.epam.app.service.CardService;
import com.epam.app.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

@WebServlet("/myCard")
public class MyCardController extends HttpServlet {

    String login;
    List<Card> cards;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        login = req.getParameter("login");
        cards = CardService.getAllCards(UserService.getByLogin(login));
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idCard = req.getParameter("id");
        String button = req.getParameter("button");
        if (idCard != null) {
            int idInt = Integer.valueOf(idCard);
            if (button != null) {
                CardService.updateCardStatusAndDate(CardService.get(idInt), CardState.RETURNED,
                        LocalDate.now(ZoneId.systemDefault()));
                cards = CardService.getAllCards(UserService.getByLogin(login));
            }
        }
        req.setAttribute("login",login);
        req.setAttribute("list",cards );
        req.getRequestDispatcher("/cardList.jsp").forward(req, resp);
    }
}
