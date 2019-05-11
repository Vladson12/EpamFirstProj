package com.epam.app.DAO.impl;

import com.epam.app.DAO.DaoFactory;

import java.util.function.Function;

public class DaoFactorySupplier implements Function<String, DaoFactory> {

    @Override
    public DaoFactory apply(String dbName) {
        if ("mysql".equalsIgnoreCase(dbName)) {
            return DaoFactoryMySqlImpl.getInstance();
        } else {
            throw new UnsupportedOperationException();
        }
    }
}
