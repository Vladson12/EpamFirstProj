package com.epam.app.util.db.mysql;

/**
 * Created by vladd on 23.04.2019
 */
public class BookQueryMySql {

    public static final String insert = "insert into book (author, title, book_state_id, description) values (?,?,?,?);";
    public static final String select = "select * from book where idbook = ?;";
    public static final String selectAll = "select * from book;";
    public static final String update = "update book set author = ? , title = ? , book_state_id = ? , description = ? where idbook = ?;";
    public static final String delete = "delete from book where idbook = ?;";

    private BookQueryMySql() {
    }

}
