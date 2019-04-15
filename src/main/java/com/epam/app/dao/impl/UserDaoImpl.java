package com.epam.app.dao.impl;

import com.epam.app.dao.UserDao;
import com.epam.app.model.*;
import com.epam.app.model.emuns.Role;

import java.sql.*;
import java.util.*;

@SuppressWarnings("All")
public class UserDaoImpl implements UserDao {

    private static final String url = "jdbc:mysql://localhost:3306/library" +
            "?verifyServerCertificate=false"+
            "&useSSL=false"+
            "&requireSSL=false"+
            "&useLegacyDatetimeCode=false"+
            "&amp"+
            "&serverTimezone=UTC";
    private static final String userName = "root";
    private static final String password = "Polina2313";

    private static String INSERT = "insert into user (name, role, login, password) values (?,?,?,?);";
    private static String UPDATE = "update user set name = ? , role =? , login = ? , password = ? where id = ?;";
    private static String SELECT = "select * from user where id = ?";
    private static String SELECT_ALL = "select * from user";

    @Override
    public void addUser(User user) throws SQLException {
        Connection connection = DriverManager.getConnection(url, userName, password);
        PreparedStatement statement = connection.prepareStatement(INSERT);
        statement.setString(1, user.getName());
        statement.setInt(2, user.getRole().ordinal()+1);
        statement.setString(3, user.getLogin());
        statement.setString(4, user.getPassword());
        statement.executeUpdate();

    }

    @Override
    public void updateUser(User user) throws SQLException {
        Connection connection = DriverManager.getConnection(url, userName, password);
        PreparedStatement statement = connection.prepareStatement(UPDATE);
        statement.setString(1, user.getName());
        statement.setInt(2, user.getRole().ordinal()+1);
        statement.setString(3, user.getLogin());
        statement.setString(4, user.getPassword());
        statement.setInt(4, user.getId());
        statement.executeUpdate();
    }

    @Override
    public User getUser(int userId) throws SQLException {
        Connection connection = DriverManager.getConnection(url, userName, password);
        PreparedStatement statement = connection.prepareStatement(SELECT);
        statement.setInt(1,userId);
        ResultSet rs = statement.executeQuery();
        rs.next();
        return new User(rs.getString("name"), Role.get(rs.getInt("role")),rs.getString("login"), rs.getString("password"));
    }

    @Override
    public List<User> getAllUsers() throws SQLException {
        List<User> userList = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection(url, userName, password);
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(SELECT_ALL);) {
            while (rs.next()){
                userList.add(new User(rs.getString("name"), Role.get(rs.getInt("role")),rs.getString("login"), rs.getString("password")));
            }
        } catch (SQLException e) {
        }

        return userList;
    }

}
