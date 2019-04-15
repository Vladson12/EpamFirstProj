package com.epam.app.DAO.impl;

import com.epam.app.DAO.BookDAO;
import com.epam.app.DAO.CardDAO;
import com.epam.app.DAO.UserDAO;

public class DaoFactoryImpl implements com.epam.app.DAO.DaoFactory {

    static DaoFactoryImpl instance = null;
    final private BookDAO bookDAO;
    final private CardDAO cardDAO;
    final private UserDAO userDAO;

    private DaoFactoryImpl() {
        bookDAO =  new BookDaoImpl();
        cardDAO = new CardDaoImpl();
        userDAO = new UserDaoImpl();
    }

    public static DaoFactoryImpl getInstance() {
        if (instance == null) instance = new DaoFactoryImpl();
        return instance;
    }

    @Override
    public UserDAO getUserDAO() {
        return userDAO;
    }

    @Override
    public CardDAO getCardDAO() {
        return cardDAO;
    }

    @Override
    public BookDAO getBookDAO() {
        return bookDAO;
    }
}
