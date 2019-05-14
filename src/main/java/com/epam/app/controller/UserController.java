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
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/users")
public class UserController extends HttpServlet {

    private String button;
    private String userLogin;
    private static PageManager<User> pageManager;

    {
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
            updateUser(req, resp);
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
        if (button.equals("edit")) {
            doPut(req, resp);
        } else if (button.equals("delete")) {
            doDelete(req, resp);
        } else if (button.equals("findCards")) {
            req.setAttribute("login", userLogin);
            req.getRequestDispatcher("/cards").forward(req, resp);
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

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) {
        User currentUser = UserService.getByLogin(userLogin);
        Role oldRole = currentUser.getRole();
        String newRole = req.getParameter("role");
        UserService.updateUserByFields(userLogin, req.getParameter("name"),
                req.getParameter("login"), req.getParameter("role"));
        if (newRole != null && !newRole.equals(oldRole.toString())) {
            HttpSession session = SessionHelper.sessions.remove(currentUser.getId());
            if (session != null) {
                session.invalidate();
            }
        }

    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) {
        User deletedUser = UserService.getByLogin(userLogin);
        UserService.deleteUser(deletedUser);
    }

}