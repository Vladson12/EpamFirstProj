package com.epam.app.service;

import com.epam.app.DAO.impl.UserDaoImpl;
import com.epam.app.model.User;

import java.sql.SQLException;

public class UserService {
//    protected final Logger log = LoggerFactory.getLogger(getClass());


    public void create(User user) throws SQLException, ClassNotFoundException {
//        log.info("get {}");
        new UserDaoImpl().addUser(user);
    }

    //get by roles,
//    public ArrayList<String> getName(){
//
//        return null;
//    }


}
