package com.epam.app.service;

import com.epam.app.DAO.UserDAO;
import com.epam.app.DAO.mySQL.SQLUserDAO;
import com.epam.app.model.Role;
import com.epam.app.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.SQLException;

public class UserService {
    protected final Logger log = LoggerFactory.getLogger(getClass());


    public void create(User user) throws SQLException, ClassNotFoundException {
        log.info("get {}");
        new SQLUserDAO().addUser(user);
    }

    //get by roles,
//    public ArrayList<String> getName(){
//
//        return null;
//    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        User u = new User("Jogdfgdfgdfny", Role.READER, "gtdfgdfgny", "jony123");


        new UserService().create(u);

    }

}
