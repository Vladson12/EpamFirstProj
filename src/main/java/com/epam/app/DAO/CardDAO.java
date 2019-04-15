package com.epam.app.DAO;

import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;

import java.sql.SQLException;
import java.util.List;

public interface CardDAO {

    void addCard(Card card) throws SQLException;

    List<Book> getAllBook(User user) throws SQLException;

    List<User> getAllUser(Book book) throws SQLException;

    void updateCardStatus (Card card) throws SQLException;
}
