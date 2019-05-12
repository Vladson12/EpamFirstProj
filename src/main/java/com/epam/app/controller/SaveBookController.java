package com.epam.app.controller;

import com.epam.app.model.Book;
import com.epam.app.model.enums.BookState;
import com.epam.app.model.enums.Genre;
import com.epam.app.service.BookService;
import com.epam.app.util.PageManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.stream.Collectors;

@WebServlet("/saveBook")
public class SaveBookController extends HttpServlet {
    private static PageManager pageManager = new PageManager<Book>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Book book = BookService.getBookById(Integer.parseInt(req.getParameter("id")));
        req.getSession().setAttribute("book", book);
        req.getRequestDispatcher("/saveBook.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("id"));
        Book book = new Book();

        book.setId(id);
        book.setAuthor(req.getParameter("author"));
        book.setTitle(req.getParameter("title"));
        book.setDescription(req.getParameter("description"));
        book.setYear(Integer.parseInt(req.getParameter("year")));
        book.setGenre(Genre.valueOf(req.getParameter("genre")));

        BookService.updateBook(book);
        req.getSession().setAttribute("list", pageManager.sublist(BookService.getAllBooks()
                .stream().filter(o -> o.getBookState().equals(BookState.FREE)).collect(Collectors.toList())));
        req.getSession().setAttribute("page", new PageManager.Page(0));
        req.getSession().setAttribute("pages", pageManager.getPages());
        req.getSession().setAttribute("message", "Success!");
        req.getRequestDispatcher("/bookListForUser.jsp").forward(req, resp);
    }
}

