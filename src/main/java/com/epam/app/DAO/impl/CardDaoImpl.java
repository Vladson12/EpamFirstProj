package com.epam.app.DAO.impl;

import com.epam.app.DAO.CardDAO;
import com.epam.app.model.enums.CardState;
import com.epam.app.util.ConnectionManager;
import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("ALL")
public class CardDaoImpl implements CardDAO {


    private static String insert = "insert into card (user, book, start_date, end_date,card_state) values (?,?,?,?,?);";
    private static String update = "update card set card_state = ? where idhome_card = ?;";
    private static String selectByBook = "select * from card where book = ?";
    private static String selectByUser = "select * from card where user = ?";
    private static String select = "select * from card where idhome_card = ?";



    @Override
    public void addCard(Card card) {
        try (Connection connection = ConnectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(insert)){
            statement.setInt(1, card.getUser().getId());
            statement.setInt(2, card.getBook().getId());
            statement.setObject(3, card.getStartDate());
            statement.setObject(4, card.getEndDate());
            statement.setInt(5, card.getCardState().ordinal()+1);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
//            log.info("");
        }
    }

    @Override
    public Card getCard(int id) {
        Card card = null;
        try (Connection connection = ConnectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(select)){
            statement.setInt(1,id);
            try (ResultSet rs = statement.executeQuery()) {
                rs.next();
                card = createCard(id,rs.getInt("user"),rs.getInt("book"),rs.getDate("start_date"),
                        rs.getDate("end_date"),rs.getInt("card_state"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return card;
    }

    private Card createCard(int id, int user,int book,java.sql.Date start, java.sql.Date end,int state){
        return new Card(id,DaoFactoryImpl.getInstance().getUserDAO().getUser(user),
                DaoFactoryImpl.getInstance().getBookDAO().getBook(book),start.toLocalDate(),end.toLocalDate(),CardState.getCardState(state));
    }

    @Override
    public List<Integer> getAllBookId(User user){
        List<Integer> arrayOfId= new ArrayList<>();
        try(Connection connection = ConnectionManager.getConnection();
            PreparedStatement statement = connection.prepareStatement(selectByUser);) {
            statement.setInt(1,user.getId());
            try(ResultSet rs = statement.executeQuery();){
                while (rs.next()) {
                    arrayOfId.add(rs.getInt("book"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
//            log.info("");
        }
        return  arrayOfId;
    }

    @Override
    public List<Integer> getAllUserId(Book book) {
        List<Integer> arrayOfId= new ArrayList<>();
        try(Connection connection = ConnectionManager.getConnection();
            PreparedStatement statement = connection.prepareStatement(selectByBook);) {
            statement.setInt(1,book.getId());
            try(ResultSet rs = statement.executeQuery();){
                while (rs.next()) {
                    arrayOfId.add(rs.getInt("user"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
//            log.info("");
        }
        return arrayOfId;
    }

    @Override
    public List<Integer> getAllCards(User user) {
        List<Integer> arrayOfIdCard= new ArrayList<>();
        try(Connection connection = ConnectionManager.getConnection();
            PreparedStatement statement = connection.prepareStatement(selectByUser);) {
            statement.setInt(1,user.getId());
            try(ResultSet rs = statement.executeQuery();){
                while (rs.next()) {
                    arrayOfIdCard.add(rs.getInt("idhome_card"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
//            log.info("");
        }
        return  arrayOfIdCard;
    }

    @Override
    public void updateCardStatus(Card card, CardState cardState) {
        try (Connection connection = ConnectionManager.getConnection();
             PreparedStatement statement = connection.prepareStatement(update);){
            statement.setInt(1, cardState.ordinal()+1);
            statement.setInt(2, card.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
//            log.info("");
        }
    }
}
