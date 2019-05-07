package com.epam.app.controller;

import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.enums.BookState;
import com.epam.app.model.enums.CardState;
import com.epam.app.service.BookService;
import com.epam.app.service.CardService;
import com.epam.app.service.UserService;
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
import java.util.stream.Collectors;

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
        booksList = updateBookList();
        login = req.getParameter("login");
        if ((side = req.getParameter("pageSide")) != null) {
            if ("previous".equals(side)) {
                pageManager.previousPage();
            } else pageManager.nextPage();
        }
        if (req.getParameter("insert") != null) {
            String author = req.getParameter("author");
            String genre = req.getParameter("genre");
            if (!genre.isEmpty() && !author.isEmpty()) {
                booksList = BookService.getAllBooks().stream().filter(o -> o.getAuthor().contains(author))
                        .filter(o->o.getGenre().toString().contains(genre)).collect(Collectors.toList());
            } else if (!genre.isEmpty()) {
                booksList = BookService.getAllBooks().
                        stream().filter(o -> o.getGenre().toString().contains(genre)).collect(Collectors.toList());
            } else if (!author.isEmpty()) {
                booksList = BookService.getAllBooks().
                        stream().filter(o -> o.getAuthor().contains(author)).collect(Collectors.toList());
            }
        }
        req.getSession().setAttribute("list", booksList);
        req.getSession().setAttribute("page", new PageManager.Page(0));
        req.getSession().setAttribute("pages", pageManager.getPages());
        req.getRequestDispatcher("/bookListForUser.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        login = req.getParameter("login");
        id = req.getParameter("id");
        if (id != null) {
            doPut(req,resp);
        }
        resp.sendRedirect("/bookList");
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Book book = BookService.getBookById(Integer.parseInt(id));
        book.setBookState(BookState.ORDERED);
        BookService.updateBook(book);
        Card card = new Card(UserService.getByLogin(login), book, LocalDate.now(ZoneId.systemDefault()),
                LocalDate.now(ZoneId.systemDefault()).plusDays((long) 7), CardState.ORDERED);
        CardService.create(card);
        req.getSession().setAttribute("list", updateBookList());
        req.getSession().setAttribute("page", new PageManager.Page(0));
        req.getSession().setAttribute("pages", pageManager.getPages());
        req.getRequestDispatcher("/bookListForUser.jsp").forward(req, resp);
    }

    private static List<Book> updateBookList(){
        return pageManager.sublist(BookService.getAllBooks().stream().
                filter(o -> o.getBookState().equals(BookState.FREE))
                .collect(Collectors.toList()));
    }
}
