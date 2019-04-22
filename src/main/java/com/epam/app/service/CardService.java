package com.epam.app.service;

import com.epam.app.DAO.DaoFactory;
import com.epam.app.DAO.impl.BookDaoImpl;
import com.epam.app.DAO.impl.CardDaoImpl;
import com.epam.app.DAO.impl.DaoFactoryImpl;
import com.epam.app.DAO.impl.UserDaoImpl;
import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;
import com.epam.app.model.enums.BookState;
import com.epam.app.model.enums.CardState;
import com.epam.app.util.ConnectionManager;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

public class CardService {

    public void create(Card card) {
        DaoFactoryImpl.getInstance().getCardDAO().addCard(card);
        updateBookState(card,card.getCardState());
    }

    public  Card get(int id){
        return DaoFactoryImpl.getInstance().getCardDAO().getCard(id);
    }

    public  List<Book> getAllBook(User user){
        return DaoFactoryImpl.getInstance().getCardDAO().getAllBookId(user)
                .stream().map(i->new BookDaoImpl().getBook(i)).collect(Collectors.toList());

    }

    public  List<Card> getAllCards(User user){
        return DaoFactoryImpl.getInstance().getCardDAO().getAllCards(user)
                .stream().map(i->new CardDaoImpl().getCard(i)).collect(Collectors.toList());

    }

    public  List<User> getAllUser(Book book){
        return DaoFactoryImpl.getInstance().getCardDAO().getAllUserId(book)
                .stream().map(i->new UserDaoImpl().getUser(i)).collect(Collectors.toList());
    }

    public  void updateCardState(Card card, CardState cardState) {
        DaoFactoryImpl.getInstance().getCardDAO().updateCardStatus(card,cardState);
        updateBookState(card,cardState);
    }

    public void updateCardStatusAndDate(Card card, CardState cardState, LocalDate endDate) {
        DaoFactoryImpl.getInstance().getCardDAO().updateCardStatusAndDate(card,cardState,endDate);
        updateBookState(card,cardState);
    }
//
//    public static void main(String[] args) {
//        Card card = DaoFactoryImpl.getInstance().getCardDAO().getCard(3);
//        new CardService().updateCardState(card,CardState.ORDERED);
//    }
    private void updateBookState(Card card, CardState cardState){
        Book book = card.getBook();
        if (cardState.equals(CardState.ORDERED))
            book.setBookState(BookState.ORDERED);
        else if (cardState.equals(CardState.AT_HALL)||cardState.equals(CardState.AT_HOME))
            book.setBookState(BookState.ONHANDS);
        else if (cardState.equals(CardState.RETURNED))
            book.setBookState(BookState.FREE);
       DaoFactoryImpl.getInstance().getBookDAO().updateBook(book);
    }


}
