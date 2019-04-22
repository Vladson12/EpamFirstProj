package com.epam.app.service;

import com.epam.app.model.User;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.stream.Collectors;

import static com.epam.app.DAO.impl.DaoFactoryImpl.*;

@NoArgsConstructor
public class UserService {


    public UserService(String name, String login, String password) {
    }

    public static boolean create(User user) {

        for (String logins : getAllLogins()) {
            boolean isTheSameUser = logins.equals(user.getLogin());
            if (isTheSameUser) return false;
        }
        return getInstance().getUserDAO().addUser(user);
    }

    public User get(int id) {
        return getInstance().getUserDAO().getUser(id);
    }

    public User getByLogin(String login){
        return getInstance().getUserDAO().getUserByLogin(login);
    }

    public static List<User> getAllUsers() {
        return getInstance().getUserDAO().getAllUser();
    }

    public void updateUser(User user) {
        getInstance().getUserDAO().updateUser(user);
    }

    public static List<String> getAllLogins() {
        return getAllUsers().stream().map(i -> i.getLogin()).collect(Collectors.toList());
    }

}
