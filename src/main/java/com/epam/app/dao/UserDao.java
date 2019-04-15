package com.epam.app.dao;

import com.epam.app.model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDao {

    void addUser(User user) throws SQLException;

    void updateUser(User user) throws SQLException;

    User getUser(int userId) throws SQLException;

    List<User> getAllUsers() throws SQLException;
}

