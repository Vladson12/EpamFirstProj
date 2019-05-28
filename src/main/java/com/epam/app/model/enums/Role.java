package com.epam.app.model.enums;

public enum Role {
    READER,
    LIBRARIAN,
    ADMINISTRATOR;

    public static Role getRole(int roleId) {
        switch (roleId) {
            case 1:
                return READER;
            case 2:
                return LIBRARIAN;
            case 3:
                return ADMINISTRATOR;
            default:
                throw new IllegalArgumentException("Argument must be in a range of 1 to 3");
        }
    }

    public static Role getRole(String role) {
        switch (role) {
            case "READER":
                return READER;
            case "LIBRARIAN":
                return LIBRARIAN;
            case "ADMINISTRATOR":
                return ADMINISTRATOR;
            default:
                throw new IllegalArgumentException("Argument must be in a range of 1 to 3");
        }
    }

}
