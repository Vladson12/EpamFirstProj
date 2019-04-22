package com.epam.app.DAO.impl;

import com.epam.app.DAO.BookDAO;
import com.epam.app.model.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.epam.app.model.enums.BookState.getBookState;
import static com.epam.app.util.ConnectionManager.*;

public class BookDaoImpl implements BookDAO {

    private static String insert = "insert into book (author, title, book_state_id, description) values (?,?,?,?);";
    private static String update = "update book set author = ? , title =? , book_state_id = ? , description = ? where idbook = ?;";
    private static String select = "select * from book where idbook = ?";
    private static String delete = "delete from book where idbook =?";

    @Override
    public List<Book> getAllBooks() {
        List<Book> array = new ArrayList<>();
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("select * from book")) {
            while (rs.next()) {
                array.add(new Book(rs.getInt("idbook"), rs.getString("author"), getBookState(rs.getInt("book_state_id")), rs.getString("title"), rs.getString("description")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    @Override
    public Book getBook(int bookId) {
        Book book = null;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(select)) {
            statement.setInt(1, bookId);
            try (ResultSet rs = statement.executeQuery()) {
                rs.next();
                book = new Book(rs.getInt("idbook"), rs.getString("author"), getBookState(rs.getInt("book_state_id")), rs.getString("title"), rs.getString("description"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    @Override
    public void addBook(Book book) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(insert)) {
            statement.setString(1, book.getAuthor());
            statement.setString(2, book.getTitle());
            statement.setInt(3, book.getBookState().ordinal() + 1);
            statement.setString(4, book.getDescription());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateBook(Book book) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(update)) {
            statement.setString(1, book.getAuthor());
            statement.setString(2, book.getTitle());
            statement.setInt(3, book.getBookState().ordinal() + 1);
            statement.setString(4, book.getDescription());
            statement.setInt(5, book.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteBook(Book book) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(delete)) {
            statement.setInt(1, book.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private ResultSet getAll() throws SQLException {
        ResultSet resultSet = null;
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("select * from book")) {
            resultSet = rs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

}