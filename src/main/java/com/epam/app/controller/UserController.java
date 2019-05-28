package com.epam.app.controller;

import com.epam.app.model.User;
import com.epam.app.model.enums.Role;
import com.epam.app.service.UserService;
import com.epam.app.util.PageManager;
import com.epam.app.util.SessionHelper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/users")
public class UserController extends HttpServlet {
    private String button;
    private String userLogin;
    private static final PageManager<User> pageManager;

    static {
        pageManager = new PageManager<>(10);
        pageManager.setSortIdentificator(true);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String side;
        if ((side = req.getParameter("pageSide")) != null) {
            if ("previous".equals(side)) {
                pageManager.previousPage();
            } else {
                pageManager.nextPage();
            }
        }
        if (req.getParameter("update") != null) {
            updateUser(req);
        }
        if (req.getParameter("delete") != null) {
            deleteUser(req, resp);
        }
        UserService.handleButtons(pageManager, req);
        req.getSession().setAttribute("users", pageManager.sublist(pageManager.getItemList()));
        req.getRequestDispatcher("/userList.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        userLogin = req.getParameter("login");
        button = req.getParameter("button");
        switch (button) {
            case "edit":
                doPut(req, resp);
                break;
            case "delete":
                doDelete(req, resp);
                break;
            case "findCards":
                req.setAttribute("login", userLogin);
                req.getRequestDispatcher("/cards").forward(req, resp);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("user", UserService.getByLogin(userLogin));
        req.getRequestDispatcher("/userUpdate.jsp").forward(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("user", UserService.getByLogin(userLogin));
        req.getRequestDispatcher("/userDelete.jsp").forward(req, resp);
    }

    private void updateUser(HttpServletRequest req) {
        User currentUser = UserService.getByLogin(userLogin);
        Role oldRole = currentUser.getRole();
        String newRole = req.getParameter("role");
        UserService.updateUserByFields(userLogin, req.getParameter("name"),
                req.getParameter("login"), req.getParameter("role"));
        if (newRole != null && !newRole.equals(oldRole.toString())) {
            SessionHelper.endUserSessions(currentUser.getId());
        }

    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) {
        User deletedUser = UserService.getByLogin(userLogin);
        UserService.deleteUser(deletedUser);
    }

}