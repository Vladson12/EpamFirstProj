package com.epam.app.DAO;

public interface DaoFactory {

    UserDAO getUserDAO();

    CardDAO getCardDAO();

    BookDAO getBookDAO();

}

