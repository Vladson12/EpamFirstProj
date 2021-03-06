package com.epam.app.DAO.impl;

import com.epam.app.util.ConnectionManager;
import com.epam.app.DAO.UserDAO;
import com.epam.app.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import static com.epam.app.model.enums.Role.getRole;


public class UserDaoImpl implements UserDAO {

    private static String insert = "insert into user (name, role, login, password) values (?,?,?,?);";
    private static String update = "update user set name = ? , role =? , login = ? , password = ? where id = ?;";
    private static String select = "select * from user where id = ?";
    private static String selectByLogin = "select * from user where login = ?";
    private static String delete = "delete * from user where id = ?";


    private ResultSet getAll() {
        ResultSet resultSet =null;
        try (Connection connection = ConnectionManager.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("select * from user");){
            resultSet = rs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }



    @Override
    public boolean addUser(User user) {
        try (Connection connection = ConnectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(insert)) {
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
        try (Connection connection = ConnectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(update);) {
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
    public List<User> getAllUser(){
        List<User> array= new ArrayList<>();
        try (Connection connection = ConnectionManager.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("select * from user");){
            while (rs.next()){
                array.add(new User(rs.getString("name"), getRole(rs.getInt("role")),rs.getString("login"), rs.getString("password")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    @Override
    public User getUser(int userId) {
        User user = null;
        try (Connection connection = ConnectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(select)) {
            statement.setInt(1, userId);
            try (ResultSet rs = statement.executeQuery()) {
                rs.next();
                user = new User(rs.getInt("id"), rs.getString("name"), getRole(rs.getInt("role")), rs.getString("login"), rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public User getUserByLogin(String userLogin) {
        User user = null;
        try (Connection connection = ConnectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(selectByLogin)){
            statement.setString(1,userLogin);
            try (ResultSet rs = statement.executeQuery()) {
                rs.next();
                user =new  User(rs.getInt("id"),rs.getString("name"), getRole(rs.getInt("role")),rs.getString("login"), rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void deleteUser(int userId) {
        try (Connection connection = ConnectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(delete)) {
            statement.setInt(1, userId);
            statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }



}