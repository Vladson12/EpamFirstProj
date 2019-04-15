package com.epam.app.DAO.mySQL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

class SQLUtil {

    private static final Logger log = LoggerFactory.getLogger(SQLUtil.class);
    private static Connection connection = null;

    public static Connection getConnection() {
        if (connection != null) {
            return connection;
        } else {
            try {
                ResourceBundle bundle = ResourceBundle.getBundle("db");
                String url = bundle.getString("url");
                String user = bundle.getString("user");
                String password = bundle.getString("password");
                connection = DriverManager.getConnection(url, user, password);
            } catch (SQLException e) {
                log.info("");
            }
            return connection;
        }
    }
}



