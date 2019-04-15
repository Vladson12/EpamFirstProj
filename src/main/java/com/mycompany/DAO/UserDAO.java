package com.mycompany.DAO;

import com.mycompany.model.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDAO {

    void addUser(User user) throws SQLException;

    void updateUser(User user) throws SQLException;

    List<User> getAllUser() throws SQLException;

    User getUser(int userId) throws SQLException;
}

