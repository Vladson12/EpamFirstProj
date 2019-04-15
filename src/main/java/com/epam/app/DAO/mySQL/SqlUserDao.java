package com.epam.app.DAO.mySQL;

import com.epam.app.DAO.UserDAO;
import com.epam.app.model.User;
import lombok.Cleanup;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import static com.epam.app.model.Role.getRole;


@SuppressWarnings("ALL")
public class SqlUserDao implements UserDAO {

    private static final String url = "jdbc:mysql://localhost:3306/library" +
            "?verifyServerCertificate=false"+
            "&useSSL=false"+
            "&requireSSL=false"+
            "&useLegacyDatetimeCode=false"+
            "&amp"+
            "&serverTimezone=UTC";
    private static final String userName = "root";
    private static final String password = "Polina2313";

    private static String insert = "insert into user (name, role, login, password) values (?,?,?,?);";
    private static String update = "update user set name = ? , role =? , login = ? , password = ? where id = ?;";
    private static String select = "select * from user where id = ?";

    private ResultSet getAll() {
        ResultSet resultSet =null;
        try (Connection connection = SQLUtil.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("select * from user");){
            resultSet = rs;
        } catch (SQLException e) {
            log.info("");
        }
        return resultSet;
    }

    @Override
    public void addUser(User user){
        try (Connection connection = SQLUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(insert)){
            statement.setString(1, user.getName());
            statement.setInt(2, user.getRole().ordinal()+1);
            statement.setString(3, user.getLogin());
            statement.setString(4, user.getPassword());
            statement.executeUpdate();
        } catch (SQLException e) {
            log.info("");
        }
    }

    @Override
    public void updateUser(User user) {
        try (Connection connection = SQLUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(update);){
            statement.setString(1, user.getName());
            statement.setInt(2, user.getRole().ordinal()+1);
            statement.setString(3, user.getLogin());
            statement.setString(4, user.getPassword());
            statement.setInt(4, user.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            log.info("");
        }
    }

    @Override
    public List<User> getAllUser(){
        List<User> array= new ArrayList<>();
        try(ResultSet rs = getAll()){
            while (rs.next()){
                array.add(new User(rs.getString("name"), getRole(rs.getInt("role")),rs.getString("login"), rs.getString("password")));
            }
        } catch (SQLException e) {
            log.info("");
        }
        return array;
    }

    @Override
    public User getUser(int userId) {
        User user = null;
        try (Connection connection = SQLUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(select)){
            statement.setInt(1,userId);
            try (ResultSet rs = statement.executeQuery()) {
                rs.next();
                user =new  User(rs.getString("name"), getRole(rs.getInt("role")),rs.getString("login"), rs.getString("password"));
            }
        } catch (SQLException e) {
            log.info("");
        }
        return user;
    }

}
