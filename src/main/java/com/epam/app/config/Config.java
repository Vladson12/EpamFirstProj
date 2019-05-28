package com.epam.app.config;

import com.epam.app.dao.DaoFactory;
import com.epam.app.dao.impl.DaoFactorySupplier;
import com.epam.app.model.Book;
import com.epam.app.model.Card;
import com.epam.app.model.User;
import com.epam.app.model.enums.BookState;
import com.epam.app.model.enums.CardState;
import com.epam.app.service.BookService;
import com.epam.app.service.CardService;
import com.epam.app.service.UserService;
import com.epam.app.util.db.DbUtils;

import javax.servlet.ServletContext;
import java.nio.file.FileSystems;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Collection;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import java.util.stream.Collectors;

public class Config {
    private static DaoFactory factory;
    private static boolean isSet = false;

    private Config() {
    }

    public static void set(ServletContext context, String dbName) {
        if (isSet) return;
        isSet = true;
        String separator = FileSystems.getDefault().getSeparator();
        String db = dbName.toLowerCase();
        String dbPropsPath = context.getRealPath(
                "WEB-INF" + separator + "classes" + separator + db + ".properties");
        Config.setDatabase(dbPropsPath);
        DaoFactory factory = new DaoFactorySupplier().apply(db);
        Config.setDaoFactory(factory);
        daemonThread();
    }

    private static void daemonThread(){
        Timer timer = new Timer ();
        TimerTask hourlyTask = new TimerTask () {
            @Override
            public void run () {
                List<User> users = UserService.getAllUsers();
                List<Card> overdueCards = users.stream()
                        .map(CardService::getAllCards)
                        .flatMap(Collection::stream)
                        .filter(card -> isOverdue(card.getEndDate()))
                        .collect(Collectors.toList());
                for (Card cards: overdueCards)
                    if (cards.getCardState().equals(CardState.AT_HOME) || cards.getCardState().equals(CardState.AT_HALL)) {
                        CardService.updateCardState(cards,CardState.OVERDUE);
                    } else if (cards.getCardState().equals(CardState.ORDERED)){
                        CardService.updateCardState(cards,CardState.RETURNED);
                        Book book = cards.getBook();
                        book.setBookState(BookState.FREE);
                        BookService.updateBook(book);
                    }
            }};

        Thread th = new Thread(() -> timer.schedule (hourlyTask, 0L, 1000L*60*60*3));
        th.setDaemon(true);
        th.start();
    }

    private static Boolean isOverdue(LocalDate date){
        LocalDate today = LocalDate.now(ZoneId.systemDefault());
        return today.compareTo(date)>=0;
    }

    private static void setDatabase(String dbPropsPath) {
        DbUtils.setPropertiesFile(dbPropsPath);
    }

    private static void setDaoFactory(DaoFactory fact) {
        factory = fact;
    }

    public static DaoFactory getFactory() {
        return factory;
    }
}
