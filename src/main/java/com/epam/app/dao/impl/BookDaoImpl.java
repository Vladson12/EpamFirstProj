package com.epam.app.dao.impl;

import com.epam.app.dao.BookDao;
import com.epam.app.model.*;
import com.epam.app.model.emuns.BookState;
import com.epam.app.utils.DbUtils;

import java.sql.*;
import java.util.*;

@SuppressWarnings("All")
public class BookDaoImpl implements BookDao {

    private static String INSERT = "insert into book (author, title, book_state_id, description) values (?,?,?,?);";
    private static String UPDATE = "update book set author = ? , title =? , book_state_id = ? , description = ? where idbook = ?;";
    private static String SELECT = "select * from book where idbook = ?";
    private static String SELECT_ALL = "select * from book";
    private static String DELETE = "delete from book where idbook =?";

    @Override
    public List<Book> getAllBooks() throws SQLException {
        List<Book> bookList = new ArrayList<>();
        try (Connection connection = DbUtils.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(SELECT_ALL);){
            while (rs.next()){
                bookList.add(new Book(rs.getString("author"),
                        BookState.get(rs.getInt("book_state_id")),
                        rs.getString("title"), rs.getString("description")));
            }
        } catch (SQLException e){
        }
        return bookList;
    }

    @Override
    public Book getBook(int bookId) throws SQLException {

        Connection connection = DbUtils.getConnection();
        PreparedStatement statement = connection.prepareStatement(SELECT);
        statement.setInt(1, bookId);
        ResultSet rs = statement.executeQuery();
        rs.next();
        return new Book(rs.getString("author"), BookState.get(rs.getInt("bookState")),
                rs.getString("title"), rs.getString("description") );
    }

    @Override
    public void addBook(Book book) throws SQLException {

        Connection connection = DbUtils.getConnection();
        PreparedStatement statement = connection.prepareStatement(INSERT);
        statement.setString(1, book.getAuthor());
        statement.setString(2, book.getTitle());
        statement.setInt(3, book.getBookState().ordinal() + 1);
        statement.setString(4, book.getDescription());
        statement.executeUpdate();

    }

    @Override
    public void updateBook(Book book) throws SQLException {

        Connection connection = DbUtils.getConnection();
        PreparedStatement statement = connection.prepareStatement(UPDATE);
        statement.setString(1, book.getAuthor());
        statement.setString(2, book.getTitle());
        statement.setInt(3, book.getBookState().ordinal() + 1);
        statement.setString(4, book.getDescription());
        statement.setInt(5, book.getId());
        statement.executeUpdate();

    }

    @Override
    public void deleteBook(Book book) throws SQLException {

        Connection connection = DbUtils.getConnection();
        PreparedStatement statement = connection.prepareStatement(DELETE);
        statement.setInt(1, book.getId());
        statement.executeUpdate();

    }
}
