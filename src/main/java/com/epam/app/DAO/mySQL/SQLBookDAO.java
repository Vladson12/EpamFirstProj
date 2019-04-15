package com.epam.app.DAO.mySQL;

import com.epam.app.DAO.BookDAO;
import com.epam.app.model.Book;

import com.epam.app.model.BookState;
import lombok.Cleanup;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import static com.epam.app.model.BookState.getBookState;

@SuppressWarnings("ALL")
public class SQLBookDAO implements BookDAO {

    private  final Logger log = LoggerFactory.getLogger(getClass());

    private static String insert = "insert into book (author, title, book_state_id, description) values (?,?,?,?);";
    private static String update = "update book set author = ? , title =? , book_state_id = ? , description = ? where idbook = ?;";
    private static String select = "select * from book where idbook = ?";
    private static String delete = "delete from book where idbook =?";


    @Override
    public List<Book> getAllBooks() {
        List<Book> array= new ArrayList<>();
        try(ResultSet rs = getAll()){
            while (rs.next()){
                array.add(new Book(rs.getString("author"), getBookState(rs.getInt("book_state_id")), rs.getString("title"), rs.getString("description")));
            }
        } catch (SQLException e) {
            log.info("");
        }
        return array;
    }

    @Override
    public Book getBook(int bookId)  {
        Book book = null;
        try (Connection connection = SQLUtil.getConnection();
                PreparedStatement statement = connection.prepareStatement(select)){
            statement.setInt(1,bookId);
            try (ResultSet rs = statement.executeQuery()) {
                rs.next();
                book = new Book(rs.getString("author"), getBookState(rs.getInt("book_state_id")), rs.getString("title"), rs.getString("description") );
            }
        } catch (SQLException e) {
            log.info("");
        }
        return book;
    }

    @Override
    public void addBook(Book book) {
        try (Connection connection = SQLUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(insert)){
            statement.setString(1, book.getAuthor());
            statement.setString(2, book.getTitle());
            statement.setInt(3, book.getBookState().ordinal()+1);
            statement.setString(4, book.getDescription());
            statement.executeUpdate();
        } catch (SQLException e) {
            log.info("");
        }
    }

    @Override
    public void updateBook(Book book) {
        try (Connection connection = SQLUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(update);){
            statement.setString(1, book.getAuthor());
            statement.setString(2, book.getTitle());
            statement.setInt(3, book.getBookState().ordinal()+1);
            statement.setString(4, book.getDescription());
            statement.setInt(5,book.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            log.info("");
        }
    }

    @Override
    public void deleteBook(Book book) {
        try (Connection connection = SQLUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(delete);){
            statement.setInt(1,book.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            log.info("");
        }
    }

    private ResultSet getAll() throws SQLException {
        ResultSet resultSet =null;
        try (Connection connection = SQLUtil.getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("select * from book");){
            resultSet = rs;
        } catch (SQLException e) {
            log.info("");
        }
        return resultSet;
    }

}
