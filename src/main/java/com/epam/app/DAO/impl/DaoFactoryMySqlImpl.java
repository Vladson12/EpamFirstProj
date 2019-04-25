package com.epam.app.DAO.impl;

import com.epam.app.DAO.BookDAO;
import com.epam.app.DAO.CardDAO;
import com.epam.app.DAO.UserDAO;

public class DaoFactoryMySqlImpl implements com.epam.app.DAO.DaoFactory {

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
