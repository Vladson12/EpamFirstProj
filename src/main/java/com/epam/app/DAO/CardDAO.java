package com.epam.app.DAO;

import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;

import java.sql.SQLException;
import java.util.List;

public interface CardDAO {

    void addCard(Card card);

    List<Book> getAllBook(User user);

    List<User> getAllUser(Book book);

    void updateCardStatus (Card card);
}
