package com.epam.app.controller;

import com.epam.app.model.Card;
import com.epam.app.model.enums.CardState;
import com.epam.app.service.CardService;
import com.epam.app.service.UserService;
import org.apache.log4j.Logger;

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

@WebServlet("/cabinet/usercards")
public class MyCardController extends HttpServlet {

    static final Logger log = Logger.getLogger(MyCardController.class);
    private String login;
    private List<Card> cards;
    private String id;
    private String button;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        login = req.getParameter("login");
        cards = updateCards();
        req.getSession().setAttribute("login", login);
        req.getSession().setAttribute("list", cards);
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
        int idInt = Integer.valueOf(id);
        if (button != null) {
            CardService.updateCardStatusAndDate(CardService.get(idInt), CardState.RETURNED,
                    LocalDate.now(ZoneId.systemDefault()));
            cards = updateCards();
        }
        req.getSession().setAttribute("login", login);
        req.getSession().setAttribute("list", cards);
        req.getRequestDispatcher("/cardList.jsp").forward(req, resp);
    }

    private List<Card> updateCards(){
        return CardService.getAllCards(UserService.getByLogin(login)).stream()
                .sorted(Comparator.comparingInt(o -> getPriority(o.getCardState()))).collect(Collectors.toList());
    }
}
