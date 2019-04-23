package com.epam.app.DAO.impl;

import com.epam.app.DAO.CardDAO;
import com.epam.app.model.enums.CardState;
import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;
import com.epam.app.util.db.DbUtils;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static com.epam.app.DAO.impl.DaoFactoryImpl.*;
import static com.epam.app.model.enums.CardState.*;
import static com.epam.app.util.db.DbUtils.*;

public class CardDaoMySqlImpl implements CardDAO {


    private static String insert = "insert into card (user, book, start_date, end_date,card_state) values (?,?,?,?,?);";
    private static String update = "update card set card_state = ? where idhome_card = ?;";
    private static String updateDate = "update card set card_state = ? , end_date=? where idhome_card = ?;";
    private static String selectByBook = "select * from card where book = ?";
    private static String selectByUser = "select * from card where user = ?";
    private static String select = "select * from card where idhome_card = ?";


    @Override
    public void addCard(Card card) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(insert)) {
            statement.setInt(1, card.getUser().getId());
            statement.setInt(2, card.getBook().getId());
            statement.setObject(3, card.getStartDate());
            statement.setObject(4, card.getEndDate());
            statement.setInt(5, card.getCardState().ordinal() + 1);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Card getCard(int id) {
        Card card = null;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(select)) {
            statement.setInt(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                rs.next();
                card = createCard(id, rs.getInt("user"), rs.getInt("book"), rs.getDate("start_date"),
                        rs.getDate("end_date"), rs.getInt("card_state"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return card;
    }

    private Card createCard(int id, int userId, int bookId, Date start, Date end, int state) {
        User user = getInstance().getUserDAO("mysql").getUser(userId);
        Book book = getInstance().getBookDAO("mysql").getBook(bookId);
        return new Card(id, user, book, start.toLocalDate(), end.toLocalDate(), getCardState(state));
    }

    @Override
    public List<Integer> getAllBookId(User user) {
        List<Integer> IdBookList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(selectByUser)) {
            statement.setInt(1, user.getId());
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    IdBookList.add(rs.getInt("book"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return IdBookList;
    }

    @Override
    public List<Integer> getAllUserId(Book book) {
        List<Integer> userIdList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(selectByBook)) {
            statement.setInt(1, book.getId());
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    userIdList.add(rs.getInt("user"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userIdList;
    }

    @Override
    public List<Integer> getAllCards(User user) {
        List<Integer> arrayOfIdCard= new ArrayList<>();
        try(Connection connection = getConnection();
            PreparedStatement statement = connection.prepareStatement(selectByUser)) {
            statement.setInt(1,user.getId());
            try(ResultSet rs = statement.executeQuery()){
                while (rs.next()) {
                    arrayOfIdCard.add(rs.getInt("idhome_card"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  arrayOfIdCard;
    }

    @Override
    public void updateCardStatus(Card card, CardState cardState) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(update)) {
            statement.setInt(1, cardState.ordinal() + 1);
            statement.setInt(2, card.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateCardStatusAndDate(Card card, CardState cardState, LocalDate endDate) {
        try (Connection connection = DbUtils.getConnection();
             PreparedStatement statement = connection.prepareStatement(updateDate);){
            statement.setInt(1, cardState.ordinal()+1);
            statement.setDate(2, Date.valueOf(endDate));
            statement.setInt(3, card.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
//            log.info("");
        }
    }
}
