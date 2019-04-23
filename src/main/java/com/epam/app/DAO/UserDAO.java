package com.epam.app.DAO;

import com.epam.app.model.User;

import java.util.List;

public interface UserDAO {

    boolean addUser(User user);

    User getUser(int userId);

    User getUserByLogin(String userLogin);

    List<User> getAllUsers();

    void updateUser(User user);

    void deleteUser(int usedId);
}

