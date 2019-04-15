package com.epam.app.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Card {

    private int id;
    private User user;
    private Book book;
    private Date startDate;
    private Date endDate;
    private Boolean isReturn;

    public Card(User user, Book book, Date startDate, Date endDate, Boolean isReturn) {
        this.user = user;
        this.book = book;
        this.startDate = startDate;
        this.endDate = endDate;
        this.isReturn = isReturn;
    }
}
