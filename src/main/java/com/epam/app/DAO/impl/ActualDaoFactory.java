package com.epam.app.DAO.impl;

import com.epam.app.DAO.BookDAO;
import com.epam.app.DAO.CardDAO;
import com.epam.app.DAO.DaoFactory;
import com.epam.app.DAO.UserDAO;
import com.epam.app.config.Config;

/**
 * Created by vladd on 27.04.2019
 */
public class ActualDaoFactory implements DaoFactory {

    public static final DaoFactory factory = Config.getFactory();
    public static final ActualDaoFactory ACTUAL_FACTORY = new ActualDaoFactory();

    private ActualDaoFactory() {
    }

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
