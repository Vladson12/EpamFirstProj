package com.epam.app.model.enums;

public enum CardState {

    ORDERED,
    AT_HOME,
    AT_HALL,
    RETURNED,
    OVERDUE;

    public static CardState getCardState(int CardStateId) {
        switch (CardStateId) {
            case 1:
                return ORDERED;
            case 2:
                return AT_HOME;
            case 3:
                return AT_HALL;
            case 4:
                return RETURNED;
            case 5:
                return OVERDUE;
            default:
                throw new IllegalArgumentException("Argument must be in a range of 1 to 5");
        }
    }
}

