package com.epam.app.service;

import com.epam.app.model.Book;

import java.util.List;

import static com.epam.app.DAO.impl.DaoFactoryImpl.getInstance;

/**
 * Created by vladd on 15.04.2019
 */
public class BookService {

    public static void create(Book book) {
        getInstance().getBookDAO("mysql").addBook(book);
    }

    public static Book getBookById(int id) {
        return getInstance().getBookDAO("mysql").getBook(id);
    }

    public static List<Book> getAllBooks() {
        return getInstance().getBookDAO("mysql").getAllBooks();
    }

    public static void updateBook(Book book) {
        getInstance().getBookDAO("mysql").updateBook(book);
    }

}
