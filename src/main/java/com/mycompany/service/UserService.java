package com.mycompany.service;

import com.mycompany.DAO.UserDAO;
import com.mycompany.model.Role;
import com.mycompany.model.User;

import java.sql.SQLException;
import java.util.ArrayList;

public class UserService {


    public void create(User user) throws SQLException, ClassNotFoundException {
        new UserDAO().create(user);
    }

    //get by roles,
    public ArrayList<String> getName(){

        return null;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        User u = new User("Jony", Role.READER, "jjony", "jony123");
        new UserService().create(u);

    }

}
