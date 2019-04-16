package com.epam.app.dao.impl;

import com.epam.app.dao.CardDao;
import com.epam.app.model.*;
import com.epam.app.utils.DbUtils;

import java.sql.*;
import java.sql.Date;
import java.util.*;

@SuppressWarnings("All")
public class CardDaoImpl implements CardDao {

    private static String INSERT = "insert into card (user, book, start_date, end_date,is_return) values (?,?,?,?);";
    private static String UPDATE = "update card set is_return = ? where idbook = ?;";
    private static String SELECT_BY_BOOK = "select * from card where book = ?";
    private static String SELECT_BY_USER = "select * from card where user = ?";

    @Override
    public void addCard(Card card) throws SQLException {

        Connection connection = DbUtils.getConnection();
        PreparedStatement statement = connection.prepareStatement(INSERT);
        statement.setInt(1, card.getUser().getId());
        statement.setInt(2, card.getBook().getId());
        statement.setDate(3, (Date) card.getStartDate());
        statement.setDate(4, (Date) card.getEndDate());
        statement.setBoolean(5, card.isReturn());
        statement.executeUpdate();

    }

    @Override
    public List<Book> getAllBooksByUser(User user) throws SQLException {

        Connection connection = DbUtils.getConnection();
        PreparedStatement statement = connection.prepareStatement(SELECT_BY_USER);
        statement.setInt(1,user.getId());
        ResultSet rs = statement.executeQuery();
        List<Book> bookList= new ArrayList<>();
        while (rs.next()){
            bookList.add(new BookDaoImpl().getBook(rs.getInt("book")));
        }
        System.out.println(bookList);
        return bookList;

    }

    @Override
    public List<User> getAllUsersByBook(Book book) throws SQLException {

        Connection connection = DbUtils.getConnection();
        PreparedStatement statement = connection.prepareStatement(SELECT_BY_BOOK);
        statement.setInt(1,book.getId());
        ResultSet rs = statement.executeQuery();
        List<User> userList= new ArrayList<>();
        while (rs.next()){
            userList.add(new UserDaoImpl().getUser(rs.getInt("user")));
        }
        return userList;

    }

    @Override
    public void updateStatus(Card card) throws SQLException {

        Connection connection = DbUtils.getConnection();
        PreparedStatement statement = connection.prepareStatement(UPDATE);
        statement.setInt(1, card.getId());
        statement.setBoolean(6, card.isReturn());
        statement.executeUpdate();
    }
}
