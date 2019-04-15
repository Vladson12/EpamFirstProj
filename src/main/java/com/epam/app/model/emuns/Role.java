package com.epam.app.model.emuns;

public enum Role {
    READER,
    LIBRARIAN,
    ADMINISTRATOR;

    public static Role get(int roleId){
        if (roleId==1)
            return READER;
        else if (roleId==2)
            return LIBRARIAN;
        else
            return ADMINISTRATOR;

    }
}
