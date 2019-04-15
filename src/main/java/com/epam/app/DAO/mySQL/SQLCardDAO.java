package com.epam.app.DAO.mySQL;

import com.epam.app.DAO.CardDAO;
import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;
import lombok.Cleanup;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("ALL")
public class SQLCardDAO implements CardDAO {

    private static final String url = "jdbc:mysql://localhost:3306/library";
    private static final String userName = "root";
    private static final String password = "ksusha11";

    private static String insert = "insert into card (user, book, start_date, end_date,is_return) values (?,?,?,?);";
    private static String update = "update card set is_return = ? where idbook = ?;";
    private static String selectByBook = "select * from card where book = ?";
    private static String selectByUser = "select * from card where user = ?";


    @Override
    public void addCard(Card card) throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup PreparedStatement statement = connection.prepareStatement(insert);
        statement.setInt(1, card.getUser().getId());
        statement.setInt(2, card.getBook().getId());
        statement.setDate(3, (Date) card.getStartDate());
        statement.setDate(4, (Date) card.getEndDate());
        statement.setBoolean(5, card.getReturn());
        statement.executeUpdate();
    }

    @Override
    public List<Book> getAllBook(User user) throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup PreparedStatement statement = connection.prepareStatement(selectByUser);
        statement.setInt(1,user.getId());
        ResultSet rs = statement.executeQuery();
        List<Book> array= new ArrayList<>();
        while (rs.next()){
            array.add(new SQLBookDAO().getBook(rs.getInt("book")));
        }
        return array;
    }

    @Override
    public List<User> getAllUser(Book book) throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup PreparedStatement statement = connection.prepareStatement(selectByBook);
        statement.setInt(1,book.getId());
        ResultSet rs = statement.executeQuery();
        List<User> array= new ArrayList<>();
        while (rs.next()){
            array.add(new SQLUserDAO().getUser(rs.getInt("user")));
        }
        return array;
    }


    @Override
    public void updateCardStatus(Card card) throws SQLException {
        @Cleanup Connection connection = DriverManager.getConnection(url, userName, password);
        @Cleanup PreparedStatement statement = connection.prepareStatement(update);
        statement.setBoolean(1, card.getReturn());
        statement.setInt(2, card.getId());
        statement.executeUpdate();
    }
}
