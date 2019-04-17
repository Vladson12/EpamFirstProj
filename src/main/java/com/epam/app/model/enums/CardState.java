package com.epam.app.model.enums;

public enum CardState {

    ORDERED,
    AT_HOME,
    AT_HALL,
    RETURNED,
    OVERDUE;

    public static CardState getCardState(int CardStateId){
        if (CardStateId==1)
            return ORDERED;
        else if (CardStateId==2)
            return AT_HOME;
        else if (CardStateId==3)
            return AT_HALL;
        else if (CardStateId==4)
            return RETURNED;
        else
            return OVERDUE;

    }
}

