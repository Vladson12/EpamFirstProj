package com.epam.app.DAO.impl;

import com.epam.app.DAO.BookDAO;
import com.epam.app.model.Book;
import com.epam.app.model.enums.Genre;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.epam.app.model.enums.BookState.getBookState;
import static com.epam.app.model.enums.Genre.getGenre;
import static com.epam.app.util.db.DbUtils.*;
import static com.epam.app.util.db.mysql.BookQueryMySql.*;



public class BookDaoMySqlImpl implements BookDAO {

    @Override
    public List<Book> getAllBooks() {
        List<Book> array = new ArrayList<>();
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery(SELECT_All)) {
            while (rs.next()){
                array.add(new Book(rs.getInt("idbook"), rs.getString("author"), getBookState(rs.getInt("book_state_id")),
                        rs.getString("title"), rs.getString("description"), rs.getInt("year"), getGenre(rs.getInt("genre"))));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return array;
    }

    @Override
    public Book getBookById(Integer bookId) {
        Book book = null;
        if (bookId == 0) {
            book = new Book("", "", "", 2019, Genre.DRAMA);
            book.setId(0);
            return book;
        }
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT)) {
            statement.setInt(1, bookId);
            try (ResultSet rs = statement.executeQuery()) {
                rs.next();
                book = new Book(rs.getInt("idbook"),rs.getString("author"), getBookState(rs.getInt("book_state_id")), rs.getString("title"),
                        rs.getString("description"), rs.getInt("year"), getGenre(rs.getInt("genre"))); }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return book;
    }

    @Override
    public void addBook(Book book) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT)) {
            statement.setString(1, book.getAuthor());
            statement.setString(2, book.getTitle());
            statement.setInt(3, book.getBookState().ordinal() + 1);
            statement.setString(4, book.getDescription());
            statement.setInt(5, book.getYear());
            statement.setInt(6, book.getGenre().ordinal() + 1);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateBook(Book book) {
        if (book.getId() == 0) {
            addBook(book);
        } else {
            try (Connection connection = getConnection();
                 PreparedStatement statement = connection.prepareStatement(UPDATE)) {
                statement.setString(1, book.getAuthor());
                statement.setString(2, book.getTitle());
                statement.setInt(3, book.getBookState().ordinal() + 1);
                statement.setString(4, book.getDescription());
                statement.setInt(5, book.getYear());
                statement.setInt(6, book.getGenre().ordinal() + 1);
                statement.setInt(7, book.getId());
                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleteBook(Book book) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE)) {
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
             ResultSet rs = statement.executeQuery(SELECT_All)) {
            resultSet = rs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

}