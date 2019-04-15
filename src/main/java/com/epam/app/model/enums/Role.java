package com.epam.app.model.enums;

public enum Role {
    READER,
    LIBRARIAN,
    ADMINISTRATOR;

    public static Role getRole(int roleId){
        if (roleId==1)
            return READER;
        else if (roleId==2)
            return LIBRARIAN;
        else
            return ADMINISTRATOR;

    }
}
