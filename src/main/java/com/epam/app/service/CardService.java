package com.epam.app.service;

import com.epam.app.dao.impl.DaoFactoryImpl;
import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;

import java.sql.SQLException;

/**
 * Created by vladd on 15.04.2019
 */
public class CardService {

    public void addCard(Card card) throws SQLException {
        DaoFactoryImpl.getInstance().getCardDao().addCard(card);
    }

    public void updateCardStatus(Card card) throws SQLException {
        DaoFactoryImpl.getInstance().getCardDao().updateStatus(card);
    }

    public void getAllBooksByUser(User user) throws SQLException {
        DaoFactoryImpl.getInstance().getCardDao().getAllBooksByUser(user);
    }

    public void getAllUsersByBook(Book book) throws SQLException {
        DaoFactoryImpl.getInstance().getCardDao().getAllUsersByBook(book);
    }

}
