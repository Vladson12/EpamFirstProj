package com.epam.app.model;

import com.epam.app.model.enums.BookState;
import com.epam.app.model.enums.Genre;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Book {
    private Integer id;
    private String author;
    private BookState bookState = BookState.FREE;
    private String title;
    private String description;
    private int year;
    private Genre genre;

    public Book(String author, String title, String description, int year, Genre genre) {
        this.author = author;
        this.title = title;
        this.description = description;
        this.year = year;
        this.genre = genre;
    }
}
