package com.epam.app.util.db.mysql;

public class CardQueryMySql {
    public static final String INSERT = "INSERT into card (user, book, start_date, end_date,card_state) values (?,?,?,?,?);";
    public static final String SELECT = "SELECT * from card where idhome_card = ?;";
    public static final String SELECT_BY_BOOK = "SELECT * from card where book = ?;";
    public static final String SELECT_BY_USER = "SELECT * from card where user = ?;";
    public static final String UPDATE = "UPDATE card set card_state = ? where idhome_card = ?;";
    public static final String UPDATE_DATE = "UPDATE card set card_state = ? , end_date=? where idhome_card = ?;";

    private CardQueryMySql() {
    }
}
