package com.mycompany.DAO;

import com.mycompany.model.User;
import lombok.Cleanup;

import java.sql.*;

public class UserDAO {


    private static final String url = "jdbc:mysql://localhost:3306/library";
    private static final String userName = "root";
    private static final String password = "ksusha11";

    public static String createString = "insert into user (name, role, login, password) values (?,?,?,?);";

    public void create (User user) throws SQLException, ClassNotFoundException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup PreparedStatement statement = connection.prepareStatement(createString);
        statement.setString(1, user.getName());
        statement.setInt(2, user.getRole().ordinal()+1);
        statement.setString(3, user.getLogin());
        statement.setString(4, user.getPassword());
        statement.executeUpdate();
    }

    public ResultSet getAll() throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery("select * from user");
        return rs;
    }


}
