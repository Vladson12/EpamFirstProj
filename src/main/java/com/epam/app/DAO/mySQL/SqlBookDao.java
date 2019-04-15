package com.epam.app.DAO.mySQL;

import com.epam.app.DAO.BookDAO;
import com.epam.app.model.Book;

import lombok.Cleanup;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.epam.app.model.BookState.getBookState;

@SuppressWarnings("ALL")
public class SqlBookDao implements BookDAO {

    private static final String url = "jdbc:mysql://localhost:3306/library" +
            "?verifyServerCertificate=false"+
            "&useSSL=false"+
            "&requireSSL=false"+
            "&useLegacyDatetimeCode=false"+
            "&amp"+
            "&serverTimezone=UTC";
    private static final String userName = "root";
    private static final String password = "Polina2313";

    private static String insert = "insert into book (author, title, book_state_id, description) values (?,?,?,?);";
    private static String update = "update book set author = ? , title =? , book_state_id = ? , description = ? where idbook = ?;";
    private static String select = "select * from book where idbook = ?";
    private static String delete = "delete from book where idbook =?";

    @Override
    public List<Book> getAllBooks() throws SQLException {
        ResultSet rs = getAll();
        List<Book> array= new ArrayList<>();
        while (rs.next()){
            array.add(new Book(rs.getString("author"), getBookState(rs.getInt("bookState")), rs.getString("title"), rs.getString("description")));
        }
        return array;
    }

    @Override
    public Book getBook(int bookId) throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup PreparedStatement statement = connection.prepareStatement(select);
        statement.setInt(1,bookId);
        ResultSet rs = statement.executeQuery();
        rs.next();
        return new Book(rs.getString("author"), getBookState(rs.getInt("bookState")), rs.getString("title"), rs.getString("description") );
    }

    @Override
    public void addBook(Book book) throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup PreparedStatement statement = connection.prepareStatement(insert);
        statement.setString(1, book.getAuthor());
        statement.setString(2, book.getTitle());
        statement.setInt(3, book.getBookState().ordinal()+1);
        statement.setString(4, book.getDescription());
        statement.executeUpdate();
    }

    @Override
    public void updateBook(Book book) throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup PreparedStatement statement = connection.prepareStatement(update);
        statement.setString(1, book.getAuthor());
        statement.setString(2, book.getTitle());
        statement.setInt(3, book.getBookState().ordinal()+1);
        statement.setString(4, book.getDescription());
        statement.setInt(5,book.getId());
        statement.executeUpdate();
    }

    @Override
    public void deleteBook(Book book) throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup PreparedStatement statement = connection.prepareStatement(delete);
        statement.setInt(1,book.getId());
        statement.executeUpdate();
    }

    private ResultSet getAll() throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery("select * from book");
        return rs;
    }
}
