package com.epam.app.DAO.mySQL;

import com.epam.app.DAO.BookDAO;
import com.epam.app.DAO.CardDAO;
import com.epam.app.DAO.DAOFactory;
import com.epam.app.DAO.UserDAO;

public class SQLDAOFactory implements DAOFactory {

    final private BookDAO bookDAO;
    final private CardDAO cardDAO;
    final private UserDAO userDAO;

    public SQLDAOFactory() {
        bookDAO =  new SQLBookDAO();
        cardDAO = new SQLCardDAO();
        userDAO = new SQLUserDAO();
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
