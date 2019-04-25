package com.epam.app.DAO.impl;

import com.epam.app.util.db.DbUtils;
import com.epam.app.DAO.UserDAO;
import com.epam.app.model.User;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import static com.epam.app.model.enums.Role.getRole;
import static com.epam.app.util.db.mysql.UserQueryMySql.*;


public class UserDaoMySqlImpl implements UserDAO {

    private ResultSet getAll() {
        ResultSet resultSet = null;
        try (Connection connection = DbUtils.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(SELECT_ALL);){
            resultSet = rs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;

    }

    @Override
    public boolean addUser(User user) {
        try (Connection connection = DbUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT)) {
            statement.setString(1, user.getName());
            statement.setInt(2, user.getRole().ordinal() + 1);
            statement.setString(3, user.getLogin());
            statement.setString(4, user.getPassword());
            int i = statement.executeUpdate();

            if (i != 0)
                return true;
        } catch (
                SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    @Override
    public void updateUser(User user) {
        try (Connection connection = DbUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE);) {
            statement.setString(1, user.getName());
            statement.setInt(2, user.getRole().ordinal() + 1);
            statement.setString(3, user.getLogin());
            statement.setString(4, user.getPassword());
            statement.setInt(4, user.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> getAllUsers(){
        List<User> array= new ArrayList<>();
        try (Connection connection = DbUtils.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(SELECT_ALL);){
            while (rs.next()){
                array.add(new User(rs.getString("name"),
                        getRole(rs.getInt("role")),
                        rs.getString("login"),
                        rs.getString("password")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;

    }

    @Override
    public User getUser(int userId) {
        User user = null;
        try (Connection connection = DbUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT)) {
            statement.setInt(1, userId);
            try (ResultSet rs = statement.executeQuery()) {
                rs.next();
                user = new User(rs.getInt("id"),
                        rs.getString("name"),
                        getRole(rs.getInt("role")),
                        rs.getString("login"),
                        rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;

    }

    @Override
    public User getUserByLogin(String userLogin) {
        User user = null;
        try (Connection connection = DbUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_BY_LOGIN)){
            statement.setString(1,userLogin);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    user = new User(rs.getInt("id"),
                            rs.getString("name"),
                            getRole(rs.getInt("role")),
                            rs.getString("login"),
                            rs.getString("password"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;

    }

    @Override
    public void deleteUser(int userId) {
        try (Connection connection = DbUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE)) {
            statement.setInt(1, userId);
            statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}