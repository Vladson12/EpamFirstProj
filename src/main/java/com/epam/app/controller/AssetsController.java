
package com.epam.app.controller;

import com.epam.app.config.Config;
import com.epam.app.model.User;
import com.epam.app.service.UserService;
import lombok.NoArgsConstructor;
import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static com.epam.app.util.password.Password.hash;

@NoArgsConstructor
@WebServlet("/assets")
public class AssetsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}