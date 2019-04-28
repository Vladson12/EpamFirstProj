package com.epam.app.controller;

import com.epam.app.service.UserService;
import com.epam.app.util.mail.Mail;
import com.epam.app.util.password.Password;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by vladd on 29.04.2019
 */
@WebServlet("/passwordRecovery")
public class PasswordRecoveryController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String login = request.getParameter("login");
        String password = Password.generate();

        boolean isLoginValid = UserService.isLoginValid(login);
        boolean isUserRegistered = UserService.isLoginDuplicated(login);


        if (!isLoginValid) {
            request.setAttribute("errMessage", "This is not valid email address!");
            request.getRequestDispatcher("/recovery.jsp").forward(request, response);
        } else if (!isUserRegistered) {
            request.setAttribute("errMessage", "There is no user with this email!");
            request.getRequestDispatcher("/recovery.jsp").forward(request, response);
        } else {
            try {
                String subject = "Library: Password Recovery";
                String body = "You password was successfully changed.\n" +
                        "Email: " + login +
                        "\nPassword: " + password +
                        "\nYou can change it in your Personal Cabinet." +
                        "\nRegards, Library administration";
                Mail.send(login, subject, body);
            } catch (MessagingException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/welcomePage.jsp").forward(request, response);

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/recovery.jsp");
        requestDispatcher.forward(req, resp);
    }
}
