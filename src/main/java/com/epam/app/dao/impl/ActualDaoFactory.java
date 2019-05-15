package com.epam.app.dao.impl;

import com.epam.app.dao.BookDAO;
import com.epam.app.dao.CardDAO;
import com.epam.app.dao.DaoFactory;
import com.epam.app.dao.UserDAO;
import com.epam.app.config.Config;

public class ActualDaoFactory implements DaoFactory {
    private static final DaoFactory factory = Config.getFactory();
    private static final ActualDaoFactory ACTUAL_FACTORY = new ActualDaoFactory();

    public static ActualDaoFactory getInstance() {
        return ACTUAL_FACTORY;
    }

    @Override
    public UserDAO getUserDAO() {
        return factory.getUserDAO();
    }

    @Override
    public CardDAO getCardDAO() {
        return factory.getCardDAO();
    }

    @Override
    public BookDAO getBookDAO() {
        return factory.getBookDAO();
    }
}
