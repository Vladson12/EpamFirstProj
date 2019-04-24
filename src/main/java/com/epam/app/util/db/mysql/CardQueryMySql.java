package com.epam.app.util.db.mysql;

/**
 * Created by vladd on 23.04.2019
 */
public class CardQueryMySql {

    public static final String insert = "insert into card (user, book, start_date, end_date,card_state) values (?,?,?,?,?);";
    public static final String select = "select * from card where idhome_card = ?;";
    public static final String selectByBook = "select * from card where book = ?;";
    public static final String selectByUser = "select * from card where user = ?;";
    public static final String update = "update card set card_state = ? where idhome_card = ?;";
    public static final String updateDate = "update card set card_state = ? , end_date=? where idhome_card = ?;";

    private CardQueryMySql() {
    }

}
