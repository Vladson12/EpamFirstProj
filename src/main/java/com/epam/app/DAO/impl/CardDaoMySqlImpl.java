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

import static com.epam.app.DAO.impl.DaoFactoryMySqlImpl.*;
import static com.epam.app.model.enums.CardState.*;
import static com.epam.app.util.db.DbUtils.*;
import static com.epam.app.util.db.mysql.CardQueryMySql.*;

public class CardDaoMySqlImpl implements CardDAO {

    @Override
    public void addCard(Card card) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT)) {
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
             PreparedStatement statement = connection.prepareStatement(SELECT)) {
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
        User user = getInstance().getUserDAO().getUser(userId);
        Book book = getInstance().getBookDAO().getBook(bookId);
        return new Card(id, user, book, start.toLocalDate(), end.toLocalDate(), getCardState(state));
    }

    @Override
    public List<Integer> getAllBookId(User user) {
        List<Integer> IdBookList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_BY_USER)) {
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
             PreparedStatement statement = connection.prepareStatement(SELECT_BY_BOOK)) {
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
            PreparedStatement statement = connection.prepareStatement(SELECT_BY_USER)) {
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
             PreparedStatement statement = connection.prepareStatement(UPDATE)) {
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
             PreparedStatement statement = connection.prepareStatement(UPDATE_DATE);){
            statement.setInt(1, cardState.ordinal()+1);
            statement.setDate(2, Date.valueOf(endDate));
            statement.setInt(3, card.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
