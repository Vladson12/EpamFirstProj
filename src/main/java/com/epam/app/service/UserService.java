package com.epam.app.service;

import com.epam.app.DAO.impl.DaoFactoryImpl;
import com.epam.app.model.User;
import lombok.NoArgsConstructor;
import org.apache.commons.validator.routines.EmailValidator;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@NoArgsConstructor
public class UserService {
    private static final Map<String, User> mapUsers = new HashMap<>();

    public static boolean create(User user) {

        return DaoFactoryImpl.getInstance().getUserDAO().addUser(user);
    }

    public User get(int id) {
        return DaoFactoryImpl.getInstance().getUserDAO().getUser(id);
    }

    public static User getByLogin(String login) {
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
}
