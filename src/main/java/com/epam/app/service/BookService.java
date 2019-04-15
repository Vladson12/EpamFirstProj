package com.epam.app.service;

import com.epam.app.DAO.mySQL.SqlBookDao;
import com.epam.app.DAO.mySQL.SqlDaoFactory;
import com.epam.app.model.Book;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by vladd on 15.04.2019
 */
public class BookService {
    public static void create(Book book) throws SQLException {
        new SqlBookDao().addBook(book);
    }

    public Book get(int bookId) throws SQLException {
        return SqlDaoFactory.getInstance().getBookDAO().getBook(bookId);
    }

    public static List<Book> getAll() throws SQLException {
        return SqlDaoFactory.getInstance().getBookDAO().getAllBooks();
    }



}
