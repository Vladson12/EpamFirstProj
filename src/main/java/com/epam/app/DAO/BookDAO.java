package com.epam.app.DAO;

import com.epam.app.model.Book;

import java.util.List;

public interface BookDAO {

    void addBook(Book book);

    Book getBookById(Integer bookId);

    Book getBookByAuthor(String author);

    List<Book> getAllBooks();

    void updateBook(Book book);

    void deleteBook(Book book);

}
