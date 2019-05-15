package com.epam.app.model.enums;

public enum BookState {
    FREE,
    ORDERED,
    ONHANDS;

    public static BookState getBookState(int bookStateId) {
        switch (bookStateId) {
            case 1:
                return FREE;
            case 2:
                return ORDERED;
            case 3:
                return ONHANDS;
            default:
                throw new  IllegalArgumentException("Argument must be in a range of 1 to 3");
        }
    }
}
