package com.epam.app.service;

import com.epam.app.dao.impl.BookDaoImpl;
import com.epam.app.dao.impl.DaoFactoryImpl;
import com.epam.app.dao.impl.UserDaoImpl;
import com.epam.app.model.Book;
import com.epam.app.model.emuns.BookState;
import com.epam.app.utils.DbHelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by vladd on 15.04.2019
 */
public class BookService {

//    public static void addBook(Book book) throws SQLException {
//        DaoFactoryImpl.getInstance().getBookDao().addBook(book);
//    }
//
//    public static void updateBook(Book book) throws SQLException {
//        DaoFactoryImpl.getInstance().getBookDao().updateBook(book);
//    }
//
//    public static void deleteBook(Book book) throws SQLException {
//        DaoFactoryImpl.getInstance().getBookDao().deleteBook(book);
//    }
//
//    public static Book getBook(int bookId) throws SQLException {
//        return DaoFactoryImpl.getInstance().getBookDao().getBook(bookId);
//    }

    public static List<Book> getAllBooks() throws SQLException {
        return new DaoFactoryImpl().getInstance().getBookDao().getAllBooks();
    }
}
