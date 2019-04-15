package com.epam.app.model;

public enum BookState {
    FREE,
    ORDERED,
    ONHANDS;

    public static BookState getBookState(int bookStateId){
        if (bookStateId==1)
            return FREE;
        else if (bookStateId==2)
            return ORDERED;
        else
            return ONHANDS;

    }
}
