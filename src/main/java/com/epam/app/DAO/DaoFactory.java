package com.epam.app.DAO;

public interface DaoFactory {

    UserDAO getUserDAO(String type);

    CardDAO getCardDAO(String type);

    BookDAO getBookDAO(String type);

}

