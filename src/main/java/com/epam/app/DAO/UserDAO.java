package com.epam.app.DAO;

import com.epam.app.model.User;

import java.util.List;

public interface UserDAO {

    boolean addUser(User user);

    void updateUser(User user);

    List<User> getAllUser();

    User getUser(int userId);
}

