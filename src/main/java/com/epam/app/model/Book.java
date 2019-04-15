package com.epam.app.model;

import com.epam.app.model.emuns.BookState;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Book {

    private int id;
    private String author;
    private BookState bookState;
    private String title;
    private String description;

    public Book(String author, BookState bookState, String title, String description) {
        this.author = author;
        this.bookState = bookState;
        this.title = title;
        this.description = description;
    }
}
