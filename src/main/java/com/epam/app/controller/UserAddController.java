package com.epam.app.controller;


import com.epam.app.model.User;
import com.epam.app.model.enums.Role;
import com.epam.app.service.UserService;
import com.epam.app.util.mail.Mail;
import com.epam.app.util.password.Password;
import lombok.extern.log4j.Log4j;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static com.epam.app.util.password.Password.hash;

@Log4j
@WebServlet("/addUser")
public class UserAddController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String login = request.getParameter("login");
        String role = request.getParameter("role");
        String password = Password.generate();

        User user = new User(name, Role.getRole(role), login, hash(password));
        HttpSession session = request.getSession(true);
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        boolean isValidLogin = UserService.isLoginValid(login);
        boolean isTheSameLogin = UserService.isLoginDuplicated(login);

        if (isValidLogin) {
            if (isTheSameLogin) {
                request.setAttribute("errMessage", "User with this email already exists!");
                request.getRequestDispatcher("/userAdd.jsp").forward(request, response);
                log.info("Failed to register new user by " + loggedInUser.getRole() + " " +
                        loggedInUser.getLogin() + ". User with this email already exists");
            } else {
                try {
                    UserService.create(user);
                    String subject = "Library: new Account details";
                    String body = "You was successfully added to the library base.\n" +
                            "Email: " + login +
                            "\nPassword: " + password +
                            "\nYou can change it in your Personal Cabinet." +
                            "\nRegards, Library administration";
                    Mail.send(login, subject, body);
                } catch (MessagingException e) {
                    log.error("Exceptions happen!", e);
                }
                request.getRequestDispatcher("/").forward(request, response);
                log.info("User " + user.getLogin() + " registered by " + loggedInUser.getRole() + " "
                        + loggedInUser.getLogin() + " and mail has sent");
            }
        } else {
            request.setAttribute("errMessage", "This Email is invalid");
            log.error("Failed to register new user by " + loggedInUser.getRole() + " " +
                    loggedInUser.getLogin() + ". Email is invalid");
            request.getRequestDispatcher("/userAdd.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/userAdd.jsp").forward(req, resp);
    }

}