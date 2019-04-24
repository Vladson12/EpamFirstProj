package com.epam.app.controller;

import com.epam.app.model.Book;
import com.epam.app.model.enums.BookState;
import com.epam.app.service.BookService;
import com.epam.app.util.PageManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/bookList")
public class BookListController extends HttpServlet {

    private static PageManager pageManager;

    static {
        pageManager = new PageManager<Book>();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String identify;
        String side;

        if ((identify = req.getParameter("id")) != null) {
            int id = Integer.parseInt(identify);
            Book book = BookService.getBookById(id);
            book.setBookState(BookState.ORDERED);
            BookService.updateBook(book);
        }
        if ((side = req.getParameter("pageSide")) != null) {
            System.out.println("inside if");
            if ("previous".equals(side)) {
                System.out.println("double inside if");

                pageManager.previousPage();
            } else pageManager.nextPage();
        }
        System.out.println(side);
        req.getSession().setAttribute("list", pageManager.sublist(BookService.getAllBooks()));
        req.getSession().setAttribute("page", new PageManager.Page(0));
        req.getSession().setAttribute("pages", pageManager.getPages());

        req.getRequestDispatcher("/bookListForUser.jsp").forward(req, resp);
    }

}
