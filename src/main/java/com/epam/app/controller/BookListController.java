package com.epam.app.controller;

import com.epam.app.model.Book;
import com.epam.app.model.User;
import com.epam.app.service.BookService;
import com.epam.app.service.CardService;
import com.epam.app.service.UserService;
import com.epam.app.util.PageManager;
import lombok.extern.log4j.Log4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Log4j
@WebServlet("/bookList")
public class BookListController extends HttpServlet {

    private static PageManager<Book> pageManager;
    private String login;
    private String id;

    static {
        pageManager = new PageManager<>(10);
        pageManager.setSortIdentificator(true);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        login = req.getParameter("login");
        String side;
        if ((side = req.getParameter("pageSide")) != null) {
            if ("previous".equals(side)) {
                pageManager.previousPage();
            } else {
                pageManager.nextPage();
            }
        }
        BookService.handleButtons(pageManager, req);
        req.getSession().setAttribute("list", pageManager.sublist(pageManager.getItemList()));
        req.getRequestDispatcher("/bookList.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        login = req.getParameter("login");
        id = req.getParameter("id");
        doPut(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = UserService.getByLogin(login);
        if (CardService.amountOfActiveCards(user) && !CardService.haveOverdueCards(user)) {
            CardService.orderBook(id, login);
            pageManager.setItemList(BookService.updateBookList());
        } else {
            req.getSession().setAttribute("errMessage", "Error!");
            log.info(login + "Failed to order books." + "Reason: overdue card or book card excess");
        }
        req.getSession().setAttribute("list", pageManager.sublist(pageManager.getItemList()));
        req.getRequestDispatcher("/bookList.jsp").forward(req, resp);
    }

}