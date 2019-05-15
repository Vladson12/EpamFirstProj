package com.epam.app.service;

import com.epam.app.dao.BookDAO;
import com.epam.app.model.Book;
import com.epam.app.model.enums.BookState;
import com.epam.app.util.PageManager;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import static com.epam.app.dao.impl.ActualDaoFactory.getInstance;

public class BookService {
    private BookService() {
    }

    private static final BookDAO BOOK_DAO = getInstance().getBookDAO();

    public static void addBook(Book book) {
        BOOK_DAO.addBook(book);
    }

    public static Book getBookById(int id) {
        return BOOK_DAO.getBookById(id);
    }

    public static Book getBookByAuthor(String author) {
        return BOOK_DAO.getBookByAuthor(author);
    }

    private static List<Book> getAllBooks() {
        return BOOK_DAO.getAllBooks();
    }

    public static void updateBook(Book book) {
        BOOK_DAO.updateBook(book);
    }

    public static List<Book> updateBookList() {
        return BookService.getAllBooks().stream().
                filter(o -> o.getBookState().equals(BookState.FREE))
                .collect(Collectors.toList());
    }

    public static void handleButtons(PageManager<Book> pageManager, HttpServletRequest req) {
        String sort = req.getParameter("sort");
        if (req.getParameter("update") != null) {
            pageManager.setItemList(BookService.updateBookList());
        } else if (sort != null) {
            switch (sort) {
                case "name":
                    pageManager.setItemList(BookService.sortBookListByName(pageManager));
                    break;
                case "author":
                    pageManager.setItemList(BookService.sortBookListByAuthor(pageManager));
                    break;
                case "genre":
                    pageManager.setItemList(BookService.sortBookListByGenre(pageManager));
                    break;
                case "year":
                    pageManager.setItemList(BookService.sortBookListByYear(pageManager));
                    break;
                default:
                    break;
            }
        } else if (pageManager.getItemList() != null) {
            pageManager.setItemList(pageManager.getItemList());
        } else {
            pageManager.setItemList(BookService.updateBookList());
        }
        if (req.getParameter("insert") != null) {
            String context = req.getParameter("context");
            String genre = req.getParameter("genre");
            pageManager.setCurrentPage(1);
            if (!genre.isEmpty() && !context.isEmpty()) {
                pageManager.setItemList(BookService.getByContextAndGenre(context, genre));
            } else if (!genre.isEmpty()) {
                pageManager.setItemList(BookService.getByGenre(genre));
            } else if (!context.isEmpty()) {
                pageManager.setItemList(BookService.getByContext(context));
            }
        }
    }

    private static List<Book> getByContextAndGenre(String context, String genre) {
        return BookService.updateBookList().stream().filter(predicateContext(context))
                .filter(predicateGenre(genre)).collect(Collectors.toList());
    }

    private static List<Book> getByContext(String context) {
        Predicate<Book> containsAuthor = o -> containsIgnoreCase(o.getAuthor(), context);
        Predicate<Book> containsTitle = o -> containsIgnoreCase(o.getTitle(), context);
        List<Book> allBooks = BookService.updateBookList().
                stream().filter(containsAuthor.or(containsTitle)).collect(Collectors.toList());
        if (allBooks.isEmpty()) {
            return new ArrayList<>();
        } else {
            return allBooks;
        }
    }

    private static List<Book> getByTitle(String title) {
        return BookService.updateBookList().
                stream().filter(predicateContext(title)).collect(Collectors.toList());
    }

    private static List<Book> getByGenre(String genre) {
        return BookService.updateBookList().
                stream().filter(predicateGenre(genre)).collect(Collectors.toList());
    }

    private static List<Book> sortBookListByName(PageManager<Book> pageManager) {
        return sortBookListByComparator(pageManager, compareByName());
    }

    private static List<Book> sortBookListByAuthor(PageManager<Book> pageManager) {
        return sortBookListByComparator(pageManager, compareByAuthor());
    }

    private static List<Book> sortBookListByYear(PageManager<Book> pageManager) {
        return sortBookListByComparator(pageManager, compareByYear());
    }

    private static List<Book> sortBookListByGenre(PageManager<Book> pageManager) {
        return sortBookListByComparator(pageManager, compareByGenre());
    }

    private static List<Book> sortBookListByComparator(PageManager<Book> pageManager, Comparator<Book> comparator) {
        pageManager.setCurrentPage(1);
        List<Book> books = BookService.updateBookList().stream()
                .sorted(comparator)
                .collect(Collectors.toList());
        if (!pageManager.isSortIdentificator())
            Collections.reverse(books);
        pageManager.setSortIdentificator(!pageManager.isSortIdentificator());
        return books;
    }

    private static Comparator<Book> compareByName() {
        return (book1, book2) -> book1.getTitle().compareToIgnoreCase(book2.getTitle());
    }

    private static Comparator<Book> compareByAuthor() {
        return (book1, book2) -> book1.getAuthor().compareToIgnoreCase(book2.getAuthor());
    }

    private static Comparator<Book> compareByYear() {
        return Comparator.comparingInt(Book::getYear);
    }

    private static Comparator<Book> compareByGenre() {
        return (book1, book2) -> book1.getGenre().toString().compareToIgnoreCase(book2.getGenre().toString());
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
