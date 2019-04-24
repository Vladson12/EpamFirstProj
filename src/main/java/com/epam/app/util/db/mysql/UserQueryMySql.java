package com.epam.app.util.db.mysql;

/**
 * Created by vladd on 23.04.2019
 */
public class UserQueryMySql {

    public static final String insert = "insert into user (name, role, login, password) values (?,?,?,?);";
    public static final String select = "select * from user where id = ?;";
    public static final String selectByLogin = "select * from user where login = ?;";
    public static final String selectAll = "select * from user;";
    public static String update = "update user set name = ? , role =? , login = ? , password = ? where id = ?;";
    public static String delete = "delete * from user where id = ?;";

    private UserQueryMySql() {
    }
}
