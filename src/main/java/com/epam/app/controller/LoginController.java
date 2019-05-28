
package com.epam.app.controller;

import com.epam.app.config.Config;
import com.epam.app.model.User;
import com.epam.app.service.UserService;
import com.epam.app.util.SessionHelper;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static com.epam.app.util.password.Password.hash;

@Log4j
@NoArgsConstructor
@WebServlet("/login")
public class LoginController extends HttpServlet {
    @Override
    public void init() {
        Config.set(this.getServletContext(), "mysql");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        User userAccount = UserService.findUser(login, password);
        if (UserService.isUserAllowed(login, password)) {
            if (userAccount != null) {
                HttpSession session = request.getSession(true);
                SessionHelper.registerSession(userAccount.getId(), session);
                session.setAttribute("loggedInUser", userAccount);
                session.setAttribute("login", userAccount.getLogin());
                response.sendRedirect("/");
                log.info("User " + userAccount.getLogin() + " logged in.");
            }
        } else {
            String errMessage = "Incorrect Username or password!";
            request.setAttribute("errMessage", errMessage);
            request.getRequestDispatcher("/userLogin.jsp").forward(request, response);
            log.error("Unsuccessful attempt to login by " + login);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/userLogin.jsp");
        requestDispatcher.forward(req, resp);
    }
}