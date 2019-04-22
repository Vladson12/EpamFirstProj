package com.epam.app.service;

import com.epam.app.DAO.impl.DaoFactoryImpl;
import com.epam.app.model.Book;

import java.util.List;

/**
 * Created by vladd on 15.04.2019
 */
public class BookService {

    public void create(Book book) {
        DaoFactoryImpl.getInstance().getBookDAO().addBook(book);
    }

    public static Book getBookById(int id) {
        return DaoFactoryImpl.getInstance().getBookDAO().getBook(id);
    }

    public static List<Book> getAllBooks() {
        return DaoFactoryImpl.getInstance().getBookDAO().getAllBooks();
    }

    public static void updateBook(Book book) {
        DaoFactoryImpl.getInstance().getBookDAO().updateBook(book);
    }

}
