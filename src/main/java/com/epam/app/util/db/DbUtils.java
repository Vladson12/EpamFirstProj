package com.epam.app.util.db;

import lombok.extern.log4j.Log4j;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

@Log4j
public class DbUtils {
    private static final BasicDataSource DATA_SOURCE = new BasicDataSource();
    private static final Properties properties = new Properties();

    static {
        DATA_SOURCE.setInitialSize(100);
        DATA_SOURCE.setMinIdle(5);
        DATA_SOURCE.setMaxIdle(10);
        DATA_SOURCE.setMaxOpenPreparedStatements(100);
    }

    private DbUtils() {
    }

    public static void setPropertiesFile(String dbPropsFile) {

        try (FileInputStream is = new FileInputStream(dbPropsFile)) {
            properties.load(is);
        } catch (FileNotFoundException e) {
            log.error("Can't load properties! File not found! " + e);
        } catch (IOException e) {
            log.error("Can't load properties! " + e);
        }
        setProperties();
    }

    private static void setProperties() {
        try {
            Class.forName(properties.getProperty("driver"));
        } catch (ClassNotFoundException e) {
            log.error("Failed set properties! " + e);
        }

        DATA_SOURCE.setUrl(properties.getProperty("url"));
        DATA_SOURCE.setUsername(properties.getProperty("user"));
        DATA_SOURCE.setPassword(properties.getProperty("password"));
    }

    public static Connection getConnection() throws SQLException {
        return DATA_SOURCE.getConnection();
    }
}
