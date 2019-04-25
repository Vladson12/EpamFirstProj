package com.epam.app.DAO.impl;

import com.epam.app.DAO.BookDAO;
import com.epam.app.DAO.CardDAO;
import com.epam.app.DAO.UserDAO;

public class DaoFactoryMySqlImpl implements com.epam.app.DAO.DaoFactory {

    private static final DaoFactoryMySqlImpl INSTANCE = new DaoFactoryMySqlImpl();

    private DaoFactoryMySqlImpl() {
    }

    public static DaoFactoryMySqlImpl getInstance() {
        return INSTANCE;
    }


    @Override
    public UserDAO getUserDAO() {

            return new UserDaoMySqlImpl();

    }

    @Override
    public CardDAO getCardDAO() {
            return new CardDaoMySqlImpl();
    }

    @Override
    public BookDAO getBookDAO() {
            return new BookDaoMySqlImpl();
    }
}
