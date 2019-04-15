package com.epam.app.model.emuns;

public enum BookState {
    FREE,
    ORDERED,
    ONHANDS;

    public static BookState get(int bookStateId){
        if (bookStateId==1)
            return FREE;
        else if (bookStateId==2)
            return ORDERED;
        else
            return ONHANDS;

    }
}
