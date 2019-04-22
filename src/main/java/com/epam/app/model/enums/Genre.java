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
        if (genreId==1)
            return TEXTBOOK;
        else if (genreId==2)
            return NARRATIVE_NONFICTION;
        else if (genreId==3)
            return DRAMA;
        else if (genreId==4)
            return FANTASY;
        else if (genreId==5)
            return CRIME_AND_DETECTIVE;
        else if (genreId==6)
            return SELF_HELP_BOOK;
        else
            return SCIENCE_FICTION;
    }
}