package com.epam.app.service;

import com.epam.app.dao.UserDAO;
import com.epam.app.model.User;
import com.epam.app.model.enums.Role;
import com.epam.app.util.PageManager;
import com.epam.app.util.password.Password;
import org.apache.commons.validator.routines.EmailValidator;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static com.epam.app.dao.impl.ActualDaoFactory.getInstance;

public class UserService {
    private static final UserDAO USER_DAO = getInstance().getUserDAO();

    private UserService() {
    }

    public static void create(User user) {
        USER_DAO.addUser(user);
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

    private static List<String> getAllLogins() {
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

    public static void updateUserByFields(String userLogin, String name, String login, String role) {
        User updatedUser = UserService.getByLogin(userLogin);
        updatedUser.setName(name);
        updatedUser.setLogin(login);
        if (role != null) {
            updatedUser.setRole(Role.valueOf(role));
        }
        UserService.updateUser(updatedUser);
    }

    public static void handleButtons(PageManager<User> pageManager, HttpServletRequest req) {
        String sort = req.getParameter("sort");
        if (req.getParameter("insert") != null) {
            String login = req.getParameter("login");
            pageManager.setItemList(UserService.getByContext(login));
        } else if (req.getParameter("updatePage") != null) {
            pageManager.setItemList(UserService.getAllUsers());
        } else if (sort != null) {
            switch (sort) {
                case "name":
                    pageManager.setItemList(UserService.sortUserListByName(pageManager));
                    break;
                case "login":
                    pageManager.setItemList(UserService.sortUserListByLogin(pageManager));
                    break;
                case "role":
                    pageManager.setItemList(UserService.sortUserListByRole(pageManager));
                    break;
                default:
                    break;
            }
        } else {
            pageManager.setItemList(UserService.getAllUsers());
        }
    }

    private static List<User> sortUserListByName(PageManager<User> pageManager) {
        return sortUserListByComparator(pageManager, compareByName());
    }

    private static List<User> sortUserListByLogin(PageManager<User> pageManager) {
        return sortUserListByComparator(pageManager, compareByLogin());
    }

    private static List<User> sortUserListByRole(PageManager<User> pageManager) {
        return sortUserListByComparator(pageManager, compareByRole());
    }

    private static List<User> sortUserListByComparator(PageManager<User> pageManager, Comparator<User> comparator) {
        pageManager.setCurrentPage(1);
        List<User> users = pageManager.getItemList().stream()
                .sorted(comparator)
                .collect(Collectors.toList());
        if (!pageManager.isSortIdentificator())
            Collections.reverse(users);
        pageManager.setSortIdentificator(!pageManager.isSortIdentificator());
        return users;
    }

    private static Comparator<User> compareByName() {
        return (user1, user2) -> user1.getName().compareToIgnoreCase(user2.getName());
    }

    private static Comparator<User> compareByLogin() {
        return (user1, user2) -> user1.getLogin().compareToIgnoreCase(user2.getLogin());
    }

    private static Comparator<User> compareByRole() {
        return (user1, user2) -> user1.getRole().toString().compareToIgnoreCase(user2.getRole().toString());
    }

    private static List<User> getByContext(String context) {
        Predicate<User> containsName = o -> containsIgnoreCase(o.getName(), context);
        Predicate<User> containsLogin = o -> containsIgnoreCase(o.getLogin(), context);
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
}
