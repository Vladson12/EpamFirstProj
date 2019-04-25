package com.epam.app.service;

import com.epam.app.DAO.BookDAO;
import com.epam.app.model.Book;

import java.util.List;

import static com.epam.app.DAO.impl.DaoFactoryMySqlImpl.getInstance;

/**
 * Created by vladd on 15.04.2019
 */
public class BookService {

    public static final BookDAO BOOK_DAO = getInstance().getBookDAO();

    public static void create(Book book) {
        BOOK_DAO.addBook(book);
    }

    public static Book getBookById(int id) {
        return BOOK_DAO.getBook(id);
    }

    public static List<Book> getAllBooks() {
        return BOOK_DAO.getAllBooks();
    }

    public static void updateBook(Book book) {
        BOOK_DAO.updateBook(book);
    }

}
