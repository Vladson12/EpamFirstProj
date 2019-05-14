package com.epam.app.controller;

import com.epam.app.model.Book;
import com.epam.app.service.BookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by vladd on 13.05.2019
 */

@WebServlet("/viewBook")
public class BookViewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/bookView.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Book viewableBook = BookService.getBookById(id);
        req.setAttribute("book", viewableBook);
        System.out.println(viewableBook);
        req.getRequestDispatcher("/bookView.jsp").forward(req, resp);
    }
}
