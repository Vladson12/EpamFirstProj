package com.epam.app.dao;

public interface DaoFactory {

    UserDAO getUserDAO();

    CardDAO getCardDAO();

    BookDAO getBookDAO();
}
