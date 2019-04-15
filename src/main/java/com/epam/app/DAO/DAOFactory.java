package com.epam.app.DAO;

public interface DAOFactory {

    UserDAO getUserDAO();

    CardDAO getCardDAO();

    BookDAO getBookDAO();

}

