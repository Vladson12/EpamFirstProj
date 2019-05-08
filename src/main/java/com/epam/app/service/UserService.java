package com.epam.app.service;

import com.epam.app.DAO.UserDAO;
import com.epam.app.model.Card;
import com.epam.app.model.User;
import com.epam.app.model.enums.Role;
import com.epam.app.util.password.Password;
import org.apache.commons.validator.routines.EmailValidator;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static com.epam.app.DAO.impl.ActualDaoFactory.getInstance;

public class UserService {

    public static final UserDAO USER_DAO = getInstance().getUserDAO();

    public static boolean create(User user) {
        return USER_DAO.addUser(user);
    }

    public static User get(int id) {
        return USER_DAO.getUser(id);
    }

    public static User getByLogin(String login) {
        return USER_DAO.getUserByLogin(login);
    }

    public static List<User> getAllUsers() {
        return USER_DAO.getAllUsers();
    }

    public static List<String> getAllLogins() {
        return getAllUsers().stream().map(User::getLogin).collect(Collectors.toList());
    }

    public static List<String> getAllPasswords() {
        return getAllUsers().stream().map(User::getPassword).collect(Collectors.toList());
    }

    public static void updateUser(User user) {
        USER_DAO.updateUser(user);
    }

    public static void deleteUser(User user) {
        USER_DAO.deleteUser(user.getId());
    }

    public static boolean isLoginValid(String login) {
        EmailValidator emailValidator = EmailValidator.getInstance();
        return emailValidator.isValid(login);
    }

    public static boolean isLoginDuplicated(String login) {
        return getAllLogins().stream().anyMatch(l -> l.equals(login));
    }

    public static boolean isUserAllowed(String login, String password) {
        User user = getByLogin(login);
        if (user == null) {
            return false;
        }
        return Password.matches(password, user.getPassword());
    }

    public static User findUser(String login, String password) {
        User user = getByLogin(login);
        if (user != null && Password.matches(password, user.getPassword())) {
            return user;
        }
        return null;
    }

    public static List<User> getByContext(String context){
        Predicate<User> containsName = o -> containsIgnoreCase(o.getName(),context);
        Predicate<User> containsLogin = o -> containsIgnoreCase(o.getLogin(),context);
        List<User> allUsers = UserService.getAllUsers()
                .stream().filter(containsName.or(containsLogin)).collect(Collectors.toList());
        if (allUsers.isEmpty()) {
            return new ArrayList<>();
        } else {
            return allUsers;
        }
    }

    private static boolean containsIgnoreCase(String str, String subString) {
        return str.toLowerCase().contains(subString.toLowerCase());
    }

    public static void updateUserByFields(String userLogin, String name,String login,String role) {
        User updatedUser = UserService.getByLogin(userLogin);
        updatedUser.setName(name);
        updatedUser.setLogin(login);
        if (role != null) {
            updatedUser.setRole(Role.valueOf(role));
        }
        UserService.updateUser(updatedUser);
    }
}
