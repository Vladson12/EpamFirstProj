package com.epam.app.dao;

import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;
import com.epam.app.model.enums.CardState;

import java.time.LocalDate;
import java.util.List;

public interface CardDAO {
    void addCard(Card card);

    Card getCard(int id);

    List<Integer> getAllBookId(User user);

    List<Integer> getAllUserId(Book book);

    List<Integer> getAllCards(User user);

    void updateCardStatus(Card card, CardState cardState);

    void updateCardStatusAndDate(Card card, CardState cardState, LocalDate endDate);
}
