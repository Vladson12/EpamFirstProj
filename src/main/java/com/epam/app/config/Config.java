package com.epam.app.config;

import com.epam.app.DAO.DaoFactory;
import com.epam.app.DAO.impl.DaoFactorySupplier;
import com.epam.app.util.db.DbUtils;

import javax.servlet.ServletContext;
import java.nio.file.FileSystems;

/**
 * Created by vladd on 25.04.2019
 */

public class Config {

    private static DaoFactory factory;
    private static boolean isSet = false;

    private Config() {
    }

    public static void set(ServletContext context, String dbName) {
        if (isSet) return;
        isSet = true;
        String separator = FileSystems.getDefault().getSeparator();
        String db = dbName.toLowerCase();
        String dbPropsPath = context.getRealPath(
                "WEB-INF" + separator + "classes" + separator + db + ".properties");
        Config.setDatabase(dbPropsPath);
        DaoFactory factory = new DaoFactorySupplier().apply(db);
        Config.setDaoFactory(factory);
    }

    private static void setDatabase(String dbPropsPath) {
        DbUtils.setPropertiesFile(dbPropsPath);
    }

    private static void setDaoFactory(DaoFactory fact) {
        factory = fact;
    }

    public static DaoFactory getFactory() {
        return factory;
    }
}
