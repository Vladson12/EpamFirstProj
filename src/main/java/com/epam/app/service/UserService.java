package com.epam.app.service;

import com.epam.app.DAO.impl.UserDaoImpl;
import com.epam.app.model.User;

import java.sql.SQLException;

public class UserService {

    public void create(User user)  {
        new UserDaoImpl().addUser(user);
    }
}
