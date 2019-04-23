package com.epam.app.model;

import com.epam.app.model.enums.CardState;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Card {

    private int id;
    private User user;
    private Book book;
    private LocalDate startDate;
    private LocalDate endDate;
    private CardState cardState;

    public Card(User user, Book book, LocalDate startDate, LocalDate endDate, CardState cardState) {
        this.user = user;
        this.book = book;
        this.startDate = startDate;
        this.endDate = endDate;
        this.cardState = cardState;
    }

    public String toStringDates() {
        return String.format("%s%s%s", startDate, " - ", endDate);

    }
}
