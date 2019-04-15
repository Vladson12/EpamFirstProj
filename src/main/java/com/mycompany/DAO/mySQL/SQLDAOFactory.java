package com.mycompany.DAO.mySQL;

import com.mycompany.DAO.BookDAO;
import com.mycompany.DAO.CardDAO;
import com.mycompany.DAO.DAOFactory;
import com.mycompany.DAO.UserDAO;

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
