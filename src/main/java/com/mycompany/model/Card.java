package com.mycompany.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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

}
