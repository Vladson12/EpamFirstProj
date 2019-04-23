package com.epam.app.DAO.impl;

import com.epam.app.DAO.BookDAO;
import com.epam.app.DAO.CardDAO;
import com.epam.app.DAO.UserDAO;

public class DaoFactoryImpl implements com.epam.app.DAO.DaoFactory {

    private static final DaoFactoryImpl INSTANCE = new DaoFactoryImpl();

    private DaoFactoryImpl() {
    }

    public static DaoFactoryImpl getInstance() {
        return INSTANCE;
    }

    @Override
    public UserDAO getUserDAO(String type) {
        if (type.equalsIgnoreCase("mysql")) {
            return new UserDaoMySqlImpl();
        } else {
            throw new UnsupportedOperationException();
        }
    }

    @Override
    public CardDAO getCardDAO(String type) {
        if (type.equalsIgnoreCase("mysql")) {
            return new CardDaoMySqlImpl();
        } else {
            throw new UnsupportedOperationException();
        }
    }

    @Override
    public BookDAO getBookDAO(String type) {
        if (type.equalsIgnoreCase("mysql")) {
            return new BookDaoMySqlImpl();
        } else {
            throw  new UnsupportedOperationException();
        }
    }
}
