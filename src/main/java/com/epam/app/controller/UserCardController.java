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
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import static com.epam.app.model.enums.CardState.getPriority;

@WebServlet("/cards")
public class UserCardController extends HttpServlet {

    private String id;
    private String button;
    private String login;
    private List<Card> cardsForUser;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        login = (String) req.getAttribute("login");
        List<Card> cardsForUser = updateCards(UserService.getByLogin(login));
        req.setAttribute("list", cardsForUser);
        req.getRequestDispatcher("/cardList.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        id = req.getParameter("id");
        button = req.getParameter("button");
        login = (String) req.getAttribute("login");
        if (id != null) {
            doPut(req,resp);
        }
        List<Card> cardsForUser = updateCards(UserService.getByLogin(login));
        req.setAttribute("list", cardsForUser);
        req.getRequestDispatcher("/cardList.jsp").forward(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

    private List<Card> updateCards(User user){
        return CardService.getAllCards(user).stream()
                .sorted(Comparator.comparingInt(o -> getPriority(o.getCardState()))).collect(Collectors.toList());
    }
}
