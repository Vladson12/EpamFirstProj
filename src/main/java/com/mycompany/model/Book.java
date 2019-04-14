package com.mycompany.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Book {
    private int id;
    private String author;
    private BookState bookState;
    private String title;
    private String description;
}
