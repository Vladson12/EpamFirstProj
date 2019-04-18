package com.epam.app.DAO;

import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;
import com.epam.app.model.enums.CardState;

import java.sql.SQLException;
import java.util.List;

public interface CardDAO {

    void addCard(Card card);

    Card getCard(int id);

    List<Integer> getAllBookId(User user);

    List<Integer> getAllUserId(Book book);

    void updateCardStatus(Card card, CardState cardState);
}
