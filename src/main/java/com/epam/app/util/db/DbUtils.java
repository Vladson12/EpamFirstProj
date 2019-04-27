package com.epam.app.util.db;

import org.apache.commons.dbcp2.BasicDataSource;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class DbUtils {

    private static final BasicDataSource DATA_SOURCE = new BasicDataSource();
    private static final Properties properties = new Properties();

    static {
        DATA_SOURCE.setInitialSize(100);
        DATA_SOURCE.setMinIdle(5);
        DATA_SOURCE.setMaxIdle(10);
        DATA_SOURCE.setMaxOpenPreparedStatements(100);
    }

    public static void setPropertiesFile(String dbPropsFile) {

        try (FileInputStream is = new FileInputStream(dbPropsFile)) {
            properties.load(is);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            System.err.println("Can't load properties!");
        }

        System.out.println("PROPS DRIVER: " + properties.getProperty("driver"));
        System.out.println("PROPS URL: " + properties.getProperty("url"));
        System.out.println("PROPS USER: " + properties.getProperty("user"));
        System.out.println("PROPS PASSWORD: " + properties.getProperty("password"));
        setProperties();
    }

    private static void setProperties() {
        try {
            Class.forName(properties.getProperty("driver"));
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        DATA_SOURCE.setUrl(properties.getProperty("url"));
        DATA_SOURCE.setUsername(properties.getProperty("user"));
        DATA_SOURCE.setPassword(properties.getProperty("password"));
    }

    public static Connection getConnection() throws SQLException {
        return DATA_SOURCE.getConnection();
    }
}
