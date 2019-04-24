package com.epam.app.service;

import com.epam.app.DAO.impl.BookDaoMySqlImpl;
import com.epam.app.DAO.impl.CardDaoMySqlImpl;
import com.epam.app.DAO.impl.UserDaoMySqlImpl;
import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;
import com.epam.app.model.enums.BookState;
import com.epam.app.model.enums.CardState;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import static com.epam.app.DAO.impl.DaoFactoryImpl.getInstance;

public class CardService {

    public static void create(Card card) {
        getInstance().getCardDAO("mysql").addCard(card);
        updateBookState(card, card.getCardState());
    }

    public static Card get(int id) {
        return getInstance().getCardDAO("mysql").getCard(id);
    }

    public static List<Book> getAllBooks(User user) {
        return getInstance().getCardDAO("mysql").getAllBookId(user)
                .stream().map(i -> new BookDaoMySqlImpl().getBook(i)).collect(Collectors.toList());
    }

    public static List<Card> getAllCards(User user) {
        return getInstance().getCardDAO("mysql").getAllCards(user)
                .stream().map(i -> new CardDaoMySqlImpl().getCard(i)).collect(Collectors.toList());
    }

    public static List<User> getAllUsers(Book book) {
        return getInstance().getCardDAO("mysql").getAllUserId(book)
                .stream().map(i -> new UserDaoMySqlImpl().getUser(i)).collect(Collectors.toList());
    }

    public static void updateCardState(Card card, CardState cardState) {
        getInstance().getCardDAO("mysql").updateCardStatus(card, cardState);
        updateBookState(card, cardState);
    }

    public static void updateCardStatusAndDate(Card card, CardState cardState, LocalDate endDate) {
        getInstance().getCardDAO("mysql").updateCardStatusAndDate(card, cardState, endDate);
        updateBookState(card, cardState);
    }

    private static void updateBookState(Card card, CardState cardState) {
        Book book = card.getBook();
        BookState newState = BookState.FREE;

        switch (cardState) {
            case ORDERED:
                newState = BookState.ORDERED;
                break;
            case AT_HOME:
            case AT_HALL:
                newState = BookState.ONHANDS;
                break;
            case RETURNED:
                newState = BookState.FREE;
                break;
            default:
                throw new IllegalArgumentException("СardState parameter cannot take that value");
        }

        book.setBookState(newState);

        getInstance().getBookDAO("mysql").updateBook(book);
    }


}
