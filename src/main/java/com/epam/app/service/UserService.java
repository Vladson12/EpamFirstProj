package com.epam.app.service;

import com.epam.app.DAO.DaoFactory;
import com.epam.app.DAO.impl.DaoFactoryImpl;
import com.epam.app.DAO.impl.UserDaoImpl;
import com.epam.app.model.User;
import com.epam.app.model.enums.Role;

import java.util.List;
import java.util.stream.Collectors;

public class UserService {

    public void create(User user) {
        DaoFactoryImpl.getInstance().getUserDAO().addUser(user);
    }

    public User get(int id){
        return DaoFactoryImpl.getInstance().getUserDAO().getUser(id);
    }

    public User getByLogin(String login){
        return DaoFactoryImpl.getInstance().getUserDAO().getUserByLogin(login);
    }

    public List<User> getAllUsers(){
        return DaoFactoryImpl.getInstance().getUserDAO().getAllUser();
    }

    public void updateUser(User user) {
        DaoFactoryImpl.getInstance().getUserDAO().updateUser(user);
    }

    public List<String> getAllLogins(){
        return getAllUsers().stream().map(i->i.getLogin()).collect(Collectors.toList());
    }

}
