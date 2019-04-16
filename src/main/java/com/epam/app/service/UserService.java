package com.epam.app.service;

import com.epam.app.dao.impl.DaoFactoryImpl;
import com.epam.app.model.User;

import java.sql.SQLException;
import java.util.List;

public class UserService {


    public void addUser(User user) throws SQLException {
        DaoFactoryImpl.getInstance().getUserDao().addUser(user);
    }

    public void updateUser(User user) throws SQLException {
        DaoFactoryImpl.getInstance().getUserDao().updateUser(user);
    }

    public User getUser(int userId) throws SQLException {
        return DaoFactoryImpl.getInstance().getUserDao().getUser(userId);
    }

    public List<User> getAllUsers() throws SQLException {
        return DaoFactoryImpl.getInstance().getUserDao().getAllUsers();
    }


}
