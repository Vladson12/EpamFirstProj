package com.epam.app.model.enums;

public enum Genre {
    TEXTBOOK,
    NARRATIVE_NONFICTION,
    DRAMA,
    FANTASY,
    CRIME_AND_DETECTIVE,
    SELF_HELP_BOOK,
    SCIENCE_FICTION;

    public static Genre getGenre(int genreId){
        switch (genreId) {
            case 1:
                return TEXTBOOK;
            case 2:
                return NARRATIVE_NONFICTION;
            case 3:
                return DRAMA;
            case 4:
                return FANTASY;
            case 5:
                return CRIME_AND_DETECTIVE;
            case 6:
                return SELF_HELP_BOOK;
            case 7:
                return SCIENCE_FICTION;
            default:
                throw new IllegalArgumentException("Argument must be in a range of 1 to 7");
        }
    }
}