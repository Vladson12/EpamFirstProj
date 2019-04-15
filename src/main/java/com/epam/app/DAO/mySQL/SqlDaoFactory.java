package com.epam.app.DAO.mySQL;

import com.epam.app.DAO.BookDAO;
import com.epam.app.DAO.CardDAO;
import com.epam.app.DAO.DaoFactory;
import com.epam.app.DAO.UserDAO;

public class SqlDaoFactory implements DaoFactory {

    static SqlDaoFactory instance = null;
    final private BookDAO bookDAO;
    final private CardDAO cardDAO;
    final private UserDAO userDAO;

    private SqlDaoFactory() {
        bookDAO =  new SqlBookDao();
        cardDAO = new SqlCardDao();
        userDAO = new SqlUserDao();
    }

    public static SqlDaoFactory getInstance() {
        if (instance == null) instance = new SqlDaoFactory();
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
