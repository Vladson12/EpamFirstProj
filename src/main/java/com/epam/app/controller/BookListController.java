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
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/bookList")
public class BookListController extends HttpServlet {

    private static PageManager pageManager;
    String login;
    List<Book> booksList;

    static {
        pageManager = new PageManager<Book>();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String identify;
        String side;

        login = req.getParameter("login");

        if ((identify = req.getParameter("id")) != null) {
            int id = Integer.parseInt(identify);
            Book book = BookService.getBookById(id);
            book.setBookState(BookState.ORDERED);
            BookService.updateBook(book);
            Card card = new Card(UserService.getByLogin(login), book, LocalDate.now(ZoneId.systemDefault()),
                    LocalDate.now(ZoneId.systemDefault()).plusDays((long) 7), CardState.ORDERED);
            CardService.create(card);
        }
        booksList = pageManager.sublist(BookService.getAllBooks());
        if ((side = req.getParameter("pageSide")) != null) {
            if ("previous".equals(side)) {
                pageManager.previousPage();
            } else pageManager.nextPage();
        }
        if (req.getParameter("insert") != null) {
            String author = req.getParameter("author");
            booksList = Collections.singletonList(BookService.getBookByAuthor(author));
        }

        req.getSession().setAttribute("list", booksList
                .stream().filter(o -> o.getBookState().equals(BookState.FREE)).collect(Collectors.toList()));
        req.getSession().setAttribute("page", new PageManager.Page(0));
        req.getSession().setAttribute("pages", pageManager.getPages());
        req.getSession().setAttribute("login", login);
        req.getRequestDispatcher("/bookListForUser.jsp").forward(req, resp);




//        else {
//            booksList = BookService.getAllBooks();
//            System.out.println("It doesn't work");
//        }
    }

}
