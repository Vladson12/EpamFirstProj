package com.epam.app.config;

import com.epam.app.DAO.DaoFactory;
import com.epam.app.util.db.DbUtils;
import lombok.Data;

/**
 * Created by vladd on 25.04.2019
 */

public class Config {

    private static DaoFactory factory;

    private Config() {
    }

    public static void setDatabase(String dbPropsPath) {
        DbUtils.setPropertiesFile(dbPropsPath);
    }

    public static void setDaoFactory(DaoFactory fact) {
        factory = fact;
    }

}
