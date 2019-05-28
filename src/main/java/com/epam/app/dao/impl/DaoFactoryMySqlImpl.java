package com.epam.app.dao.impl;

import com.epam.app.dao.BookDAO;
import com.epam.app.dao.CardDAO;
import com.epam.app.dao.UserDAO;

public class DaoFactoryMySqlImpl implements com.epam.app.dao.DaoFactory {
    private static final DaoFactoryMySqlImpl INSTANCE = new DaoFactoryMySqlImpl();
    private static final UserDAO USER_DAO = new UserDaoMySqlImpl();
    private static final BookDAO BOOK_DAO = new BookDaoMySqlImpl();
    private static final CardDAO CARD_DAO = new CardDaoMySqlImpl();

    private DaoFactoryMySqlImpl() {
    }

    public static DaoFactoryMySqlImpl getInstance() {
        return INSTANCE;
    }

    @Override
    public UserDAO getUserDAO() {
        return USER_DAO;
    }

    @Override
    public CardDAO getCardDAO() {
        return CARD_DAO;
    }

    @Override
    public BookDAO getBookDAO() {
        return BOOK_DAO;
    }
}
