package com.epam.app.util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

    private static Connection jdbcConnection;

    public static Connection getConnection() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/library?useUnicode=true&useJDBCCompliantTimezoneShift=true&use" +
                            "LegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false", "root", "root");
        }
        return jdbcConnection;
    }
}




