package com.epam.app.service;

import com.epam.app.DAO.impl.DaoFactoryImpl;
import com.epam.app.model.User;
import lombok.NoArgsConstructor;
import org.apache.commons.validator.routines.EmailValidator;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.epam.app.DAO.impl.DaoFactoryImpl.*;

@NoArgsConstructor
public class UserService {

    public static boolean create(User user) {


        return DaoFactoryImpl.getInstance().getUserDAO().addUser(user);
    }

    public User get(int id) {
        return getInstance().getUserDAO().getUser(id);
    }

    public static User getByLogin(String login){
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

    public static List<String> getAllPassword() {
        return getAllUsers().stream().map(i -> i.getPassword()).collect(Collectors.toList());
    }

    public static boolean isValidLogin(String login) {
        EmailValidator emailValidator = EmailValidator.getInstance();
        return emailValidator.isValid(login);
    }

    public static boolean isDuplicateLogin(User user) {
        for (String logins : getAllLogins()) {
            boolean isTheSameUser = logins.equals(user.getLogin());
            if (isTheSameUser) return true;
        }
        return false;
    }

    public static boolean isAllowedUser(String login, String password) {
        User user = getByLogin(login);
        if (user == null) {
            return false;
        }
        return user.getPassword().equals(password);
    }

    // Find a User by userName and password.
    public static User findUser(String login, String password) {
        User user = getByLogin(login);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
}
