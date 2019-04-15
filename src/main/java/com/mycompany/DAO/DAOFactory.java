package com.mycompany.DAO;

public interface DAOFactory {

    UserDAO getUserDAO();

    CardDAO getCardDAO();

    BookDAO getBookDAO();

}

