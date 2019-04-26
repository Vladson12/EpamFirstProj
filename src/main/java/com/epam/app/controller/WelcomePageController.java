package com.epam.app.controller;

import com.epam.app.DAO.impl.DaoFactorySupplier;
import com.epam.app.config.Config;
import com.epam.app.model.User;
import com.epam.app.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.FileSystems;


@WebServlet("/")
public class WelcomePageController extends HttpServlet {

    @Override
    public void init() throws ServletException {

        dbConfig("mysql");

    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        session.setAttribute("loggedInUser", null);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/welcomePage.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void dbConfig(String dbName) {
        String separator = FileSystems.getDefault().getSeparator();
        String db = dbName.toLowerCase();

/*        String dbPropsPath = getServletContext().
                getRealPath(separator + "WEB-INF" + separator +
                        "classes" + separator +
                        "resources" + separator +
                        db + ".properties");*/
        String dbPropsPath = getServletContext().getRealPath(
                        "resources" + separator +
                        db + ".properties");

        Config.setDatabase(dbPropsPath);
        Config.setDaoFactory(new DaoFactorySupplier().apply(db));

    }
}
