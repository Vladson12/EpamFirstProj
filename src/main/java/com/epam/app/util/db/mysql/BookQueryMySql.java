package com.epam.app.util.db.mysql;

public class BookQueryMySql {
    public static final String INSERT = "INSERT into book (author, title, book_state_id, description, year, genre) values (?,?,?,?,?,?);";
    public static final String SELECT = "SELECT * from book where idbook = ?;";
    public static final String SELECT_All = "SELECT * from book;";
    public static final String UPDATE = "UPDATE book set author = ? , title = ? , book_state_id = ? , description = ? , year = ? , genre = ? where idbook = ?;";
    public static final String DELETE = "DELETE from book where idbook = ?;";
    public static final String SELECT_BY_AUTHOR = "SELECT * from book where author = ?;";

    private BookQueryMySql() {
    }
}
