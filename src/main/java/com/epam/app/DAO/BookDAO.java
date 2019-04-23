package com.epam.app.DAO;

import com.epam.app.model.Book;

import java.util.List;

public interface BookDAO {

    void addBook(Book book);

    Book getBook(int bookId);

    List<Book> getAllBooks();

    void updateBook(Book book);

    void deleteBook(Book book);

}
