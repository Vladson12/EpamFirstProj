package com.epam.app.service;

import com.epam.app.dao.BookDAO;
import com.epam.app.dao.CardDAO;
import com.epam.app.dao.UserDAO;
import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;
import com.epam.app.model.enums.BookState;
import com.epam.app.model.enums.CardState;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import static com.epam.app.dao.impl.ActualDaoFactory.getInstance;
import static com.epam.app.model.enums.CardState.getPriority;

public class CardService {
    private static final CardDAO CARD_DAO = getInstance().getCardDAO();
    private static final BookDAO BOOK_DAO = getInstance().getBookDAO();
    private static final UserDAO USER_DAO = getInstance().getUserDAO();

    private CardService() {
    }

    private static void create(Card card) {
        CARD_DAO.addCard(card);
        updateBookState(card, card.getCardState());
    }

    public static Card get(int id) {
        return CARD_DAO.getCard(id);
    }

    public static List<Book> getAllBooks(User user) {
        return CARD_DAO.getAllBookId(user)
                .stream().map(BOOK_DAO::getBookById).collect(Collectors.toList());
    }

    public static List<Card> getAllCards(User user) {
        return CARD_DAO.getAllCards(user)
                .stream().map(CARD_DAO::getCard).collect(Collectors.toList());
    }

    public static List<User> getAllUsers(Book book) {
        return CARD_DAO.getAllUserId(book)
                .stream().map(USER_DAO::getUser).collect(Collectors.toList());
    }

    public static void updateCardState(Card card, CardState cardState) {
        CARD_DAO.updateCardStatus(card, cardState);
        updateBookState(card, cardState);
    }

    public static void updateCardStatusAndDate(Card card, CardState cardState, LocalDate endDate) {
        CARD_DAO.updateCardStatusAndDate(card, cardState, endDate);
        updateBookState(card, cardState);
    }

    private static void updateBookState(Card card, CardState cardState) {
        Book book = card.getBook();
        BookState newState;

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
                throw new IllegalArgumentException("СardState parameter can't take that value");
        }

        book.setBookState(newState);
        BOOK_DAO.updateBook(book);
    }

    public static void orderBook(String bookId, String userLogin){
        Book book = BookService.getBookById(Integer.parseInt(bookId));
        book.setBookState(BookState.ORDERED);
        BookService.updateBook(book);
        Card card = new Card(UserService.getByLogin(userLogin), book, LocalDate.now(ZoneId.systemDefault()),
                LocalDate.now(ZoneId.systemDefault()).plusDays((long) 7), CardState.ORDERED);
        CardService.create(card);
    }

    public static List<Card> updateCardsOfUser(String login){
        return CardService.getAllCards(UserService.getByLogin(login)).stream()
                .sorted(Comparator.comparingInt(o -> getPriority(o.getCardState()))).collect(Collectors.toList());
    }

    public static Boolean amountOfActiveCards(User user) {
        return CARD_DAO.getAllCards(user)
                .stream().map(CARD_DAO::getCard).filter(o->!o.getCardState().equals(CardState.RETURNED))
                .count()<10;
    }

    public static Boolean haveOverdueCards(User user) {
        return CARD_DAO.getAllCards(user)
                .stream().map(CARD_DAO::getCard).anyMatch(o->o.getCardState().equals(CardState.OVERDUE));
    }
}
