package com.epam.app.dao.impl;

import com.epam.app.dao.UserDAO;
import com.epam.app.model.User;
import com.epam.app.util.db.DbUtils;
import lombok.extern.log4j.Log4j;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.epam.app.model.enums.Role.getRole;
import static com.epam.app.util.db.mysql.UserQueryMySql.*;

@Log4j
public class UserDaoMySqlImpl implements UserDAO {
    private ResultSet getAll() {
        ResultSet resultSet = null;
        try (Connection connection = DbUtils.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(SELECT_ALL)) {
            resultSet = rs;
        } catch (SQLException e) {
            log.error("Failed getAll " + e);
        }
        return resultSet;
    }

    @Override
    public void addUser(User user) {
        try (Connection connection = DbUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT)) {
            statement.setString(1, user.getName());
            statement.setInt(2, user.getRole().ordinal() + 1);
            statement.setString(3, user.getLogin());
            statement.setString(4, user.getPassword());
            statement.executeUpdate();

        } catch (
                SQLException e) {
            log.error("Failed add user " + e);
        }
    }

    @Override
    public void updateUser(User user) {
        try (Connection connection = DbUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE)) {
            statement.setString(1, user.getName());
            statement.setInt(2, user.getRole().ordinal() + 1);
            statement.setString(3, user.getLogin());
            statement.setString(4, user.getPassword());
            statement.setInt(5, user.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            log.error("Failed update user " + e);
        }
    }

    @Override
    public List<User> getAllUsers() {
        List<User> array = new ArrayList<>();
        try (Connection connection = DbUtils.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(SELECT_ALL)) {
            while (rs.next()) {
                array.add(new User(rs.getInt("id"),rs.getString("name"),
                        getRole(rs.getInt("role")),
                        rs.getString("login"),
                        rs.getString("password")));
            }
        } catch (SQLException e) {
            log.error("Failed get all users " + e);
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
            log.error("Failed get user by ID " + e);
        }
        return user;
    }

    @Override
    public User getUserByLogin(String userLogin) {
        User user = null;
        try (Connection connection = DbUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_BY_LOGIN)) {
            statement.setString(1, userLogin);
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
            log.error("Failed get user by login " + e);
        }
        return user;
    }

    @Override
    public void deleteUser(int userId) {
        try (Connection connection = DbUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE)) {
            statement.setInt(1, userId);
            statement.executeUpdate();
        } catch (SQLException e) {
            log.error("Failed delete user " + e);
        }
    }
}