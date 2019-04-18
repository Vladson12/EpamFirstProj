package com.epam.app.service;

import com.epam.app.DAO.DaoFactory;
import com.epam.app.DAO.impl.DaoFactoryImpl;
import com.epam.app.DAO.impl.UserDaoImpl;
import com.epam.app.model.User;
import com.epam.app.model.enums.Role;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.stream.Collectors;

@NoArgsConstructor

public class UserService {


    public UserService(String name, String login, String password) {
    }

    public static boolean create(User user) {

        for (String logins : getAllLogins()) {
            boolean isTheSameUser = logins.equals(user.getLogin());
            if (isTheSameUser) return false;
        }
        return DaoFactoryImpl.getInstance().getUserDAO().addUser(user);
    }

    public User get(int id) {
        return DaoFactoryImpl.getInstance().getUserDAO().getUser(id);
    }

    public User getByLogin(String login){
        return DaoFactoryImpl.getInstance().getUserDAO().getUserByLogin(login);
    }

    public static List<User> getAllUsers() {
        return DaoFactoryImpl.getInstance().getUserDAO().getAllUser();
    }

    public void updateUser(User user) {
        DaoFactoryImpl.getInstance().getUserDAO().updateUser(user);
    }

    public static List<String> getAllLogins() {
        return getAllUsers().stream().map(i -> i.getLogin()).collect(Collectors.toList());
    }

}
