package com.epam.app.controller;


import com.epam.app.model.User;
import com.epam.app.model.enums.Role;
import com.epam.app.service.UserService;
import com.epam.app.util.mail.Mail;
import com.epam.app.util.password.Password;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.epam.app.util.password.Password.hash;

@WebServlet("/addUser")
public class AddUserController extends HttpServlet {

    private static String name;
    private static String login;
    private static String role;
    private static String password;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        name = request.getParameter("name");
        login = request.getParameter("login");
        role = request.getParameter("role");
        password = Password.generate();

        User user = new User(name, Role.getRole(role), login, hash(password));

        boolean isUserRegistered = UserService.create(user);

        if (!isUserRegistered) {
            request.setAttribute("errMessage", "User with this email already exists!");
            request.getRequestDispatcher("/addUser.jsp").forward(request, response);
        } else {
            try {
                String subject = "Library: new Account details";
                String body = "You was successfully added to the library base.\n" +
                        "Email: " + login +
                        "\nPassword: " + password +
                        "\nYou can change it in your Personal Cabinet." +
                        "\nRegards, Library administration";
                Mail.send(login, subject, body);
            } catch (MessagingException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/homePage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/addUser.jsp").forward(req, resp);
    }

}