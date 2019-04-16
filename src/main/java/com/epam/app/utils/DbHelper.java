package com.epam.app.utils;

import com.mysql.cj.jdbc.Driver;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Locale;
import java.util.Properties;
import java.util.ResourceBundle;

/**
 * Created by vladd on 16.04.2019
 */
public class DbHelper {

    private static final BasicDataSource DATA_SOURCE = new BasicDataSource();

    static {

        Properties property = new Properties();

        try (FileInputStream fis = new FileInputStream("src/main/resources/mysql.properties")) {
            property.load(fis);

            String driver = property.getProperty("driver");
            String user = property.getProperty("user");
            String url = property.getProperty("url");
            String password = property.getProperty("password");

        } catch (FileNotFoundException e) {
            System.err.println("Can't access file!");
        } catch (IOException e) {
            System.err.println("Can't load properties!");
        }

//        DATA_SOURCE.setDriver();
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
