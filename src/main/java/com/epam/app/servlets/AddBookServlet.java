package com.epam.app.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddBookServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/addbook.jsp");
        requestDispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String title = req.getParameter("title");
//        String author = req.getParameter("author");
//        int isbn = req.getParameter("isbn");
//        Book book = new Book(title, author, isbn);
//        Model model = Model.getInstance();
//        model.add(book);

//        req.setAttribute("userName", name);
//        doGet(req, resp);
    }
}
