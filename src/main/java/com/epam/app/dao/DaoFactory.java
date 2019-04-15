package com.epam.app.dao;

public interface DaoFactory {

    UserDao getUserDao();

    CardDao getCardDao();

    BookDao getBookDao();

}

