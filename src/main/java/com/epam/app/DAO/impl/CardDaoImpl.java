package com.epam.app.DAO.impl;

import com.epam.app.DAO.CardDAO;
import com.epam.app.util.ConnectionManager;
import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("ALL")
public class CardDaoImpl implements CardDAO {


    private static String insert = "insert into card (user, book, start_date, end_date,is_return) values (?,?,?,?);";
    private static String update = "update card set is_return = ? where idbook = ?;";
    private static String selectByBook = "select * from card where book = ?";
    private static String selectByUser = "select * from card where user = ?";


    @Override
    public void addCard(Card card) {
        try (Connection connection = ConnectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(insert)){
            statement.setInt(1, card.getUser().getId());
            statement.setInt(2, card.getBook().getId());
            statement.setDate(3, (Date) card.getStartDate());
            statement.setDate(4, (Date) card.getEndDate());
            statement.setBoolean(5, card.getIsReturn());
            statement.executeUpdate();
        } catch (SQLException e) {
//            log.info("");
        }
    }

    @Override
    public List<Book> getAllBook(User user){
        List<Book> array= new ArrayList<>();
        try(Connection connection = ConnectionManager.getConnection();
            PreparedStatement statement = connection.prepareStatement(selectByUser)) {
            statement.setInt(1,user.getId());
            try(ResultSet rs = statement.executeQuery()){
                while (rs.next()){
                    array.add(new BookDaoImpl().getBook(rs.getInt("book")));
                }
            }
        } catch (SQLException e) {
//            log.info("");
        }
        return array;
    }

    @Override
    public List<User> getAllUser(Book book) {
        List<User> array= new ArrayList<>();
        try(Connection connection = ConnectionManager.getConnection();
            PreparedStatement statement = connection.prepareStatement(selectByBook)) {
            statement.setInt(1,book.getId());
            try(ResultSet rs = statement.executeQuery()){
                while (rs.next()){
                    array.add(new UserDaoImpl().getUser(rs.getInt("user")));
                }
            }
        } catch (SQLException e) {
//            log.info("");
        }
        return array;
    }


    @Override
    public void updateCardStatus(Card card) {
        try (Connection connection = ConnectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(update);){
            statement.setBoolean(1, card.getIsReturn());
            statement.setInt(2, card.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
//            log.info("");
        }
    }
}
