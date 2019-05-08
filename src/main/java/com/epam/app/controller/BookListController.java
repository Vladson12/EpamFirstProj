package com.epam.app.controller;

import com.epam.app.model.Book;
import com.epam.app.service.BookService;
import com.epam.app.service.CardService;
import com.epam.app.util.PageManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/bookList")
public class BookListController extends HttpServlet {

    private static PageManager pageManager;
    private List<Book> booksList;
    private String login;
    private String id;
    private String side;

    static {
        pageManager = new PageManager<Book>();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String side;
        if ((side = req.getParameter("pageSide")) != null) {
            if ("previous".equals(side)) {
                pageManager.previousPage();
            } else {
                pageManager.nextPage();
            }
        }
        booksList = BookService.updateBookList(pageManager);
        login = req.getParameter("login");
        if (req.getParameter("insert") != null) {
            String author = req.getParameter("author");
            String genre = req.getParameter("genre");
            if (!genre.isEmpty() && !author.isEmpty()) {
                booksList = BookService.getByContextAndGenre(author, genre);
            } else if (!genre.isEmpty()) {
                booksList = BookService.getByGenre(genre);
            } else if (!author.isEmpty()) {
                booksList = BookService.getByContext(author);
            }
        }
        req.getSession().setAttribute("list", booksList);
        req.getRequestDispatcher("/bookListForUser.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        login = req.getParameter("login");
        id = req.getParameter("id");
        if (id != null) {
            doPut(req, resp);
        }
        resp.sendRedirect("/bookList");
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CardService.orderBook(id, login);
        req.getSession().setAttribute("list", BookService.updateBookList(pageManager));
        req.getRequestDispatcher("/bookListForUser.jsp").forward(req, resp);
    }

}
