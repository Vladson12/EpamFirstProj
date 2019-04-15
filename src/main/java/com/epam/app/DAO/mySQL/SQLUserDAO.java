package com.epam.app.DAO.mySQL;

import com.epam.app.DAO.UserDAO;
import com.epam.app.model.User;
import lombok.Cleanup;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import static com.epam.app.model.Role.getRole;


@SuppressWarnings("ALL")
public class SQLUserDAO implements UserDAO {

    private static final String url = "jdbc:mysql://localhost:3306/library?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private static final String userName = "root";
    private static final String password = "root";

    private static String insert = "insert into user (name, role, login, password) values (?,?,?,?);";
    private static String update = "update user set name = ? , role =? , login = ? , password = ? where id = ?;";
    private static String select = "select * from user where id = ?";

    private ResultSet getAll() throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery("select * from user");
        return rs;
    }

    @Override
    public void addUser(User user) throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup PreparedStatement statement = connection.prepareStatement(insert);
        statement.setString(1, user.getName());
        statement.setInt(2, user.getRole().ordinal()+1);
        statement.setString(3, user.getLogin());
        statement.setString(4, user.getPassword());
        statement.executeUpdate();

    }

    @Override
    public void updateUser(User user) throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup PreparedStatement statement = connection.prepareStatement(update);
        statement.setString(1, user.getName());
        statement.setInt(2, user.getRole().ordinal()+1);
        statement.setString(3, user.getLogin());
        statement.setString(4, user.getPassword());
        statement.setInt(4, user.getId());
        statement.executeUpdate();
    }

    @Override
    public List<User> getAllUser() throws SQLException {
        ResultSet rs = getAll();
        List<User> array= new ArrayList<>();
        while (rs.next()){
            array.add( new User(rs.getString("name"), getRole(rs.getInt("role")),rs.getString("login"), rs.getString("password")));
        }
        return array;
    }

    @Override
    public User getUser(int userId) throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup PreparedStatement statement = connection.prepareStatement(select);
        statement.setInt(1,userId);
        ResultSet rs = statement.executeQuery();
        rs.next();
        return new User(rs.getString("name"), getRole(rs.getInt("role")),rs.getString("login"), rs.getString("password"));
    }

}
