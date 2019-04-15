package com.mycompany.DAO;

import com.mycompany.model.Book;
import com.mycompany.model.Card;
import com.mycompany.model.User;

import java.sql.SQLException;
import java.util.List;

public interface CardDAO {

    void addCard(Card card) throws SQLException;

    List<Book> getAllBook(User user) throws SQLException;

    List<User> getAllUser(Book book) throws SQLException;

    void updateCardStatus (Card card) throws SQLException;
}
