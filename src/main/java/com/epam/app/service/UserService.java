package com.epam.app.service;

import com.epam.app.model.User;
import org.apache.commons.validator.routines.EmailValidator;

import java.util.List;
import java.util.stream.Collectors;

import static com.epam.app.DAO.impl.DaoFactoryImpl.getInstance;

public class UserService {

    public static boolean create(User user) {
        return getInstance().getUserDAO("mysql").addUser(user);
    }

    public static User get(int id) {
        return getInstance().getUserDAO("mysql").getUser(id);
    }

    public static User getByLogin(String login) {
        return getInstance().getUserDAO("mysql").getUserByLogin(login);
    }

    public static List<User> getAllUsers() {
        return getInstance().getUserDAO("mysql").getAllUsers();
    }

    public static List<String> getAllLogins() {
        return getAllUsers().stream().map(i -> i.getLogin()).collect(Collectors.toList());
    }

    public static List<String> getAllPasswords() {
        return getAllUsers().stream().map(i -> i.getPassword()).collect(Collectors.toList());
    }

    public static void updateUser(User user) {
        getInstance().getUserDAO("mysql").updateUser(user);
    }

    public static boolean isLoginValid(String login) {
        EmailValidator emailValidator = EmailValidator.getInstance();
        return emailValidator.isValid(login);
    }

    public static boolean isLoginDuplicated(User user) {
        for (String logins : getAllLogins()) {
            boolean isTheSameUser = logins.equals(user.getLogin());
            if (isTheSameUser) return true;
        }
        return false;
    }

    public static boolean isUserAllowed(String login, String password) {
        User user = getByLogin(login);
        if (user == null) {
            return false;
        }
        return user.getPassword().equals(password);
    }

    //Find user by userName and password.
    public static User findUser(String login, String password) {
        User user = getByLogin(login);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
}
