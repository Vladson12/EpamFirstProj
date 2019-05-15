package com.epam.app.util.db.mysql;

public class UserQueryMySql {
    public static final String INSERT = "INSERT into user (name, role, login, password) values (?,?,?,?);";
    public static final String SELECT = "SELECT * from user where id = ?;";
    public static final String SELECT_BY_LOGIN = "SELECT * from user where login = ?;";
    public static final String SELECT_ALL = "SELECT * from user;";
    public static final String UPDATE = "UPDATE user set name = ? , role =? , login = ? , password = ? where id = ?;";
    public static final String DELETE = "DELETE from user where id = ?;";

    private UserQueryMySql() {
    }
}
