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
public class SqlCardDao implements CardDAO {

    private static final String url = "jdbc:mysql://localhost:3306/library" +
            "?verifyServerCertificate=false"+
            "&useSSL=false"+
            "&requireSSL=false"+
            "&useLegacyDatetimeCode=false"+
            "&amp"+
            "&serverTimezone=UTC";
    private static final String userName = "root";
    private static final String password = "Polina2313";

    private static String insert = "insert into card (user, book, start_date, end_date,is_return) values (?,?,?,?);";
    private static String update = "update card set is_return = ? where idbook = ?;";
    private static String selectByBook = "select * from card where book = ?";
    private static String selectByUser = "select * from card where user = ?";


    @Override
    public void addCard(Card card) {
        try (Connection connection = SQLUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(insert)){
            statement.setInt(1, card.getUser().getId());
            statement.setInt(2, card.getBook().getId());
            statement.setDate(3, (Date) card.getStartDate());
            statement.setDate(4, (Date) card.getEndDate());
            statement.setBoolean(5, card.getReturn());
            statement.executeUpdate();
        } catch (SQLException e) {
            log.info("");
        }
    }

    @Override
    public List<Book> getAllBook(User user){
        List<Book> array= new ArrayList<>();
        try(Connection connection = SQLUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(selectByUser)) {
            statement.setInt(1,user.getId());
            try(ResultSet rs = statement.executeQuery()){
                while (rs.next()){
                    array.add(new SQLBookDAO().getBook(rs.getInt("book")));
                }
            }
        } catch (SQLException e) {
            log.info("");
        }
        return array;
    }

    @Override
    public List<User> getAllUser(Book book) {
        List<User> array= new ArrayList<>();
        try(Connection connection = SQLUtil.getConnection();
            PreparedStatement statement = connection.prepareStatement(selectByBook)) {
            statement.setInt(1,book.getId());
            try(ResultSet rs = statement.executeQuery()){
                while (rs.next()){
                    array.add(new SQLUserDAO().getUser(rs.getInt("user")));
                }
            }
        } catch (SQLException e) {
            log.info("");
        }
        return array;
    }


    @Override
    public void updateCardStatus(Card card) {
        try (Connection connection = SQLUtil.getConnection();
             PreparedStatement statement = connection.prepareStatement(update);){
            statement.setBoolean(1, card.getReturn());
            statement.setInt(2, card.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            log.info("");
        }
    }
}
