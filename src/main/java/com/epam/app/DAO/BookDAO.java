package com.epam.app.DAO;

import com.epam.app.model.Book;

import java.sql.SQLException;
import java.util.List;

public interface BookDAO {

    List<Book> getAllBooks();

    Book getBook(int bookId);

    void addBook(Book book);

    void updateBook(Book book);

    void deleteBook(Book book);

}
