package com.epam.app.service;

import com.epam.app.DAO.BookDAO;
import com.epam.app.model.Book;
import com.epam.app.model.enums.BookState;
import com.epam.app.util.PageManager;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static com.epam.app.DAO.impl.ActualDaoFactory.getInstance;

public class BookService {

    public static final BookDAO BOOK_DAO = getInstance().getBookDAO();

    public static void addBook(Book book) {
        BOOK_DAO.addBook(book);
    }

    public static Book getBookById(int id) {
        return BOOK_DAO.getBookById(id);
    }

    public static Book getBookByAuthor(String author) {
        return BOOK_DAO.getBookByAuthor(author);
    }

    public static List<Book> getAllBooks() {
        return BOOK_DAO.getAllBooks();
    }

    public static void updateBook(Book book) {
        BOOK_DAO.updateBook(book);
    }

    public static List<Book> updateBookList(PageManager pageManager) {
        return pageManager.sublist(BookService.getAllBooks().stream().
                filter(o -> o.getBookState().equals(BookState.FREE))
                .collect(Collectors.toList()));
    }

    public static List<Book> getByContextAndGenre(String context, String genre) {
        return BookService.getAllBooks().stream().filter(predicateContext(context))
                .filter(predicateGenre(genre)).collect(Collectors.toList());
    }

    public static List<Book> getByContext(String context) {
        Predicate<Book> containsAuthor = o -> containsIgnoreCase(o.getAuthor(), context);
        Predicate<Book> containsTitle = o -> containsIgnoreCase(o.getTitle(), context);
        List<Book> allBooks = BookService.getAllBooks().
                stream().filter(containsAuthor.or(containsTitle)).collect(Collectors.toList());
        if (allBooks.isEmpty()) {
            return new ArrayList<>();
        } else {
            return allBooks;
        }
    }

    public static List<Book> getByTitle(String title) {
        return BookService.getAllBooks().
                stream().filter(predicateContext(title)).collect(Collectors.toList());
    }

    public static List<Book> getByGenre(String genre) {
        return BookService.getAllBooks().
                stream().filter(predicateGenre(genre)).collect(Collectors.toList());
    }

    private static Predicate<Book> predicateContext(String context) {
        Predicate<Book> containsAuthor = o -> containsIgnoreCase(o.getAuthor(), context);
        Predicate<Book> containsName = o -> containsIgnoreCase(o.getTitle(), context);
        return containsAuthor.or(containsName);
    }

    private static Predicate<Book> predicateGenre(String genre) {
        return o -> containsIgnoreCase(o.getGenre().toString(), genre);
    }

    private static boolean containsIgnoreCase(String str, String subString) {
        return str.toLowerCase().contains(subString.toLowerCase());
    }


}
