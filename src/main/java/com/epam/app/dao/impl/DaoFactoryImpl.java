package com.epam.app.dao.impl;

import com.epam.app.dao.BookDao;
import com.epam.app.dao.CardDao;
import com.epam.app.dao.DaoFactory;
import com.epam.app.dao.UserDao;

public class DaoFactoryImpl implements DaoFactory {

    private static final DaoFactoryImpl INSTANCE = new DaoFactoryImpl();

    final private BookDao bookDao;
    final private CardDao cardDao;
    final private UserDao userDao;

    private DaoFactoryImpl() {
        bookDao =  new BookDaoImpl();
        cardDao = new CardDaoImpl();
        userDao = new UserDaoImpl();
    }

    public static DaoFactoryImpl getInstance() {
        return INSTANCE;
    }

    @Override
    public UserDao getUserDao() {
        return userDao;
    }

    @Override
    public CardDao getCardDao() {
        return cardDao;
    }

    @Override
    public BookDao getBookDao() {
        return bookDao;
    }
}
