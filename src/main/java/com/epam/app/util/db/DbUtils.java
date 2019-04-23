package com.epam.app.util.db;

import org.apache.commons.dbcp2.BasicDataSource;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by vladd on 23.04.2019
 */
public class DbUtils {

    private static final BasicDataSource DATA_SOURCE = new BasicDataSource();

    static {

        Properties property = new Properties();

        try (FileInputStream fis = new FileInputStream("D:\\IdeaProjects\\EpamFirstProj\\src\\main\\resources\\mysql.properties")) {
            property.load(fis);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            System.err.println("Can't load properties!");
        }

        try {
            Class.forName(property.getProperty("driver"));
//            DATA_SOURCE.setDriver(DriverManager.getDriver((property.getProperty("driver"))));
//        } catch (SQLException e) {
//            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        DATA_SOURCE.setUrl(property.getProperty("url"));
        DATA_SOURCE.setUsername(property.getProperty("user"));
        DATA_SOURCE.setPassword(property.getProperty("password"));
        DATA_SOURCE.setInitialSize(100);
        DATA_SOURCE.setMinIdle(5);
        DATA_SOURCE.setMaxIdle(10);
        DATA_SOURCE.setMaxOpenPreparedStatements(100);
    }

    public static Connection getConnection() throws SQLException {
        return DATA_SOURCE.getConnection();
    }
}
