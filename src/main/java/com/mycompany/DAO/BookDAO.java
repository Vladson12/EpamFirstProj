package com.mycompany.DAO;

import com.mycompany.model.Book;

import java.sql.SQLException;
import java.util.List;

public interface BookDAO {

    List<Book> getAllBooks() throws SQLException;

    Book getBook(int bookId) throws SQLException;

    void addBook(Book book) throws SQLException;

    void updateBook(Book book) throws SQLException;

    void deleteBook(Book book) throws SQLException;

}
