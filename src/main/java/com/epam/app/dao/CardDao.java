package com.epam.app.dao;

import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;

import java.sql.SQLException;
import java.util.List;

public interface CardDao {

    void addCard(Card card) throws SQLException;

    List<Book> getAllBooksByUser(User user) throws SQLException;

    List<User> getAllUsersByBook(Book book) throws SQLException;

    void updateStatus(Card card) throws SQLException;
}
