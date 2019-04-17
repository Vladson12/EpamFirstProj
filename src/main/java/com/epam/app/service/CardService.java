package com.epam.app.service;

import com.epam.app.DAO.impl.BookDaoImpl;
import com.epam.app.DAO.impl.DaoFactoryImpl;
import com.epam.app.DAO.impl.UserDaoImpl;
import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;
import com.epam.app.model.enums.CardState;

import java.util.List;
import java.util.stream.Collectors;

public class CardService {

    public void create(Card card) {
        DaoFactoryImpl.getInstance().getCardDAO().addCard(card);
    }
    public Card get(int id){
        return DaoFactoryImpl.getInstance().getCardDAO().getCard(id);
    }
    public List<Book> getAllBook(User user){
        return DaoFactoryImpl.getInstance().getCardDAO().getAllBookId(user)
                .stream().map(i->new BookDaoImpl().getBook(i)).collect(Collectors.toList());

    }
    public List<User> getAllUser(Book book){
        return DaoFactoryImpl.getInstance().getCardDAO().getAllUserId(book)
                .stream().map(i->new UserDaoImpl().getUser(i)).collect(Collectors.toList());
    }

    public void udateCardState(Card card, CardState cardState){
        DaoFactoryImpl.getInstance().getCardDAO().updateCardStatus(card,cardState);
    }

//    public static void main(String[] args) {
//        User user = DaoFactoryImpl.getInstance().getUserDAO().getUser(1);
//        Book book = DaoFactoryImpl.getInstance().getBookDAO().getBook(3);
//        LocalDate dateS = LocalDate.now();
//        LocalDate dateE = dateS.plusDays(6);
//        Card card = new Card(user,book,dateS,dateS, CardState.AT_HALL);
////        DaoFactoryImpl.getInstance().getCardDAO().addCard(card);
//        System.out.println(new CardService().getAllBook(user));
//    }

}
