package com.epam.app.utils;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ResourceBundle;

/**
 * Created by vladd on 16.04.2019
 */
public class DbUtils {

    private static final BasicDataSource DATA_SOURCE = new BasicDataSource();
    private static final ResourceBundle RESOURCE_BUNDLE = ResourceBundle.getBundle("db");

    static {
        DATA_SOURCE.setUrl(RESOURCE_BUNDLE.getString("url"));
        DATA_SOURCE.setUsername(RESOURCE_BUNDLE.getString("root"));
        DATA_SOURCE.setPassword(RESOURCE_BUNDLE.getString("password"));
        DATA_SOURCE.setMinIdle(5);
        DATA_SOURCE.setMaxIdle(10);
        DATA_SOURCE.setMaxOpenPreparedStatements(100);
    }

    private DbUtils() {
    }

    public static Connection getConnection() throws SQLException {
        return DATA_SOURCE.getConnection();
    }
}
